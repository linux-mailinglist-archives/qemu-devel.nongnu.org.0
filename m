Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6018450EAF3
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 23:04:05 +0200 (CEST)
Received: from localhost ([::1]:33540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj5sK-0001PN-HM
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 17:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj5rP-0000k2-3F
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 17:03:07 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:35368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj5rN-0002DD-IH
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 17:03:06 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 w5-20020a17090aaf8500b001d74c754128so492072pjq.0
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 14:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OunPaDf2cbw2Y7Mv2SHhzw5nUd6bM4EpLNrg7LONixc=;
 b=jYeaUkcfNT//pVIaclNSvBAVvYNEo3974NvJwJQ2D4rdO+RI0VrIWR8g8sBitqGZIa
 T3Pd256iDOp34lr2KD4T+ofRCBvZ600puylmiI1ynLb2lg05cANifLxxnY4ElphqrPTt
 /XUuIZgjUqUyPem9FTRG/BwkRxdfK98/RsNpLkcR8zyvHZaJcoaBgOvgdEqaP3aF6AL3
 6IR0/FlnoGGSvQMDj5yYS+/u9aAfvZfxioSgphOAcxp+g0jMPxMdMx9tncVesoYxJo8t
 OLCpYVfQp0eHYkBTQq1o8pOv2yA1wGiJsIcazE7vLhX3ot03gNKvNVAQo/qY04+FusCC
 1ayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OunPaDf2cbw2Y7Mv2SHhzw5nUd6bM4EpLNrg7LONixc=;
 b=C1a/b2GJ8opaGJaqhbjIGeTi3gtSPAJpguIw863UtBvAMNQ/rdb5XXPIgPablfIK1S
 OBrRH/Ha3hB2+6fQ1sK6/cl7ZXkbsLQMSNdAkwBAdk4pp8TRaH7K5jI+nyYfYly1b17g
 hkrhsKrXXxAkmYh/AFvY+cXwSbMzi8AdzQi2q/40U5XaVlMonHSBruV3bypUYJPN+b+n
 efWF0kn+/XsxYyk5MYQw1Z6X7KWMGFkqPjDApWdwA8VdcB5VDoaqhydnUrRmlAE5U5qc
 jF4uJUNhWaYPKpAVA+jz1JytwiABdYMTSdUWUYpc6KoNPyrdLjq4JjyQCfPuECDe5Ojx
 6I3A==
X-Gm-Message-State: AOAM5328rsO690ZmJ4M0c9TIhzExpO76ytiYm9Zrh/B0ffZb0bzh5Gs4
 Ce44zv6HRvYod5Ggp/GSfr3Nmw==
X-Google-Smtp-Source: ABdhPJwi8tsJzXZ+aKQJARqjN2yd+t2jTm70IRQFADtrBrqu4VVbVMdDBSR9kkC9tyKGg2Qjf0M6VQ==
X-Received: by 2002:a17:902:d3cb:b0:15b:a002:d80c with SMTP id
 w11-20020a170902d3cb00b0015ba002d80cmr19698312plb.108.1650920584027; 
 Mon, 25 Apr 2022 14:03:04 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 130-20020a621488000000b00505e6092973sm11949153pfu.68.2022.04.25.14.03.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 14:03:03 -0700 (PDT)
Message-ID: <290356ee-2186-e21b-5a86-d41b77b9a68c@linaro.org>
Date: Mon, 25 Apr 2022 14:03:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 08/42] i386: Add ZMM_OFFSET macro
Content-Language: en-US
To: Paul Brook <paul@nowt.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20220418173904.3746036-1-paul@nowt.org>
 <20220424220204.2493824-9-paul@nowt.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220424220204.2493824-9-paul@nowt.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/22 15:01, Paul Brook wrote:
> Add a convenience macro to get the address of an xmm_regs element within
> CPUX86State.
> 
> This was originally going to be the basis of an implementation that broke
> operations into 128 bit chunks. I scrapped that idea, so this is now a purely
> cosmetic change. But I think a worthwhile one - it reduces the number of
> function calls that need to be split over multiple lines.
> 
> No functional changes.
> 
> Signed-off-by: Paul Brook<paul@nowt.org>
> ---
>   target/i386/tcg/translate.c | 60 +++++++++++++++++--------------------
>   1 file changed, 27 insertions(+), 33 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

