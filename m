Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 079814E5AB0
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 22:31:42 +0100 (CET)
Received: from localhost ([::1]:51368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX8Zw-00048x-Kk
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 17:31:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX8YB-0003MM-QV
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 17:29:51 -0400
Received: from [2607:f8b0:4864:20::102a] (port=55931
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX8YA-0007tZ-9I
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 17:29:51 -0400
Received: by mail-pj1-x102a.google.com with SMTP id jx9so2965581pjb.5
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 14:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=azfuHNFw4UInvxMz1NBOocn6k8umZzJwXSp8hKaOLmw=;
 b=jauoVzG8ZRHqgA9ywkQYwNDDfJ9XGf1uHCPWdT7DF5QOebZS+u/U20Aaf7zyTHhG/e
 ROTY5uiXcK8CveFlg4QvfrZjO+qnS5gfR6TTgFj9RAujYXr9q3lcIeBHX0ZBs8VmqHka
 X2QlGWL+tudscbMKTER1aNloHYNVtH6YSWGTUmG3BBvzCGW6yjlLDjG9rzko/GWTbIZp
 8HUQQb1WW3Rg5ShQCZJpa5OxoynY6rCfRZ/KEC5urub2LtrhOkLtoq6+BZBbovhXfIwQ
 b6fmcBefGXPWRcDC0keZjv71KQO2zdoqEpuYtIEyAr2b8B/9GLNt03MIs0fGzhmcJ3+u
 oOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=azfuHNFw4UInvxMz1NBOocn6k8umZzJwXSp8hKaOLmw=;
 b=2jiuj81zRChtbd4pTM8DfgxNMD7s9sm1+zGNiy2wl/G3ESflo3mK36uoRlUoBw2Wcj
 QFlxYoXFTSZehwFKqAxd/Jm61xwnWL2y3jFzGlVXF/qlwGa9xFHGU9Lat5h2Js+WXhDg
 R8EDNmhpSF81ZnooTk51kgrWk6tOAoLQbiqr38j49KzxEKSuntFcrEFdo5C2cjXHG2mh
 AlWd1GsTp8zaJob0hZjkNvLwfHYajouJzymGji1zXePhHYf6lkOWreyR2kwlVBSlUXDH
 dt7PipaZvfzAXfohUtPXyAolmVOsvfwkOs14xBfq3hAG2GvGCmEnEzEXludk+QpUPq5T
 mn8Q==
X-Gm-Message-State: AOAM530YmnPPskTQpoFydm1R+wIIh8tkAnXDONcNHqT0/xw/5Dj3HEBs
 cu1SntOrtmfZY5stDTKK5yuPYg==
X-Google-Smtp-Source: ABdhPJwTNK1fn+mG24nh89Q1OG1F5j+Fl1YYC2zrJHI7ngPg5z+6T/piyt6yqLB814XwDHEKfGOuzw==
X-Received: by 2002:a17:90b:38d2:b0:1c6:fa94:96bb with SMTP id
 nn18-20020a17090b38d200b001c6fa9496bbmr2015607pjb.206.1648070988835; 
 Wed, 23 Mar 2022 14:29:48 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a056a00174400b004fabbccb1a5sm782311pfc.94.2022.03.23.14.29.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 14:29:48 -0700 (PDT)
Message-ID: <10f0e8c8-6b4c-fdf0-3ba2-30a709bd3949@linaro.org>
Date: Wed, 23 Mar 2022 14:29:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 05/13] accel/tcg: Init TCG cflags in vCPU thread handler
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
 <20220323171751.78612-6-philippe.mathieu.daude@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220323171751.78612-6-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 3/23/22 10:17, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé<f4bug@amsat.org>
> 
> Move TCG cflags initialization to thread handler.
> Remove the duplicated assert checks.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   accel/tcg/tcg-accel-ops-mttcg.c | 5 ++---
>   accel/tcg/tcg-accel-ops-rr.c    | 7 +++----
>   2 files changed, 5 insertions(+), 7 deletions(-)

Why move into the thread handler?  Seems fine where it is.
I agree with the removal of duplicate asserts, but I'd have
removed them the other way around...


r~

