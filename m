Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD216AB74B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 08:54:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ5fA-0007zF-G7; Mon, 06 Mar 2023 02:53:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZ5eu-0007y0-OC
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 02:53:28 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZ5ep-0004Dl-1Y
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 02:53:23 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so4613588wmq.1
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 23:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678089197;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xAoPkZ5AC7rJeCDudPy+dFBhPiwHX4n0XKpqnzxjqHs=;
 b=lmXxN7kGxFzKqfBUpYl3N5QNVMEGZhYBOEz+ZFCIPiiLkn7BS+aQMyeqn6imn6pgCO
 a3M81QoEP33H38A4f/AlLwULcDNgOE/8+A2uKdgsweTTmtxSWLXbDSz7/HbPWQ1M9Gje
 JILNHFhje3dNd/5No2fS9pJGXlTAscdpZsP4A9N0aL/3B3SAY5UPKOTsnfI5PqI/1PS3
 gDS5d9jIQQLcbFcUbpb2UEFNXAN8i9r09SNpjNWk+hXR1hcZ3ijVzgd3L0YvF0bTVDFZ
 kDi+nvvDACVhLbg6QQEmt1X8gTMcGwjSAVhnivQiQ5izQMREdTVwlkIb7E60+KcA/qQP
 9rWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678089197;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xAoPkZ5AC7rJeCDudPy+dFBhPiwHX4n0XKpqnzxjqHs=;
 b=bOKOcflnO2LFCUtssG9i839TAv++HNbRqvw4LoURYBta1AncSS3YBshQ9H082DtKZE
 OyTJosKuLlK28DJ0Jdbbu61/gDBHukFVsNJx+UO8HRKs+hVR52Hn3yhTEkQ9xiPLbii9
 nq24Hz1sMuQuI4TPfZby4BEeXtAbIU3gMT/turyC6sVHxInT1L5hYCevqaEMUkSJJIQT
 rm0P+fUpnyQ4G+fKNRs6ug76fzP6kAQCc+Boh55e6kty/0mZy8qVIRN7A172uCUnus2B
 GBgAGIVXYhRkCCt37/NyAZjNd3Q0iRFM06BJOHg7+XFURCsxdd5rqLrzio70XSgVdKf8
 yuEQ==
X-Gm-Message-State: AO0yUKVpnUWh9e6p8/x4ukObSorqfrdh5Xaa2KiHWJKaUy1Do8yNGuD5
 zEbX4R0+O9EYcXKVEEPLlA8kg1p+HSJiFegDgwc=
X-Google-Smtp-Source: AK7set+87MBTpMBQ1vKcGFIY6zkc8MxlvPIxHR/yH+FN7vfKqy1+RukkKlxWeVmpRjEm+J4+9XAC9g==
X-Received: by 2002:a05:600c:4746:b0:3eb:36fa:b791 with SMTP id
 w6-20020a05600c474600b003eb36fab791mr8156361wmo.31.1678089197239; 
 Sun, 05 Mar 2023 23:53:17 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f7-20020a05600c44c700b003e2232d0960sm9316265wmo.23.2023.03.05.23.53.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Mar 2023 23:53:16 -0800 (PST)
Message-ID: <597b8f7f-185b-802b-7c79-4cda2d6d89b7@linaro.org>
Date: Mon, 6 Mar 2023 08:53:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 7/9] accel/tcg: Pass last not end to page_collection_lock
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230306021307.1879483-1-richard.henderson@linaro.org>
 <20230306021307.1879483-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230306021307.1879483-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 6/3/23 03:13, Richard Henderson wrote:
> Pass the address of the last byte to be changed, rather than
> the first address past the last byte.  This avoids overflow
> when the last page of the address space is involved.
> 
> Fixes a bug in the loop comparision where "<= end" would lock
> one more page than required.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/tb-maint.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


