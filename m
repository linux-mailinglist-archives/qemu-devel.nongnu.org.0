Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D1B4D6930
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 20:46:02 +0100 (CET)
Received: from localhost ([::1]:44708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSlD7-00056S-SL
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 14:46:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSl9d-000261-In
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 14:42:25 -0500
Received: from [2607:f8b0:4864:20::631] (port=35458
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSl9c-0007pF-4L
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 14:42:25 -0500
Received: by mail-pl1-x631.google.com with SMTP id n15so8512902plh.2
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 11:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=cbhXRhgBwoNz35i3hs0qsFne1SN9RRIX2YYBT8LqKuc=;
 b=PNAU0ttxtrQKveFJn8Vomyv4fuWmaLOSfMX3zCXWtnvUhCGg+MI2LTuzBjtltCoMtF
 UV2Av/uT9fpTnJKLOH7f0S6fElIIkAJUFxSHORKbsWw9D6hHDYk4vZoYXsOWF6cAp3OI
 OJ9+eNkXrjfWj2+TBeOfXCFcP7miBjk/pHEof5CG2KK0BNZk+KKaYobdSQj6V7iNPqpf
 lSCdC1yGch4NaAYLJlSZMFMReA4cP//Mqo7R8EppHQnYoEbmW9UcQOFtmvsh2QOTQ9Aq
 0exYvmwjGx0jLlQ8cdAjjqtKIJJLCsgNfWarnj/ZUOUcGSvvOzOK7lylhelw4zTrcMMJ
 KueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cbhXRhgBwoNz35i3hs0qsFne1SN9RRIX2YYBT8LqKuc=;
 b=ByM7wViBHAaP5hIL+dKkCLF2M3fWQVJQRqMcKFAf/egghBUUcCccWkQKVHRGL5CD9z
 6TXiJ5Z+XXA7fqtcQu8E+3HQ+0WXrXaOrNDj4QYWls56kqjPXdoNy9cAHzBkEShZKU9H
 7KwdCkl0+71tql+ODK8xm4asbm4hx/8m+payK/3m01h+Peff0yQJEcUU+Zzzx8VAyKtI
 NWsBuFx9UMVpm0D/fXvE/Slu21heKnTcoQ+fNWkL9iPn5PhWhkKKNXo5Xvbz9oVvg4A/
 VX75tIvpeRQ0K5uJOcrhN35MzF+CCYszh97gp8XvurfaRYA31EiYasOOEEXtjvkx36Z4
 qRKQ==
X-Gm-Message-State: AOAM532B0gFhXeRFtJ6ZMmeq7W61iy4nBZjlL2nEVPP3Fogyq5K3EmQ/
 JSJwP3eSh6+XtfZKlSxMBJ8rQw==
X-Google-Smtp-Source: ABdhPJyhl19bKh9O2A+6G1P6ZvdtvPjTgzVNPu+crZMRtYo1NBoL2mxJ8V+rSlTJ+Mp6VfusvxJiXg==
X-Received: by 2002:a17:902:eb84:b0:151:c730:c9a3 with SMTP id
 q4-20020a170902eb8400b00151c730c9a3mr12015452plg.144.1647027742907; 
 Fri, 11 Mar 2022 11:42:22 -0800 (PST)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a62830a000000b004f73c34f2e8sm10484932pfe.165.2022.03.11.11.42.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 11:42:22 -0800 (PST)
Message-ID: <e9588005-002e-2feb-ed29-3babd6b00fee@linaro.org>
Date: Fri, 11 Mar 2022 11:42:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 4/9] dump: Remove the section if when calculating the
 memory offset
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220310110854.2701-1-frankja@linux.ibm.com>
 <20220310110854.2701-5-frankja@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220310110854.2701-5-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/22 03:08, Janosch Frank wrote:
> When s->shdr_num is 0 we'll add 0 bytes of section headers which is
> equivalent to not adding section headers but with the multiplication
> we can remove a if/else.
> 
> Signed-off-by: Janosch Frank<frankja@linux.ibm.com>
> ---
>   dump/dump.c | 24 ++++++++----------------
>   1 file changed, 8 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

