Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E68652E4F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 10:15:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7vCF-0006l0-Hb; Wed, 21 Dec 2022 04:15:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7vC1-0006iC-CR
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 04:15:17 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7vBz-0001sY-SJ
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 04:15:17 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so2219454wml.0
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 01:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wSZhX9MDbXxRMh0iSciLgfvVhy3nB7jM4dYyYgkuvb0=;
 b=smc+omFEAzDNgZ5NZoDJyDy1s0Cn5ktmI68M1PoGuTEqSONKlyNLwUwzZCBwbVsf1X
 D5BaaW9toO7gMt2lbN3rZJO9v5IT11gHwrl/PzGaE8P6kwaaJiatrkIMYZ+PrzCrhtPT
 l5+RiZxZNX8sF6nXYRTLsVj4Fv22jK4Q1o3MurOS1OlW2SDDOtJ97SEn9eOVbT9EVh1J
 wjDmiPoSLI4eN4MIhwS7J1MNXCZ0/bgaEvNAY/SABvO8pTY3N9lQvQkIKJrd2oHDb4rB
 NkHgKNAAXcviL8Ust8M8EE+1RWp8m1Hvlmz76me7O8wgQay2j128aZaXAx2G+oK9ym7+
 kdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wSZhX9MDbXxRMh0iSciLgfvVhy3nB7jM4dYyYgkuvb0=;
 b=M4+4ey/Y2l4ktemTNhNIdM6ubO8zTqtiEZdhWHj1LB5lSvMbhKUMPH+kPbHVjy7h6G
 LcxJPf/R/o9E/loBYNUrcnIfduwU3y2mvcCdgdtDwEoEjo8Kgl2IQGANeeir/SsWgun7
 b/WSHgQHf0OGZPhXMvkWni1ZFZER8JoFJLd3Fi5pRWYIDRNBVR8hPuukgZEngMyvEk6A
 AlHoTnENEFFDS21iBPnqA6wi/xarnYXGq8ksvjx9RqCI8UYGEEOMezzWKtSQjvdwtGxM
 FSQFl1506D/+IlXppMUGRbL+uMZQRmz6KCx6XSZSI0WBEIGqjmpnHR7bviS1D69Itkql
 VB4w==
X-Gm-Message-State: AFqh2kpvOvXwbF8MTgxtklE13mp+sQbMCk27KtdLh/5ZDSzvMIu6gO7R
 or1gQqN1wlZDtYUGTAUXB+IGldYc/4k+Uf0m3PA=
X-Google-Smtp-Source: AMrXdXsXnSpQCvvs7r+/383UhOG2CR/nV7qGHoDKNWuIFldgVB5tp9G0GlmwkiLRaaXdirk3/0FlZA==
X-Received: by 2002:a05:600c:4148:b0:3d3:52bb:3985 with SMTP id
 h8-20020a05600c414800b003d352bb3985mr1090207wmm.31.1671614115220; 
 Wed, 21 Dec 2022 01:15:15 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 iv7-20020a05600c548700b003d35c09d4b9sm1744351wmb.40.2022.12.21.01.15.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 01:15:14 -0800 (PST)
Message-ID: <c75b58b8-42e8-0267-be29-01809b1bf0e9@linaro.org>
Date: Wed, 21 Dec 2022 10:15:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2 6/6] gitlab-ci: Disable docs and GUIs for the build-tci
 and build-tcg-disabled jobs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, fam@euphon.net,
 berrange@redhat.com, f4bug@amsat.org, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, Beraldo Leal <bleal@redhat.com>
References: <20221221090411.1995037-1-alex.bennee@linaro.org>
 <20221221090411.1995037-7-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221221090411.1995037-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/12/22 10:04, Alex Bennée wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> These jobs use their own "script:" section and thus do not profit from
> the global "--disable-docs" from the template. While we're at it, disable
> also some GUI front ends here since we do not gain any additional test
> coverage by compiling those here again.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20221208135945.99975-1-thuth@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/buildtest.yml | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


