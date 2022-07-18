Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A325781D2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 14:12:57 +0200 (CEST)
Received: from localhost ([::1]:56218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDPcO-0002lX-98
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 08:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDPLA-0001hF-A8
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:55:08 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:42992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDPL7-0006CL-Hz
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:55:06 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id c131so19599306ybf.9
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 04:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X+BmcDDXd/8gm8VkYyN+ipQkPc/1T3GGYMz8aERPj5k=;
 b=Fy3DEOMOubiyjEoIy78gAZMICs8k8nDDA4e3aYMlUycJEjKTrkQzSBsHO7nN93JE4p
 TbqHWcKqUL5v9wVhHrF1lBdzpKtJNgvtMhF0nE+U7snDAlmtXBharRiEbjzcc9S938kf
 x04dsGZZz9fkC1rvA3V64ctPFWeFZnmapbpghQFCgeJuCOKO8pgvGMVVIsG/0xr+fbO4
 Gqgb61uCLGi9f0DzYvPG+BgaMrX3dcQFdLBIXaOiOYITvqKME3Qfi5ewr8rvE1fcrrqS
 pcb699k6VsVyhGElbxHTNtVFDY66m+ybzlsoK/7mYzRiGjNffbRlvoJk71iCrBQD4qfp
 5J4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X+BmcDDXd/8gm8VkYyN+ipQkPc/1T3GGYMz8aERPj5k=;
 b=WbtL7lpLE+QSmYwFfOZEtOOIJk2lknPom0h1JLl8lpnE0tukYqzZGSwKlaQO947fR6
 R3jzvD7dfKSJvp43K0He19Rfje5AiVbca7SPlFcui7fw8TXAV1t04z0e0zoz9pMQLxd4
 Y9s/KVbYNg2VCrxrZU1nwi1bLvu256wk39baj89RC7MgelA990V2/GmUDqbOtSOablUq
 yqXjvVE5vhtIgVTMdJh3CHQkd6ESYoVVBH9SgleEaV4Cx+MwodbpqnFmRAkMy2Ms9iZH
 tomJZybReLbfhOJVimarPaaSAazSTOJd10hqvgf+joWj6vXXMLRVi7XyAB/EbuSWSbSo
 kHDA==
X-Gm-Message-State: AJIora8vXXVpxgf+UL/we0EsLCP1IeUsYjAQgj3tukgsgVauFGRXg90l
 0O/5K13e3z+6xuUQkDs1mtqVlXCAkJU+AdXQ3XWHd/g6gKg=
X-Google-Smtp-Source: AGRyM1vRm7saeeghTptduLkTT6mD1zZ645OSEUSAn6FZjRnoJlfqa6FVTMDw+rzHdcCZh9imNYxH45RqxoLHs2E/ffI=
X-Received: by 2002:a25:2f58:0:b0:66e:cf9a:6a2 with SMTP id
 v85-20020a252f58000000b0066ecf9a06a2mr28953650ybv.193.1658145304361; Mon, 18
 Jul 2022 04:55:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220708154700.18682-1-richard.henderson@linaro.org>
 <20220708154700.18682-24-richard.henderson@linaro.org>
In-Reply-To: <20220708154700.18682-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 12:54:53 +0100
Message-ID: <CAFEAcA9oPWmq7pAABd_22BRf1E1SkOVGFTjcXVdYw0PiuwMveQ@mail.gmail.com>
Subject: Re: [RISU PATCH v4 23/29] Standardize reginfo_dump_mismatch printing
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, 8 Jul 2022 at 17:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Hoist the "master vs apprentice" label to apprentice(), since
> we will want different labels for dumping.  Remove all of the
> "mismatch" text from reginfo_dump_mismatch -- just print "vs".
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> diff --git a/risu_reginfo_ppc64.c b/risu_reginfo_ppc64.c
> index 9899b36..e96dc48 100644
> --- a/risu_reginfo_ppc64.c
> +++ b/risu_reginfo_ppc64.c
> @@ -27,6 +27,15 @@
>  const struct option * const arch_long_opts;
>  const char * const arch_extra_help;
>
> +static const char * const greg_names[NGREG] = {
> +    "r0",  "r1",  "r2",  "r3",  "r4",  "r5",  "r6",  "r7",
> +    "r8",  "r9", "r10", "r11", "r12", "r13", "r14", "r15",
> +   "r16", "r17", "r18", "r19", "r20", "r21", "r22", "r23",
> +   "r24", "r25", "r26", "r27", "r28", "r29", "r30", "r31",
> +   [XER] = "xer",
> +   [CCR] = "ccr",
> +};
> +
>  void process_arch_opt(int opt, const char *arg)
>  {
>      abort();
> @@ -147,35 +156,21 @@ int reginfo_dump(struct reginfo *ri, FILE * f)
>      return !ferror(f);
>  }
>
> -int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE *f)
> +void reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE *f)
>  {
>      int i;
> -    for (i = 0; i < 32; i++) {
> -        if (i == 1 || i == 13) {
> -            continue;
> +
> +    for (i = 0; i < NGREG; i++) {
> +        if (greg_names[i] != NULL && m->gregs[i] != a->gregs[i]) {
> +            fprintf(f, "%6s: %016lx vs %016lx\n",
> +                    greg_names[i], m->gregs[i], a->gregs[i]);
>          }

This used to skip r1 and r13, and now it does not.

> -
> -        if (m->gregs[i] != a->gregs[i]) {
> -            fprintf(f, "Mismatch: Register r%d\n", i);
> -            fprintf(f, "master: [%lx] - apprentice: [%lx]\n",
> -                    m->gregs[i], a->gregs[i]);
> -        }
> -    }
> -
> -    if (m->gregs[XER] != a->gregs[XER]) {
> -        fprintf(f, "Mismatch: XER\n");
> -        fprintf(f, "m: [%lx] != a: [%lx]\n", m->gregs[XER], a->gregs[XER]);
> -    }
> -
> -    if (m->gregs[CCR] != a->gregs[CCR]) {
> -        fprintf(f, "Mismatch: Cond. Register\n");
> -        fprintf(f, "m: [%lx] != a: [%lx]\n", m->gregs[CCR], a->gregs[CCR]);
>      }
>
>      for (i = 0; i < 32; i++) {
>          if (m->fpregs[i] != a->fpregs[i]) {
> -            fprintf(f, "Mismatch: Register f%d\n", i);
> -            fprintf(f, "m: [%016lx] != a: [%016lx]\n",
> +            fprintf(f, "%*s%d: %016lx vs %016lx\n",
> +                    6 - (i < 10 ? 1 : 2), "f", i,
>                      m->fpregs[i], a->fpregs[i]);
>          }
>      }

thanks
-- PMM

