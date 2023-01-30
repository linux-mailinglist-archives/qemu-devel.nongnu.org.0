Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2D0681F90
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 00:23:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMdTO-0006vu-7t; Mon, 30 Jan 2023 18:22:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdTM-0006vF-JD
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:22:00 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdTL-00079a-0z
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:22:00 -0500
Received: by mail-wr1-x429.google.com with SMTP id h16so12662608wrz.12
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 15:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9nrgG/Eamrd0ArAWxB6m+8tRXt7MPsTedgBb2xBAGHU=;
 b=bR+dnjUjK23HvNsMqOO4Z298CSBT/mRM8cTXnGPmRF4+B1bf1AydL3nhc9+VaNQLf0
 FfVn3R8p4NF2v6e8Ur25DQS5wnjDWSWRwb/sD5hEaEPneCGKSO3UL2m0Xxc1+O1pMtK8
 A5dZptSC/o3zceRnLQkrlUWZxX3D75faAV4S9DzytTTf6JHXyGTMiTd6QRx9PAyvpieL
 B/lmRGJq50B/UeSIcuA6flXSV1uYAOBDlUxqy6Ayw35Vp9ofOqAfg44rkRyuZRrAVmYD
 XIZURBgJXo1hCbxzLanEY6N15yN1tXFf7y5qFmYKmDBzTZW+GBWkGCuQyT1RpofGnQGd
 4QuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9nrgG/Eamrd0ArAWxB6m+8tRXt7MPsTedgBb2xBAGHU=;
 b=kgKMIsZEVxF59JxYLJxejRvfBjF1C6jQAhN4+oEnacZNGwugjC2I1rkOqOHTvzMfNi
 PIMkSvwGlH+dk3vTDAhGvylCSZR824bVImYM774C9yE/lQGZjym5VkfwO/i54jsTkKGw
 P+RSbuRfx+3JWCH+m0pqTM9nlceOg0J8TGqWlbHStn2gNMrfodF16pDZJqKzvqnb7yan
 AJqVDs5njB5q+Ddpggt8OVThGPNo+wzmL7Z/NBLVpqwF97q1PrHr37ceAGseYYlVAUjH
 WA+W5/970iamoY0mPqdL5pc8DJsCfNeTF3dCBHZNqU5IWbwzxWj/q2lk3WVUKNP04hp1
 xxxg==
X-Gm-Message-State: AO0yUKX1fvyqkXItbA2ZygKzbZhWeza1M8dXarEBByvNwmIGYdOz2B9D
 4RFf8vv7p+woQNuqvZ6luXzkmw==
X-Google-Smtp-Source: AK7set9u9jQRFkO4w0cEhnqneHzig2qAhkyPA07GGiMpR6EJrUFHor4EQ8KXyhB2R2zVj28gecxJJQ==
X-Received: by 2002:a05:6000:1b06:b0:2bf:f6b7:7a63 with SMTP id
 f6-20020a0560001b0600b002bff6b77a63mr2504493wrz.0.1675120917278; 
 Mon, 30 Jan 2023 15:21:57 -0800 (PST)
Received: from [192.168.1.4] ([41.141.105.34])
 by smtp.gmail.com with ESMTPSA id
 y17-20020adffa51000000b002238ea5750csm15660877wrr.72.2023.01.30.15.21.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 15:21:56 -0800 (PST)
Message-ID: <6699a3cb-472d-4748-6a11-f49ac25f692c@linaro.org>
Date: Tue, 31 Jan 2023 00:21:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 35/36] target/i386: Inline cmpxchg8b
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
 <20230130214844.1158612-36-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230130214844.1158612-36-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 30/1/23 22:48, Richard Henderson wrote:
> Use tcg_gen_atomic_cmpxchg_i64 for the atomic case,
> and tcg_gen_nonatomic_cmpxchg_i64 otherwise.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Eduardo Habkost <eduardo@habkost.net>
> ---
>   target/i386/helper.h         |  2 --
>   target/i386/tcg/mem_helper.c | 57 ------------------------------------
>   target/i386/tcg/translate.c  | 54 ++++++++++++++++++++++++++++++----
>   3 files changed, 49 insertions(+), 64 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


