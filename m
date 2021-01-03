Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AFE2E8C64
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 14:57:54 +0100 (CET)
Received: from localhost ([::1]:47172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kw3tJ-0002Bg-2O
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 08:57:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kw3rI-0001S3-6b
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 08:55:48 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:33911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kw3rD-0002SU-TL
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 08:55:47 -0500
Received: by mail-wm1-x332.google.com with SMTP id g25so6557985wmh.1
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 05:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D4I/WzzwdWtgpG532KBSQRmjXuxLv4dq2k81qB7B6Ng=;
 b=lrwK/Z7a88YIrXCtZMH8bvCz6QM4c0KlEztfWs0CneHWOInMjx2vZVwcGLbTC3XW/+
 un5JfxJhECNB+ftNCZdFdD4EnF+dDptie0LJL75f7AYi+b0Il0gTrA/cELvO1/kRfJz4
 vcSyetK4O3fMl7KxaXZApqXNwCS3lbGEdQj46xDuFdspficT6beJ5L0ydPl6hnBy1Oox
 2gwt3Yrc/qSO7KS+DOUnbgVmebenLV7sutEX2X5SeDynUbFQgoYF99kShU8wwz4kEmsP
 +JFwumEEcADFKU60WXJsBK2oCUwGrUkiMvmhYjv2nHpzPxNaxdq58dyawn0NcheDNMCj
 SblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D4I/WzzwdWtgpG532KBSQRmjXuxLv4dq2k81qB7B6Ng=;
 b=hUtl3GY5+U2VY1dWfzC86FNJQyTbn9iZgE3Dz6JwH+mnEly/K+57vKtKLb0BZOX6t2
 16kgSFGIvhao02I1ie0R0lnqZ+ya+nSkoo6bzRIRYtN56eQWyKpnXFLWMSaM8RFDfHjo
 5CgrID/nJFggd6ozqLzMsdxokeFN7P5+hZKfc6Zab6q/eyvdgGnJOuD3qSbFZk+5I4Wf
 mcSnBu9tMNEYF7L3Em44mLpr1Z8hydAAwMgB9so6ytPsKzPzfYI0jqm7RT0CH5OzV/7k
 7xyPUzGDAa/j0b03q7Wt8kQt3SOd8XRR7s9s7c3WnkG/Gzv27ndo1+LGzE2xS3ed2yl8
 h9sg==
X-Gm-Message-State: AOAM532ak0ncuZkSADw+z9GqjWOP8yvPSXTJtQ2zLUl4sjhKgQYvC3Lp
 sgb+rd/CoeprnCbiCnFxIjI=
X-Google-Smtp-Source: ABdhPJxP7dY3VbDDlyo8MDU+37Tw/PozKPhzR9CcjMtvnEuH9OjZpjKWO5Kwwx/NbxGh64L1nbAhBA==
X-Received: by 2002:a1c:287:: with SMTP id 129mr23469137wmc.133.1609682142397; 
 Sun, 03 Jan 2021 05:55:42 -0800 (PST)
Received: from [192.168.1.34] (194.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id v20sm89454269wra.19.2021.01.03.05.55.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jan 2021 05:55:41 -0800 (PST)
Subject: Re: [PATCH 00/24] vt82c686b clean ups and vt8231 emulation - all in
 one
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1609584215.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6f66caae-64fb-6325-9950-8ff52f1b13eb@amsat.org>
Date: Sun, 3 Jan 2021 14:55:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <cover.1609584215.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.262,
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/2/21 11:43 AM, BALATON Zoltan via wrote:
> Hello,
> 
> This is an all in one series containing all the patches from my
> previous part I and part II vt82c686b clean up series plus the end of
> it to finally add vt8231 emulation that will be used by subsequent
> ppc/pegasos2 emulation. I consider this finished for now and good
> enough to get in also cleaning up and improving fuloong2e emulation a
> bit but previous disclaimer is still valid: It does not aim to fix all
> existing bugs or make the model perfectly emulate the real chip just
> reach the level where we can have working emulation to boot guests
> which can then be improved later. (E.g. I think state saving was
> broken before and it remains broken after because I don't know all the
> details how to add vmstate for all kinds of data structures and this
> could be addressed separately when fixing the already broken state
> saving if someone wants to test and fix it.) With this it boots at
> least MorphOS on pegasos2 and works with the pmon_2e.bin for fuloong2e
> which needs more fixes for Linux that are currently under review. More
> testing is welcome.
> 
> It still needs the Bonito BONITO_PCICONF_REG_MASK fix for fuloong2e
> because it no longer maps SMBus but due to the Bonito bug guest cannot
> write register 0xd2 to map it. With that fix pmon_2e.bin from here:
> http://www.anheng.com.cn/loongson/pmon/ works for me with this
> command: qemu-system-mips64el -M fuloong2e -net none -bios pmon_2e.bin
> 
> After rolling this for two years now I hope it can finally be merged
> and eventually also get pegasos2 emulation that will need this.
> 
> Regards,
> BALATON Zoltan
> 
> BALATON Zoltan (24):
>   vt82c686: Rename AC97/MC97 parts from VT82C686B to VIA
>   vt82c686: Remove unnecessary _DEVICE suffix from type macros
>   vt82c686b: Rename VT82C686B to VT82C686B_ISA
>   vt82c686: Remove vt82c686b_[am]c97_init() functions
>   vt82c686: Split off via-[am]c97 into separate file in hw/audio
>   audio/via-ac97: Simplify code and set user_creatable to false
>   vt82c686: Remove legacy vt82c686b_isa_init() function
>   vt82c686: Remove legacy vt82c686b_pm_init() function
>   vt82c686: Convert debug printf to trace points
>   vt82c686: Remove unneeded includes and defines
>   vt82c686: Use shorter name for local variable holding object state
>   vt82c686: Rename superio config related parts

As the first half of this series is reviewed, I'm queuing it
(patches 1-12) via mips-next.

Regards,

Phil.

