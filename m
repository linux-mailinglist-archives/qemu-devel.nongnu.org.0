Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0C84796D4
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 23:06:14 +0100 (CET)
Received: from localhost ([::1]:36206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myLMj-0003XG-0d
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 17:06:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myLKL-0001Tc-09
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 17:03:45 -0500
Received: from [2607:f8b0:4864:20::102b] (port=54172
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myLKJ-0007U9-Eq
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 17:03:44 -0500
Received: by mail-pj1-x102b.google.com with SMTP id mj19so3424534pjb.3
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 14:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=goIgqIf4YjRmrGh4ACY+QIYHkuDhPtgY9i2SkO4blUA=;
 b=JB3Kh2pnIMlCIfftHdnL7SxZ1dVE+tz6U4YJ2W6rScS2wy3It+pihtCN7WK+2LxKFf
 u0qnyYgo5o259avAQx4Xfqp7+NLoPejsbjWPWcGaRCXCVBb/jhUSQTMUCT7CNvgSGZNx
 ATXNs60eN2cBOdghMgy26nlC4kyDf02FfKwPNxuenY/vM0zgWb0GwYclry/KCvdBIBnd
 joDrXfXUueW5QWgdE4WiyIFfC1G/XLzTi2uzPHEfwbnevmIQeDpJ9rMNa3FXf3FYMgPS
 wYzGMIDK2sYNFG7p0ivVFosGjciVETiSmoj9QuzSliK6di3gxgvSiCf5tdf0DhJO6nOK
 8Eug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=goIgqIf4YjRmrGh4ACY+QIYHkuDhPtgY9i2SkO4blUA=;
 b=odi9RPoN6UoMoukR+JLsOQOUUG/bf6T6qjcsM2fE9KhKr+LxYidXl52Lg21rXJkZ+J
 rRusX6AiHwvZa6jI3VDBekk+MMOlPQwV6lMSG50hqjxqEbljFJ7NMW1BlHvlfNXHYsvo
 QADp6HFj6kkRsmsxELz+Ju/e7XqxQ8uF42ykP5H3JXoPa+SktkH/K6jMpEh6/f7lH6VE
 8zII72C4gU88y4iioBCFy45mJc6ENcoOKvIq573B6Wh7mNxZ7d7dubEhnanxjgcgug9b
 3rb29bBiDWVTJxEDd/F+iwLqtyQPHGVWa0v6LQMMMu5/Sx/s0cdEKs0hbJJ2gObS04p9
 fouA==
X-Gm-Message-State: AOAM533iMsdzwnyYxiCfwUbKKMtlx5cGuQxEkj4X5R2dV8FRnFa7DmD3
 Y2Np45Jq7Q2U+l3Dg02Q+SOjYga9Sc0+XQ==
X-Google-Smtp-Source: ABdhPJyw3iYLi8k2X6hB+PfIzWz0ybRd4rBs+96r0u1zTqOzzQabIsLTtMxRucnG2MiyrkOP3kGIWw==
X-Received: by 2002:a17:903:2311:b0:148:a950:73fb with SMTP id
 d17-20020a170903231100b00148a95073fbmr4979902plh.151.1639778622075; 
 Fri, 17 Dec 2021 14:03:42 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id f124sm9418324pgc.32.2021.12.17.14.03.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 14:03:41 -0800 (PST)
Subject: Re: [PATCH 10/10] configure: remove unnecessary symlinks
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211216085139.99682-1-pbonzini@redhat.com>
 <20211216085139.99682-11-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <53765058-21ba-2ffa-d9e2-a551fec7f12b@linaro.org>
Date: Fri, 17 Dec 2021 14:03:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211216085139.99682-11-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/16/21 12:51 AM, Paolo Bonzini wrote:
> Make pc-bios/meson.build use the files in the source tree as inputs
> to bzip2.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   configure           | 1 -
>   pc-bios/meson.build | 2 +-
>   2 files changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

