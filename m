Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F5C26AACE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 19:37:08 +0200 (CEST)
Received: from localhost ([::1]:45462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIEt9-0005g8-EZ
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 13:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kIEcs-00064i-VF
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 13:20:19 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:39033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kIEcq-0003g6-Mw
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 13:20:18 -0400
Received: by mail-pj1-x1042.google.com with SMTP id v14so125799pjd.4
 for <qemu-devel@nongnu.org>; Tue, 15 Sep 2020 10:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6t2e/QvCg9ighe78yLjg01mBs0eovML/S/LmYNjwTX4=;
 b=lZ3EU/l1eHzqXnsHvxQ7Iuz6rv8lpIXDcr0+5aRZQnn7udksOZsgYITY1acOAFSVD9
 bdKdWzI1jDldPoi7s3K3WwmHUjhxMbJeTA0Gpslteaze3LxgDQMkGG07MTjZMhsbjFC8
 k//znV++g7wrsu9UUjYni8lzU70t0zPRooiXynjXxmpqxJAvAZaaalDnRKXxTcQGk+F7
 7ZXWvLTXEKyv3l0a8fWfDM92MjDrBOTvseYsRiX2pS0n/4jA/JHkISD9KZ+mQ2XxZujb
 GyZNdfjVnsnhbWvtBdVGgnf0lpj5DsNEAWIfGxXQs4lMi40i986lYXkTsEgfG6BfkRKy
 99lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6t2e/QvCg9ighe78yLjg01mBs0eovML/S/LmYNjwTX4=;
 b=FTBOKAakjtNB0+2PWyU96t3phiddUI/msC2Bnus90ThpnoZnLu8bBzfbFAI7zJFbFf
 gKQfgHrEwJ0/iMrk8OqYg5YbU1g12ZlDk/yE+aLFTyilHr6kQZv/fq3IkbyvYc3EFhQb
 cIfYPNmSZAh77FG5VCxGj3ZIWqaNgcGY/JB1GfjrVSLLFY5sbSOb0spx5Jm/mnN5wxNF
 0j98zRRE+cRHwA5JXx8Y8dj/PmZXmOgLgA9FdcqW4CxC7LLgRFq1IDcart6h/kPnbkDl
 1AXEbpjwq7qyUVznezT9qxitGzAj3Fw+9hmV5ms2vHnSCuR5YOS2engnnxkfkYTKnnyJ
 Qvbg==
X-Gm-Message-State: AOAM533X702XwKiT3zVUuVdQ9BT09PCQMphNohj3+kpwLiicSNzGzQWV
 p1LWw74GSvuIAimuyAvCdkGsSA==
X-Google-Smtp-Source: ABdhPJyFs74LJvNIEdK76C46/ETVmN4MDzEFvXbS6ZftFGKqXinN4suWP3ASv/eXEE55TrH78P+1kg==
X-Received: by 2002:a17:90a:c705:: with SMTP id o5mr387330pjt.68.1600190414969; 
 Tue, 15 Sep 2020 10:20:14 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id w192sm14459799pfd.156.2020.09.15.10.20.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2020 10:20:14 -0700 (PDT)
Subject: Re: [PATCH v2 8/8] configure: add [lm32|unicore32]-softmmu to
 deprecation logic
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200915134317.11110-1-alex.bennee@linaro.org>
 <20200915134317.11110-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <912842b2-5282-2531-045b-b45d7c54c4d8@linaro.org>
Date: Tue, 15 Sep 2020 10:20:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200915134317.11110-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/15/20 6:43 AM, Alex Bennée wrote:
> While we are at it move the few places where they are into the
> deprecation build bucket.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  configure      | 2 +-
>  .gitlab-ci.yml | 9 +++++----
>  .shippable.yml | 2 +-
>  3 files changed, 7 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


