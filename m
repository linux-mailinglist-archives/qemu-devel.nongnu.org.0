Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4563549CBD1
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 15:06:42 +0100 (CET)
Received: from localhost ([::1]:51820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCiwb-0004kS-C1
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 09:06:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>)
 id 1nCif7-0003d0-BW; Wed, 26 Jan 2022 08:48:37 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:56334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>)
 id 1nCif5-0000e5-O4; Wed, 26 Jan 2022 08:48:36 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3F5D361536;
 Wed, 26 Jan 2022 13:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A22DAC340E3;
 Wed, 26 Jan 2022 13:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643204905;
 bh=CBTX/eYcW33qRvFz0VC673VNcvSRdP9HNWAH2mQKI8A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BCxbVTCBeJ+G2S/izyo2b3cD+FSurF0AcvvaLfEUE6UAAbM0Gw/wblplx/vwwNGNT
 6RN67LdacaQSjuOOYfr2ORG+jvoM10gBatbuGYy6WNxAfAwKCQw0G5RpXPmHGuJ+OD
 KoCc6VTu7HOxSz3YCbefS+dps/qTdyO4PHTyFHffUgvHkXBbyq7aDtXhdWl5oClAc1
 ndrzXXMRoJ5rQ3juQ0X3KuIDH0C2eblgYG1C1sQoNcw7+hwrnbmd8IJuGRhxR/ZXw5
 Upgb8ZlAj3e6PLMV9HJZSiSg2F6aAHvO3xT+PxMJsqT8TRgkTrSioUwBnWh3zie+mw
 KUduEcTEjT0Iw==
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1nCiet-003E9b-JL; Wed, 26 Jan 2022 13:48:23 +0000
MIME-Version: 1.0
Date: Wed, 26 Jan 2022 13:48:23 +0000
From: Marc Zyngier <maz@kernel.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: Raspberry Pi?
In-Reply-To: <1e98b4ec-3476-387c-9dda-99a13121e22f@amsat.org>
References: <CAK7rcp9pFFvYnvwgX_9ganFsc8V5+c7keofM7PPSY3Fp82J15w@mail.gmail.com>
 <1e98b4ec-3476-387c-9dda-99a13121e22f@amsat.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <9864ab7ffce7f60d460051fa94f755c5@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: f4bug@amsat.org, kennethadammiller@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Received-SPF: pass client-ip=139.178.84.217; envelope-from=maz@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kenneth Adam Miller <kennethadammiller@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022-01-26 02:59, Philippe Mathieu-Daudé via wrote:
> Hi,
> 
> On 26/1/22 00:59, Kenneth Adam Miller wrote:
>> Hello all,
>> 
>> I would like to emulate something on a pi so that I don't have to 
>> pay as high of a translation penalty since the guest and host will 
>> share the same arch. I'm finding that on some forums that people have 
>> been having trouble getting QEMU to run on raspberry pi. The posts are 
>> kind of old, in 2019.
>> 
>> Does anyone know if this has been addressed since then?
> 
> What you asks is if you can run an Aarch64 guest (virt machine?) on a
> Raspi4 host, is that right? IIRC it should work straight away using
> "-machine virt,gic-version=host". Cc'ing qemu-arm@ list to verify.

Note that only a RPi-4 will provide any sort of performance, assuming
the OP wants to use KVM as the acceleration backend.

The original RPi has no support for virtualisation (ARM 1176), and
the two following models are deprived of a GIC, making them a bit
useless (we have *some* support code in KVM, but I'm pretty sure it
has bitrot by now).

         M.
-- 
Jazz is not dead. It just smells funny...

