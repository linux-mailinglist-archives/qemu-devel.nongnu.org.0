Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D03F2D3634
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 23:27:11 +0100 (CET)
Received: from localhost ([::1]:38684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmlRu-0001cP-3Z
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 17:27:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmkvP-0006p5-0i
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 16:53:35 -0500
Received: from mail-oo1-xc43.google.com ([2607:f8b0:4864:20::c43]:44608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmkvM-0007eP-DF
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 16:53:34 -0500
Received: by mail-oo1-xc43.google.com with SMTP id n20so738981ooq.11
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 13:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NStUY/qLk9bu6L+y0GrWZhiL3GnQYL84Qz+hTcrhUBU=;
 b=iGYD/ijLzODNWCUcr1z62gKp332+R5ij3BuEbr04mj/Nk8eeZsNG5L5by0MJWkopAZ
 p1M0Sy6rDiQfyVoxIbBFHSx67H1P2PL/voYDNQLiwXuCWJISosUY8We+zAdOeSZldEfJ
 U2174otlSp7Oy5tnTVCb5yDz4H5KMHHyxpo365KUtxX0+IZ5AdDTf3sZ6CnbEhwnT3aV
 S/XyGjgXUknzbP5d4G6bB2Nzd0A1aR/7BPTXc0uqE4czX/bE7KiwheuAIprucxY+VPBq
 t2CF3pJvNMRc1PxSbY2JZrY26stdvPMkUFHIGe1pR685BV115AnY1uR4TxdSf9nh+C6J
 m7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NStUY/qLk9bu6L+y0GrWZhiL3GnQYL84Qz+hTcrhUBU=;
 b=VH1wQ+g17YZlqkw1ghtdIVb9JePVm0bsrR4i/ak0a81Tyi9CBuN0Ko50HNHzDmki99
 5leGWpOPoN+bVt2pIEgRy2UxPr1NOv+7mvxnUKGvIp2gJFE6FMETUSE/prsUKGGlMPax
 sfQQvpFXaTlMGMBfI+lO6UEKXvryRCKr/HWbOLhNw8mTAIrjrqhh0biwPKYATROni93n
 s14Evf7TCROmMaqeKGLqmBb/iEXL7LwtFAPwL2V6FvLTQWu5ScYQ5e+g/I54q6f8Mbgf
 VxjPs717//xPsPnaI32Bah0XnJ6XtUXS6z2hdG7sLtQ10XaDQxG1FPR8fNdIjPNK26tl
 4IGw==
X-Gm-Message-State: AOAM531xFh37kQ5HHgJwTEKDfjl1Bv9IYxJYjoFsM2o+mErHH613HulB
 mCpL/We5f8Qw+NeQbybIt4/caQ==
X-Google-Smtp-Source: ABdhPJyEKfCiY0bGmx6HepSAva6E5lZxzE8O7K/xAi7N4YY1wjhs/wYc7SiQ2pHrj6mGa+53CRBZsA==
X-Received: by 2002:a4a:d043:: with SMTP id x3mr20993oor.19.1607464411181;
 Tue, 08 Dec 2020 13:53:31 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id b91sm14253otc.13.2020.12.08.13.53.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 13:53:30 -0800 (PST)
Subject: Re: [PATCH 08/19] target/mips: Extract cpu_supports*/cpu_set*
 translate.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201206233949.3783184-1-f4bug@amsat.org>
 <20201206233949.3783184-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c7adb225-43bb-21be-fd43-3985554301d9@linaro.org>
Date: Tue, 8 Dec 2020 15:53:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201206233949.3783184-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c43;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc43.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/20 5:39 PM, Philippe Mathieu-Daudé wrote:
> Move cpu_supports*() and cpu_set_exception_base() from
> translate.c to cpu.c.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/cpu.c       | 18 ++++++++++++++++++
>  target/mips/translate.c | 18 ------------------
>  2 files changed, 18 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

