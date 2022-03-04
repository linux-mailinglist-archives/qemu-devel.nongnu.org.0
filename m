Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E944CD499
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 13:58:21 +0100 (CET)
Received: from localhost ([::1]:57528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ7Vk-0003Xk-JK
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 07:58:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ7Uu-0002rf-RE
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 07:57:28 -0500
Received: from [2607:f8b0:4864:20::b30] (port=38890
 helo=mail-yb1-xb30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ7Ut-0000km-6R
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 07:57:28 -0500
Received: by mail-yb1-xb30.google.com with SMTP id u3so16684252ybh.5
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 04:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bd63nJjSwqjy0OI/lNLvXPcHq5LH/yPaERbHooxLvIk=;
 b=LJFn+LWoRqzxIT/ZSAGBBwbewBne4VZpYfe7aZpD9cnvZeGddIU0ba9l24+8rrnl0m
 VrFMalLP9kJ0TKKsVoKWvvm0+MVpvMNx4AXGefhQ+Iikh3XK7SZD3E7HO0XgkRGlzaj2
 uTR8emhP8snsI6izXZywfQBHn7SCWPmLxmlXEq1fUaQDOSaJ3XfyydNIhHo4HX87JU+4
 AaPf471E1UCfoUJrNghDred14iLcnJ3RaQOWTwx3dBJuk8deyhy+5k6FSs8BZCOygVmb
 bfoM8yJBTOnNYdloujk6gNVggIoGvdDbpVK5Gb1zAuc0EwJBwk4O0IE3P7L6TUYH51jY
 JiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bd63nJjSwqjy0OI/lNLvXPcHq5LH/yPaERbHooxLvIk=;
 b=eYWTShT4Dnj9YgfmhaqhDsDENuQC010fRzuJDw8kIIY/3yPcgurh3BPGBG/y2auEjG
 xqO+uzW7fkCTvL62dS6S+AD9MDsK/Y2zIGYb4CEQnfN9Xdepd2fsf8TR9fxNRUqG+uFw
 BNXasRCy5e2PX5H4M5tilUNvSf3qtWRAdkLtj+2gLfBh5XkE7FxNZp3LjTtSD8AJS9NO
 m005vsHtL+BBtNtnxNLDhsm6uezlBY6YQAHZWl/Y9hfvkHKSt3zivrluh4kb7agRCQx4
 ySAt7SO783ekk5NJn32L5rOuwG0bNqQ1JaqeFkCtnRiZ3YPBQWxikPtTYv3HMR0eda/C
 DDfg==
X-Gm-Message-State: AOAM531eicCRgjLQfEt+cbXJQocOlwhTs1yrBRcJj7GRG4CFJzx9CA9p
 Drkjm0NYP5KhC+Iw6qBb2S32mH1RFdILuRmiNAjBHw==
X-Google-Smtp-Source: ABdhPJwznitgHTouGkKObS89hfeWrG3vkz7p64rSn4XL/Y80dhdHbB/us5TPdad64iX7j4r8qlq4CPrFlxC0ZHU/hvM=
X-Received: by 2002:a05:6902:83:b0:61a:709b:d841 with SMTP id
 h3-20020a056902008300b0061a709bd841mr37002747ybs.140.1646398646166; Fri, 04
 Mar 2022 04:57:26 -0800 (PST)
MIME-Version: 1.0
References: <20220303153906.2024748-1-amir.gonnen@neuroblade.ai>
 <20220303153906.2024748-2-amir.gonnen@neuroblade.ai>
In-Reply-To: <20220303153906.2024748-2-amir.gonnen@neuroblade.ai>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Mar 2022 12:57:15 +0000
Message-ID: <CAFEAcA8YwGaA9M2oA9MBCfpV-QPeAsAanv8xotH_Cn1tTiBcmA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] target/nios2: Check supervisor on eret
To: Amir Gonnen <amir.gonnen@neuroblade.ai>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Mar 2022 at 15:39, Amir Gonnen <amir.gonnen@neuroblade.ai> wrote:
>
> eret instruction is only allowed in supervisor mode.
>
> Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
> ---
>  target/nios2/translate.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/target/nios2/translate.c b/target/nios2/translate.c
> index ce3aacf59d..007c17e6e9 100644
> --- a/target/nios2/translate.c
> +++ b/target/nios2/translate.c
> @@ -384,6 +384,8 @@ static const Nios2Instruction i_type_instructions[] = {
>   */
>  static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
>  {
> +    gen_check_supervisor(dc);
> +
>      tcg_gen_mov_tl(cpu_R[CR_STATUS], cpu_R[CR_ESTATUS]);
>      tcg_gen_mov_tl(cpu_R[R_PC], cpu_R[R_EA]);
>
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

