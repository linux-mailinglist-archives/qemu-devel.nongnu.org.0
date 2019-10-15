Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C55D7CEB
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 19:07:51 +0200 (CEST)
Received: from localhost ([::1]:53668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKQIY-0000F7-Al
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 13:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45589)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iKQ8p-0004zK-1T
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 12:57:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iKQ8m-0005PP-Us
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 12:57:46 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:51545
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iKQ8m-0005Og-PE
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 12:57:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571158663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MOm2q142xbxVs3t+zfzmLrFudLPOT2so7VPiI4kJ+w4=;
 b=ST6LutHBxh9xX2QxwGlYID0ojPgrab56dZ6Cp/bu6OkOu0lTbN3WVEFruXgTVEyOrvc9dZ
 Bj+S5JtpwKAVYcbQB+ikYoEhEgU7uiF7319Q2/XzizfKSbnVKCCnqdpBx9nLHULH01fviH
 4TBBrSG0Cwb4g8GRze3yojpwHMzUi90=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-BobY5yMvNM6nX_kYrLWWCA-1; Tue, 15 Oct 2019 12:57:39 -0400
Received: by mail-wr1-f70.google.com with SMTP id h4so4634284wrx.15
 for <qemu-devel@nongnu.org>; Tue, 15 Oct 2019 09:57:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W0gJaXs8R1iBffJQ5+T4/8y6cnODed4LV8/0NAgLPE0=;
 b=hLbButfstb0dOH+ciGKp00adKZ52Yvnt3Z4tUUmYmjCUiH+sSLoLqpucOaYmmO3awV
 ZvoXEDp/rXTIO4ixZEy8+t3MZeGrHMe7pCHAHny9tW9XdlRV+qOUxHyx70vEGoquAEDO
 t1EHWJK9h5MZJmvIIcItFXN6phMcvLHk4+HaJqtc+5CaomrjhLUM0wsBsBteKnBzZ9xL
 75NbcSLH+VOs+gzVAO4a7AUg75LibqWRiuRvibTSjruXq/nk61iunNf5SsKnJPndnWb2
 xHOL+sOAedpPUtC6rRoBFTsXgCAUwtgoDCFvyFZhBE6y82VzKnT7zO0bMdA7LmnWKDnI
 QLxQ==
X-Gm-Message-State: APjAAAXXAP6cTSl8rgJl9qtligMG006b5Fh0T7kJPrLNbrHyOlQ28qht
 vRE2ipI6rpy5XTRNr4raiSKd0ZjP+b0HoqxDGxxDBmQHVNajk+7uCNl9yyqiB1+pTCHxbeSBnyj
 H0IbsvPvtZbEp/Kc=
X-Received: by 2002:a5d:460a:: with SMTP id t10mr32875667wrq.13.1571158658637; 
 Tue, 15 Oct 2019 09:57:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqysEDVqMYA97yuIGjUYaWpRKelsc3FU+eXK6BRS3xML1EzhA2vcQyAErLIP/7v4HYfIS+eDmw==
X-Received: by 2002:a5d:460a:: with SMTP id t10mr32875637wrq.13.1571158658286; 
 Tue, 15 Oct 2019 09:57:38 -0700 (PDT)
Received: from [192.168.1.36] (14.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.14])
 by smtp.gmail.com with ESMTPSA id b144sm25627953wmb.3.2019.10.15.09.57.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Oct 2019 09:57:37 -0700 (PDT)
Subject: Re: LEON3 networking
To: Joshua Shaffer <joshua.shaffer@astrobotic.com>, qemu-devel@nongnu.org,
 Jiri Gaisler <jiri@gaisler.se>, Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
References: <CAPJW7GKLH3pkrGQQj_OaAy0UecUJttsHOJp35+CcpZvm9cM2WQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6bb8abb2-68f0-db85-1557-6e04839b5ea2@redhat.com>
Date: Tue, 15 Oct 2019 18:57:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CAPJW7GKLH3pkrGQQj_OaAy0UecUJttsHOJp35+CcpZvm9cM2WQ@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: BobY5yMvNM6nX_kYrLWWCA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Joshua,

On 10/15/19 3:17 PM, Joshua Shaffer wrote:
> Hello,
>=20
> I've been using the LEON3 port of qemu, and am wondering if anyone has=20
> touched the networking setup for such since the thread here:=20
> https://lists.rtems.org/pipermail/users/2014-September/028224.html

Thanks for sharing this!

Good news, Jiri keeps rebasing his patch with the latest stable version.
Bad news, he didn't not signed his work with a "Signed-off-by" tag so we=20
can not take this as it into the mainstream repository, see=20
https://wiki.qemu.org/Contribute/SubmitAPatch#Patch_emails_must_include_a_S=
igned-off-by:_line

Note we have maintainers for the Leon3, I'm Cc'ing them:

$ ./scripts/get_maintainer.pl -f hw/sparc/leon3.c
Fabien Chouteau <chouteau@adacore.com> (maintainer:Leon3)
KONRAD Frederic <frederic.konrad@adacore.com> (maintainer:Leon3)
Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> (maintainer:SPARC TCG CPUs=
)
Artyom Tarasenko <atar4qemu@gmail.com> (maintainer:SPARC TCG CPUs)
qemu-devel@nongnu.org (open list:All patches CC here)

Regards,

Phil.


