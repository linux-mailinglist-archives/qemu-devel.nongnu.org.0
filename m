Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DB235AA6C
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Apr 2021 04:59:48 +0200 (CEST)
Received: from localhost ([::1]:42094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lV3qc-0002QV-NK
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 22:59:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lV3pn-00020R-FE
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 22:58:55 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:36574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lV3pk-0007zN-SA
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 22:58:55 -0400
Received: by mail-pl1-x634.google.com with SMTP id ay2so3645277plb.3
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 19:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=3+Fncf9wjpsu2hKm27IpzR02JS860n59cbZbKfIBiiY=;
 b=vYPOxNVysfVEuXYLK58o8NNUwV0sR1XXegELG8t84deTtC7U8Phnb5CuZrYH2f0G9P
 cDmg0pekWHLRyHIMI1fpzYmZV250aijQTyoVfV9RcFa7/ep0AjXWFzWTnrwKUJCFb7Jw
 R+G1JVH5yJX4b9ChUb2Nl96yFWLOjWCMMp5wGAri2Qs4aGZXlbn2ZkccFfos+rf3cHWE
 /0iNXzuD/O5OhpdwcwcLEdbC+1Htt/uDgsaYlvgxdijJ5EkpZ1EveGBYyEMfd14L7gXB
 7YI6MOfGEyl4ZJw3Ym2y+EaxFqwbuToG9/QcYRxCaOsJC8A2q9wX6uTJrnlMcHLdjaXt
 VHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=3+Fncf9wjpsu2hKm27IpzR02JS860n59cbZbKfIBiiY=;
 b=DHs7wYVic3twQqpqucVT8pmarafuq6OoocBGLni/6Op0KvEp4GBJ6KL7xWGxtnPdNE
 iv9quJ8V6IMg9ZZsbC3QZPzoZ/cQbjRTlsOFBVl2JZe6FXrFo7SRXEXmS9Xxhi2yjkj8
 /AeviE3J0tBTn003nv5uBys1BrLXyNT2h4J6Omd9HFCoApdbG+vlvcDqfmCdVhdxtN+s
 yVsrSZl7cwObh87AwhLvCUihr4Y9usw2fB4jRl/nZxZHdiMx83maoVIPFBMQxFnc+sN/
 z8qnuZfyW3GzwkN9Hgu7D97/738ZTg5SsGCP3AroiB9b/I0PfKk+zCwY1FGrE2ybGm83
 2h8w==
X-Gm-Message-State: AOAM531YGb6F/JtagslMAZ6IjOk/tg+QYvwSuGnE/FGv9MZNW/M9l0TU
 hP91QQSv94brpO9Eiv3G7EQPd9LLGxHASA==
X-Google-Smtp-Source: ABdhPJyXSPAa+ZOvFoV+mvym2iODf0CW7Nj9uIkOUEQx1SB3aNLV3sr1sSN75L/NKrCcHevGSmOOug==
X-Received: by 2002:a17:902:7e8b:b029:e9:2ba0:20a2 with SMTP id
 z11-20020a1709027e8bb02900e92ba020a2mr15807687pla.69.1618023530067; 
 Fri, 09 Apr 2021 19:58:50 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id a13sm3947068pgm.43.2021.04.09.19.58.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 19:58:49 -0700 (PDT)
To: "Daniel P. Berrange" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
From: Richard Henderson <richard.henderson@linaro.org>
Subject: gitlab-ci check-dco test
Message-ID: <524450fb-2baa-12de-710a-3e05ea1f3f25@linaro.org>
Date: Fri, 9 Apr 2021 19:58:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On development branches, it's not uncommon to push
temporary --fixup patches, and normally one doesn't
sign those.  But then of course one get hate-mail
from the gitlab-ci job about the failing test.

Is there a way to make it fatal on staging, but
merely a warning on other branches (a-la checkpatch)?


r~

