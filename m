Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F93157F604
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jul 2022 18:37:27 +0200 (CEST)
Received: from localhost ([::1]:38958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFebe-00066d-A1
	for lists+qemu-devel@lfdr.de; Sun, 24 Jul 2022 12:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oFeZu-0003cN-V1
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 12:35:39 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:46943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oFeZr-0001xh-Ls
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 12:35:37 -0400
Received: by mail-pf1-x433.google.com with SMTP id c3so8397283pfb.13
 for <qemu-devel@nongnu.org>; Sun, 24 Jul 2022 09:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=k7u+dS1Dnp5UIZM2Rwg8Sy7j22uDjlZDpx2pla4PIt0=;
 b=vXQ1YEPffNrI0o0wpKJxMNLzakoD2OrJq1+zScUDjXWLXn/+7Sec1s/PPbEgQ2FyeL
 +Ky+vfzhvWqEtYcCzKc8h+llf964YQy21d3rI/AMIwM4JVWPMG4j+msJjxhpNMvmZq1b
 yfxe1cTbKy+SHfB+o0xv60Thdzy+yAAveEchfswXomm0eZ9e0faII3PGHiYz2RkoIz1P
 BrfgQHcS6KjRUdotOLk4rv8Ib7AxtYdsOrxItzVf75/PYCJRbR02DP/b/b0OFEmzf/uV
 anTzZkb8oz07/TmtMyyi0apphjm+bDQO919N0q9yFZLWu36bGH1tRhdhQxJ0Iv1mPD63
 9yIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=k7u+dS1Dnp5UIZM2Rwg8Sy7j22uDjlZDpx2pla4PIt0=;
 b=U/wT2ukzbzeMWnb2qs7EAqeEJ/gXhoX3SPsYlG3DK8hU/osi4ZWg0EqNrHx2XP5rS+
 XTB+93ArBlulZTpyZiwCVrsqu3WbggS9qrXmJsopq8FW1INcp+r+FlmPw0VB8b17WRFt
 eLA7PJUvFyng+dhvGyTOVqZ8n0n9dyZlRXdswrbOTyyl4jmjwd8Cli7DZ91dMTzNk/hO
 3eCN2mJrENpEDZDatIWf1sj7sZvWqtK3JQwfkyq2EGO9cij5hys5AYS5UrcsN469Mfbq
 GpA7BynBDvIJ/E/rHHkQEo6dCnrOcQ5NtLG1m2eB1IXRgcNK5eUn2JCXjkfCLDvYYQLk
 Y0YA==
X-Gm-Message-State: AJIora/ysmZl/ZkSYlCo+88mT/6YNNZo8kxahmwy2dwPolPXS3Rlh0hH
 +iDQ9q3FYP9bv1m/6YNbMbonVw==
X-Google-Smtp-Source: AGRyM1tyXrQ4CQDWp4X7x5hP8N7C9ZQfm9nfcgEDcioKyYkQRp8fWKTgtyx1ucq8Z4Gr+KsujqCk+g==
X-Received: by 2002:a63:fc16:0:b0:415:18c4:75a7 with SMTP id
 j22-20020a63fc16000000b0041518c475a7mr7820467pgi.351.1658680533005; 
 Sun, 24 Jul 2022 09:35:33 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:f67c:fb58:6d94:30be?
 ([2602:ae:1549:801:f67c:fb58:6d94:30be])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a056a00212700b0052ab0a73752sm7704195pfj.198.2022.07.24.09.35.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 09:35:32 -0700 (PDT)
Message-ID: <d45472dc-4b09-8b58-364c-a82e6870a667@linaro.org>
Date: Sun, 24 Jul 2022 09:35:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/4] semihosting: Check for errors on SET_ARG()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220719121110.225657-1-peter.maydell@linaro.org>
 <20220719121110.225657-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220719121110.225657-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/19/22 17:41, Peter Maydell wrote:
> The SET_ARG() macro returns an error indication; we check this in the
> TARGET_SYS_GET_CMDLINE case but not when we use it in implementing
> TARGET_SYS_ELAPSED.  Check for and handle the errors via the do_fault
> codepath, and update the comment documenting the SET_ARG() and
> GET_ARG() macros to note how they handle memory access errors.
> 
> Resolves: Coverity CID 1490287
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

