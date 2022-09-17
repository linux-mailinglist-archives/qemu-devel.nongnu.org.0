Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A49985BB737
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 10:25:15 +0200 (CEST)
Received: from localhost ([::1]:45524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZT8U-0007Ux-8D
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 04:25:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1oZT68-0005SH-Db
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 04:22:48 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:36800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1oZT66-00049m-Fe
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 04:22:48 -0400
Received: by mail-ej1-x633.google.com with SMTP id 13so25138527ejn.3
 for <qemu-devel@nongnu.org>; Sat, 17 Sep 2022 01:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date;
 bh=8GfMU3LNbcJmKG72FaQaoRpQcj2bKLPD05RqY14JXv0=;
 b=7Jkd157cGJ+ECYvRhx3I0Fer3x0bryV9dPTd+JM+QJlR7e3JvFpsdiW3hWl3WhbdUC
 OelPui6cz+NcDgUIJNXlN3w8LPZa1W2m1tAaB5YGa/WZ55+bbQ92sFtlFtZ7HjdDJzA9
 P6a962a2pPm4O270vLVtiTAfs9ppX9lYWpaIqHSB2lCsdw+dznvl3YzrzgeOr0pyT2Gm
 NwpYERQ2TumGbxqxt8wkP3ZlPWXhNp1tTXMvxh9l4oxRCObqSqsuqa4rDo6ZhH3VMsyI
 OPvkEf45AJl0IHikqhdPq3hR6ZiecKnPJrsi5uOD7s4kYgX7W3m9nOL4THhx6ex2fNBX
 atgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date;
 bh=8GfMU3LNbcJmKG72FaQaoRpQcj2bKLPD05RqY14JXv0=;
 b=5zKTvWMkzYY5WhEcn7zelQDPPN2QCIyCjDMcqOXCUvulOUAj1S5xJqM9ovy4uWjcvf
 L8T87AtJZbnm/ek0USKrxsPijekzUwYGihlCIWBV2UONPyVfD8Ys6Pwh77j8FDZWggLH
 2q+ZcbZR0w5RigECU7u4cVLojEcbvwxYHtazF961gkyAspFwJQU4obgsUFL4NfxytExZ
 L/4+6qQSphYYczmB5FGB0bbww3X0dgTHhHoI7GTFeVKVm4bPuIpXdVCHjCXZv+W7ZDUk
 5NlfKI6wV8R7sF2pd8dMcVsNyqBYcatQY7iz9EV+E+F0y2Mny0PL0N6x+LnoiOHTQooL
 zjrg==
X-Gm-Message-State: ACrzQf0dGVSEG92ktx06LtxkmFieiHNUDhjWPCWjBBYbYrddd0rFdO/4
 4C+dUpOXX0akliPHw3lXdsPzxDfXC0MmmM0IWGw=
X-Google-Smtp-Source: AMsMyM6gyX/V4a50Y0ek6KmK7lLn47s89vRIyrtLMl/xF4coontPHofsRx1d75AiTplFrhEWP4X1pQ==
X-Received: by 2002:a17:907:2da2:b0:77c:1599:b3ad with SMTP id
 gt34-20020a1709072da200b0077c1599b3admr5828049ejc.213.1663402964466; 
 Sat, 17 Sep 2022 01:22:44 -0700 (PDT)
Received: from localhost (vpn-konference.ms.mff.cuni.cz. [195.113.20.101])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a509306000000b0044eb5b922bdsm15427307eda.24.2022.09.17.01.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Sep 2022 01:22:44 -0700 (PDT)
Date: Sat, 17 Sep 2022 01:22:44 -0700 (PDT)
X-Google-Original-Date: Sat, 17 Sep 2022 01:22:40 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Add support for Ztso
In-Reply-To: <0a809729-26ad-5d71-b849-cf008ece4a87@linaro.org>
CC: qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <mhng-93b0c378-9205-4c14-a3da-c8385cc1c238@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=palmer@rivosinc.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 17 Sep 2022 01:02:46 PDT (-0700), Richard Henderson wrote:
> On 9/16/22 14:52, Palmer Dabbelt wrote:
>>> Though, honestly, I've had patches to add the required barriers sitting around for the
>>> last few releases, to better support things like x86 on aarch64.  I should just finish
>>> that up.
>>
>> I can just do that for the RISC-V TSO support?  Like the cover letter says that was my
>> first thought, it's only when I found the comment saying not to do it that I went this way.
>
> My patches inject the barriers automatically by the tcg optimizer, rather than by hand,
> which is what the comment was trying to discourage.  Last version was
>
> https://lore.kernel.org/qemu-devel/20210316220735.2048137-1-richard.henderson@linaro.org/

Thanks, I get it now.

