Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB18239C226
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 23:15:42 +0200 (CEST)
Received: from localhost ([::1]:52156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpHAL-0000WM-Q6
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 17:15:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpH9D-0008Hx-ED
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 17:14:31 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:42687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpH9B-0004Jy-T3
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 17:14:31 -0400
Received: by mail-pl1-x629.google.com with SMTP id v13so5295825ple.9
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 14:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BdrAizjIxYH4XH3uw3xvhU4unB1yfjyW0vhYhp+aWTI=;
 b=RbLfvlGbi7Kln0OuihYjUHU/0gH4UIallB5Y/oPKc7NeAthGi9IlOQzCS7lHPDMVlU
 UpyZnLhEynaHcFPjNZ6lNK+jEKnrdQ4k2ANN52LZEx4VpG3a/L0/ISr2AxdyEpk0/WzC
 bM/RfYz79FEBJKKvn3T9mkX8vECRfeKvjngfvx9fjfOdH2seTm0fUXismG+a6mc0j/mE
 O9PO1lDxYlATWoMz0XDwq1Qff/q3kxh3nLJVCm/euNBidyVWodlLW+1U/w7KF5QXovCK
 TPlyhjT5z73EQrWWBeRhkOphOu96ouYn2iPW6LMB4s7ZMIa++jYLXwnERhQtO7bAtNGZ
 jdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BdrAizjIxYH4XH3uw3xvhU4unB1yfjyW0vhYhp+aWTI=;
 b=UKboxbQrJn55ggseKX24xHRrPiPhAYDESqzhc/Ls58V9GXdF/9EJJKabWEdnSf3Zv6
 hzLvT9VPkYkKqiWm4cba65hiCjglOZHDgHaYr1r8/k2qcRNCPCWvmQNpstoNYYViVWPv
 DVUFufM+XH43R+qOok5JePVpgXP+QkpNhGmJubwNbHoIdyufOiUF1nTgwdYstM0HD6Co
 8UGC2QtXhx1/fl8GST8eRLbdz0CyBU/QlvU2NVsIL1hUg9M7G876AqwoXpKOR/710Cyw
 disLpUGiVj7v2OIh9y0yimQaRoi38LDlmlm1kBAMhWGt7x/plmUvAulwpftE4Kf+i+su
 wtsw==
X-Gm-Message-State: AOAM533gR8jw5Rhxi3rgxTEAThS0g8zoEP2Ty5+gfCcAzH7KkaTNz2jF
 rLv6VszYTUoccP4GQgrqcCDIihPkdJO0OQ==
X-Google-Smtp-Source: ABdhPJxi59zxKd4iQPmKDZtwEdhuOwxFx2PfQ8ZuCTS+ZXwwyUjVnJfPWGgfZSnl+hD0ZOXUg91F6A==
X-Received: by 2002:a17:902:ce84:b029:10f:a857:1e73 with SMTP id
 f4-20020a170902ce84b029010fa8571e73mr3570614plg.72.1622841268077; 
 Fri, 04 Jun 2021 14:14:28 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 v11sm2478990pfm.143.2021.06.04.14.14.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 14:14:27 -0700 (PDT)
Subject: Re: [PATCH v16 11/99] qtest/bios-tables-test: Make test
 build-independent from accelerator
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-12-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5925bd98-60b7-d4e2-5ce4-75bb9034d69c@linaro.org>
Date: Fri, 4 Jun 2021 14:14:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:51 AM, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé<philmd@redhat.com>
> 
> Now that we can probe if the TCG accelerator is available
> at runtime with a QMP command, do it once at the beginning
> and only register the tests we can run.
> We can then replace the #ifdef'ry by an assertion.
> 
> Reviewed-by: Eric Blake<eblake@redhat.com>
> Reviewed-by: Igor Mammedov<imammedo@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20210505125806.1263441-12-philmd@redhat.com>
> ---
>   tests/qtest/bios-tables-test.c | 14 ++++++--------
>   1 file changed, 6 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

