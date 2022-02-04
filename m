Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A06B34AA32A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 23:34:04 +0100 (CET)
Received: from localhost ([::1]:40464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG79X-0004mS-6q
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 17:34:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nG774-0002Zo-WF
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 17:31:31 -0500
Received: from [2607:f8b0:4864:20::1032] (port=45736
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nG770-0007nI-JZ
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 17:31:30 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 g15-20020a17090a67cf00b001b7d5b6bedaso7390826pjm.4
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 14:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5Or02FN1dbCsfAI4BRpWkrqvibhMn2j3dIYvf2oGqME=;
 b=U96lrvH7zdX/ySobil+A63GrucKUWkeI9ZU7kYnVjHizFcaDam6+IDGAILOqRyg/Uh
 REEhyBa5UUJ0l4s4GzN6PwMQK9U3JK2ZSkGfGinxenXnMG8uCcABTxn3bWViHviBqdHF
 buYjMWoACn+BsrwM2/XvdSbRGb7bX9zIjwV3ITHWaruHblWwYA8UHyzLLh09k9TnvVBA
 UA/CcuwrGplOQ2cxYgIFVDoQf0nk/MaBVNBUYYiHAanzlpZ6fbBmV8YAji7i343rs9kg
 aP9t6o5lxg4CKTyUpNYLtPxqSa+qzrCSK6UT5KKDqoLW18U+oiVSNRuqsoGnQ5jJVmsU
 56Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5Or02FN1dbCsfAI4BRpWkrqvibhMn2j3dIYvf2oGqME=;
 b=OK2rgASZN3Ip39pfrGUYGG3bT0II3ik6r8xWROUqEymSkQNXFHa83BFcTOpSDugEHT
 rFUoWSNOhG9cQJmUU7PtqHai/aHfJmshMd3vPoI46zQEgD6IXREqeCaa4GXNBkLv64uJ
 2I7oJmrmPVhf9UoLkrVTFpEHYA9By9FZx/g89HxYOMZIbRkqRBOHhFcUSMEvMOiphkYm
 gQ848SmfLuhlehNwXK+jCkhcnO4pOWpNyoXXyRkg/YOaezCqoBok08FcSkN+REtFyPpr
 Rqwbaxhfq0tQ5UlUR26KgvTEurS2yzfEXs1bU0kyZtqXMDBTNd44NChvSK2kJnZ1aI0W
 A5Ig==
X-Gm-Message-State: AOAM5301pPqHDo2Cm8aaTPkJ2a3wcYjH9/Z0rtATR4+MtgMJ1mIZEkjI
 xyXhAmzivD0k3mHG5wbjyLE=
X-Google-Smtp-Source: ABdhPJwEebKA433DcNMc3dGdExvVswEIwYAjfWSz8dWK0Rd/5glWkOtsO2qjVBoeVzhP17MOG6DzaQ==
X-Received: by 2002:a17:902:a512:: with SMTP id
 s18mr5226361plq.3.1644013885219; 
 Fri, 04 Feb 2022 14:31:25 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id e14sm3712861pfv.219.2022.02.04.14.31.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 14:31:24 -0800 (PST)
Message-ID: <d82e6ad5-0e44-dd69-5c98-162a73d3ca7a@amsat.org>
Date: Fri, 4 Feb 2022 23:31:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v3 24/26] tests/plugins: add instruction matching to
 libinsn.so
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com, minyihh@uci.edu,
 ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu, cota@braap.org,
 aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 Vasilev Oleg <vasilev.oleg@huawei.com>, Alexandre Iooss <erdnaxe@crans.org>
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
 <20220204204335.1689602-25-alex.bennee@linaro.org>
In-Reply-To: <20220204204335.1689602-25-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 4/2/22 21:43, Alex Bennée wrote:
> This adds simple instruction matching to the libinsn.so plugin which
> is useful for examining the execution distance between instructions.
> For example to track how often we flush in ARM due to TLB updates:
> 
>    -plugin ./tests/plugin/libinsn.so,match=tlbi
> 
> which leads to output like this:
> 
>    0xffffffc01019a918, 'tlbi vale1is, x1', 5702 hits, 31825 match hits, Δ+8112 since last match, 68859 avg insns/match
>    0xffffffc01019a918, 'tlbi vale1is, x1', 5703 hits, 56593 match hits, Δ+17712125 since last match, 33455 avg insns/match
>    0xffffffc01019a918, 'tlbi vale1is, x1', 5704 hits, 56594 match hits, Δ+12689 since last match, 33454 avg insns/match
>    0xffffffc01019a918, 'tlbi vale1is, x1', 5705 hits, 56595 match hits, Δ+12585 since last match, 33454 avg insns/match
>    0xffffffc01019a918, 'tlbi vale1is, x1', 5706 hits, 56596 match hits, Δ+10491 since last match, 33454 avg insns/match
>    0xffffffc01019a918, 'tlbi vale1is, x1', 5707 hits, 56597 match hits, Δ+4721 since last match, 33453 avg insns/match
>    0xffffffc01019a918, 'tlbi vale1is, x1', 5708 hits, 56598 match hits, Δ+10733 since last match, 33453 avg insns/match
>    0xffffffc01019a918, 'tlbi vale1is, x1', 5709 hits, 56599 match hits, Δ+61959 since last match, 33453 avg insns/match
>    0xffffffc01019a918, 'tlbi vale1is, x1', 5710 hits, 56600 match hits, Δ+55235 since last match, 33454 avg insns/match
>    0xffffffc01019a918, 'tlbi vale1is, x1', 5711 hits, 56601 match hits, Δ+54373 since last match, 33454 avg insns/match
>    0xffffffc01019a918, 'tlbi vale1is, x1', 5712 hits, 56602 match hits, Δ+2705 since last match, 33453 avg insns/match
>    0xffffffc01019a918, 'tlbi vale1is, x1', 5713 hits, 56603 match hits, Δ+17262 since last match, 33453 avg insns/match
>    0xffffffc01019a918, 'tlbi vale1is, x1', 5714 hits, 56604 match hits, Δ+17206 since last match, 33453 avg insns/match
>    0xffffffc01019a918, 'tlbi vale1is, x1', 5715 hits, 56605 match hits, Δ+28940 since last match, 33453 avg insns/match
>    0xffffffc01019a918, 'tlbi vale1is, x1', 5716 hits, 56606 match hits, Δ+7370 since last match, 33452 avg insns/match
>    0xffffffc01019a918, 'tlbi vale1is, x1', 5717 hits, 56607 match hits, Δ+7066 since last match, 33452 avg insns/match
> 
> showing we do some sort of TLBI invalidation every 33 thousand
> instructions.
> 
> Cc: Vasilev Oleg <vasilev.oleg@huawei.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Emilio Cota <cota@braap.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20220124201608.604599-21-alex.bennee@linaro.org>
> 
> ---
> v2
>    - quote disassembly
>    - try and improve formatting
> ---
>   tests/plugin/insn.c | 89 ++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 88 insertions(+), 1 deletion(-)

>   static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
>   {
>       size_t n = qemu_plugin_tb_n_insns(tb);
> @@ -71,6 +118,29 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
>               unsigned long *cnt = &g_array_index(sizes, unsigned long, sz);
>               (*cnt)++;
>           }
> +
> +        /*
> +         * If we are tracking certain instructions we will need more
> +         * information about the instruction which we also need to
> +         * save if there is a hit.
> +         */
> +        if (matches) {
> +            char *insn_disas = qemu_plugin_insn_disas(insn);
> +            int j;
> +            for (j = 0; j < matches->len; j++) {
> +                Match *m = &g_array_index(matches, Match, j);
> +                if (g_str_has_prefix(insn_disas, m->match_string)) {
> +                    Instruction *rec = g_new0(Instruction, 1);

Maybe release matches and its Instruction entries in atexit?

Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +                    rec->disas = g_strdup(insn_disas);
> +                    rec->vaddr = qemu_plugin_insn_vaddr(insn);
> +                    rec->match = m;
> +                    qemu_plugin_register_vcpu_insn_exec_cb(
> +                        insn, vcpu_insn_matched_exec_before,
> +                        QEMU_PLUGIN_CB_NO_REGS, rec);
> +                }
> +            }
> +            g_free(insn_disas);
> +        }
>       }
>   }

