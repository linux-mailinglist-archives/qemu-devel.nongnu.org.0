Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C144DCB70
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 17:31:24 +0100 (CET)
Received: from localhost ([::1]:59392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUt23-0002Y5-LG
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 12:31:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUszI-0000vm-Jy
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:28:32 -0400
Received: from [2607:f8b0:4864:20::112f] (port=44461
 helo=mail-yw1-x112f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUszH-0004Qf-48
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:28:32 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2d07ae0b1c4so63944517b3.11
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 09:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8vGKfy2wZ8QLhLP4BgOJJgrRgp4sA8YGL/wtO7L5cWs=;
 b=G/Iy+2YUJKqeNlS5lQ5U06KKHYx8pFM3TCqBvgZKk4g64uSGEcdySiELQ1PchTHLUK
 FDHq1TcOzBPA62dGq6+HeKVGUYIKaghBacvBwQd7q2o7Hm3bOxLpAifpREO8g0HcJMUK
 aOSJNDiiP5s1giyFrsLdMhyXs66w8jZcxHk1vwjzWoTTtFTAfGgLOJym88unkUXAUxPm
 mKR+FQve8nKplB3BRkxCi4IZV/hfyypL13o/siVgpDte8iuTp/ZU2V7wbDgy/sfUa//8
 JHX5pn7nP4frSBO0vtzrM/0yOvTvwCaqaMVXXM4hh85vkPl+tsV1u4ySUeHTSmbnzOSS
 Suug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8vGKfy2wZ8QLhLP4BgOJJgrRgp4sA8YGL/wtO7L5cWs=;
 b=u6drhZ6ZiWHmbKUpOjedVE706kqgwmIowAEmEnQXvvh2gZT4WEngDaxjEn7rOCpkJ6
 FVmr6ACJ9W+skInVSJnleiDyYN0RlX3Ytk9S0KWa+4GMGMrtelYvZB2adLnTb3PO7DtH
 q/pEDZ3xJrvfyaj9hISJhLHb9pbZELan/0e665lX7NS4lHLdXPazrur6e/rGCWk3I6us
 5lqWTRP30FFtrUQJ5Hf5vsYn2o0wRz+hvodVgSU7ht6tGJzch/8mDfmcOep0HpMMIEMN
 iqhl96V0EqC95QLLvC5+/ggK0IvNaMUsTvrQYMBi4kKWj1ykFS5IbZSZ7vcpDITSAC2k
 uw7A==
X-Gm-Message-State: AOAM530/m9vAuOuBrf1Usk4JyJhPLsqKijbQTA05zJxEsM9BoMYAIdka
 aSE0FBi0vbELwVc1PlQOatMbdVsL19euFNd5NozjrQ==
X-Google-Smtp-Source: ABdhPJzkDepBKtAcB6PtLfsnoLzSWVRyOqin37Ydfg12Ex+Ms1aQHFjUnWmToZ2+xCbs49BcUhz76pYA0WlmRJO3Ea0=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr6295091ywh.329.1647534510184; Thu, 17
 Mar 2022 09:28:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220317050538.924111-1-richard.henderson@linaro.org>
 <20220317050538.924111-38-richard.henderson@linaro.org>
In-Reply-To: <20220317050538.924111-38-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2022 16:28:18 +0000
Message-ID: <CAFEAcA9Ar9kBANNQPe3pYmEpME1j3R2zh=29aE=XF7Xsjf=Nhg@mail.gmail.com>
Subject: Re: [PATCH for-7.1 v6 37/51] target/nios2: Use gen_goto_tb for
 DISAS_TOO_MANY
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Mar 2022 at 05:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Depending on the reason for ending the TB, we can chain
> to the next TB because the PC is constant.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/translate.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

