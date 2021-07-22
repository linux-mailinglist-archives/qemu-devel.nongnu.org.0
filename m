Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFC33D2D94
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 22:20:31 +0200 (CEST)
Received: from localhost ([::1]:42260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6fBE-0006sU-Mh
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 16:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6f9q-0005DL-R6
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 16:19:02 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:36603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6f9n-0007o6-7f
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 16:19:02 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 ds11-20020a17090b08cbb0290172f971883bso5929925pjb.1
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 13:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qqOD/MAtz/2tH6T11m3/gTWq9fkdgGQmdJRMm/Rergs=;
 b=bZ0DFUyZXJ6uR2Z5EEhBfMZGV4vO46sxGwGv0FyGFLLJdEKFZg09vtPNP6kZQz5eCH
 8d9Ui7X2FR4QUcOVQWHg0BDoUetR4IItfoVfdFS/ZPi+oq2h7byORVNsQ9SAX3K69sSo
 h+tQxi4CuxT+VjmkKRQTuCSsWbD7Z4nvrF+ltn+AtfVPaLrne5phBwcL/7YSXLr7/w/h
 W2Pf7Tk6keVagHHiR9gbAoDeR5nNT4EgxNen7Rp3sxilw0mRvHbtBkDKibPSoBWXOMV5
 4XiBcIWbPoNo2rSEBRHbuX9g6nZaJAT4yRU/YTSk9ozV+9NB2N1+YXr7k8VbN10bPiyz
 JD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qqOD/MAtz/2tH6T11m3/gTWq9fkdgGQmdJRMm/Rergs=;
 b=gqWl1E35D0u1er4NBHWO+HaSel0TwbkXuSoo7RxtDngGmFmpwDg6pKZdPYKVl6I4cg
 PYnfxpLEhY0XhdAzMIOFSdJ8j/5yJZ3sZxb4rBXNnKS7qBGJJBM8ddPpSBMsN27G64Eu
 ijfKmEjGTurBL/zXbKR0Kt5qCjQnEuCx2rDPFBJxS9/nvG2kiniILb+CsveEeaqeqwFB
 cPRy2rXT66hliZyx3mm8q3n6FKv3CZunaJ8/skAWrpp0+da6C7jhzAgsytzp2qMUH/Ed
 TR7nJQZQJpNNRyT89m9knvQSQVjsVADzzvE+v3L5uJ7uPidrdmeZCUW1QpKKZy1ylUQ+
 Eo4g==
X-Gm-Message-State: AOAM533WQjRs7MX9RcVssGXiGPLzLQKAL6K2cMUoBO49onr91zP1iwKP
 kCYmvuVd2YwUHqPe/8u/65hCAw==
X-Google-Smtp-Source: ABdhPJzo0HjSgogKqdjQHFYZM0XBt0apgdKEZRmOFNaqLE81cCCZ9E2Qtt2xK5Nt+8JN0hDROfh0YA==
X-Received: by 2002:a17:90a:4884:: with SMTP id
 b4mr1386318pjh.193.1626985137278; 
 Thu, 22 Jul 2021 13:18:57 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id 73sm27196308pjz.24.2021.07.22.13.18.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 13:18:56 -0700 (PDT)
Subject: Re: [PATCH for-6.1 0/3] docs: Document arm mainstone, kzm, imx25-pdk
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210722175229.29065-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d1bf6cf7-9cf4-ddde-45a1-d95cf72b3a4e@linaro.org>
Date: Thu, 22 Jul 2021 10:18:54 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210722175229.29065-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.203,
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
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/22/21 7:52 AM, Peter Maydell wrote:
> Peter Maydell (3):
>    docs: Add documentation of Arm 'mainstone' board
>    docs: Add documentation of Arm 'kzm' board
>    docs: Add documentation of Arm 'imx25-pdk' board

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

