Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 160155F6C80
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 19:08:51 +0200 (CEST)
Received: from localhost ([::1]:41080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogUMb-0004wu-LU
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 13:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogTDI-00060F-1d
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:55:08 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:34458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogTDG-0003BY-ES
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:55:07 -0400
Received: by mail-pl1-x629.google.com with SMTP id n7so2120876plp.1
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gPdQk8CmvlKjoU43I3j+3YXTgKXcw8FgEbePWdre+oY=;
 b=kpNqQR7laWk/jXwRf2VUtS0ehMgRsGM9ZLy8bJH7V1TUvruDxhD0ymZLi3hd4KkOOt
 iYBPnvFmbmco89Br2Rl5qUi131YI5ZKILuVlwi7cmfx1Vhk0PldMLhNnrNel4twWSlcY
 MMm5m2IkNKpknWF0HT6j34ofmbCaVcmT88M3LG8ZjORKWspGI7KRX5YJLQiRN80oThB3
 pt8ZnuqMvVbm8jA0H+RVnPGGBTGqUjWOM5ViYam9afq2GGpbcRGdmQ7y1uv/ocHAbhx1
 fK13/SaODMRa6a10m+0yRkUqNt7bysZETBykF3PBzfAPcU+GjwRSh7pHsh1BdV9dEXna
 2/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gPdQk8CmvlKjoU43I3j+3YXTgKXcw8FgEbePWdre+oY=;
 b=o8ZkSLZr2gkHmOGeq3cXeYFkQaSYnaojoRFb7Syl2RmbUY2/7yUepesk0RVC1rEIv6
 e0LOfO+Ej+Q6YMrZVm2oC1BxM5yfpo2PqsTtTFGcKneXEZia3AOEnd3jmNDku1gXKqiZ
 dKIuJ4o90gENpwfhEtYfxuWQ62gtd36IJ1/EoEDwV55z252Q42HHKpxT56Ku4EZ6StfW
 awOTt/8HR7bH582e330Rkq4OT9HyvhHG0TcGMDytG3XNflOSwwWGEFpCz+tTs0vMFo3H
 NSEeY/gtrDX5d/LZJ9qNAJ1QArDaNDoFEoD2vt9mBjWfzYNkNNpA92yzAsDKqO8i6fau
 upcg==
X-Gm-Message-State: ACrzQf2qZOLbC1mc1dqQ7+gNP8xUTLrpYvM1WEYLOwCMwIqxfWcEjSIT
 xCFOFRM/oXprZ9PwDO3grnp2gwWXIyYUE8jaVSreXQ==
X-Google-Smtp-Source: AMsMyM4SqFOviQ4AQUngtqnvdKVkw9n7K7p+8tdVge/IqUbUn/K3nrlJFYIqdOvwqBwDMOa651UE8md4LWRWzjTNb+k=
X-Received: by 2002:a17:902:7c97:b0:17f:5abf:9450 with SMTP id
 y23-20020a1709027c9700b0017f5abf9450mr513126pll.19.1665071704926; Thu, 06 Oct
 2022 08:55:04 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-27-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-27-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 16:54:53 +0100
Message-ID: <CAFEAcA_FtLots9sCy3G39Gc8F9QJRcVXyY8V96qLM8ycOWNQfg@mail.gmail.com>
Subject: Re: [PATCH v3 26/42] target/arm: Plumb debug into S1_ptw_translate
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Sat, 1 Oct 2022 at 17:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Before using softmmu page tables for the ptw, plumb down
> a debug parameter so that we can query page table entries
> from gdbstub without modifying cpu state.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


> +static bool get_phys_addr_with_secure_debug(CPUARMState *env,
> +                                            target_ulong address,
> +                                            MMUAccessType access_type,
> +                                            ARMMMUIdx mmu_idx,
> +                                            bool is_secure, bool debug,
> +                                            GetPhysAddrResult *result,
> +                                            ARMMMUFaultInfo *fi)

I'm not too enthused about this function name, because
Secure Debug is an entirely unrelated architecture feature, but
I can't immediately think of a better one, so

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

