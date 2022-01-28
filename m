Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DF649F0AE
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 02:46:35 +0100 (CET)
Received: from localhost ([::1]:43664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDGLR-0004ih-Ph
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 20:46:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDGI7-0002Zi-BE
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 20:43:07 -0500
Received: from [2607:f8b0:4864:20::102c] (port=51010
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDGI3-0003Hg-LJ
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 20:43:06 -0500
Received: by mail-pj1-x102c.google.com with SMTP id o11so5093275pjf.0
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 17:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UBQg9YR5jTkdJ7S8Bcm4ntzYwqvC7Nk117MqSldtzb4=;
 b=QsHdHeqVwghZ3cJPBXVEYchcw5aEgRfo5ibLNTnm5shpYKTtr74iA4Royq1XYetKMP
 MsOfN9ViJgj1sxkfdLP3FFmvUvuoPuCIx4yni0eZ6lTn7jjYfQIAtpurwGXUd6fH9OeD
 o2MN00qNIu9fqOLBDHRufwSQX1x0ZfcjlnOypsKtYto+Wnb67JivpQ6yT6a1BL4D37hI
 N+47ohQJo21rPZZ6opD8ciS5/X36ZREtzLGoqSRO/pgkC/oRqPxsY8R6HG2dngWxE4To
 Z19H0fgRDqyrA6DN+TdDXWFR+uT8bQqrgu1xUmZ0pDDqQg8PFHJQtG0luPgUTFR785YV
 7DZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UBQg9YR5jTkdJ7S8Bcm4ntzYwqvC7Nk117MqSldtzb4=;
 b=l52xVcxIi+x6PaZjyETR8yhQi8YUqETfK0tdG5nAnBgmjW3tehBOPPaoygepyuj51+
 I3UCSz5bEM6vIePMh16LXdC/8UcnRcYg2unGRQ0TfNb/xOrSMbyDC6Z/jdYEFJnrf8Rt
 lpUzsWRcRmVNyzfQ18rblVjQUXIIfDmKLZ4Ok7+6TZIeO2donRISZ0LYsosQReqltPeS
 jGvex+XKBlZjBQya9C7rwIZnM7pMay5xTCe1XuMBOev3B7UFPW3IuBJvQ3eojf6nsLzq
 E2VZj2fXjqd1vFV+fvJiIWF8cZipf/gElBhxZlCnrtWRgmkv7V+ZejsXOgnsr0LDOgma
 Ajsw==
X-Gm-Message-State: AOAM532hhYsGvfABOkx+CQqBFwaGFsxABD+G3tpQ7/bYbJl00I9ccJrZ
 BsJLhGsOib/OV5OqnWzLEYuQMg==
X-Google-Smtp-Source: ABdhPJzznDjLOHgxnV+ij2/Rwia2RRl58i/J8BLmDa5ZQqnioKV3Rmr1aDpG5e0cQnjP93NHDI1HeQ==
X-Received: by 2002:a17:902:ecc5:: with SMTP id
 a5mr5841153plh.30.1643334170051; 
 Thu, 27 Jan 2022 17:42:50 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id oo9sm532584pjb.15.2022.01.27.17.42.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 17:42:49 -0800 (PST)
Message-ID: <a90b72ac-104e-3a74-da54-4717d17fd781@linaro.org>
Date: Fri, 28 Jan 2022 12:42:44 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 12/13] hw/intc/arm_gicv3_its: Check indexes before use, 
 not after
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
 <20220111171048.3545974-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220111171048.3545974-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/22 04:10, Peter Maydell wrote:
> In a few places in the ITS command handling functions, we were
> doing the range-check of an event ID or device ID only after using
> it as a table index; move the checks to before the uses.
> 
> This misordering wouldn't have very bad effects because the
> tables are in guest memory anyway.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 42 ++++++++++++++++++++++++-----------------
>   1 file changed, 25 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

