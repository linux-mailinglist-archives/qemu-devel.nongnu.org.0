Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 069E94B1CFF
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 04:41:39 +0100 (CET)
Received: from localhost ([::1]:33896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIMoU-0004ku-45
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 22:41:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIMmv-00044I-AW
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 22:40:01 -0500
Received: from [2607:f8b0:4864:20::62a] (port=34535
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIMmt-0002b4-NL
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 22:40:00 -0500
Received: by mail-pl1-x62a.google.com with SMTP id 10so3630083plj.1
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 19:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Gg8WGxGYH2LjWYRc4BS8CSASSb3XKuvO5pUyymFwtu4=;
 b=EKEF0bq1cWMGAII3MP0KkdpM2p+HhLv6zIMWyBpsf3SzWBUBGIdmVWjWMBYi7ipdn/
 0BtylIw9FhmYB46fcoe4yWJde/OxX7QpkzlE92Vmu3FTRDZ8A3c2cBC4ph6hHUO5+N4c
 ILvI3GuCMYONyn70vanLkunYB6+XIH4PfwGA4hpGZ7V4Jd6rDg9gCOUYRRg6jBpMVgnA
 +ByV24mVo6VgnmS1cGpcLVqzPlploUPR6zGdzayKXcm3zLm+crKcAclnVh1KmXtvrV+E
 q+VKRB/T7FG8FPzSwKdfFY8QiS7QogP/rv3EhUcXDWBT0dHLdBf5T2LH7zLoO++8S6gm
 K0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Gg8WGxGYH2LjWYRc4BS8CSASSb3XKuvO5pUyymFwtu4=;
 b=Y2Pghja1iGh0OpRoL37RlwX70VG2Jaz++Y8IadgfQytHgVFYRjZbgRMptRcy7Y3Lkp
 pKp8qH9dzETiCeyf1UuEQUVLiOiWlnMopEiPLsrluQRmTYN5uBKKuIuJoGjuqPlbkedx
 TmtFG/fqoZdhtYGeZAOan3XrLSn8IXB+6su3r65QPelUKR3fYzm5liszRv0Jb4iY1/xu
 zmdb/9ZHXjRNZEEo0bAMq2GxT+9KJ1yN1GbAqrMd3Uq+4rRI9b+awM2luHCetnU1Irn9
 MMko1SuwnCg2/7FTNfRTDeii4Wopuib8KHFgzPQKUKp+xcze6RSFcWGMwiX3USjY6Jih
 mALQ==
X-Gm-Message-State: AOAM532HQDTcLQ9igN+irhJglMoJokBcpBooL9FAwGN30UEBxwUhYBca
 N3QC3TBrBwlxt6Kx5zF6fr+evA==
X-Google-Smtp-Source: ABdhPJzrS7xC9dV+G8RNLDfRWIE0yfhJ4F07GpnrENJ+i/XBu1fT/wYsvRSTH0L9Quel706RHodsoQ==
X-Received: by 2002:a17:902:a505:: with SMTP id
 s5mr10478507plq.157.1644550798129; 
 Thu, 10 Feb 2022 19:39:58 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id p21sm25697365pfh.89.2022.02.10.19.39.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 19:39:57 -0800 (PST)
Message-ID: <3c913b30-d61d-10e4-4a83-458a8236d135@linaro.org>
Date: Fri, 11 Feb 2022 14:39:08 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 02/37] target/ppc: moved vector even and odd
 multiplication to decodetree
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220210123447.3933301-1-matheus.ferst@eldorado.org.br>
 <20220210123447.3933301-3-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220210123447.3933301-3-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.castro@eldorado.org.br>,
 danielhb413@gmail.com, groug@kaod.org,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 23:34, matheus.ferst@eldorado.org.br wrote:
> +void helper_VMULESD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
> +{
> +    muls64(&r->VsrD(1), &r->VsrD(0), a->VsrSD(0), b->VsrSD(0));
> +}
> +void helper_VMULOSD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
> +{
> +    muls64(&r->VsrD(1), &r->VsrD(0), a->VsrSD(1), b->VsrSD(1));
> +}
> +void helper_VMULEUD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
> +{
> +    mulu64(&r->VsrD(1), &r->VsrD(0), a->VsrD(0), b->VsrD(0));
> +}
> +void helper_VMULOUD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
> +{
> +    mulu64(&r->VsrD(1), &r->VsrD(0), a->VsrD(1), b->VsrD(1));
> +}

These are single tcg calls; there's no particular need to have them out-of-line, except 
perhaps just to make it easier for your pattern expansion.  But perhaps not important 
enough to worry about.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

