Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5052CDB2C4
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 18:49:50 +0200 (CEST)
Received: from localhost ([::1]:53144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL8yC-0003oS-JE
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 12:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34738)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iL8DI-0002kx-Lx
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 12:01:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iL8DH-0004wo-In
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 12:01:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57925
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iL8DH-0004wR-Fg
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 12:01:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571328077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fQpAgiZAlEZ9f6dCPqK8uNPTfe5LbEkGvY6MEfbGq0I=;
 b=YN3BS7AvmmDulrbEkjQ5k+zsSZEeGdsck6++Gspf7TIcMG1QH2kj5inSulrEqoyKNTn1ir
 KZ2M5uncuzI5+rkdbY27yXFLXam9umdea/D1wzna4UPZVOl47nAn86NiQpMh6b/NPLckgh
 B3mNvfdEXsWsLO/xxYVnIbM9I290+u8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-x0uZ2atFM4m2Xpm1YMbgpw-1; Thu, 17 Oct 2019 12:01:16 -0400
Received: by mail-wm1-f69.google.com with SMTP id l184so98659wmf.6
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 09:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gaPbLO5k5U/qtjj1ZtSdEVt8rJ3Dve6xXLgqoafe+mc=;
 b=d7RklPGXnGdTDxXiNd4rPMxlowkHc3eaNmYe5kI2JzH2r+UI6hSi6yEijAw3TMBCyW
 9Zu7gK+8ioLh1o0AtXxlmYxlkZtaAf0/QUF7aNU7DlS96SaeWCHwxeCeYc4pQ+zqo5XS
 B2BtCZbePv9YSU4gY327o8+dRqxEW64EDM3j4Kcl8T3S8asC3FZxEIHDcJvYZXo6iZhx
 Ap6EgGIiELNa/AlgS2NrQMMbX66k5GH/FyTFm5ZmVdPNqLFNzAp2A8zG5bQvbzdh014t
 yRVH/gP+qGtkcedcG+jDpBUCedobTFnV48cvAPu7mX2dvbfy6r3L+9pcbAJ60k/zt1J7
 7bzw==
X-Gm-Message-State: APjAAAUdr6+4fG3QUS2BVHnMpeuvw3HMpcMh4ilSvTVySNpdYx8FdQ9S
 b2qM8cjuY54/gjTiknZ86OpNsCURoBXGmRxoDdRERMFnS2CTNz2Yn/vOvM/XQIvb48w6+THY2dd
 llHA16dZvZshmw2c=
X-Received: by 2002:adf:fecd:: with SMTP id q13mr3931017wrs.224.1571328075693; 
 Thu, 17 Oct 2019 09:01:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyI3Ktxkek7HVf0KOnfNbqwbvK3baw38BNmSoIzUTiQ0Jw5XA8u7hfEEqG33HzJCK/R7AfJcA==
X-Received: by 2002:adf:fecd:: with SMTP id q13mr3931003wrs.224.1571328075533; 
 Thu, 17 Oct 2019 09:01:15 -0700 (PDT)
Received: from [192.168.50.32] (243.red-88-26-246.staticip.rima-tde.net.
 [88.26.246.243])
 by smtp.gmail.com with ESMTPSA id 36sm3074162wrp.30.2019.10.17.09.01.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2019 09:01:14 -0700 (PDT)
Subject: Re: [PATCH 2/8] hw/timer/sh_timer: Switch to transaction-based ptimer
 API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20191017132905.5604-1-peter.maydell@linaro.org>
 <20191017132905.5604-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3fe7efb4-4750-94eb-bc9a-ec6585206ab1@redhat.com>
Date: Thu, 17 Oct 2019 18:01:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191017132905.5604-3-peter.maydell@linaro.org>
Content-Language: en-US
X-MC-Unique: x0uZ2atFM4m2Xpm1YMbgpw-1
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
Cc: Thomas Huth <huth@tuxfamily.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Walle <michael@walle.cc>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Magnus Damm <magnus.damm@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/17/19 3:28 PM, Peter Maydell wrote:
> Switch the sh_timer code away from bottom-half based ptimers to the
> new transaction-based ptimer API.  This just requires adding
> begin/commit calls around the various places that modify the ptimer
> state, and using the new ptimer_init() function to create the timer.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/timer/sh_timer.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


