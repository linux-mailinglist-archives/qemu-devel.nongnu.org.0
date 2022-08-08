Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BA458C812
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 14:04:22 +0200 (CEST)
Received: from localhost ([::1]:58430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL1Ua-0000V3-No
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 08:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oL1Nu-0004ri-Nk
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 07:57:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oL1Nq-00081m-O3
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 07:57:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659959842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=A4odhkgsoWiAmLLXk5hCZapicKjk5qNX4OPiMVo9Dyw=;
 b=aypktxjsWV62s6uzo/689hobOFULhvHhj99HySOrtdG49zqEQF0vEGuPdG5eNlgrzC7u2e
 HBrFufQvKDSKhiMaDmk6R6418mGS8IeVtWOBM1G42WoiRyVT+H/aXKIN2KKkHWYVqDKrHn
 156DGXJa/4C0jzDtgUnunOgfg0yPzuo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-4t7QuxGkMUet_Uy9TYe0vg-1; Mon, 08 Aug 2022 07:57:21 -0400
X-MC-Unique: 4t7QuxGkMUet_Uy9TYe0vg-1
Received: by mail-wr1-f71.google.com with SMTP id
 d27-20020adfa41b000000b0021ee714785fso1363180wra.18
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 04:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc; bh=A4odhkgsoWiAmLLXk5hCZapicKjk5qNX4OPiMVo9Dyw=;
 b=0vDkirRc0ulAKSk6Tw9jOH0+6OiJFUkCaup5zpqMZMgeYc3qheoPHCplMfo5EAY1t7
 rvg23b8QXTlpe2qN8uVBWC5ZBwJJzSlTlfMhgVsmvoRQFuBaDInFAIZ5tXBPKhYyPPYx
 pL5u40snNmB4+OF9tqkeIlX9U/mWLGksnWEY0WEXFJ0XOVODfq98rY84QViylrFWQiil
 FjuCFxU1pFN2YaNO5CCyRP2kt5S4CCmgOYmVvy8zKjfZXsp4+Se2V7ZHzUXroy8Um4Tb
 8VZMZ4jO4EV3FOsb/A6jcqe05Z0X0xrNY7jmBjWN/OvMVOB7X4q2YipfsDYOopA27ren
 avQA==
X-Gm-Message-State: ACgBeo1mMTwI71AmglViWinsQ1qIUSi9P9GtAt8m+kW237QQ26/XSRTW
 g7DDOFGOChZeLMkbvPtgABxdnmJDJ3nEedFYmpMGB0nM/qja9kQ7GyxtqTmjvj+5NzhsI3pnGoL
 myiKkymODEenDk/YZI7+6uOQNnRP+vya7WW1E2UvRJCEc2XX/nXPDZP3IWvcuJ+E=
X-Received: by 2002:a05:6000:789:b0:220:7480:e2c1 with SMTP id
 bu9-20020a056000078900b002207480e2c1mr11280746wrb.327.1659959839881; 
 Mon, 08 Aug 2022 04:57:19 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5IqzKTsm5Hi5eKWT8k6F2W1TeUnMqMpcs3T7md/y2Gph0DEg5ctTenImH/6yqwEQPAQOywQQ==
X-Received: by 2002:a05:6000:789:b0:220:7480:e2c1 with SMTP id
 bu9-20020a056000078900b002207480e2c1mr11280731wrb.327.1659959839636; 
 Mon, 08 Aug 2022 04:57:19 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-42-113-71.web.vodafone.de.
 [109.42.113.71]) by smtp.gmail.com with ESMTPSA id
 n11-20020a5d660b000000b0021f13097d6csm11231335wru.16.2022.08.08.04.57.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 04:57:19 -0700 (PDT)
Message-ID: <7bf333f0-7bdc-1ba7-2a45-ffa2894ad809@redhat.com>
Date: Mon, 8 Aug 2022 13:57:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Cc: Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Migration tests are very slow in the CI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


  Hi!

Seems like we're getting more timeouts in the CI pipelines since commit 
2649a72555e ("Allow test to run without uffd") enabled the migration tests 
in more scenarios.

For example:

  https://gitlab.com/qemu-project/qemu/-/jobs/2821578332#L49

You can see that the migration-test ran for more than 20 minutes for each 
target (x86 and aarch64)! I think that's way too much by default.

I had a check whether there is one subtest taking a lot of time, but it 
rather seems like each of the migration test is taking 40 to 50 seconds in 
the CI:

  https://gitlab.com/thuth/qemu/-/jobs/2825365836#L44

Given the fact that we're running more than 30 migration tests, this quickly 
sums up to 20 minutes and more.

Could we maybe focus on running only the most important migration tests in 
quick mode, and only run the full suite under an "if (g_test_slow())" statement?

  Thomas


