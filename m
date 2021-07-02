Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D193BA145
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:32:03 +0200 (CEST)
Received: from localhost ([::1]:52878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzJGz-0004Wt-1j
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:32:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJFP-0003fK-Sk
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:30:23 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:51758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJFN-0001ia-Nj
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:30:23 -0400
Received: by mail-wm1-x329.google.com with SMTP id r3so6701020wmq.1
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pAhcCN8pVG6fkwq4O+PIKbDXNItL85P6eyltdSY7gdI=;
 b=VXKarL/7tx+ukq/CyfTusOyccp2fDxb2rxj1m2IVGgRFX5a6Wc+82BzYpA1i4xXGKF
 ira+8sy3XQNVWm6tWxtb/aohDOUPjkHV5Fd8Xiqqd1TYcBQjReToxNcnLuMeXqQIdyoJ
 o0EgwdoMZQhGpAltpWvNM+D7O3ycktAUUGO3zbPojrTbTsXwthJMl/sejZPWf/Ho1H7n
 WTgDkTw/Hdig9AaI/CaXwvUnhacfuuFEff59UIJ4hbKOaA2Sdjg+bZYrEF9C4sdbTOlt
 t56S0r7eIGqwKBwO8gfAgmFi1uB7nD+MFRQY2CrbXPOOXTnsoW4KyPJMiDYi4oFdaqDc
 ODKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pAhcCN8pVG6fkwq4O+PIKbDXNItL85P6eyltdSY7gdI=;
 b=Nd8uOPq2imP+2GIEidtkebufkJIoJWTM96BvZUq9R9t8gKgjPP1HLABkp1Se5SUiLj
 CKIqiePkS7SlFh7o5++tC6DBX+bGzsklTCPnTvOvQS7hBw5jR1BYnro1uk4SPd6QPH2k
 P6M8MxYc1lnwsCYZXRzhRDKDsLUkGYdzQ1quVwUvQUFceA9rP55b3BWpnrh1CsUKcX0O
 xlrZFE3zxp9ILt6B1NZtkUt/TyyAi+mzfuzotNkGJ8tIUmTIrdtPsyDMi9B+4V9pmhDx
 lV2hlNP5m6EMTTIR+KHz0nLNCKB6jp/zSQPlNxMcqFkqBRGGMcLXRvyY38OKOzxfNSAF
 XruQ==
X-Gm-Message-State: AOAM531ATdvn+6LgaMa627HHS7xP727Hf1DyZAo/AP6z3U8MLZsl68UE
 eO/2iDYWjwOFojTQwYoHMzc=
X-Google-Smtp-Source: ABdhPJz2D/kEfl32Xdw5RtEyIshfR9U2pCd32Vvjyc5aY0HbLi/Fm+SSNATmtQNhNnDGxfYOYxrwxA==
X-Received: by 2002:a7b:c092:: with SMTP id r18mr5607931wmh.181.1625232620111; 
 Fri, 02 Jul 2021 06:30:20 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-23.mobile.abo.orange.fr.
 [92.184.108.23])
 by smtp.gmail.com with ESMTPSA id n8sm3277056wrt.95.2021.07.02.06.30.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jul 2021 06:30:19 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] g364fb: fix migration (or: fix migration for MIPS
 magnum machines)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 hpoussin@reactos.org, fthain@telegraphics.com.au
References: <20210625163554.14879-1-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c985102d-434c-3c72-b2a6-5c29813e67fd@amsat.org>
Date: Fri, 2 Jul 2021 15:30:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625163554.14879-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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

On 6/25/21 6:35 PM, Mark Cave-Ayland wrote:
> I noticed whilst testing the previous dp8393x patchset that I would always
> get a segfault whilst attempting to migrate the MIPS magnum machine.
> 
> A bit of detective work shows that the problem is an incorrect VMStateDescription
> in the g364fb device which expects a G364State but instead receives a
> G364SysBusState.
> 
> Looking back through the git history suggests that migration for this device
> (and also the MIPS magnum machines) has been broken for several years, so patch
> 1 takes the opportunity to improve the migration stream for the framebuffer
> first whilst patch 2 contains the actual fix.
> 
> Note that I don't use the MIPS magnum machines on a regular basis but the
> patchset fixes the migration error and survives some light testing here.

> Mark Cave-Ayland (2):
>   g364fb: use RAM memory region for framebuffer
>   g364fb: add VMStateDescription for G364SysBusState
> 
>  hw/display/g364fb.c | 32 ++++++++++++++++++++------------
>  1 file changed, 20 insertions(+), 12 deletions(-)

Thanks, queued to mips-next.

