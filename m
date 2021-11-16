Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D35C6452D83
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 10:04:31 +0100 (CET)
Received: from localhost ([::1]:58820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmuOE-0000kO-QY
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 04:04:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmuMs-0007q6-UW
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 04:03:06 -0500
Received: from [2a00:1450:4864:20::42d] (port=35578
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmuMr-000609-C9
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 04:03:06 -0500
Received: by mail-wr1-x42d.google.com with SMTP id i5so36123746wrb.2
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 01:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jk2aKy3qgQk810zPHO3zhLeqLVhoYOOv4DQJTDfs0Q4=;
 b=TCvPf6G0V6KDszMj09QEJM2pGkMeIJ/1vByOLoi+Yy83KigTPSn8Ys/m7/PZdsHdaQ
 oLoWZtzC64vxGDbME6KYKmhTwh+T7rZc4yn4H/E866Xb5bbQjJhF4wk89mBOihCq2V68
 tBhLi9x813qdg/QNNnlOi5qDAhSLL/Qub+32f7d6pKHc3sGf9aO27o8n6I82qthCHx9Q
 FkQI/mOVrfiC9eBxqsSIXF/fqN41HLpCOFNDQH2ZaqUryPntwsOd1CXzUSSvT2h8/OBO
 qJKi/uNCh0r3ug+sK7dUVxslCnhxeecbPER+UE8yRZusVsdXL4W730hMT/3L1/OYtu3L
 iL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jk2aKy3qgQk810zPHO3zhLeqLVhoYOOv4DQJTDfs0Q4=;
 b=ooQjwHvj02c+e34KjVMi0qMcoPkrMiwaTDi2r4zLmk9w7fkei0qJ25qOQlibmo7bEJ
 YAeDdOTOYJgJrW5rd3RyqR4Ypm5EAzxZSfWSLuT0v+3duIcaQx3vgw7D/V0ogRCg+D0u
 Q1knGbdkvEYOGOeOWeGSXPVmkoF+BRIxFXsvgMOjCW0DZ0RNGnHCS8cgu7ZDveTOoEVi
 ppEULi9nTACEkH0CQlQmkaD8mgACKF9rsvKtQlzA7AgxxYlIDP8RFs60MDOCgUZOar5q
 QZQ6pxx+7DoXmSJXwkGBzXtYbpkslwyQmQYQsspLuIm3fW134gs3lbMoqa0w075ehRJD
 Dgew==
X-Gm-Message-State: AOAM530UaJ0QOl8MX4bvsDFupPEr6fZaSkswMDoGgjwF3LbZeeHQtcbm
 AYGN8Ph8mBYsfDdFCfSCLSaZTA==
X-Google-Smtp-Source: ABdhPJx9dpudcfqwpyQBqLY03IX5sRmUCkAlC6w+6YBwgqxQdksun1zMVPwrqrcmcmmY/acyRbKhyQ==
X-Received: by 2002:adf:df0d:: with SMTP id y13mr7414937wrl.176.1637053383967; 
 Tue, 16 Nov 2021 01:03:03 -0800 (PST)
Received: from [192.168.8.105] (145.red-37-158-173.dynamicip.rima-tde.net.
 [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id f18sm16493895wre.7.2021.11.16.01.03.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 01:03:03 -0800 (PST)
Subject: Re: [PATCH v1 2/6] tests/vm: sort the special variable list
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211115142915.3797652-1-alex.bennee@linaro.org>
 <20211115142915.3797652-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5f6123c6-e666-35f8-ec7a-49a6e1f17228@linaro.org>
Date: Tue, 16 Nov 2021 10:03:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115142915.3797652-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.446,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/21 3:29 PM, Alex Bennée wrote:
> Making the list alphabetical makes it easier to find the config option
> you are looking for.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/vm/Makefile.include | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

