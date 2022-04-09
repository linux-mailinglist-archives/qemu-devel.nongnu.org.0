Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9090E4FA964
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 17:58:34 +0200 (CEST)
Received: from localhost ([::1]:43474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndDTt-0003y1-B8
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 11:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndDSh-0003H3-05
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 11:57:19 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:36566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndDSf-00065T-Kd
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 11:57:18 -0400
Received: by mail-pf1-x434.google.com with SMTP id z16so10959141pfh.3
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 08:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=5THXOr/3BZ0cUlGD5hkBdZvt2W3kZPV4SjwLr+LaHJM=;
 b=h4LKGIzRTrBw9RW9a3be7o7dOFEFDaaFQ7CP4sWEd7gv8xhCY3D8Jo5VpE3IyGduOB
 /Naf2yc1J6jyLN4TMyrKwHKpGm1CehfoOD/pRuYxN5ouvJe7KQyB6iGZNMlZVM7gTeWa
 dImnqnvCl5+ybbjZkOEcd8SWg222QF52412bsDWizQh1KEPB8RhpIfBST2xuC4Sr3NeH
 UpKKdSlEOhQLTvvRWPMN6TSCKjqGM1sCDfeDi2/FOqt3vFJ6sT2LOyG2BMZq/aVjOH2q
 gWrmzcphcTdex1qS5yHdfeSfxfxOVj79TyCbLGOq1PXqdfiP7mYV1Pqlx+ueKQKxUyik
 T7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5THXOr/3BZ0cUlGD5hkBdZvt2W3kZPV4SjwLr+LaHJM=;
 b=Ny8+JbhG2UJ8ndOAIBGRVbdFnxjw8WYRsbLUE1SIiHaxBKAqK57Jh2SMY99PtkI3mp
 LTdZqGl8YzG3dWeByu23JCZ5nnv7GT64Jujx4z3HH55SRcdP/yNtNoNDvZHhX0ipGi2I
 m5Vl5qi3H+HGWqbY5gIxQwx7AuxhXm+QNa5hcNxvSOZZRQVEk9u1vnNWpcAVGEvE1K7J
 juJ0kF5urjJpvInS3pJkpb7A6fuBBIWJnXowggEQd3BOYbz5khbgrJUj4jx2gtyPFVz1
 GPaFl+9zWJkZHHIA0eozYExQm5MhsPosJowUTQq4kr4EhWaXltyITl0ueqZ7krvDC8JV
 Lidg==
X-Gm-Message-State: AOAM5321MJOfOUrBZI5jd4/RqcvtFskSNY3B4F0kjdz3ocp+8TYFtXC0
 HffXnhLwJbNUpYUoHC+YYV/f3g==
X-Google-Smtp-Source: ABdhPJz1ga9VPzSUvK7RUK+FhytH7S1dJ4xHrFhLdW47NtamliFRlUzHWZz0aD6rdVmhloqdtkZRSw==
X-Received: by 2002:a65:4681:0:b0:382:b4f5:84c2 with SMTP id
 h1-20020a654681000000b00382b4f584c2mr19850662pgr.218.1649519836068; 
 Sat, 09 Apr 2022 08:57:16 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 x124-20020a627c82000000b00505aece5638sm73859pfc.130.2022.04.09.08.57.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 08:57:15 -0700 (PDT)
Message-ID: <4ab5df0d-6730-cbfc-bddb-a9c8fb347921@linaro.org>
Date: Sat, 9 Apr 2022 08:57:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 05/15] accel/tcg: add tb_invalidate_phy_pages_fast
 tracepoint
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220408164742.2844631-1-alex.bennee@linaro.org>
 <20220408164742.2844631-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408164742.2844631-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 4/8/22 09:47, Alex Bennée wrote:
> These events can be very expensive for the translator so lets add a
> tracepoint to help with debugging what might be causing them. Clean up
> the comments while we are at it.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   accel/tcg/translate-all.c | 15 +++++++++++----
>   accel/tcg/trace-events    |  1 +
>   2 files changed, 12 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

