Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF292F5159
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 18:47:12 +0100 (CET)
Received: from localhost ([::1]:41458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzkEh-0007Fd-Rq
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 12:47:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzk3D-0000ZZ-23
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 12:35:19 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:40729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzk3B-0001Am-8G
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 12:35:18 -0500
Received: by mail-pj1-x102e.google.com with SMTP id m5so1619541pjv.5
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 09:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LMvWinS/zxCekTHUcnqjoO/VJjlw17h3HAuR+PFa4cM=;
 b=c4+FF+mgUIdIJCiZVr57k3vkhiBecv2vsqvH4IX8ZkVBfVFUN3M+AuoRIVLV1W8jNf
 6MUZUJlCPwkOGPlaYsaZG705gcAOWjvOTMqGckNAPp4kofBO9fXCrbC6eQGFlueb6BHl
 xArulzWsGl/iIutjMNIcUfFnrl8RoLKjj2eCY9NFHxMffpgC7nmuYQVB/evQ18DZF8wJ
 Wv1/iMOxwdXnVhPS8YqnH++3k/tsZnVDCnuwepksZtWgCc02jXlrMKDkXXfczdp9aaL0
 rRHqCajs4qoIc35ELt/GGlwoOvEs+fQBdnZlVZO2VmvHzPpbPurkfRRe0q6espNRS7N/
 eRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LMvWinS/zxCekTHUcnqjoO/VJjlw17h3HAuR+PFa4cM=;
 b=H53P1yfQPPLU2ogZcXHIojEGHrNPRBHnWsp5/cO4xZgIV2IldKHZtSNUFEu368OEXw
 mEAkkUoVNnUKogb1AjqXpwZjA/0R0cDQP4Ru/8Bmfjz8GzO6K0kgvakoRx04XhBl4WsC
 7gJ+Ns/Y3MS57Y9dY+4/Kd2TN5x+kA1DtPuC97Bdm2Nxd1lpa8CPqYtLZ0jX1vaJpkWK
 O0SP6X4GdzonQXUlb1r/MovsVY5OOmGGkTfpTlzb0fKJGcbIHIv5CZSiw4mn6bkmuQoj
 qGueIUF4UF+E6ByZ8N6OmEIFrRVkmAhwY3pkmrzS485oZeyF+5bSW1Mujz6t88K1XPPy
 hOtA==
X-Gm-Message-State: AOAM531B4OQ6D8ptXZaHpMM5P0CaCVKNTN30onS59glgMslc4x4Tuy9O
 H3rwJmxBJtIwu89rxnwtzN1+P941ECW+eg==
X-Google-Smtp-Source: ABdhPJz/jbxXWrF5t9dwr7b9OxFhXhV5jJDbkLHQ1oswulHbQDf06xrppv8wO15JTJZFLkkk9WS6pw==
X-Received: by 2002:a17:902:6b84:b029:dc:3423:a24a with SMTP id
 p4-20020a1709026b84b02900dc3423a24amr3505035plk.31.1610559313723; 
 Wed, 13 Jan 2021 09:35:13 -0800 (PST)
Received: from [10.25.18.3] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v3sm3716764pjn.7.2021.01.13.09.35.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 09:35:13 -0800 (PST)
Subject: Re: [PATCH 17/19] target/arm: add ARMv8.4-SEL2 extension
To: =?UTF-8?Q?R=c3=a9mi_Denis-Courmont?= <remi.denis.courmont@huawei.com>,
 qemu-arm@nongnu.org
References: <12681824.uLZWGnKmhe@basile.remlab.net>
 <20210112104511.36576-17-remi.denis.courmont@huawei.com>
 <6ffaca60-2fa0-ac7d-b430-0bbaee18b25a@linaro.org>
 <4284476.LvFx2qVVIh@basile.remlab.net>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <55d19894-4435-6ba0-69c1-b9078127128f@linaro.org>
Date: Wed, 13 Jan 2021 07:35:09 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4284476.LvFx2qVVIh@basile.remlab.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On 1/13/21 3:12 AM, Rémi Denis-Courmont wrote:
>>     if (arm_dc_feature(s, ARM_FEATURE_AARCH64) &&
>>         dc_isar_feature(aa64_sel2, s)) {
>>         ...
>>
> 
> Hmm, yeah. Should this be an ifdef on TARGET_AARCH64 instead?

No, I don't think so.  It's not performance critical that we avoid a single bit
test.

> Also do we need to revector the exception code, or leave it mostly duplicated 
> as is?

If you see a way to tidy that, great, please.  But I don't think it's required
for this patch set.


r~

