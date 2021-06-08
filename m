Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0956B3A0421
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 21:35:31 +0200 (CEST)
Received: from localhost ([::1]:55420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqhVa-0005X8-E0
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 15:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqhSh-0002IN-TU
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:32:31 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:46746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqhSY-0008VO-Dx
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:32:31 -0400
Received: by mail-pl1-x62c.google.com with SMTP id e1so11230791pld.13
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 12:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=HSUK12g/80vfG2/J2yM+vGpdLMLvF7Xbk2RCvE7EcnA=;
 b=PXnTEpLzaoW/F1OqoGPGnimHESclb2S27noX2SuqFKqCfTbb5a3kQvrkR9oNp13LsN
 FdBeL5Zimgvbc6GootCkx0HsPG+Hvix1rmRZIWldQIHIWDwuLWqjCuVht76/MboMdr/J
 U5kz53on6CRGdbP4t8u5f+gQK+0Vlf1HtdnqTb5NINMuj58agbX2mCMURFVuOT2Fvt1E
 okzONPCk2xTVoloYKCBBPG3GokRRA531bea0F9Xp6YdgFzXgQBE9OwgWoOR32ihsnx+X
 yUtmX8swlwV1f2o7vPNtqT3m6SMPDC1M6HgaWz4nnCM0vsttMTJSD6Lijs2HhpiiZSUq
 qW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HSUK12g/80vfG2/J2yM+vGpdLMLvF7Xbk2RCvE7EcnA=;
 b=Sf0NGl9kDPZk8kvMk9nJzdelIrkxo34RgUXCP0YFrDvx9A7jyOyj36uVuKdEmiFfZj
 ALO/3zj+P8S0dMWjMFayPhMrTcYXXlBmX8fIPC16RgqlGA0b2TYOSfzqVc3abw6vaDpP
 lStvLAP/VGA3u+g+lENioe3VXWItAyWkLioBvzfuj8jcY4iWZUTaAGzp2UQStYsqZXGl
 HF0hYRY0XbcuMD+4owcNmKPGEviQo21X37wRCSMxDEuqPMDkNlLM1ZPd+4mPR7navBbP
 RD5xfV4J5VPv4BBOMpQlRh90/4RWYTTqs24vP5Cq7dRzQK/UfIDX4AThkNNx46rShnnP
 fXYQ==
X-Gm-Message-State: AOAM530zw93RMk4l50Xr35vXhIPp51gTzkDf7+rAc34hZ51ejS2qzA0Y
 gG87/gsIviW+GEl3PMdsR0LWnK80+6ysaQ==
X-Google-Smtp-Source: ABdhPJw6U+q/dFHMlOezKe4OTKIrrFZEXIyR/76ctIgYCOEuAxOv5kLtBRs1T/s6kAbEU8wu4vnLKg==
X-Received: by 2002:a17:90a:de16:: with SMTP id
 m22mr6253082pjv.60.1623180740497; 
 Tue, 08 Jun 2021 12:32:20 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 y15sm11068485pji.47.2021.06.08.12.32.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 12:32:20 -0700 (PDT)
Subject: Re: [PATCH 04/26] configure, meson: convert libtasn1 detection to
 meson
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210608112301.402434-1-pbonzini@redhat.com>
 <20210608112301.402434-5-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cb0490f1-591d-a734-0aa0-8ffb7daf47c5@linaro.org>
Date: Tue, 8 Jun 2021 12:32:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210608112301.402434-5-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/21 4:22 AM, Paolo Bonzini wrote:
> Make it depend on gnutls too, since it is only used as part of gnutls
> tests.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   configure              | 19 -------------------
>   meson.build            |  9 +++++----
>   tests/unit/meson.build |  2 +-
>   3 files changed, 6 insertions(+), 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

