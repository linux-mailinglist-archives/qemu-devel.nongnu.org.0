Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB4D5694DD
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 00:00:08 +0200 (CEST)
Received: from localhost ([::1]:43872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9D42-0005ju-HW
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 18:00:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o9CEU-0000zI-01
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 17:06:50 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:41948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o9CES-0004xo-9A
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 17:06:49 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 o31-20020a17090a0a2200b001ef7bd037bbso11589063pjo.0
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 14:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oTi/uvns8CujpWM8Jw8LmA4lqq8j2BtXnHscp8e1mfs=;
 b=TUvy/EANpjLhkhroqPTkobOkwL21UqQ8SDNOr5nDodgg17OggE4Y94UXNB/G3kOg8i
 a41pMqcwViRU6XgNa5BhaaCxFejFqHlJA2k4H13iPDy0NobYhmYoYshzFpjPpkYniWN7
 Rv2+Mf6+RVKyuCL4O4Ls52oduvBFGk8xXQ01erT+C/BwSVaCxlAK9bjycHHjfe0EnOqD
 /UO8Cn0q2imaKNGYsjQL30Ufxm+iv+ft+cSrHIL2oyBwrcPklslyBu5AoCrcx+KpHBgO
 puXruOGkY2geZaNWrqsxk4PZUMzwPef3lCDAghadC6Gp9h+WlJVyQAQOiiYckMIfXxAt
 UnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oTi/uvns8CujpWM8Jw8LmA4lqq8j2BtXnHscp8e1mfs=;
 b=ZeJMnQrgbvuVY812IZmXe+ZxDr0PdGCeu4m6hHM5AjQuKSvHjK0Kf/k/rqBT3V13HW
 ++K49aPfz3X6e+GIbayL5ekXLmWiRxjqDN07X+k/pq9CD6hqlLtbGUgH0Zy9uUwYW2aD
 p9HNbvH9TgO80G9z2tlvfnFgxDtfGCVPZbJfZ8mIiEu2RE5/OKpnJfpwS+RpZiETW9aW
 +6yr9sbdnCeFmRm+M79/5PtPYAKjqTQniMF/EYSDdNmiZsdFDjedGupHbglf3a63FAxj
 5so3XjZ6sH1Vm4EpIi5Jq8P82He3d87rs+hAUdg3PQsEnjwmSip4ZBk/r44sPogWfk2L
 9qfg==
X-Gm-Message-State: AJIora8UUk+zi2xguy8mn5ilXGz9Zm3/97xkyqXUZZLcbBdVZ4Ois4gG
 wqcDKsIy2VtkN+kNjUvaPnE=
X-Google-Smtp-Source: AGRyM1tQ+wSEkwmzMfaQ/JQ4IViBqFHejdPqySLowx7PlTe6WIFqLL0GcR8las+wwX6WVh2gUI+kXA==
X-Received: by 2002:a17:902:ab96:b0:16a:6db6:2715 with SMTP id
 f22-20020a170902ab9600b0016a6db62715mr50352378plr.141.1657141598418; 
 Wed, 06 Jul 2022 14:06:38 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 iw4-20020a170903044400b0016be5ed14d5sm6775586plb.40.2022.07.06.14.06.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 14:06:37 -0700 (PDT)
Message-ID: <8dd4ce07-c2f3-f0e5-855b-c167f471407f@amsat.org>
Date: Wed, 6 Jul 2022 23:06:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] tests/docker/dockerfiles: Add
 debian-loongarch-cross.docker
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20220704070824.965429-1-richard.henderson@linaro.org>
In-Reply-To: <20220704070824.965429-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 4/7/22 09:08, Richard Henderson wrote:
> Use the pre-packaged toolchain provided by Loongson via github.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   configure                                     |  5 ++++
>   tests/docker/Makefile.include                 |  2 ++
>   .../dockerfiles/debian-loongarch-cross.docker | 25 +++++++++++++++++++
>   3 files changed, 32 insertions(+)
>   create mode 100644 tests/docker/dockerfiles/debian-loongarch-cross.docker

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

