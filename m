Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B21F36A9DAD
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:28:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY9CA-0001l8-OB; Fri, 03 Mar 2023 12:27:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9C7-0001dX-BT
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:27:47 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9C4-0006aN-Au
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:27:47 -0500
Received: by mail-pg1-x532.google.com with SMTP id z10so1921799pgr.8
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 09:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677864463;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8LO3H0xihPu/J7zCAeMi7XJn5vVG/43m/HalvuEQr3o=;
 b=dqe9Wr/0rmE64Xh4Yh88Z3e9cpBEwQtvyuIgUVKevqct1CNJD97nClsdlKWVWM5bqL
 AMy2A3k3BhQTXw8Xd/mcdQZmkedJIPma18eTQITDXR2UrL/++lwc3xrn3xjv8fVQSJQl
 PGfz2yV4R+7+xqFLNpHCCK6YwTcMe+q7Np4Ul7XqQRmgjiBkDaYAycIIb0EcoP2tNC9F
 zKTDZj5OFsX+8cJJ6Dz9hFHL8nyEjfxnFSHCiKEakc6u0f6Rfu/sGwaKWIC+e2FFzGnL
 pXYoM90xKp7I5rZ1qNXNbhkFwxfN1wZJqRrQxO5JfIpvV9V3E6rHFfe9GL/m3HhuhWrO
 Zj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864463;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8LO3H0xihPu/J7zCAeMi7XJn5vVG/43m/HalvuEQr3o=;
 b=O5kqvXpInDMJdBTWKbrWXXti53UHRsxK1Ik5KZBwxDT1Hjq8N9qv48BLJbty/eQO0g
 3O/ZE1xfIdal476wKT0nKbPCBVzq5Lqp+4yGYpTdsevSDObjnPTmd6QgsfYTmau66jTA
 A2oHM/ySul41zKvvy24h5DpL6JHZ+cOtRcTGg508v+rRJGqCUwLQlK+8Lt2GqH0L/UGX
 zznAiAq6ato9NYW1KHpX63vi2o63Usqd1dCSH2eT6gTm1e64Y7ex/ZCAYMYwPiGdFtdd
 3jr1Nt6MYhfDuKZmelbtloN7yP05A+NkhsYIg5xj5oYj/vIieueXZOEHXebbr1Ks/J3d
 zaOg==
X-Gm-Message-State: AO0yUKXOEeQ9sEOlg3CqJ0JJrrkBlmGPGc1oP/Gr8BSjLF54itwLJnC2
 DefCAHO5zBBmLjmbWbjNLpENMySoQI68psxF5CZHBQ==
X-Google-Smtp-Source: AK7set8RtgODdpxMw0WfgMvh8Pc/ic98gX8Ayo6k4GS8+spLKyKEnHqUHKrKYeujhwqLaNk7opMzTRtE8tnRzPzCNoc=
X-Received: by 2002:a62:ce4e:0:b0:5a9:c22e:7764 with SMTP id
 y75-20020a62ce4e000000b005a9c22e7764mr1200776pfg.5.1677864462740; Fri, 03 Mar
 2023 09:27:42 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-4-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:27:31 +0000
Message-ID: <CAFEAcA9S1kr8rJwgM=qxoSouBhQ+q_cHoUVmZLFBtuTd3YqHGA@mail.gmail.com>
Subject: Re: [PATCH v2 03/76] target/alpha: Drop tcg_temp_free
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x532.google.com
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

On Mon, 27 Feb 2023 at 05:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

