Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1783139C484
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 02:38:18 +0200 (CEST)
Received: from localhost ([::1]:46684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpKKP-0006LZ-5y
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 20:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpKEc-0000vx-Kd
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 20:32:18 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:41794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpKEa-0007Wf-2x
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 20:32:18 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 b15-20020a17090a550fb029015dad75163dso6829755pji.0
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 17:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VDgsh/3/PMvBK0vmoYe4s+I9cv2xo3ibZxTXRwS4UJc=;
 b=xjx/ZjQ3kzOoj9K3PTwC6YPtpsOrYO1vhWxwyz2ldsvGJVWHlr5ovSJEelUtR7JW8w
 +bcUQadrcYA6SDgtH7YsGspbLkvTSvH+HnVQTYyMrq4O+es98bDPYRlUvH2j4xygeWfm
 ZiUP4FUqrMkIoXVf1vnIsA3WE8FYm6Dt9ECzQnGPfIYlScX4srWX/GI1ZtrPjKXLoo8U
 WHSA8WyZB6drU830a6aMwcTx2T1voBQzbsqOhxqqfL6Q2ElZ/O6Tbp+0Zg0ONq7Oi0aG
 6XSm/hecwBSWQ7Hx6Lu/9qO2XejFUo/EizzRrdTy8PbVkWs4tqy94H00RUYG+XkuiCL8
 Z0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VDgsh/3/PMvBK0vmoYe4s+I9cv2xo3ibZxTXRwS4UJc=;
 b=OHcLISmn8qguU7wvWP2IcIK9DU1lXxt/Z90dILQzZzSjLn7LDoHUTOthcqQZAVhoGg
 GKuXb1kkpmEV415CQjH84eKx/yMH/DWNe27sXI8W7sTJLO8RZaUO7FnaBAeHz3F8G1VZ
 DMyLyd5Bi3JzbIf8yl0r3p73mjmGhvNOYppcDUVKWqoqaIRg2e/1EMAOrjTYI/mX9Ywz
 V0q1+He96MjETbGeHOfw4WM/SEjhwMpLiuDuVjEAmpOjgUD6EHRokSCfkazOd8GxQ3kC
 q1HUxvQIKbHfFa8e8dSJWpL3EdSvpx70GboQYtK2kIDuW+7aABgfmpoqn6NA+vmzSi5k
 tixQ==
X-Gm-Message-State: AOAM533nQyhOTEDUbf77UYSpbCms1ABnnGp83P5jEW0pUehpqNhKVzaL
 nsA4Tko4VOKTWJwyfQAuN1PgB0izewXKzg==
X-Google-Smtp-Source: ABdhPJyQpTXyrUl5Jnh5a0m4X3MsrEygAvNyeoq2iPkFr1GHwOOxxCkckHR3vL8ipugxLLf+TY8hcA==
X-Received: by 2002:a17:902:9307:b029:fd:9d27:ea2c with SMTP id
 bc7-20020a1709029307b02900fd9d27ea2cmr6880984plb.1.1622853134457; 
 Fri, 04 Jun 2021 17:32:14 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 r25sm2767747pfh.18.2021.06.04.17.32.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 17:32:14 -0700 (PDT)
Subject: Re: [PATCH v16 46/99] target/arm: fix comments style of
 fp_exception_el before moving it
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-47-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6b0f638e-055d-1c1b-e54e-43f4b43dbeda@linaro.org>
Date: Fri, 4 Jun 2021 17:32:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-47-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/tcg/helper.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

