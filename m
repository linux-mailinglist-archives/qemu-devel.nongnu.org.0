Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2508939CB82
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 00:49:40 +0200 (CEST)
Received: from localhost ([::1]:37626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpf6p-0004cq-7J
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 18:49:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpf5r-00033K-E2
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 18:48:39 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:34401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpf5p-0003CL-NR
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 18:48:39 -0400
Received: by mail-pl1-x62a.google.com with SMTP id u9so6484502plr.1
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 15:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z+XMb3a6PgCmS/uKdoinD+PPvpkdz31ARf49HWH7hy8=;
 b=WjCI711sba7r3LFNmoyTS2wTw6JEIikHypN8QCGRYgxd2+uyIXL2/7jd44WsuGGN+c
 /P/Dj62HdMwM43NBQzDgc8NKs9UVxGbQeG+R1elJlriBciWSIeIBSH+K1Zi/pz+y9RWK
 NUMGYZ/+MJOJyiolm2yaQmY33VHNjEC4T/EIJU/JQY0nA0WyrOu+Kr1c8qhTchjgNbwz
 pi71uvmuIJNH3/W+sPQFb8sCw5F1NJkrVvFG1eOYXW+4eaFk/u/8LIF0gZd3S016kjhV
 WYRRY9BccMQoKybG44sOgzeDfBDzr7Fh5ysDZYCf1q/wJKGH/nKxIl0u2llbuI4y+o2d
 3Dkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z+XMb3a6PgCmS/uKdoinD+PPvpkdz31ARf49HWH7hy8=;
 b=dzDZNo+fGMNqE1x4nAQ5PZTsV6sf0nbS6yQfwpO7ToMYxa5HRmy674GT94PBA3TZkI
 QobaSiQ3HR8s8d/jJcpEHIK8+Q0egHpnWFQ8nDnAkfNMeh0VUCghd4Qsz2Ti+CT7u62Q
 e2zZcme5Z8QrA/u/oXMxf0KfUFG7cHKZc5C5fO7n3xVVsUzHpqRN4m0k/F4mHQ5XAogt
 u2zSFeNV5hyI6O9uWJ29PMZ2RL1o9igijuo8e82QdS6Ka2SkJPoNYsAWTsgccVgJ+T7J
 pUkNdNpRi4XfP7VjFX4OxI8VVhaBGWhGUdNew5M7aYQyQt9RXtOJYX1JNGc5oXvRDQTs
 4tnA==
X-Gm-Message-State: AOAM53144SdpKcdOeUGr9EhYcly82DcvPx04tLgsqYrRCXcjv9zilVc3
 LlTpZou/HrN9gjasKgJlXkXW4A==
X-Google-Smtp-Source: ABdhPJwaQ0l9d6YKlC+YkyiY3yRwphsx+Wj4D7CnZd902cCeqNEyHsIjFZ9sm1Gi+jT13bEIRWsMyw==
X-Received: by 2002:a17:903:230b:b029:f4:b7cf:44aa with SMTP id
 d11-20020a170903230bb02900f4b7cf44aamr10742576plh.31.1622933316320; 
 Sat, 05 Jun 2021 15:48:36 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 j4sm4468488pfj.111.2021.06.05.15.48.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 15:48:36 -0700 (PDT)
Subject: Re: [PATCH v16 97/99] tests/qtest: make xlnx-can-test conditional on
 being configured
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-98-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bd2b3f0a-1871-b264-1e5d-3934967584d1@linaro.org>
Date: Sat, 5 Jun 2021 15:48:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-98-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:53 AM, Alex Bennée wrote:
> It will soon be possible to build an qemu-system-aarch64 system that
> doesn't have this.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/qtest/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

