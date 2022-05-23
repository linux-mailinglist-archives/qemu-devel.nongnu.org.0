Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3A35315C1
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 21:33:23 +0200 (CEST)
Received: from localhost ([::1]:49340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntDnu-0008Bs-Qq
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 15:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ntDlC-0005tT-I1; Mon, 23 May 2022 15:30:35 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:33486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ntDl9-0001GM-Ci; Mon, 23 May 2022 15:30:34 -0400
Received: by mail-oi1-x229.google.com with SMTP id w130so19060468oig.0;
 Mon, 23 May 2022 12:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JaN8MbtzVdwKwEcNEQD8SLqargjdm3mtWEy4WixkgEc=;
 b=jmGLNqyPqESDXILy4u6A2j05iihBDWMuG9HSScXYxjBmLj9Pwr5UomfizbNtGjdBqc
 8TKI2vTC1xO73zTxhqNVmuL51goY6qWQ8LBMrgOWXPcgzpsD1GwwvD6yWq6OG49EtzQ2
 53yVHWzcIihFxZbaL8wuAkEnLnfTIwymd2KnLIlrmQCvGz/ctKWHWAM3ohv3KdAaHANp
 Ji4k4Ic2P2791VHrN4Zkc611fC/36riaWBhmL6Hg5IU0dqjxuwvlX+VFVkc2NK0XmcFx
 nbmv6xQwlv/wTfbkYL9edHZ+rPlikGxqP2XVdwQVHbUzmgvz9piDstN2L4SWiz1h6Ck/
 9HXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JaN8MbtzVdwKwEcNEQD8SLqargjdm3mtWEy4WixkgEc=;
 b=f7zhz+/RC4YmPGdXSrv5JrZV53ck4IKvKVHY21dX3YCEZxV4pVlivR9yzj5Vd5Igqu
 EGanCbpMDgSixjBNuCKGjeXRMnXxUGANqwA7s05JNvwjuQ0gh5CxiVoKrRw18Ed9ZNVB
 oJoal7+kpBmHM6U79lpzMWqPbExhyycSXCvWgc8L9nQRix3BDRThm0Lgv6vbkLMoLLDq
 ceKYe2MpAq5bqZj9Ee0Srko1rd9o2KTUbvhPEtESEVtVA/JFSWJpF7Bqg9qFFy/lxRTN
 m7ZEGAk7F/bhtdGSdDRDbIYjFrn9XxMP/I38wUeqG32IKzr5q46BI3onZOGeVKR3f6GI
 46+w==
X-Gm-Message-State: AOAM530yxd1bNkD9UVJR3YblwV8XfFb8O65a8yT+brgRGvEJAVrO8Tzj
 0Cyq5kD4mrDWMumdF4/DoAbKLzCQ+1Q=
X-Google-Smtp-Source: ABdhPJywM4UxeoAetYUHGvmIJqt54PpwrBgR4DSoyOkYYl9+1uf5SiGHeNH5bftMpW2aW3ppF1X2rg==
X-Received: by 2002:a05:6808:2112:b0:32b:25c4:fd4a with SMTP id
 r18-20020a056808211200b0032b25c4fd4amr335331oiw.27.1653334229845; 
 Mon, 23 May 2022 12:30:29 -0700 (PDT)
Received: from [192.168.10.102] (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 b7-20020a4aac87000000b0035eb4e5a6d6sm4648297oon.44.2022.05.23.12.30.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 12:30:29 -0700 (PDT)
Message-ID: <e8106f5f-af98-283c-074e-985ee7c07dea@gmail.com>
Date: Mon, 23 May 2022 16:30:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 00/10] Random cleanup patches
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20220520180109.8224-1-shentey@gmail.com>
 <48f571d0-e783-4b31-7c90-3d330629c18c@ilande.co.uk>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <48f571d0-e783-4b31-7c90-3d330629c18c@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
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



On 5/21/22 06:55, Mark Cave-Ayland wrote:
> On 20/05/2022 19:00, Bernhard Beschow wrote:
> 
>> v2:
>> * Omit removal of isa_connect_gpio_out() (Mark)
>>
>> v1:
>> This patch series contains random cleanups that I made while studying the code.
>>
>> Bernhard Beschow (10):
>>    hw: Reuse TYPE_I8042 define
>>    hw/audio/cs4231a: Const'ify global tables
>>    hw/i386/pc: Unexport PC_CPU_MODEL_IDS macro
>>    hw/i386/pc: Unexport functions used only internally
>>    hw/i386/pc: Remove orphan declarations
>>    hw/ppc/e500: Remove unused BINARY_DEVICE_TREE_FILE
>>    hw/net/fsl_etsec/etsec: Remove obsolete and unused etsec_create()
>>    accel/tcg/cpu-exec: Unexport dump_drift_info()
>>    accel/tcg: Inline dump_opcount_info() and remove it
>>    docs/devel: Fix link to developer mailing lists
>>
>>   accel/tcg/cpu-exec.c              |  4 ++--
>>   accel/tcg/translate-all.c         |  5 -----
>>   docs/devel/submitting-a-patch.rst |  6 +++---
>>   hw/audio/cs4231a.c                |  8 ++++----
>>   hw/i386/pc.c                      | 17 +++++++++++++----
>>   hw/net/fsl_etsec/etsec.c          | 23 -----------------------
>>   hw/net/fsl_etsec/etsec.h          |  7 -------
>>   hw/ppc/e500.c                     |  1 -
>>   hw/sparc64/sun4u.c                |  2 +-
>>   include/exec/cpu-all.h            |  3 ---
>>   include/hw/i386/pc.h              | 14 --------------
>>   11 files changed, 23 insertions(+), 67 deletions(-)
> 
> In general these changes look okay, so I'd be fine to give an:
> 
> Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> for those I haven't already given a Reviewed-by tag for.
> 
> Laurent, are you happy to take these patches with their current tags via qemu-trivial? Or would you prefer an extra set of eyes on the two accel/tcg ones first?


BTW I'll send a PR later this week and I was about to queue patch 06
(hw/ppc/e500 change) via the ppc tree. Let me know if you want to queue
the whole series via qemu-trivial instead.


Thanks,


Daniel



> 
> 
> ATB,
> 
> Mark.
> 

