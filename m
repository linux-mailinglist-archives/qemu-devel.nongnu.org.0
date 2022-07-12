Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD479571114
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 06:06:52 +0200 (CEST)
Received: from localhost ([::1]:39228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB7Ah-0007Y9-Pu
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 00:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB73P-0001xJ-15
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 23:59:19 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:54829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB73J-0007Qh-Nn
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 23:59:18 -0400
Received: by mail-pj1-x102f.google.com with SMTP id s21so6512320pjq.4
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 20:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RCWaj+pO610k/jA4UqMmZKT5kK6J7jXVL5HrVRw1X3o=;
 b=uaqLjPE2OzaFqCzuVq7U0XDdDCF+dUFqu4a+Hl+E/1yIbBBEbMoWPRKvM8EQBjEmYO
 sSUTOdTxo++o08hyAfAQhgNT95G9hze/wckBK1jyD04V56YnwatchqRNVwbR2HY2QtBk
 keVCag9/gP2YIJ6J2IJvjJ2GhoLW5PMWCvCeSBpCdLm3siAsZmsF7rvyFlDUHLQB1DeQ
 eZPIRVvjhuWUnhQt+2KXb+I1Uayr9Jj9Z4Fvj/Td+rQhKv1xBIN48gkVkOcq+JyUEvCo
 I9e1b2VcqesVH9xmGftozGWaX1cj64OV1hVbOoomKwrLVg4PwDjKUgx6CPodJlFjoFfS
 9nHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RCWaj+pO610k/jA4UqMmZKT5kK6J7jXVL5HrVRw1X3o=;
 b=ELk3snLoQtHFbznzh4qY29/cD6xjKxkdISlYpoVlhXjk6qYGIrrQbqmbIWVRCeNPv3
 lkQxHv5AKqpDrrGUQHhE7T+3bovfGoIwCUy1maR8ChMlV5SfFaW+hub5OM6nR7EeG66c
 16kX7KLtQPzBprMVccXVQVqQdPIPJsI2/YyUUU8Pf1QR/P2Or4yTjkKgJBLto3VguXgz
 pPfwUiCUVzi8LhEHQLNY4/Dg6Xo2X1Ye3gbeMbGZ7At1xuga6c3U1nCAqx440cVba4HM
 YR9HXSegEZCPtC3P4NZDOtkW85lv0G4vogbqSBCmGU658oLq7XP1ljDcdOPPtRtWCQDF
 OLQA==
X-Gm-Message-State: AJIora+uGC0LsElD3tYJFclI+TC6uIzfrRg2dyTK2VcHKlo/8FfNT7GZ
 ozO8Pu69BDBnZBfKEbe1FRMzHQ==
X-Google-Smtp-Source: AGRyM1uZZoehJVwOy8WjZHsGu8yFUbWHulLf9ZDuhswuwHFtp/6xL6IYrxVOCRVKMH4nfn6f+OK8fA==
X-Received: by 2002:a17:902:c245:b0:16b:e818:b75c with SMTP id
 5-20020a170902c24500b0016be818b75cmr22104671plg.101.1657598351790; 
 Mon, 11 Jul 2022 20:59:11 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a170902e74300b0016bf4428586sm5533055plf.208.2022.07.11.20.59.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 20:59:11 -0700 (PDT)
Message-ID: <9974a2b2-328a-94e5-3faa-542605ba5d45@linaro.org>
Date: Tue, 12 Jul 2022 09:28:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 04/12] tests/vm: switch centos.aarch64 to CentOS 8
 Stream
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Daniel Berrange <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20220708153503.18864-1-jsnow@redhat.com>
 <20220708153503.18864-5-jsnow@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220708153503.18864-5-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 7/8/22 21:04, John Snow wrote:
> Switch this test over to using a cloud image like the base CentOS8 VM
> test, which helps make this script a bit simpler too.
> 
> Note: At time of writing, this test seems pretty flaky when run without
> KVM support for aarch64. Certain unit tests like migration-test,
> virtio-net-failover, test-hmp and qom-test seem quite prone to fail
> under TCG. Still, this is an improvement in that at least pure build
> tests are functional.
> 
> Signed-off-by: John Snow<jsnow@redhat.com>
> Reviewed-by: Daniel P. Berrangé<berrange@redhat.com>
> ---
>   tests/vm/centos.aarch64 | 174 ++++++----------------------------------
>   1 file changed, 24 insertions(+), 150 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

