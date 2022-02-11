Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 600C54B1AB1
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 01:50:54 +0100 (CET)
Received: from localhost ([::1]:42494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIK9F-0005fw-FZ
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 19:50:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIK2e-0003uu-80
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 19:44:05 -0500
Received: from [2607:f8b0:4864:20::1036] (port=44793
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIK2c-0005Nr-My
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 19:44:03 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 d9-20020a17090a498900b001b8bb1d00e7so7260626pjh.3
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 16:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PtWbowIvLrtWEZDOilEdP2EruzkQsQomfIvTuKaNvGc=;
 b=KsV9p9yLPjWzoNCc8mDOoEtzunwlbwpon2VLzryVOpWLH+OxJgCN3CM7ls3KFNLXx5
 4FSDZ0YyEoFsBlqMB7iGGw5VS+mkRj274kVRSIIW4N4mTEL0DigOLhwefw7D54TYl+pq
 YGMc6Ox9Iy8UK0i8kJMLe5xHGGSFEdJyXmA+gGvHf4gmPhn61UWnZxMiv5bwUsh1bqd7
 EIeva12iGbPcdPs/lW71xJbu2H5djA6DnViKGc8yxbBmaph57mOtvts3ytx6ro36M3nd
 dfXe97ZJo++HJ/W4kmkawCQfwNENmDf6ZRbDpQ+bvIIliv30o2u3EygYzz7PhZx8uV/B
 +2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PtWbowIvLrtWEZDOilEdP2EruzkQsQomfIvTuKaNvGc=;
 b=wDUghzDHyBnnzS0W6WB1b3idXX6qHs3N+Np08y8cdF7OZXHl4ouvZBKPcHta6epJAU
 hI+wfSJIA7DKHkVG818z9FoY8i1R6vjuKWgLKNBQEoA80ENgzoPX7iWbXPExreoUz7sb
 qaYOHJf10xyZcA8Po5eUBJzg9SE63L9G2ZfYPhDYq+/JS7AP1U96Dzhk2kFzA4Zuoolz
 Z0t6ge4PIsAg52F6/O1iK/joZrjZzxPlKTe+0IFwA4jZn2l0e+veWJ0OO876Ouwz6rSM
 dbv+vnLnqDknXQdRWqlKewo2kI2KtwTlVZX9ZkHTw4MszCeWT+E1ncnczl3RVcAogIYd
 sIlg==
X-Gm-Message-State: AOAM533yHZ2tTon7oRGk7E8TSUpnBooWVNef0n/NiOZXge6YNmn2w7Nk
 PS4Cfg8d2dj2MBrML6H8qcr/3g==
X-Google-Smtp-Source: ABdhPJyXJpEjAYnYZ8qX5Z5pUXqBm74jiiRNqJpmubEPzmdYecXTS+KotahFxCmSDi+Gy45qWSufxg==
X-Received: by 2002:a17:90b:4d91:: with SMTP id
 oj17mr62796pjb.10.1644540241152; 
 Thu, 10 Feb 2022 16:44:01 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id u7sm2699165pgc.93.2022.02.10.16.43.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 16:44:00 -0800 (PST)
Message-ID: <dd1d5c09-08cf-e50f-1751-22efe4b7d711@linaro.org>
Date: Fri, 11 Feb 2022 11:43:30 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 02/12] Hexagon HVX (target/hexagon) fix bug in HVX
 saturate instructions
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <20220210021556.9217-1-tsimpson@quicinc.com>
 <20220210021556.9217-3-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220210021556.9217-3-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: ale@rev.ng, bcain@quicinc.com, mlambert@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 13:15, Taylor Simpson wrote:
> Two tests added to tests/tcg/hexagon/hvx_misc.c
>      v21.uw = vadd(v11.uw, v10.uw):sat
>      v25:24.uw = vsub(v17:16.uw, v27:26.uw):sat
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/macros.h      |  4 +-
>   tests/tcg/hexagon/hvx_misc.c | 71 +++++++++++++++++++++++++++++++++++-
>   2 files changed, 72 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

