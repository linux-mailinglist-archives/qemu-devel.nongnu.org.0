Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E64D3A0DE7
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 09:41:07 +0200 (CEST)
Received: from localhost ([::1]:48578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqspl-0005Fk-Rl
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 03:41:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lqsoM-0003sf-VI
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 03:39:38 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:41703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lqsoK-0002NN-DA
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 03:39:38 -0400
Received: by mail-pg1-x534.google.com with SMTP id l184so3198045pgd.8
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 00:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=C/M9g9yrlBqMYVBaeoHPL3ThRLrJ0Z7p925iMQN/LLY=;
 b=LDRX/PtrH1Th52sEo9FRK69aTuqkdKiZX4+ukbOyr5agt0X318jaarBEMduPMLkYD7
 w+rjESIAEPwvKLLpZW/6l8g2SH2OD3ue7CbCaOdKnzku7FKaWVQPHx78aFSv12EPkcQF
 zKEI3yhsGPDqYKXL+Bs1wldiGAWGIbfL73RvszMRpA5s62yJzTpLXH7M5pyrc0yuDPjQ
 I/7YG1IhwDQaiXMsxJOwhL0gpZf4N2oSjln9TQi9WM+Fv4rIDN9scU2VtPkOLDq0xlh0
 /To8DM6nkZdCwHM+jIR2jBKc/qQfNJJPvJsuQHZ6kMxE/0FV6sIEq27g/vzhCaFDQNjW
 XR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C/M9g9yrlBqMYVBaeoHPL3ThRLrJ0Z7p925iMQN/LLY=;
 b=deKdcrgMjq+J1g5dJqRmiEj6P0M7FCBvb93Q/2NMMOH8HETmjsmNHa83r4ohRPoaGA
 CvDEWVQcIzHFYDx+oZkAkb7wViRhvJaPATEjIGZ9UP8hK1tN78QYadRrnGCIeBXZ6m31
 kd0mSju+C25ZAp8wVZtna31++Ej+h3Op4QcvJl1F70w/LJpEY5Jad/MVngayhWVwWiHn
 a8fv4xxgiSZ4nB/GGu6DIw46LGuo4syT6X/oVzsldlJRU708QTsCbEiaKGFhzUl2tVmS
 iB9RZw/qTDoWndV8lGPf7e7irjGWbxOT8n6daWFGgIcY5J3Juge4azwGTXn8oW13VmzN
 nfEg==
X-Gm-Message-State: AOAM530zUn450hv3rp9m5q8q6zLAydym027iWHOM0AiQWHMmCq/I+Jih
 MVSNL52ZwCN9pe2ityTszTJ2IQ==
X-Google-Smtp-Source: ABdhPJybMnU9rF5fGDOZBx8wjAIK5QfCE4wJvkVL+1cOotQnfdGM+MMeLFFqxZNFMizj3oDLmcgVCA==
X-Received: by 2002:a63:5203:: with SMTP id g3mr1283120pgb.247.1623224373784; 
 Wed, 09 Jun 2021 00:39:33 -0700 (PDT)
Received: from localhost (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242])
 by smtp.gmail.com with UTF8SMTPSA id h8sm8917013pjf.7.2021.06.09.00.39.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 00:39:33 -0700 (PDT)
Message-ID: <5ab75d13-2fca-17cc-b24f-e86430fdda20@ozlabs.ru>
Date: Wed, 9 Jun 2021 17:39:29 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [RFC PATCH 0/5] ppc/Pegasos2 VOF
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1622994395.git.balaton@eik.bme.hu>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <cover.1622994395.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=aik@ozlabs.ru; helo=mail-pg1-x534.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/7/21 01:46, BALATON Zoltan wrote:
> 
> Based-on: <20210520090557.435689-1-aik@ozlabs.ru>
> ^ That is v20 of Alexey's VOF patch
> 
> Hello,
> 
> Posting these for early review now. I plan to rebase on the next VOF
> patch that hopefully fixes those points that I had to circumvent in
> patch 1 for now. I've reported these before but now all of those that
> are needed for pegasos2 are in one place. Other points I've reported
> could be clean ups but not sttictly needed.
> 
> With this series on top of VOF v20 I can now boot Linux and MorphOS on
> pegasos2 without needing a firmware blob so I hope this is enough to
> get this board in 6.1 and also have it enabled so users can start
> using it. That means that VOF will also be merged by then. This now
> gives VOF another use case that may help it getting finished.
> 
> I've also updated my development tree with this series here:
> 
> https://osdn.net/projects/qmiga/scm/git/qemu/tree/pegasos2/
> 
> Please review so I can do any needed changes together with the rebase
> on next VOF patch so we don't miss 6.1 this time.


It would help if you provided the disk or/and kernel or/and initramdisk 
images and the example command line to give this a try. And said a few 
words who is this Pegasos2 guy :) The series looks ok to me otherwise. 
Thanks,

> 
> Regards,
> BALATON Zoltan
> 
> BALATON Zoltan (5):
>    Misc VOF fixes
>    ppc/pegasos2: Introduce Pegasos2MachineState structure
>    target/ppc: Allow virtual hypervisor on CPU without HV
>    ppc/pegasos2: Use Virtual Open Firmware as firmware replacement
>    ppc/pegasos2: Implement some RTAS functions with VOF
> 
>   default-configs/devices/ppc-softmmu.mak |   2 +-
>   hw/ppc/Kconfig                          |   1 +
>   hw/ppc/pegasos2.c                       | 780 +++++++++++++++++++++++-
>   hw/ppc/vof.c                            |  11 +-
>   pc-bios/vof.bin                         | Bin 3784 -> 3784 bytes
>   pc-bios/vof/entry.S                     |   2 +-
>   target/ppc/cpu.c                        |   2 +-
>   7 files changed, 776 insertions(+), 22 deletions(-)
> 

-- 
Alexey

