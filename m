Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EB051FE86
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 15:44:54 +0200 (CEST)
Received: from localhost ([::1]:59926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no3gz-0003JM-5a
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 09:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no3eR-0000kA-U8; Mon, 09 May 2022 09:42:15 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:47033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no3eQ-0003Tk-7O; Mon, 09 May 2022 09:42:15 -0400
Received: by mail-pf1-x432.google.com with SMTP id j6so12259699pfe.13;
 Mon, 09 May 2022 06:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4UrS4HhGwyY1aos6Ce2ZEmbZFmiouUGhVid6v/1AD+4=;
 b=G0ejU8MNJFQv9cCL0MZXdbDrYt2zhuSxMN/Rj76lUlBqfCdtobTkVVml7O45B9Obrp
 FSNuiGnd82Hpr7FERwO37hCkIcKSPUnbCSBpl/8UFJwrma6Y1b+4IYfZ1NfVahUAnHaA
 qbvGgPFHadLK4E6gDRobv5jdXgXqYI2KLJEoffQ4NA78pxH1VOI9GtviREoJ+4ut3nId
 E/HUWbbBeLxAwJQN5VCXLm0GVgRBPfmlsfJv7QnT80zGp9tkbj6Od1+jpC0qtpArQMBt
 E2Tj9ebn6ZK+Ocb58Y8tc1n6BjcN5Ww//8H/0hiPTgYvWQojUdbMyz7RET9SUEy8DqVU
 d6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4UrS4HhGwyY1aos6Ce2ZEmbZFmiouUGhVid6v/1AD+4=;
 b=XgU8iUKllN+r41/AKAAduOohDEHLKiGj6jIGT873xoPcijaVWMCfoU5uXEVH+ReSeo
 Rt9iQHTOnjEhxsII9vA6xvG/RUfhsA/D8epwhprzLs/kuDrkcmqISXQ2MctrT/l69quG
 dmQ4oiwJjMRd4QI9HAJE+nOGvMtR0pHKZ3Su0sqQ9VNd85A/TRHZRgbE7pbYXP19r+eo
 /JAYXHRRAXCp0VNKQfDJ3NB/TozGDfyaLoZh9UVIGcGOVWoFP3uTu5O7hgwKICBBn6Vm
 R0tYdx04OsPkWEjoy7KGXe4ESBDk/ucc/z3SMIlFjZKOl2kgGIb9Cfydt/vHcBjEUr5e
 cCGg==
X-Gm-Message-State: AOAM530xiONbflAMkDRSQohKaag8bW9fj7FzOzJKg4rnZ9PiWEodAtus
 j8pXErOJcYqCOEhPzhX62fY=
X-Google-Smtp-Source: ABdhPJyRR0FnWNDyn8ibOD06fLQODg1o1ZVC5Dr20KjOm0NEfBUWxrVh4GID2wERukIvPW+QPfUjDw==
X-Received: by 2002:a63:941:0:b0:3c6:8d64:ec01 with SMTP id
 62-20020a630941000000b003c68d64ec01mr7681595pgj.322.1652103732173; 
 Mon, 09 May 2022 06:42:12 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a056a00084100b005107da0f34csm6921345pfk.20.2022.05.09.06.42.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 06:42:11 -0700 (PDT)
Message-ID: <43860dbe-5cf8-91ef-2bba-8da631154b3b@amsat.org>
Date: Mon, 9 May 2022 15:42:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [RFC PATCH 0/3] Remove some of the old libopcode based
 disassemblers
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220412165836.355850-1-thuth@redhat.com>
 <2af15d6d-ad10-2f98-fb0a-37d0125044ca@amsat.org>
 <a8a7b68e-6fb9-e329-5c88-99a1fa5da75b@redhat.com>
In-Reply-To: <a8a7b68e-6fb9-e329-5c88-99a1fa5da75b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 9/5/22 15:18, Thomas Huth wrote:
> On 09/05/2022 14.20, Philippe Mathieu-Daudé wrote:
>> On 12/4/22 18:58, Thomas Huth wrote:
>>> Many of the disassemblers in the disas folder are based on old
>>> versions from the GNU tools (libopcode, GDB, ...) that were still
>>> licensed under the GPL v2. The GNU tools switched to GPL v3 at one
>>> point in time, so QEMU is stuck with the old versions, i.e. these
>>> files did not see much updates for new processors anymore. But
>>> for most architectures, we're preferring the Capstone disassembler
>>> now anyway, so the old libopcode disassemblers are also hardly
>>> used anymore.
>>>
>>> I'm not 100% sure (thus this is marked as RFC), but I think we could
>>> simply drop the old disassemblers nowadays, and hardly anybody would
>>> miss them, since we now always embed capstone as a submodule anyway.
>>> Or is there still an advantage in keeping these old files around?
>>>
>>> This RFC series tackles with s390, arm (32-bit) and i386 ... I wanted
>>> to get some feedback first, but if we agree that these can be removed,
>>> the sparc, mips and ppc disassemblers likely can be removed, too.
>>> (I think we should keep m68k.c since Capstone does not have support
>>> for Coldfire CPUs yet).
>>>
>>> Thomas Huth (3):
>>>    disas: Remove old libopcode s390 disassembler
>>>    disas: Remove old libopcode arm disassembler
>>>    disas: Remove old libopcode i386 disassembler
>>
>>>   disas/arm.c             | 4012 -----------------------
>>>   disas/i386.c            | 6771 ---------------------------------------
>>>   disas/s390.c            | 1892 -----------
>>
>>>   10 files changed, 12700 deletions(-)
>>
>> o_O Nice!
>>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Thanks, just a little bit too late - it's in my current pull request 
> already :-)

NP, trying to catch up.

> By the way, what about MIPS? Could MIPS be switched to Capstone, too, so 
> that we could finally remove disas/mips.c ? (We're not using capstone 
> there yet, and MIPS has so many flavours, big and little endian, 32- and 
> 64-bit ... so that I'm unsure whether there was a reason for not using 
> Capstone there, or whether it just hasn't been tried out yet?)

Last I remember is Richard saying "the capstone backend for mips is not
in terribly good shape":
https://lore.kernel.org/qemu-devel/0c7827df-c9d4-8dad-a38c-4881ce7dd22b@linaro.org/

My long-term hope is to switch to decodetree.

