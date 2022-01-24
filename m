Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB69A499D1D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 23:16:49 +0100 (CET)
Received: from localhost ([::1]:55688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC7do-0002aM-Uq
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 17:16:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC7aq-0001NL-HG
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 17:13:44 -0500
Received: from [2a00:1450:4864:20::32e] (port=38462
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC7ao-00046X-IQ
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 17:13:43 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 o30-20020a05600c511e00b0034f4c3186f4so310687wms.3
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 14:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=o4U1PtcaNv3+tlA+CpAUSi7vjDOnpo8DG1iWvqJV9O0=;
 b=ZiehhM/O4UgoUPSsW7sFiSZwVarccH6koLoZ6SlS53c2A40HtWCRc7Ub0IYyJil95T
 1uDQxPvls1YJo8tr9E9zojZewMm3cCrx5ne1L3WZQhsEEskHn4q0rJc2fdMbcmv0Xv90
 wxZwWrefJCBZHaDD8NZmhetko5iy6N6UGJ5XEeW0+Y8200cH7aS8Weh9bAgcydkq4kh+
 xcbGVH3cahMeJg4faVAxZROzKE+jePaM2VIkgGBukJnhKecQ53ruZuR7mpX834omL9AE
 vQToxAMZggoSsDTJa7iTxWZBGitw+Ob90vnI5bgTbaclkovv1vSbOZcjvB5wMbP8zDrQ
 dXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=o4U1PtcaNv3+tlA+CpAUSi7vjDOnpo8DG1iWvqJV9O0=;
 b=aLVGlEav0kt/c0ft+qtxjeP/Fp960VqFRaChfweBvbkh0ZyNOrrk4wKUSj52BuTK9A
 Q7B27nDCle15yEl+S0/osEG29rDJVxOKnfUN60URn5jJJYyI1OVkHxYHM7wbDGZj2XHV
 cn5qzAzvvMinGH1UAzpvP98NxddRx3oIll2SupihUY+XJuSLn99ZCMjoKZQvmS7dFx2d
 mmwDQXUffZTKG5Tmi+awbh8LlzGi4LJ7OSjvyCw0firaoWFdRxuNY5PimF291yRhP7o6
 KwjIDWiejnCcalgH1g8BJKs6Osbf5EMcf3V5gPqul+AGSny383VMbh/PXiFeeQ/KaTtd
 IA9w==
X-Gm-Message-State: AOAM532oRZmPUel62VQ2gBTLRS5PtbeSMCiFK0dcljQfv1P879/6POLq
 kDQN6OwDF5tcZ3bYcnx6rTI=
X-Google-Smtp-Source: ABdhPJwVamTBBu6BqOEltS6tK7JrL6a+1jVdKl/KHuxqXHr8XnH5BN9d5sayog1yfqq56iqaPIgeTw==
X-Received: by 2002:a05:600c:3592:: with SMTP id
 p18mr296284wmq.71.1643062415109; 
 Mon, 24 Jan 2022 14:13:35 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id y15sm17999313wry.36.2022.01.24.14.13.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 14:13:34 -0800 (PST)
Message-ID: <a020602f-a2b7-fb32-3ca8-9a076d98fe5e@amsat.org>
Date: Mon, 24 Jan 2022 23:13:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 20/22] tests/plugins: add instruction matching to
 libinsn.so
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Vasilev Oleg <vasilev.oleg@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 aaron@os.amperecomputing.com, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Luke.Craig@ll.mit.edu, Alexandre Iooss <erdnaxe@crans.org>,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com
References: <20220124201608.604599-1-alex.bennee@linaro.org>
 <20220124201608.604599-21-alex.bennee@linaro.org>
In-Reply-To: <20220124201608.604599-21-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 1/24/22 21:16, Alex Bennée wrote:
> This adds simple instruction matching to the libinsn.so plugin which
> is useful for examining the execution distance between instructions.
> For example to track how often we flush in ARM due to TLB updates:
> 
>   -plugin ./tests/plugin/libinsn.so,match=tlbi
> 
> which leads to output like this:
> 
>   0xffffffc01018fa00, tlbi aside1is, x0,  339, 32774 match hits, 23822 since last, avg 47279
>   0xffffffc01018fa00, tlbi aside1is, x0,  340, 32775 match hits, 565051 since last, avg 47295
>   0xffffffc0101915a4, tlbi vae1is, x0,  155, 32776 match hits, 151135 since last, avg 47298
>   0xffffffc01018fc60, tlbi vae1is, x4,  224, 32777 match hits, 814 since last, avg 47297
>   0xffffffc010194a44, tlbi vale1is, x1,  8835, 32778 match hits, 52027 since last, avg 47297
>   0xffffffc010194a44, tlbi vale1is, x1,  8836, 32779 match hits, 8347 since last, avg 47296
>   0xffffffc010194a44, tlbi vale1is, x1,  8837, 32780 match hits, 33677 since last, avg 47295

Just nitpicking the output below.

> showing we do some sort of TLBI invalidation every 47 thousand
> instructions.
> 
> Cc: Vasilev Oleg <vasilev.oleg@huawei.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Emilio Cota <cota@braap.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/plugin/insn.c | 88 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 87 insertions(+), 1 deletion(-)

> +static void vcpu_insn_matched_exec_before(unsigned int cpu_index, void *udata)
> +{
> +    unsigned int i = cpu_index % MAX_CPUS;
> +    Instruction *insn = (Instruction *) udata;
> +    Match *match = insn->match;
> +    g_autoptr(GString) ts = g_string_new("");
> +
> +    insn->hits++;
> +    g_string_append_printf(ts, "0x%" PRIx64 ", %s, % "PRId64,
> +                           insn->vaddr, insn->disas, insn->hits);

Maybe use something else the ',' to split last arg (hits)? \t or --?
Otherwise it seems part of the decoded instr.

> +
> +    uint64_t icount = counts[i].insn_count;
> +    uint64_t delta = icount - match->last_hit[i];
> +
> +    match->hits[i]++;
> +    match->total_delta[i] += delta;
> +
> +    g_string_append_printf(ts,
> +                           ", %"PRId64" match hits, %"PRId64

Maybe prefix delta with '+'.

> +                           " since last, avg %"PRId64"\n",
> +                           match->hits[i], delta,
> +                           match->total_delta[i] / match->hits[i]);
> +
> +    match->last_hit[i] = icount;
> +
> +    qemu_plugin_outs(ts->str);
> +
> +    g_ptr_array_add(match->history[i], insn);
> +}

