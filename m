Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED9A4B52DA
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 15:11:58 +0100 (CET)
Received: from localhost ([::1]:46762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJc55-0007cT-A0
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 09:11:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nJbFK-00074q-4V; Mon, 14 Feb 2022 08:18:26 -0500
Received: from [2607:f8b0:4864:20::32f] (port=39898
 helo=mail-ot1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nJbFH-000395-Ou; Mon, 14 Feb 2022 08:18:25 -0500
Received: by mail-ot1-x32f.google.com with SMTP id
 r18-20020a05683001d200b005ac516aa180so4477781ota.6; 
 Mon, 14 Feb 2022 05:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ujUbblTbOzfnxwHrleM6EQTWgSBpJXUcarvCtcJpwdc=;
 b=hKIy1QQarv4fHDvc/u7APian4NtMcNxg4DxMUcqjwAr19/SkzzMlJYu3N/pjIGYbUh
 P7Bm4XOSYkTkoJe5DiazX/RvJrXwM9nRY672qr+5i+6rSv0jK+LNLeVc1NgNXmJ4BHms
 u1IdJdeLFdscSXJbfWxzES7hkrJpWS9qvYTmEm6zDd63ntYdfNxf6dVrWoMTorluZoOr
 mxghgiWaAK21xasCviUKcJZC4Nj0kEaHFJ1q2DkTqXcT7TajBhfaujv9UZBrtgrXiI8J
 soOEevMwquYy7rDqrMhHCJBUvKsakfwHMQ0caEO/VluDwiqCNyaGgjY15ghcEjEK0QfK
 xSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ujUbblTbOzfnxwHrleM6EQTWgSBpJXUcarvCtcJpwdc=;
 b=pPSZYLuz85kAvykNLuc7ZAD7sAJankpvV549J5BwyaRhi1jWrlr4Ga0NzdHskEkU8K
 uB3kIRD/rRX4m3ffu+Q9r+ltfLM2L6vH3bNzGhYJzTnqsxrRvAkXiK93fU5p+m8k9s7j
 upoaVaMA77W29Jl2+DxX7CZLGrIVOZ+M6YlGP5hu9OvBpqgDfGbNNDEtsPbwfwO4DPO6
 qKjpmutQhdasgaLLPM5tPcNyTQo5tXJS5LaJW+wmjinxab2QbuM6EniSnxnKhSus54jF
 5Ajj/TMGdFX0MbWvQD71UBWskklNTHbggauEgxfcwu5kDMD+IBdTfnuPKKFFCL5EsYFj
 zsXA==
X-Gm-Message-State: AOAM533es9JCdxO5WzQGS9xTzj1SGnBAW3EdkIGuh+wnlJ+kIAuIZF41
 m3Kk7TpRfrYNudX+xjZ1/bne9Y9uDU4=
X-Google-Smtp-Source: ABdhPJzHg1WYvw89OBcWQ8y2kNsR1ixtPYCYH4FkTCl6NBxjTxELct7LW/eGZtb8KZsc4X+5MCo6bw==
X-Received: by 2002:a9d:eca:: with SMTP id 68mr4796234otj.274.1644844702429;
 Mon, 14 Feb 2022 05:18:22 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:367f:eb9c:8725:6b7f:76b3?
 ([2804:431:c7c6:367f:eb9c:8725:6b7f:76b3])
 by smtp.gmail.com with ESMTPSA id q9sm12515137oif.9.2022.02.14.05.18.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 05:18:22 -0800 (PST)
Message-ID: <21aa178a-1d34-c27c-2ff4-3bf52b83256c@gmail.com>
Date: Mon, 14 Feb 2022 10:18:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] target/ppc: raise HV interrupts for partition table entry
 problems
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
References: <20220214123101.1546351-1-npiggin@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220214123101.1546351-1-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/14/22 09:31, Nicholas Piggin wrote:
> Invalid or missing partition table entry exceptions should cause HV
> interrupts. HDSISR is set to bad MMU config, which is consistent with
> the ISA and experimentally matches what POWER9 generates.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/mmu-radix64.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
> index 040c055bff..54fb3ce98d 100644
> --- a/target/ppc/mmu-radix64.c
> +++ b/target/ppc/mmu-radix64.c
> @@ -560,13 +560,13 @@ static bool ppc_radix64_xlate_impl(PowerPCCPU *cpu, vaddr eaddr,
>       } else {
>           if (!ppc64_v3_get_pate(cpu, lpid, &pate)) {
>               if (guest_visible) {
> -                ppc_radix64_raise_si(cpu, access_type, eaddr, DSISR_NOPTE);
> +                ppc_radix64_raise_hsi(cpu, access_type, eaddr, eaddr, DSISR_R_BADCONFIG);
>               }
>               return false;
>           }
>           if (!validate_pate(cpu, lpid, &pate)) {
>               if (guest_visible) {
> -                ppc_radix64_raise_si(cpu, access_type, eaddr, DSISR_R_BADCONFIG);
> +                ppc_radix64_raise_hsi(cpu, access_type, eaddr, eaddr, DSISR_R_BADCONFIG);
>               }
>               return false;
>           }

