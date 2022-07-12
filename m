Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D77571105
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 05:59:01 +0200 (CEST)
Received: from localhost ([::1]:58906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB735-0001Ql-Vv
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 23:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB71Y-0006pj-Ba
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 23:57:24 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:44786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB71T-0005rV-OV
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 23:57:23 -0400
Received: by mail-pl1-x62a.google.com with SMTP id q5so6163780plr.11
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 20:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=QwHStl5Jh76xT8ueZEs++mtcKfAkINQHPsCO9/NHZU8=;
 b=RANo3o8VWP+tFiN3s690hqyEqQCvFoGWngsDNlYff5gB/g59Ap2N50Ll4b+vzCnIN8
 oMYCaMJDiga7l1+p5GR5w4hwoOwmjd7J3Y65P/oJkuXErAnLGdZPIfIHXOMpqsTqKxqd
 wVidRVmhElfqPsIDjscsPSveztxU9UoIXGhGqNEMeuxo5+RSOeHHhxMzv3cnyfznL91j
 gKPEtTqqWKuuxWlRngvMGnWENnceWXNyOZcbS76Z/LbHy8aj7c3r7aEMmVmpYNjdqYaO
 jLYqcZ/Rs8fXgQpDWZo+cWd3QHKO2ZqscEpsUH7lyaOUqEzU1djshUjmQOn9xmS3iGv8
 3CDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QwHStl5Jh76xT8ueZEs++mtcKfAkINQHPsCO9/NHZU8=;
 b=8LD1QMwnjVo0K1vfry0cSFr5qEb/vl+I+UVL/iwkjHDIjJT6gw4Bg1eidAdnZ+kV++
 7qNC41ig6TD/XVgujm1SJDltb7wYW04+nZo8d98qLsXoZEs3pzGxCUMAP2O9vB6vw3ZU
 87D5chL5SAzbNsWtBBi3Pqxl8rpwvjEJuqSj+U++6UyYYzfOOgf41t11Hv2Mx5YHE+g+
 L3XSGgLoGEKivsaNq28WVSm/nSRRKekLIzoz/5Gl+5JBMxt8lk46yz9eF4tT/nZUmB99
 u/UOgSet4z6cBdovtmLTQnniUSd48vQ1783Fg5DmhlZSKexzRXq4QnkUz08iQc7aMGAz
 AruA==
X-Gm-Message-State: AJIora/Elwa1j89jTeZ/g9K7FhnUCu2faByNgsp8iCOh3oHEKnu2iAC3
 cI4e0Ece8eqLEs2bGaU9GFI9ZWG0HhgDtGmI
X-Google-Smtp-Source: AGRyM1s99nRTI5sCJIY+oX/mmaqN9B4p7R10Hxu7KCaOTb80MQmIKM6mJAfak1Te568dvvvECMBSFg==
X-Received: by 2002:a17:90a:f2d7:b0:1ef:8859:d61 with SMTP id
 gt23-20020a17090af2d700b001ef88590d61mr1919075pjb.215.1657598237145; 
 Mon, 11 Jul 2022 20:57:17 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 63-20020a620542000000b00525373aac7csm5571251pff.26.2022.07.11.20.57.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 20:57:16 -0700 (PDT)
Message-ID: <27c5985a-d7a2-0f82-1fb6-733b92a11e58@linaro.org>
Date: Tue, 12 Jul 2022 09:27:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] meson: place default firmware path under .../share
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220711080718.13593-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220711080718.13593-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 7/11/22 13:37, Paolo Bonzini wrote:
> Fixes: c09c1ce7e9 ("configure: switch directory options to automatic parsing", 2022-05-07)
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   meson_options.txt             | 2 +-
>   scripts/meson-buildoptions.sh | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

