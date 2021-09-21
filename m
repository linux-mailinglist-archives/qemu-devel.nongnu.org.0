Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E07FC4139D1
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 20:12:46 +0200 (CEST)
Received: from localhost ([::1]:42628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSkG6-0007yu-0K
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 14:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSkEE-0005tg-B5; Tue, 21 Sep 2021 14:10:50 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSkE8-0008Bc-Tb; Tue, 21 Sep 2021 14:10:49 -0400
Received: by mail-wr1-x434.google.com with SMTP id q26so41801996wrc.7;
 Tue, 21 Sep 2021 11:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DD+FwV7KTcFgJZKYhUG2aXrAr60G0LYFgbaTENd9uT8=;
 b=hHu44/D8Je9OCXvq6nGSId8ZxB4CSBSzrc3Y1/xiQx1p24UE3FW14Ajn/ZnmU65HBg
 QErGLRuS9DnmAlkNQLMalSQdwfP9MSO2sRTO3YCJET5TbymC/75JqWy1/zO+wOnnwvGD
 AsKlorhI7eOa5LFZ0ZbPzGpYIAN36Z0CGSr5IWAf8ooMoQJIlAu/iNsvNYs+xoPAqQBF
 znFCkvNd51uEInt4to9IchrGwCr1lWC6Sy0Aqqi+RBHfr34qszhmfVj6lXVvGAMznXZl
 x18L7dddfKkyYvWbA+WgHBr+a6lDY0C6f8BA4gpD3XTuJen2E60Swp6koGzkPzEDcwA7
 TsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DD+FwV7KTcFgJZKYhUG2aXrAr60G0LYFgbaTENd9uT8=;
 b=RuBkuvzwqqN8PDeymjAN00AkHhsi/0+BeAyO0dPkv0W8SvBr5bDl+rIuPcSQmdq0Lb
 bujw2zvuf4atlCXRWE9nurzYBPvla47ai7k67LID8V7mydzNNv4lHB6j0AoWTEDJ+bNa
 r2NTgbdQ+iDRzuA9Kmp6+9Fv1Pfj1wm+9Mrcd+uAs2g40RfoYAXukwclq+afLjieYVt+
 K1i6xHBpeR06HBdOIbbIM0xrkdMmcXo0F9s7LMvqu0TNLL1y3Jh4/3GiyyrUQIxNN4JH
 ffGpxB+lgSP9fGAr7chsvmg/1I2gXzbuCuuvwwHMkDc5bYGTdehe1+1J8mFSp/o6RO5+
 LpXw==
X-Gm-Message-State: AOAM533CujoiJ2ACsNTaiwsERaoHl8vGKb1sSjLTmMAHHOq4dN4bnbo9
 lHUFQflths+TRlx8K8lvE8HBZQzqjlY=
X-Google-Smtp-Source: ABdhPJxSUSjQOzMAoN9NH2BAAKscuFgwqBAxYE0Vmjjowlx0swtgA/j/zQBgyRdbrHREmAjwAb0R7g==
X-Received: by 2002:a7b:c3d2:: with SMTP id t18mr6177708wmj.33.1632247841692; 
 Tue, 21 Sep 2021 11:10:41 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id b187sm3660429wmd.33.2021.09.21.11.10.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 11:10:40 -0700 (PDT)
Message-ID: <fc260859-b09b-89c9-85d4-9f4bdfead222@amsat.org>
Date: Tue, 21 Sep 2021 20:10:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 3/5] target/arm: Move gdbstub related code out of helper.c
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210921162901.17508-1-peter.maydell@linaro.org>
 <20210921162901.17508-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210921162901.17508-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Luis Machado <luis.machado@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 18:28, Peter Maydell wrote:
> Currently helper.c includes some code which is part of the arm
> target's gdbstub support.  This code has a better home: in gdbstub.c
> and gdbstub64.c.  Move it there.
> 
> Because aarch64_fpu_gdb_get_reg() and aarch64_fpu_gdb_set_reg() move
> into gdbstub64.c, this means that they're now compiled only for
> TARGET_AARCH64 rather than always.  That is the only case when they
> would ever be used, but it does mean that the ifdef in
> arm_cpu_register_gdb_regs_for_features() needs to be adjusted to
> match.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/internals.h |   7 ++
>   target/arm/gdbstub.c   | 130 ++++++++++++++++++++
>   target/arm/gdbstub64.c | 140 +++++++++++++++++++++
>   target/arm/helper.c    | 271 -----------------------------------------
>   4 files changed, 277 insertions(+), 271 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

