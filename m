Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F1E2ECAFF
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 08:37:07 +0100 (CET)
Received: from localhost ([::1]:49154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxPr0-0002Vd-7p
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 02:37:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxPoC-0000uv-CV; Thu, 07 Jan 2021 02:34:12 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxPo8-0001qG-Qp; Thu, 07 Jan 2021 02:34:11 -0500
Received: by mail-wr1-x435.google.com with SMTP id c5so4612800wrp.6;
 Wed, 06 Jan 2021 23:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mv9BUTkHXJZeu6IB83yOyuX6/467HlhRD+rQLREzjB4=;
 b=a1zjEKw9bYPZrFL6oMhyNnSP5fLggA3YYz15TYt95d7yP/FrMnY+UwZgUdfWfpny9l
 3G4WHhn8EV9E//Ec03N09uZcyeYzLAxhZ0hpwXNCyEDDo3+JnwRmUBv+lMLIm3shV4yv
 ud1UWNUk+2IzZJkJpIeqXU2UvCLrr1OerIihI65NAFRAr/xpaFKPoj5LbUkw+/g17rDi
 o91e6VaCCVgGMq+xVCNZyM1V5rKTBnzMfMTCk5UdTOxgoMu7RqK0IEn+2FnXXYci9d2W
 LmfQOGYS/1hCDzCO92hf6l/5xdBqcF6X7pfVC9YH1VjlXTf/QRCkF7rW+uuCIymBwwDf
 rmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mv9BUTkHXJZeu6IB83yOyuX6/467HlhRD+rQLREzjB4=;
 b=uhbGhqluvQlwy8oDTKxMSzkcE4fvZL596VqqiIoYFZ3+RjpMC8V4mZkG/F+6qoBVBc
 mZmlRb8MkFlKM7EQmNUNVsfUt1x0LeRDzCVUFM0hXheLfqEFjkdrcQCJMdx5XFzbJLNi
 otvmpPI7TduLEZTJPrEabj7Cwl8pCun8qMkJEuitOxrSY4NOOTjkr73zSn4ilrCRy3R8
 eIbY3dxASK+aq2vZ/c+vHV3ZozyIjzElH5mKvdPfiA4LREOuujfHq5u3TvT7WwtBeB10
 x0Prqky2QsrJNpgRw1HgHpmUAL31GSHP2JxeeN09UwkZ94zYckeQYzG0rDL/DnrcdT4f
 /59Q==
X-Gm-Message-State: AOAM532SFB3rd3saFDWa5kp/pWt6yQJDmDIzZA4jgzkR+0VQfLQ/70YP
 oAKPDZVS9Ic+ibIfO1MSeYk=
X-Google-Smtp-Source: ABdhPJzaaEkfEFNV2kTqUq+QRFMMUzGn7NwTA8uALTRqD8qZno/7XXTQnOa/WdY+in2vBCKCpyJ/bQ==
X-Received: by 2002:a5d:4c4d:: with SMTP id n13mr7640502wrt.356.1610004841043; 
 Wed, 06 Jan 2021 23:34:01 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id a62sm6312249wmf.7.2021.01.06.23.33.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jan 2021 23:34:00 -0800 (PST)
Subject: Re: [RFC PATCH 0/2] Pegasos2 emulation
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1609973005.git.balaton@eik.bme.hu>
 <fc421134-788a-4c62-db25-7e2453104539@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f3d46697-6371-9bd6-67b4-d1c1255fdcf3@amsat.org>
Date: Thu, 7 Jan 2021 08:33:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <fc421134-788a-4c62-db25-7e2453104539@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/21 2:15 AM, BALATON Zoltan wrote:
> On Wed, 6 Jan 2021, BALATON Zoltan wrote:
>> Hello,
>>
>> This is adding a new PPC board called pegasos2 currently posted as RFC
>> because it depends on not yet merged VT8231 emulation currently on the
>> list:
>>
>> https://patchew.org/QEMU/cover.1609967638.git.balaton@eik.bme.hu/

This note ^^^ ...

>>
>> and may need some changes like a test case but I'm posting it now for
>> getting feedback on what's needed to merge this. More info on it can
>> be found at:
>>
>> https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2
>>
>> Currently it needs a firmware ROM image that I cannot include due to
>> original copyright holder (bPlan) did not release it under a free
>> licence but I have plans to write a replacement in the future. With
>> that firmware it can boot MorphOS now as:
>>
>> qemu-system-ppc -M pegasos2 -cdrom morphos.iso -device
>> ati-vga,romfile="" -serial stdio
>>
>> then enter "boot cd boot.img" at the firmware "ok" prompt as described
>> in the MorphOS.readme. To boot Linux use same command line with e.g.
>> -cdrom debian-8.11.0-powerpc-netinst.iso then enter
>> "boot cd install/pegasos"
>>
>> Patch 2 adds the actual board code after patch 1 adding MV64361 system
>> controller chip. The mv643xx.h header file is taken from Linux and
>> produces a bunch of checkpatch warnings due to different formatting
>> rules it follows, I'm not sure we want to adopt it or keep it as it is
>> given that it does not appear any more in recent Linux versions so we
>> could reformat it as it's unlikely to get updated in the future.
> 
> Interestingly it applies for patchew while this was accidentally based
> on my previous series that has hw/ppc/Kconfig reverts so it does not
> apply on current master.

... can be passed as hint to patchew as a tag:

Based-on: <cover.1609967638.git.balaton@eik.bme.hu>

> Also missing a file so does not compile but
> other than that the content could be reviewed. I've now updated this repo:
> 
> https://osdn.net/projects/qmiga/scm/git/qemu/tree/pegasos2/
> 
> which contains all the needed patches over QEMU master at one place in
> case somebody wants to try this. I'll send an updated version later
> after I get some feedback.
> 
> The command lines above also need -bios /path/to/firmware.rom

An integration test similar to the Fuloong PMON would be highly
appreciated :)

https://www.mail-archive.com/qemu-devel@nongnu.org/msg752605.html

Regards,

Phil.

