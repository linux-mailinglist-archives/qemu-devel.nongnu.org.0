Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9AE647F58
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 09:36:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Yqq-000418-Ku; Fri, 09 Dec 2022 03:35:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3Yqn-00040x-PE
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 03:35:21 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3Yqi-0000LB-7r
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 03:35:21 -0500
Received: by mail-wr1-x436.google.com with SMTP id w15so4434701wrl.9
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 00:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/xeNrtktWXgkfyVDFYgj4gaqPrqNZfx5Pm6YrL6GrsM=;
 b=YRLAchFZ4J1oPBoVZYAadsS9GZO8uJyZFT1Jla4TcdNI342o3eXHYmMrXRtuSGa+8M
 vUCYC9ZIT0bEBjVO/IVnmyOwJobAGQnQ+lN61+fGpR+iJ1ALDhsGxPxo7c7b6S1CSfqr
 5rNnI2fP8P2DO6rd6XYR/99wKI6NNZT4gkygus6AkGo1rrF7HWK7L3NHr9irzDqkysyc
 rVcoLf96rrHul6KEEBAdIrUhiO257A8YdQFl8JOH+K/Am9aSiyIyTE/80VeCtgJovSpm
 0pQVqysfJOD53jYJ5r+flY73ayNVcXlvkCI2NWPgmIc+81xc7c6CD7O1jv/Tcd3CfP+5
 F8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/xeNrtktWXgkfyVDFYgj4gaqPrqNZfx5Pm6YrL6GrsM=;
 b=tw1/0A4Pwb236K744wt90bMRX57Yg+mWVQl9K39YaBiKqihGHaVzU7w4iHRxCAIwIH
 2PMk5ReJj3SMrzSeoiffGGN5Vb4WMK2NSZVfsC3p4VGzBV24y2HkKpLrFEYHLN9e3Xjk
 tS2w2xjz0/zBwF2bHlm5l97ywUDKKIFYRr6Vud9HUtJV/bMzIU78MzvLMBXHrXRPokN/
 pqTj2INi0R1suD12Cbxn2p43FQViIOUBOHQZJyODuSn+9wDLMvGoFyjJbbkhiCSl/iB8
 xzrul1unIGnbocyk0BjUklgQPt9xGrnW5h91JvdYjJNTHKEXMPRAQsTmtPSyvO6769/G
 o1lQ==
X-Gm-Message-State: ANoB5pn8S+wvkeawp0MjGTFROov0QlpT3Y12Jp5wxvr930MtCWuxND1c
 LujhaqgMO7uVF7jwliMcNQYuNA==
X-Google-Smtp-Source: AA0mqf5Jo6hqKeafjVeYvC8cZmVUqgCWvSwATxN+qxLdWFaFNKOQIsNb35EjYBJezUQCUrLlKPjKwg==
X-Received: by 2002:adf:dbc8:0:b0:241:d7ce:4383 with SMTP id
 e8-20020adfdbc8000000b00241d7ce4383mr2799906wrj.20.1670574912331; 
 Fri, 09 Dec 2022 00:35:12 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j8-20020a5d4528000000b0024287d9d4a8sm783408wra.74.2022.12.09.00.35.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 00:35:11 -0800 (PST)
Message-ID: <a636bdab-b092-522c-f374-de48074ee51a@linaro.org>
Date: Fri, 9 Dec 2022 09:35:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v3 1/8] util: Add interval-tree.c
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu
References: <20221209051914.398215-1-richard.henderson@linaro.org>
 <20221209051914.398215-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221209051914.398215-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.266,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 9/12/22 06:19, Richard Henderson wrote:
> Copy and simplify the Linux kernel's interval_tree_generic.h,
> instantiating for uint64_t.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/qemu/interval-tree.h    |  99 ++++
>   tests/unit/test-interval-tree.c | 209 ++++++++
>   util/interval-tree.c            | 882 ++++++++++++++++++++++++++++++++
>   tests/unit/meson.build          |   1 +
>   util/meson.build                |   1 +
>   5 files changed, 1192 insertions(+)
>   create mode 100644 include/qemu/interval-tree.h
>   create mode 100644 tests/unit/test-interval-tree.c
>   create mode 100644 util/interval-tree.c
> 
> diff --git a/include/qemu/interval-tree.h b/include/qemu/interval-tree.h
> new file mode 100644
> index 0000000000..25006debe8
> --- /dev/null
> +++ b/include/qemu/interval-tree.h
> @@ -0,0 +1,99 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Interval trees.
> + *
> + * Derived from include/linux/interval_tree.h and its dependencies.
> + */
> +
> +#ifndef QEMU_INTERVAL_TREE_H
> +#define QEMU_INTERVAL_TREE_H

> +
> +#endif /* QEMU_INTERVAL_TREE_H */
> diff --git a/tests/unit/test-interval-tree.c b/tests/unit/test-interval-tree.c
> new file mode 100644
> index 0000000000..119817a019
> --- /dev/null
> +++ b/tests/unit/test-interval-tree.c



> +/* Occasionally useful for calling from within the debugger. */
> +#if 0
> +static void debug_interval_tree_int(IntervalTreeNode *node,
> +                                    const char *dir, int level)
> +{
> +    printf("%4d %*s %s [%" PRIu64 ",%" PRIu64 "] subtree_last:%" PRIu64 "\n",
> +           level, level + 1, dir, rb_is_red(&node->rb) ? "r" : "b",
> +           node->start, node->last, node->subtree_last);
> +
> +    if (node->rb.rb_left) {
> +        debug_interval_tree_int(rb_to_itree(node->rb.rb_left), "<", level + 1);
> +    }
> +    if (node->rb.rb_right) {
> +        debug_interval_tree_int(rb_to_itree(node->rb.rb_right), ">", level + 1);
> +    }
> +}
> +
> +void debug_interval_tree(IntervalTreeNode *node);

If you think this function is helpful, shouldn't we declare it in the
header within CONFIG_DEBUG_TCG guards?

> +void debug_interval_tree(IntervalTreeNode *node)
> +{
> +    if (node) {
> +        debug_interval_tree_int(node, "*", 0);
> +    } else {
> +        printf("null\n");
> +    }
> +}
> +#endif

