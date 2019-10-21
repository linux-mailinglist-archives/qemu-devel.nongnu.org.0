Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C245DEECF
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 16:08:24 +0200 (CEST)
Received: from localhost ([::1]:42836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMYMB-0004Rp-2x
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 10:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44977)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iMYKk-0003Q4-Ip
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 10:06:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iMYKf-0002uo-35
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 10:06:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29905
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iMYKe-0002ud-Vt
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 10:06:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571666808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wzoTfPxDcv/VA6TVEB/gNMYC1H2lalrcPVIO8HpKjxs=;
 b=cfvzWfYjI6w8IQuaL17f/XtORvMIKjxZ/s9EGUnrtgD3wwE3M3ABUBDecq20vGoitTsIri
 dDdHSou+ht+3eiut1pnuXLnIXmGYHZbshdjpaAqKIy732T9qYDRP/rih/aAAlTiyq0tLGS
 gP4AsloNNc0s3EmDMLR4s/8ORDDuFCA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-oS-rmwVcNce5ieoiVSXBjA-1; Mon, 21 Oct 2019 10:06:46 -0400
Received: by mail-wr1-f71.google.com with SMTP id s17so1716813wrp.17
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 07:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ejOEPbER27oqtEfMPjtNUtXfBmpFbrTE4807+1Wt3BQ=;
 b=NCmyU7uQAdmQNW75KvX+nwePUz67jPVXQlKHxhT6ocXOjdTUWWfwIHbuYm6hSUz02h
 2g1e9BlPvJsP0jXEssfuU9Fm5OR8rBQ2dtq0GC3xNoxCYa7JJNVEzmFo5Zxavsb/E0hE
 Y7Y54nB/mkdhTMFJalN1XdgmUWSSsvdAFnbJMHvlaRuMR2/hPphgdWtwfZabfD+Qh3mW
 5rUsOKnAYs+mpn+RSvHM4i/ESDnIDZcWEarHihqdeQykehqexeePxTytR9Y87RHUN9uI
 jLlhicIG1h61nQpdNzH2Ebe11ZfevClGvceslf0l1CP2oATFc0THRBQnbWlLk4pEOj7s
 gD/w==
X-Gm-Message-State: APjAAAUgq4Iszc8tTi01xpwYGMpV8aBscnf2LvwgIyJvN2RKndaR9n9q
 do7dFCpZwh1mqrxBa5OsLcJ5/M0/5hyNRyxipz96I747UP0kDuUgC1019bpcAMwIHoZGWYbQqJv
 OgnPes5JbhgNshAw=
X-Received: by 2002:a1c:9847:: with SMTP id a68mr11406708wme.18.1571666804922; 
 Mon, 21 Oct 2019 07:06:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwUEKHeVh4J43/cJh1RCg2Io3/6eqmffkQqZrAfzw1K/H01OScQBkTdPEnP/KjlVcPZ76RGtg==
X-Received: by 2002:a1c:9847:: with SMTP id a68mr11406689wme.18.1571666804725; 
 Mon, 21 Oct 2019 07:06:44 -0700 (PDT)
Received: from [192.168.1.41] (129.red-83-57-174.dynamicip.rima-tde.net.
 [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id e17sm14065488wma.15.2019.10.21.07.06.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2019 07:06:44 -0700 (PDT)
Subject: Re: [PATCH v2 0/3] Convert sparc devices to new ptimer API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20191021134357.14266-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0ebdbde6-d804-20c1-6fa4-ad826756ff9c@redhat.com>
Date: Mon, 21 Oct 2019 16:06:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191021134357.14266-1-peter.maydell@linaro.org>
Content-Language: en-US
X-MC-Unique: oS-rmwVcNce5ieoiVSXBjA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabien Chouteau <chouteau@adacore.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/19 3:43 PM, Peter Maydell wrote:
> This patchset converts the devices used by sparc machines to the new
> ptimer API.
>=20
> Currently the ptimer design uses a QEMU bottom-half as its mechanism
> for calling back into the device model using the ptimer when the
> timer has expired.  Unfortunately this design is fatally flawed,
> because it means that there is a lag between the ptimer updating its
> own state and the device callback function updating device state, and
> guest accesses to device registers between the two can return
> inconsistent device state. This was reported as a bug in a specific
> timer device but it's a problem with the generic ptimer code:
> https://bugs.launchpad.net/qemu/+bug/1777777
>=20
> The updates to the individual ptimer devices are straightforward:
> we need to add begin/commit calls around the various places that
> modify the ptimer state, and use the new ptimer_init() function
> to create the timer.
>=20
> Changes v1->v2:
>   * patches 2 and 3 are the old 1 and 2 and have been reviewed
>   * patch 1 is new and removes a pointless NULL check; without
>     this we'd probably have got Coverity errors when patch 3
>     added a use of t->timer before the check for it being NULL
>=20
> thanks
> --PMM
>=20
>=20
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>=20
> *** BLURB HERE ***
>=20
> Peter Maydell (3):
>    hw/timer/slavio_timer: Remove useless check for NULL t->timer
>    hw/timer/grlib_gptimer.c: Switch to transaction-based ptimer API
>    hw/timer/slavio_timer.c: Switch to transaction-based ptimer API

Nitpicking, maybe reorder the grlib_gptimer patch last:

   hw/timer/slavio_timer: Remove useless check for NULL t->timer
   hw/timer/slavio_timer.c: Switch to transaction-based ptimer API
   hw/timer/grlib_gptimer.c: Switch to transaction-based ptimer API


