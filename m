Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2666A9FE0
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 20:07:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYAk3-0007WE-F8; Fri, 03 Mar 2023 14:06:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAk1-0007Uv-2Y
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 14:06:53 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAjz-000816-LL
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 14:06:52 -0500
Received: by mail-pg1-x531.google.com with SMTP id 16so2075047pge.11
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 11:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677870409;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=r9Yndr1liXeO+608ToBMudosrw4ObWwa7evXR2PJIQ8=;
 b=H0HcXLBmvpop0NBGGk3/mM7JrWyl3uWLfg1cvVbZjotOopvKvO/18u8MUmRkUOkvP6
 c2XH+XXNqVM2qoCpBHeBYZD6Kp7jAOJtlTGcxCwp4BZUZFfNehQnJPMWSll/W5LOJq15
 7dHrUVMWCFnqdtAr6fr8FSHTbXJkxVv5fwmp4aImYgBkgqw5yy6p48c5tzStWGF+DlSi
 r3LEOgoE1JTJ9DlUdQPg6cp/n02tkHeKBJvjginMKgFzXiOhqVFbE7guaLe7nJ7PRRL2
 6EXCX4NwVoW8rt/nw9RSZP6FQhMivAWJFKva7HtrhuV2oZAvWZS04uxE/bRkA7mKUCah
 r43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677870409;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r9Yndr1liXeO+608ToBMudosrw4ObWwa7evXR2PJIQ8=;
 b=w6liK3DXJ9Ix/wy4GAKlB4q1DEREnlyZrDK74Uox7qR7KAiTLI6imHaAKiDMjRCv8M
 hZGMPWeCMlREuyxxWOIunnkgG2nMA9XapzqtpyvSgbfn45naBEIkC7/BecVVGRQgPuEk
 EBfuOLGuBJ7bVZ2pCXacmubV/Sp5x+jZLbKhcWjTuvoqLfib0uiwSmpjLU7RRxH6lqzR
 Xy7T0dgOf6KOgkf6jDDbwcAqaucWbY/E6K2duu4Cy8xGYB48sZI2x6hnL05ecQidIGxD
 R1rM7W+wsRoI2C96H0FLOdcWV4Slz388+yjSHrIIiT8KC0In5hsbbesl9Ozr6PuuxTXs
 olXQ==
X-Gm-Message-State: AO0yUKWrYnA5+MIA/vNVuwkoel93Il8u9rnzCCdNJR+LKtLHg5OUMByp
 FCGj6V6ptesBC26Jy1qMyWGJYsC8bq3ccFNA1a1qzQ==
X-Google-Smtp-Source: AK7set+G/vH7N1rAAabvXcSVKcEWoRIoZ1s1D+lA6rT7RxVbVv084Uful7WrUEJoUBK9m8lyMY6llvSn2IxmbCt55WE=
X-Received: by 2002:a63:8c17:0:b0:503:7be0:ea51 with SMTP id
 m23-20020a638c17000000b005037be0ea51mr861426pgd.9.1677870409504; Fri, 03 Mar
 2023 11:06:49 -0800 (PST)
MIME-Version: 1.0
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
 <20230225091427.1817156-67-richard.henderson@linaro.org>
In-Reply-To: <20230225091427.1817156-67-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 19:06:37 +0000
Message-ID: <CAFEAcA_F_KGwDsV6MPZwyqs83oJQvr53cTTSgW0L1PwOcKJEbg@mail.gmail.com>
Subject: Re: [PATCH 66/76] target/sparc: Drop get_temp_i32
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x531.google.com
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

On Sat, 25 Feb 2023 at 09:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries,
> therefore there's no need to record temps for later freeing.
> Replace the few uses with tcg_temp_new_i32.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> @@ -5762,14 +5752,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
>      gen_exception(dc, TT_NCP_INSN);
>      goto egress;
>  #endif
> - egress:
> -    if (dc->n_t32 != 0) {
> -        int i;
> -        for (i = dc->n_t32 - 1; i >= 0; --i) {
> -            tcg_temp_free_i32(dc->t32[i]);
> -        }
> -        dc->n_t32 = 0;
> -    }
> + egress:;
>  }

Stray semicolon after colon, or does C not let you put a label at
the end of a function ?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

