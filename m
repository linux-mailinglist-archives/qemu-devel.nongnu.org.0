Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5E8411570
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 15:22:16 +0200 (CEST)
Received: from localhost ([::1]:41526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSJFP-0000TI-AF
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 09:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSJCa-0007Gq-3X
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 09:19:20 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:39621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSJCU-0001dT-LZ
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 09:19:16 -0400
Received: by mail-pg1-x534.google.com with SMTP id g184so17287701pgc.6
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 06:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XBo5Z/rN/QZMeRJJSQg+/U3i9+goRpWWJ7T43OXiRGI=;
 b=NdVuqzehHvOde5wRIPGnWmu2A0iZyDDNt/tcybiuHhEtLvLxXGvNLu5KwxCFX5apF0
 Q3LPrSuREzSYEEmL0fcaWjU8LJ/WDXOzRBwsBkSib5ntCttDx+SBO7wzvgibSybw8H5Q
 Qjva3u29hSCla14xP9vlMnRzuqTe21GPR9aS5HMhB5WaqDrn6okQOJnQzi2jqF2i9xYY
 57KrC40PEAEYK6/VBVAWRRo2GUFzsLPEfB1PVU1YacQNRyHFHfsZ/FWo2q2OP7raTeVZ
 EHq7maKw0uo/QgJ95j8y8gsp3e0TcaKMJj8qF7i0c8nP6+KCUg3bT/1J2MjnsxBOL5nt
 wdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XBo5Z/rN/QZMeRJJSQg+/U3i9+goRpWWJ7T43OXiRGI=;
 b=tpZFPN/abCF4ZIIAFRpGY2wEOhBinFrwHgat/k5eYyj5QbRS5CmKkcuEg9yUCk6bk3
 Y3GA5XfHs79XCGsSIduSikAReNyTVMppMD3g33dnR79n++EidGjwQoonjEERoFkBU7h3
 lT3mAEQ+N85FlccRWOJYhudPULFrHPPxZ/0ZDiKDYAm76FriDs99bebC/T0Swk+XJjK0
 2WSVLKiar6wZUKFoePPvUHExzrnAUZ4WeB8+vKgn/Q6crydf2M2Oh5f7b3hOo2olVlR1
 0+wi88420qWsxEbbT1c5v3V0yXpfYf6PKSMNhfRxQRGn7lrezM97b0SEdaaw60CTCce8
 EXJg==
X-Gm-Message-State: AOAM533EjegKfy9Y0JVo/0CMZ3uwy1Rb+tEXvheg25nuUDCIr2ChV/qb
 WI8lhuO2u65AGZXPbymhc7QYTpZtt3eywQ==
X-Google-Smtp-Source: ABdhPJyxqlE657qFQy1vxy2f5DVu6y9Yq1ursUVZkBmD7jXSEbg3Zpicy6fB6Y2aaPnMcd3Hq48x7w==
X-Received: by 2002:a05:6a00:2d0:b0:446:d18c:9aac with SMTP id
 b16-20020a056a0002d000b00446d18c9aacmr11992812pft.16.1632143953052; 
 Mon, 20 Sep 2021 06:19:13 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id l11sm18323018pjg.22.2021.09.20.06.19.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 06:19:12 -0700 (PDT)
Subject: Re: [PULL 00/35] tcg patch queue
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
 <CAFEAcA9XxgFYj6jzNGEhgMHhB2UQF_X3ZLigu4sRPrR3Zfj8sg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f371bf7a-71e7-b6fa-4d0c-0a71b7b7f19c@linaro.org>
Date: Mon, 20 Sep 2021 06:19:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9XxgFYj6jzNGEhgMHhB2UQF_X3ZLigu4sRPrR3Zfj8sg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 3:07 AM, Peter Maydell wrote:
> This seems to result in a failure on the s390x all-linux-static
> CI job:
> https://gitlab.com/qemu-project/qemu/-/jobs/1604251543
> due to a core dump running the 'trap' test.

Curious.  I can't reproduce this on s390x.ci.qemu.org manually.


r~

