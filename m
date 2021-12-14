Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9A147433A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 14:14:50 +0100 (CET)
Received: from localhost ([::1]:58674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx7dp-0007UC-5i
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 08:14:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx7Zd-0004yr-Do
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:10:30 -0500
Received: from [2a00:1450:4864:20::429] (port=44956
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx7Zb-0000jb-L0
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:10:29 -0500
Received: by mail-wr1-x429.google.com with SMTP id t18so32246188wrg.11
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 05:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2B4zU/Fxh5sLB9ZkEa5HJh9piIqlGkITswfxEpc+/FY=;
 b=B0MQWH3mDnPXO+X+HfCvsMegX8qHrni749V8GIsP+1KvNSfBO+DknJjEQsAfCgd4lB
 KSrKReRP3NVe2V58GW3MqIEDDycngP62iWKn45jEKQ+RFWk9dMqFuflEOs2Nl/w5E+mO
 Hd8KUjtnVv9XfXJKe3hqTHlcHT5NlWxAsbCV3gDmIgk8edCichoKoK0BjbYqFh6B2qd4
 X+xrUqB7zQUN/YF36LHRAYj6sI+r9jRBMrtGL36kcfvMkKTYzN5QbL5VnGmz8q4ewxZP
 oiewh4BWG2fT+csP1tl7cQwysy1VbpTiMR04zkkmYG12oJahWQjeShWd71x6/VXzf7VV
 Yjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2B4zU/Fxh5sLB9ZkEa5HJh9piIqlGkITswfxEpc+/FY=;
 b=59nQ/vOjaaORkXiu4rJdCAV7A+/gZff3CVDCqY5kJsAL8L2YWCtQQ1GTCkzykdYVQZ
 YNBw3yrse1OtSs25yGtk5a+28F+aid5DTnN6dVO8HRFRLSAE6fXUh/43VKS/mN9l8oXV
 YEsSNB0QtEjcXS3T+mMl7I/VAowGCw1d61EGD0VLUbWPsqYBfCafzvPeRn7Xx31XZH1t
 HR4u7ZtyX9nisY++tux5pYkq1hFz4gsqKrv98cqx26HreyDoOX8e7ni1u/ja3CJimAsy
 8aXl6SLw1dXmWKpLvu03BXr2qPuJYvl9yNs2+7c2wNS+7fQp3qLA7hkR/zbMLq+gN2Zs
 Wo6Q==
X-Gm-Message-State: AOAM532dR6M3bknWpCNgFJshTlSCJIunRic90BIrWwqS1DP4HQIKxOYM
 lkRJKkWHHvtYc/Yi2Y0z+0BE2hgN7tY=
X-Google-Smtp-Source: ABdhPJx9frfle7G6qxrsUAkVHhACLT6IgSN9nzcO/8WX+2Iq+T9/I2JqqzKGo1CBURGXBl2yFhV77A==
X-Received: by 2002:adf:e3d1:: with SMTP id k17mr5702249wrm.610.1639487426387; 
 Tue, 14 Dec 2021 05:10:26 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id bg12sm2627839wmb.5.2021.12.14.05.10.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 05:10:25 -0800 (PST)
Message-ID: <4ee5535b-1a18-5645-f7ae-d26514d53b90@amsat.org>
Date: Tue, 14 Dec 2021 14:10:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v7 09/15] linux-user: Create special-errno.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211214002604.161983-1-richard.henderson@linaro.org>
 <20211214002604.161983-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211214002604.161983-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.962,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: git@xen0n.name, laurent@vivier.eu, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/21 01:25, Richard Henderson wrote:
> Pull the two internal errno used by qemu internally into their own
> header file.  This includes the one define required by safe-syscall.S.
> 
> Reviewed-by: Warner Losh <imp@bsdimp.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/cpu_loop-common.h           |  1 +
>  linux-user/generic/target_errno_defs.h | 17 --------------
>  linux-user/signal-common.h             |  2 ++
>  linux-user/special-errno.h             | 32 ++++++++++++++++++++++++++
>  linux-user/syscall.c                   |  1 +
>  linux-user/safe-syscall.S              |  2 +-
>  6 files changed, 37 insertions(+), 18 deletions(-)
>  create mode 100644 linux-user/special-errno.h

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

