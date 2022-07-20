Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D535757BB20
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 18:11:32 +0200 (CEST)
Received: from localhost ([::1]:34494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oECIN-0004Cz-Di
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 12:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oECFt-0007yl-7s; Wed, 20 Jul 2022 12:08:57 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:37689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oECFr-0004My-I1; Wed, 20 Jul 2022 12:08:56 -0400
Received: by mail-oi1-x22b.google.com with SMTP id i126so11396874oih.4;
 Wed, 20 Jul 2022 09:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5G1fw/lJCYafD38C+Ncbp2sZEJpxDTJIOLOCOeRx2vY=;
 b=cj36IzU9954TAmTHlY0UEBfnJdnmUa01lLM2rT2KjoEPeaPzAvH9hT3nPRjYHYAYHJ
 csAqmw+GEezDWKsGmRbm43sX0eaWInHAL954I9lO2KGKMy7yfR033OR8AMw2hPhhGZne
 1jLVP9jcJ5MS61geSc/wz+JvTrtkqf8Cx8Whm49zAck5UiWU5tSlHjoBGgKleM42raGH
 PyIbZheEMb0YTAIZM8nL/UdTHvLVpnAYxRoYwQpsexYRsqFi1Q18R0EjzXcm1lrSGYIF
 DWFDeNdvMyHEWkDEOeppTCoDBR4CMFezcxOTApDtSbjufvfYupqlRI5qU1egYDOQHuj3
 fkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5G1fw/lJCYafD38C+Ncbp2sZEJpxDTJIOLOCOeRx2vY=;
 b=wTfijRxbWw1zAs/9Ht8XpYt7hTPnNZeQWxs57BH99y765H5GzmnoO+kxJHavzfeFm4
 fKsHJh9Fff+ENT/1hDkBJgaV5ypxJH77D6+LFH8bFR21Kt3DEFN2Wm+0MsZGuY4Urj09
 lUGWvXUyzpCT+XHqR+cMPrMSKrrcsnyijAanZOo9iwg1FViHp7jyUAbuU4kNZmg8UdEK
 cnk6+70V2/CYX2Jsxc+LNxxb8TtJ17DxV5oVsTV32zWUOpxCJcr2+d6sG75O54/pKphS
 CJyM3f448qPG3MedvdjQcp7XrsQBJBGtqyjkyeakgd0iBhXYKBt+37V0EK+DH9WzWEYt
 ZGPA==
X-Gm-Message-State: AJIora94VtjUjf5DOOR4w+EIECP3hpeUyG8yuNIuhnCuTum3HmBQHDG/
 gh4or+Zz7v/4HOhzg1JdZZw=
X-Google-Smtp-Source: AGRyM1ucOFJmnUAQF9x8i79W3RGopwApopRZhL9K1uI7BY5dfN1ttsILKX6ypoBnp/F9rCm2bka3AA==
X-Received: by 2002:a05:6808:f8a:b0:339:d862:bcbd with SMTP id
 o10-20020a0568080f8a00b00339d862bcbdmr2658319oiw.188.1658333332500; 
 Wed, 20 Jul 2022 09:08:52 -0700 (PDT)
Received: from [192.168.10.102] (200-232-202-163.dsl.telesp.net.br.
 [200.232.202.163]) by smtp.gmail.com with ESMTPSA id
 34-20020a9d06a5000000b0061cc146c947sm406504otx.76.2022.07.20.09.08.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jul 2022 09:08:52 -0700 (PDT)
Message-ID: <99d48009-8403-c868-9f04-c14ca8311369@gmail.com>
Date: Wed, 20 Jul 2022 13:08:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220719075930.315237-1-aik@ozlabs.ru>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220719075930.315237-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hey,

On 7/19/22 04:59, Alexey Kardashevskiy wrote:
> The following changes since commit d2066bc50d690a6605307eaf0e72a9cf51e6fc25:
> 
>    target/ppc: Check page dir/table base alignment (2022-07-18 13:59:43 -0300)
> 
> are available in the Git repository at:
> 
>    git@github.com:aik/qemu.git tags/qemu-slof-20220719
> 
> for you to fetch changes up to 17c1ad657904787b1d986fb4c85431fee006a6ea:
> 
>    pseries: Update SLOF firmware image (2022-07-19 17:50:46 +1000)
> 
> ----------------------------------------------------------------
> Alexey Kardashevskiy (1):
>        pseries: Update SLOF firmware image
> 
>   docs/system/ppc/pseries.rst |   2 +-
>   pc-bios/README              |   2 +-
>   pc-bios/slof.bin            | Bin 992384 -> 995176 bytes
>   roms/SLOF                   |   2 +-
>   4 files changed, 3 insertions(+), 3 deletions(-)
> 
> 
> *** Note: this is not for master, this is for pseries
> *** Note2: this has not sync'd to git.qemu.org but softfreeze is
> too soon so I am posting it anyway.

I forgot to send a reply yesterday, sorry.

Don't worry about rushing this SLOF pull. Given that this build doesn't
have bug fixes we can wait to pull it in 7.2. You'll have the time to
sync it up with git.qemu.org and so on.


Thanks,


Daniel

> 
> 
> The image grew in size because of change of the toolchain from
> native PPC to cross on x86.
> 
> 
> The only change is that now SLOF can also boot big endian zImage
> but kernel-addr=0 is still required.
> 
> 

