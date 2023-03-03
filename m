Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A616A990A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 15:05:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY60w-00065F-7n; Fri, 03 Mar 2023 09:04:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY60s-00064i-Gz
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 09:03:58 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY60a-0007xh-Ru
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 09:03:42 -0500
Received: by mail-pf1-x435.google.com with SMTP id fd25so1627168pfb.1
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 06:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677852219;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1lb7CZq8sImzf1Iqz9TFeDKTgP9++0M9xsvkBd8F1Bk=;
 b=d7ryU+ycWykm3mRHKygRvANp8jemR5uwqBnMncPAXYbcn3bjXodlU0o9AkONb8/Klo
 GzX3zJwnvwwnOvYmG6JGSjDDFx3rNKbuD5K4LipE8CaYlOqBgFLst2uiGUgonZW9CeLI
 yy0Ywo2uh9opboESlUA4/Ldi2vBWY1bTl/Hqf4s1EbaH1koLn2EK0xB3I9tLbTOuXiDN
 /vN+ZHobwmi+BR5oKv1nOnMUYtMds6JrMZJe4iMVDf8B8IAk/UyR1FV/Fw1b2gBKXYKf
 9focd7DSs1qWdd/atI9SxIptyPPMVRU+kDZL6blW5Whe78N+koc8mxdaoOPmWI/anWwx
 MrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677852219;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1lb7CZq8sImzf1Iqz9TFeDKTgP9++0M9xsvkBd8F1Bk=;
 b=hYl6kJ8atPT5QLZ3hT77+lzlFT5waV7Vnk7trte/ReW/hnRMVN990JsR/k5iPz+une
 9kmjVYiS9dBRBZKSwt+3wnF+oz9t7UEJjIdcJrILVkX3/KK3OzNFr8C7+YYsJyrdVjOh
 TWo9VrWEbGJkHTAa9EC/wdhCp6oPmnEptljYTQOF2E1SffPJhcPj3vnpSnlYzDOSHBs6
 xuGOKSQ+52QWIC0/8A6RtgKyUplY4lb7o4hezZgoKd+fHjgG0Trwk0Q+LS2Olnc2ExnN
 J9NVgKrisb0X2tgynTJwHrp87x0QbKpW3iVk+tageQI7l6rkAPF9PJL/xGSiDXIhzK8n
 Fa+A==
X-Gm-Message-State: AO0yUKUkYNYPEsQ2GZl+hY/LyotLpnlq3Y3GxrZkvnGrbsyHJ6nVLtJm
 sKnlgTtEsaX+G2LuSjQDWk+Y2mv9PS0MAdpf/7DjuA==
X-Google-Smtp-Source: AK7set+GJcfk31RtGTNrKUoTn5D0H614tQYo+w6W3nBUgjN7ashBcDUSl7fL2FQEIp2OCdhFlJM174PEy6sof89czQk=
X-Received: by 2002:a63:291e:0:b0:503:77ce:a1ab with SMTP id
 bt30-20020a63291e000000b0050377cea1abmr514634pgb.9.1677852218976; Fri, 03 Mar
 2023 06:03:38 -0800 (PST)
MIME-Version: 1.0
References: <20230227213329.793795-1-richard.henderson@linaro.org>
In-Reply-To: <20230227213329.793795-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 14:03:27 +0000
Message-ID: <CAFEAcA_L-62NjxXmRXZoAwwYGN2KrZ=h_MVGbxWhO6L0aA677A@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] target/arm: gdbstub cleanups and additions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 27 Feb 2023 at 21:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is my pauth enhancements from last year, the corresponding gdb
> patches for which are nearing merge.  If lore and patchew are to be
> believed, I never posted this to the list, only pushed a branch so
> that issue #1105 could see it.
>
> Since the cleanups there conflict with the recent m-profile gdbstub
> patch set, I set about to resolve those.  In the process, I merged
> the secure extension code with the sysregs, since they're simply
> presenting different views of the same registers.
>
> Changes for v3:
>   * Drop write paths; there's quite a lot to reorg in v7m_msr, and
>     it's not clear what should even happen on the exception paths.
>
> Changes for v2:
>   * Incorporate feedback for pauth.
>   * Rewrite m-profile systemreg and secext xml.
>     - Since these are Known to gdb, do not merge the two xml.
>     - Upstream gdb only knows about {M,P}SP, but David's extension
>       to include the other registers makes sense and Luis confirms
>       that it's ok to have extra registers in the two features.
>     - Continue to share code between the two xml, but separate
>       out the mapping from gdbstub regno to internal enumeration.



Applied to target-arm.next, thanks.

-- PMM

