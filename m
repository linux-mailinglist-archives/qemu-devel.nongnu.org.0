Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A014466A5C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 20:20:48 +0100 (CET)
Received: from localhost ([::1]:49442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msrdN-0003xf-78
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 14:20:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1msrYS-0007Ah-He
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 14:15:40 -0500
Received: from [2607:f8b0:4864:20::102f] (port=46079
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1msrYQ-0000xz-Dk
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 14:15:40 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 gb13-20020a17090b060d00b001a674e2c4a8so535384pjb.4
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 11:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hEg8srj3PBz/MkFJT2i5Q0p6GO6XtQ3+gsSlAhzxXzo=;
 b=h1tanaESgug21w4Xg1kO/ifpJY2BjNmAf9/TFJRs61XkY7+s83UggMrukVX60j3OB3
 w+/tbhUwdO0KXpHbXDs5T754rEyg1s0AdWfmRvUISOnQy2ueSUk/27VSiaoLZbD1gips
 wVKmCsZb85GEaLeeNznnNQPf0iJulL+HX4Ab4XYdcIwpPtynOAMyArk8IMzoixUDgche
 WaJQlTn+IEck+Yh93qeHE9s+jlJ0EFShZAwsroB1rKgUXurN7qVeRoicTS7EWd+eQybG
 NEanVWx2Pq/ldIGXVhAjXhsglfSY7Qp0qLl4AnzUDruGBeSBfDa8cQhm/zSVsLxmXcVB
 0Xzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hEg8srj3PBz/MkFJT2i5Q0p6GO6XtQ3+gsSlAhzxXzo=;
 b=3bTq/gCY51FgYXQIFcaO5zpSsTHs4URHK3OP+a+rufUd59Yyt0MxxI+zOLfQM2XT3g
 GIMnzRDtDQhvjBluvUAG+LDPTqeSfqmOUlNpHnh1xr0EnnYojbkhPLftbvXvVtnwdZMv
 KBoHgtnheuyuG/9M7ATIVnxN9RZe3gySDNa99wG0jKv4g0Q9uL/p748+qC7rscF+aLEJ
 aGhyRG4BvZQ332KvWYD0vOAZn0GXMRIZcSz7ELKG16IqTxvnv0kiq0f+sVhT1HGfZmcr
 GreL6qRXki5xnyGT9X6at2xOH/HKeojqHT9dUof3Ba5BgZLRdkfs7ACzWFBqoLmF8cmu
 okFA==
X-Gm-Message-State: AOAM532OYBmAG3vkoUbBAxSphRV3feutpPGAJyfHB352+UQNFHDp7w2P
 A0CMtoDE7WHixFVNDNl31mDuWw==
X-Google-Smtp-Source: ABdhPJySf/a6xO0ZlxA4L/x9XCOSa4ucyvbo9SqY9wncil2/6wPT5jOH9b2dzaMLq+VpyC7/JR4RAg==
X-Received: by 2002:a17:902:9b95:b0:143:b899:5b12 with SMTP id
 y21-20020a1709029b9500b00143b8995b12mr17050421plp.13.1638472537043; 
 Thu, 02 Dec 2021 11:15:37 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id w20sm551901pfu.146.2021.12.02.11.15.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 11:15:36 -0800 (PST)
Subject: Re: [PULL for-6.2 0/3] Ide patches
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20211202061756.35224-1-jsnow@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1b37167e-8b43-df4a-7ab7-d8179caf4903@linaro.org>
Date: Thu, 2 Dec 2021 11:15:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211202061756.35224-1-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.3,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/1/21 10:17 PM, John Snow wrote:
> The following changes since commit 682aa69b1f4dd5f2905a94066fa4c853adc33251:
> 
>    Update version for v6.2.0-rc3 release (2021-12-01 07:20:06 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/jsnow/qemu.git tags/ide-pull-request
> 
> for you to fetch changes up to cc20926e9b8077bff6813efc8dcdeae90d1a3b10:
> 
>    tests/qtest/fdc-test: Add a regression test for CVE-2021-20196 (2021-12-02 01:09:38 -0500)
> 
> ----------------------------------------------------------------
> Pull request
> 
> ----------------------------------------------------------------
> 
> Philippe Mathieu-Daudé (3):
>    hw/block/fdc: Extract blk_create_empty_drive()
>    hw/block/fdc: Kludge missing floppy drive to fix CVE-2021-20196
>    tests/qtest/fdc-test: Add a regression test for CVE-2021-20196
> 
>   hw/block/fdc.c         | 23 ++++++++++++++++++++---
>   tests/qtest/fdc-test.c | 38 ++++++++++++++++++++++++++++++++++++++
>   2 files changed, 58 insertions(+), 3 deletions(-)

Applied, thanks.

r~


