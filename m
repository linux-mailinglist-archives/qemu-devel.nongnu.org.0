Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAB0414044
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 06:02:16 +0200 (CEST)
Received: from localhost ([::1]:44882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mStSZ-0000uB-KQ
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 00:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mStQ4-00084d-Pl
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 23:59:42 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:36748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mStPy-0007wh-Nx
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 23:59:38 -0400
Received: by mail-pg1-x52c.google.com with SMTP id t1so1302908pgv.3
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 20:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=EU0pVekU1dQljUlMOFxucl4CCPYdqW5fXzflxmvszg8=;
 b=fax286gyu2U+JWYEWZwbLREIbd9uk5Qtu3MGpP1lM3n4PC19J24H2s5natrn3lKfX2
 jwUUj0UGzc5OAU5SBthM43hogobeY5KJCb7whBnUzi2GV8kBGZEMju7nZZbQomeXk5oF
 tfyzpUnlIUEFhVLMS0fnFD6gZOx4G6iVsky4x3MQbLMQTwC5E4QS1R4qnY7mElcilILO
 gNXvWlE+erfdM1li6cTqe50+uyaUdScXqv/a9MGbRTuKA9/ja4W1ArFJJcUFBfrb0vAp
 vzAbNYAnCr0v1QooEz59/QQUJ8syULZu/ETgPLzpDsZhyqCpxG7DqK6iZRLH01noQ7uo
 ZyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EU0pVekU1dQljUlMOFxucl4CCPYdqW5fXzflxmvszg8=;
 b=vG7fRWghuJGasg9P4HkCXdk5fvpGQeTbXzHV5aJh/+s7PcJ6AXwF0kWK4Mtq7Rz3uA
 4t09i2YCQb7hp7NqCTK09tDqDjDm79LFIsTP8SMU0MzmnLrC2PZc8RWQfDdmt5YU/Hgx
 LA4QVSgPctlrLHFhQHywoZwc0rnd8ZGu5wVBzzvMq9/1JM3ys0FUkNGk3buAiVvNujxt
 tz2juPSafHjoS1TkOEEno8N2c1d8vaQKS7fQCECay7/nUDkwxoiDmVK9vE45bmY3wGBs
 S/K7mprazNuYpp6NYg5PHo/tkKZF+RN67NQzjYBUgxMk0Dk8LIHOPjC64ZO7e5NzQS+C
 nzgw==
X-Gm-Message-State: AOAM531fpoGrcSRk2akkJRnMN/h9iYXUfMLUWOvjIEkYzhihPcxBrPcl
 aSh4VRUM3mt0hKDgKFmWb6vt1yshCvnDFw==
X-Google-Smtp-Source: ABdhPJy5qGzCwIpDFCCpBR/a+xgrqKxJcz0q588YzlZzb6JnXTX2tgJ3mLmSaXcmRyXsx1yCDG4tbQ==
X-Received: by 2002:a05:6a00:148d:b0:440:4e92:798f with SMTP id
 v13-20020a056a00148d00b004404e92798fmr32901858pfu.17.1632283172046; 
 Tue, 21 Sep 2021 20:59:32 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t10sm658120pge.10.2021.09.21.20.59.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 20:59:31 -0700 (PDT)
Subject: Re: [PATCH v2 06/30] tcg/loongarch64: Define the operand constraints
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210921201915.601245-1-git@xen0n.name>
 <20210921201915.601245-7-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <33e78254-cb57-af3d-4e8f-8a5f5e407f65@linaro.org>
Date: Tue, 21 Sep 2021 20:59:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921201915.601245-7-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 1:18 PM, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui<git@xen0n.name>
> ---
>   tcg/loongarch64/tcg-target-con-str.h | 28 +++++++++++++++
>   tcg/loongarch64/tcg-target.c.inc     | 52 ++++++++++++++++++++++++++++
>   2 files changed, 80 insertions(+)
>   create mode 100644 tcg/loongarch64/tcg-target-con-str.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

