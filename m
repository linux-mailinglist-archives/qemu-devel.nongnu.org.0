Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5925AC4C0
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 16:18:38 +0200 (CEST)
Received: from localhost ([::1]:42358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUqSL-0008Hu-Fr
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 10:18:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oUqPX-0006lc-U6
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 10:15:45 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:42632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oUqPV-0003c5-6r
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 10:15:43 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 d12-20020a05600c34cc00b003a83d20812fso4351929wmq.1
 for <qemu-devel@nongnu.org>; Sun, 04 Sep 2022 07:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=T6YNnAeUqDSCMquTbEVqT1IvJBBa69ud+1fK8c2xDXA=;
 b=BbJb2ok49ZLzTBrz9vDH/OteFDZDCc5xH+zlozhEkbKMw1OR9WDjRkz8XBr5fiC6YQ
 3v2yQS5xCovKBMu91o4wU65K9FGdaI3+HENnogeeHdP2Kxoo4eLnc3YFvuODxcq8a9ax
 e/FwBIjgMIhIiQN4FMeinOleVhtqSUQdph60mZM0m5Vu7vseyKWKKmF8hRZTX2cxVsmz
 eclMyngYQf3WkEFs3JI125ZRMRYPSuJ5yqpusc3UZGN18LOWfYHrgPiCALkXDbYBjMpN
 bVfV7xJU49asosLEXFaf7LrTMGE5MZCtGBQ++K4H8pD8BUvCbKpovTqKr7VGQonaK6Rk
 xNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=T6YNnAeUqDSCMquTbEVqT1IvJBBa69ud+1fK8c2xDXA=;
 b=cizLzAvomS8Du/ojuzWXyZ5qEu3CW57B90QUA3Ssctc8Xo+gk/UZ9BX8MFpq9wRla0
 O+ZwsLGkdO5MRSkLj1iUvChuodUbkM8LW3KHDFrV2i34Evrl/rRNlAfN0sr0+aRoCXX2
 T8SN9Fv0U2Aj2fy0oaLr/VXoxUi5BjdD4z9V8qakyuBjMMir0wnJkPIG/siWsU77mfHs
 mWP4laBxZCTSYiG1Axgz5QMwyGArYUZFEWh0UvmlTtZ08lFRk3rR356LpVo1ht8UQHiI
 M+OGLOzUHyn6j8LyUhU7SfaulSoWTiZoIKIkxqzqzuLdarGOQebtYXltjbQGLPxzcDK3
 nPlw==
X-Gm-Message-State: ACgBeo25N+wb74TF64t2OK1XeRJ4IfYgTaK+iRTRWtD/x6K+5sqZ1w3U
 Z58eM5i4P91drJ2wiIPhTWg=
X-Google-Smtp-Source: AA6agR7iBPjU2eRga+gkrq21/pfOkgRUsahOxtBFgnq8uDp/Pvw00yj9yQ5rLdXt/7FfUu3UV8r7Gg==
X-Received: by 2002:a05:600c:1551:b0:3a6:2f4d:aeca with SMTP id
 f17-20020a05600c155100b003a62f4daecamr8179283wmg.100.1662300938121; 
 Sun, 04 Sep 2022 07:15:38 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u21-20020a7bc055000000b003a3442f1229sm13801481wmc.29.2022.09.04.07.15.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Sep 2022 07:15:37 -0700 (PDT)
Message-ID: <f4e1cb86-fd7e-55a2-b05e-f27acd8e0e4e@amsat.org>
Date: Sun, 4 Sep 2022 16:15:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 21/51] tests/qtest: migration-test: Skip running
 test_migrate_fd_proto on win32
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-22-bmeng.cn@gmail.com>
In-Reply-To: <20220824094029.1634519-22-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.978,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 24/8/22 11:39, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> The test case 'test_migrate_fd_proto' calls socketpair() which does
> not exist on win32. Exclude it. The helper function wait_command_fd()
> is not needed anymore, hence exclude it too.

I'd rather use a feature test, then check for the HAVE_POSIX_SOCKETPAIR
definition.

> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   tests/qtest/migration-helpers.h | 2 ++
>   tests/qtest/migration-helpers.c | 2 ++
>   tests/qtest/migration-test.c    | 4 ++++
>   3 files changed, 8 insertions(+)

