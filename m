Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2685744B183
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 17:47:03 +0100 (CET)
Received: from localhost ([::1]:38196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkUGz-0001Pd-Vl
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 11:47:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkUEN-000765-H1; Tue, 09 Nov 2021 11:44:19 -0500
Received: from [2607:f8b0:4864:20::22a] (port=40544
 helo=mail-oi1-x22a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkUEL-0008Ry-9q; Tue, 09 Nov 2021 11:44:19 -0500
Received: by mail-oi1-x22a.google.com with SMTP id bk14so11771643oib.7;
 Tue, 09 Nov 2021 08:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GQ3a/UbVXenOMqg+GG2d82LhycYpcenT8INnqFl7d1s=;
 b=H9t7W2IS7qo953YO0xzdYmvl0PvK8FsGBecgqAGvdf9RKn2WktHTz3/hRkmSe+UbJD
 F48MUWNd63MaiSiPRN+/rgEvVNskIy4d3UJObV7FIjf/5CChhf/QAFR5MQIllPTXDn/Q
 fO1x/0pHyQA1MUUaAplkSr4eC5bxpA8yvuqG1k5elzAZZqtgr0sGwn+XSfbiHM3EzzyH
 C4Nlk+e7x16kMbvWTZFvOsKg5/jfuJfHjI1ApNgmiVN5Rk3J5Bc1WEk1nZnJcu8y5OPx
 YmeQ/dP+jOhQh3sXl8JT9Nt2BecDBQIZYJgNjNyBBUKfTzNXJexnU7AZpS480kSx1pog
 ynkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GQ3a/UbVXenOMqg+GG2d82LhycYpcenT8INnqFl7d1s=;
 b=Uq3VH9voYqKEPiXax5p784r1X07KDxM1c+OeZ1RnfBNWTGtZbPC4naglW69sTAuFzk
 8Ia8acPZjPw+ifulnFvbevSw7iINRsNK0UyX/wOVzKpbT4Q+P9yovDNYFW59iPSvCiVj
 cUch7F5hzvuKhJbb0qw6cd314rTburN1IqDZP4zFeD0GEsbfdSWOaD+/XuFXBMxy4f/N
 A5Q8tiLE3t/z0FgZgTFMMdwLJ+lwcB9Op/CNWTdDf6jNXtTZ502dQ6dQVmFooT2OMdxX
 akmq+tXq1n3tJU8+pPEz0XhqjSFWd71vMnwEN/UEV6qEjBIwqkyms4uDVdO/zvfKpZj+
 oGyQ==
X-Gm-Message-State: AOAM5329q0Z3Jf7R+fxVhIrdRk7Ckplmp3gmZow113O5wkqPD9uGrHTF
 ti/15MuTmWaRXeaA1azOvZ0=
X-Google-Smtp-Source: ABdhPJwZoDFvxtD8PkJNj1UWIgLep7/6yLGILe+fyUnHVnuELq1pQTU1VzGAnOlxbIbLdhZLUUNSlQ==
X-Received: by 2002:aca:3b89:: with SMTP id i131mr6962395oia.102.1636476255025; 
 Tue, 09 Nov 2021 08:44:15 -0800 (PST)
Received: from [192.168.10.222] ([189.79.219.109])
 by smtp.gmail.com with ESMTPSA id 3sm7588469otl.60.2021.11.09.08.44.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 08:44:14 -0800 (PST)
Message-ID: <a75244a5-207c-5e3c-95ee-7204bcf0629a@gmail.com>
Date: Tue, 9 Nov 2021 13:44:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/2] target/ppc: ppc_store_fpscr doesn't update bit 52
Content-Language: en-US
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211020125724.78028-1-lucas.araujo@eldorado.org.br>
 <20211020125724.78028-3-lucas.araujo@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211020125724.78028-3-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.364,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.castro@eldorado.org.br>,
 richard.henderson@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/20/21 09:57, Lucas Mateus Castro (alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)" <lucas.castro@eldorado.org.br>
> 
> This commit fixes the difference reported in the bug in the reserved
> bit 52, it does this by adding this bit to the mask of bits to not be
> directly altered in the ppc_store_fpscr function (the hardware used to
> compare to QEMU was a Power9).

IIUC, "bug" here is related to https://gitlab.com/qemu-project/qemu/-/issues/266,
the bug mentioned in the commit msg of the first patch. In that case, you
should mention it again in this commit message explicitly.

In fact, I also believe that the "Resolves:" tag from the first patch should
be moved to this patch instead, given that the bug is only fully fixed after
both patches are applied.


> 
> Although this is a difference reported in the bug, since it's a reserved
> bit it may be a "don't care" case, as put in the bug report. Looking at
> the ISA it doesn't explicitly mentions this bit can't be set, like it
> does for FEX and VX, so I'm unsure if this is necessary.
> 
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.castro@eldorado.org.br>
> ---
>   target/ppc/cpu.c | 2 +-
>   target/ppc/cpu.h | 3 +++
>   2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
> index 7ad9bd6044..5c411b32ff 100644
> --- a/target/ppc/cpu.c
> +++ b/target/ppc/cpu.c
> @@ -112,7 +112,7 @@ static inline void fpscr_set_rounding_mode(CPUPPCState *env)
>   
>   void ppc_store_fpscr(CPUPPCState *env, target_ulong val)
>   {
> -    val &= ~(FP_VX | FP_FEX);
> +    val &= FPSCR_MTFS_MASK;
>       if (val & FPSCR_IX) {
>           val |= FP_VX;
>       }
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index baa4e7c34d..4b42b281ed 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -736,6 +736,9 @@ enum {
>                             FP_VXZDZ  | FP_VXIMZ  | FP_VXVC   | FP_VXSOFT | \
>                             FP_VXSQRT | FP_VXCVI)
>   
> +/* FPSCR bits that can be set by mtfsf, mtfsfi and mtfsb1 */
> +#define FPSCR_MTFS_MASK ~((1ull << 11) | FP_VX | FP_FEX)


./scripts/checkpatch.pl is not happy about this line:


ERROR: Macros with complex values should be enclosed in parenthesis
#44: FILE: target/ppc/cpu.h:763:
+#define FPSCR_MTFS_MASK ~((1ull << 11) | FP_VX | FP_FEX)

total: 1 errors, 0 warnings, 17 lines checked




Thanks,



Daniel


> +
>   /*****************************************************************************/
>   /* Vector status and control register */
>   #define VSCR_NJ         16 /* Vector non-java */
> 

