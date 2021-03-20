Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6D0342E32
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 17:10:18 +0100 (CET)
Received: from localhost ([::1]:55078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNeB7-0000fZ-Rv
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 12:10:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lNe4U-0003vz-Nl
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 12:03:26 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:41905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lNe4T-0005qp-60
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 12:03:26 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 l23-20020a05683004b7b02901b529d1a2fdso11518203otd.8
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 09:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KFysDJ08D9omJTXIYlcLRJ7jgqI0qmUjZq0yFR6tzCE=;
 b=XghXtDIiYlIVe+ByLL40W8wbwWTnH97u0CpksdXCN01QLz/Z8pV+3mtKc72X1A2uXy
 ppYPF4z8z10PwHH8Pce4PkQT5fS0dLsgkzM5ioZ87w3Lo5zGLhNZtBGudGvnCZyxe+DC
 e2nh+JWSxrnBxpSsrR/ZwUx5Jad52Y1u7NryPkIvRV2d8E+m8KJdsDg1Ia/kp7GxallR
 DtcC2dW573vGnCdV8Po+WjeUVyEUySW3yMiCEKqkLld6a18LBnXGgCLJSyCw8F3JRkU0
 4JeTkLSjw/zFr20xJEUyjncVy7ogh998N+ap/zdhnpIt72Tmpx2YSPXcfq/QchTcH7Oe
 KnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KFysDJ08D9omJTXIYlcLRJ7jgqI0qmUjZq0yFR6tzCE=;
 b=EOSywdjCct77F/aoOToa/ZIlt7HS9PMVcn5N8LdG3sBHFTT/SxhETMt3eD7oh9FsP3
 Xj3uwsQYUNU2G/WCvI8dIoj1w1xIqXFVqkup87YskvSZzBSdeRwtcRXxUGKfOWEtH4Sy
 tWbNIMmhpd1sglgR559Pipp3aTB/thv9oItRzGQTyYk3xgT5CypiAmZmtqS+Iqf7IFSo
 m3sAkm22F/Ff7B1ff47nQRu0+U1dSJGm8da277rNtyaY8dBd+eVR05xOM77IPS2t5L6a
 4P0JUQwuFJHMsC2AGBirSZ9rwSzcGWxAvFNFEH1jK1MS7iQY46jiP8awNwR9MEQja6Z9
 YIMQ==
X-Gm-Message-State: AOAM530vUABtcj08hSdfyj1sTwGoBcklvkla88vbZSKk6aqT6dxgN8wu
 MKIQ7cdMuyV6tT8CH6a2ISDcVQ==
X-Google-Smtp-Source: ABdhPJwxdjfuLVMFES428jSmwjO39VPbcodbtPjDmHkG+IzEjpliyDcqFb93lXdvtlPJvbXcKpAnqg==
X-Received: by 2002:a9d:3b85:: with SMTP id k5mr5125431otc.237.1616256203790; 
 Sat, 20 Mar 2021 09:03:23 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id m19sm1946701oop.6.2021.03.20.09.03.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Mar 2021 09:03:23 -0700 (PDT)
Subject: Re: [PATCH v1 05/14] semihosting: move semihosting tests to multiarch
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210320133706.21475-1-alex.bennee@linaro.org>
 <20210320133706.21475-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ecfe75b0-1275-bca5-68d7-e6ed2e1abbaf@linaro.org>
Date: Sat, 20 Mar 2021 10:03:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210320133706.21475-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/20/21 7:36 AM, Alex Bennée wrote:
> It may be arm-compat-semihosting but more than one architecture uses
> it so lets move the tests into the multiarch area. We gate it on the
> feature and split the semicall.h header between the arches.
> 
> Also clean-up a bit of the Makefile messing about to one common set of
> runners.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20210312102029.17017-2-alex.bennee@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

