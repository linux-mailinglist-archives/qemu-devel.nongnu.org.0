Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A88EF46739C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 10:00:04 +0100 (CET)
Received: from localhost ([::1]:49540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt4QE-0003EF-Qc
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 04:00:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mt4Nn-0001h8-D3
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 03:57:31 -0500
Received: from [2a00:1450:4864:20::431] (port=45789
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mt4Nl-0006vX-S9
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 03:57:31 -0500
Received: by mail-wr1-x431.google.com with SMTP id o13so4166914wrs.12
 for <qemu-devel@nongnu.org>; Fri, 03 Dec 2021 00:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TMrda6tjCCXp0du5oqf+s2+EYqCfr+PFtVlCSOV/qYw=;
 b=MkFGVTM7S70vlhtDYiYKnsPFQhbRCCRTrmXY6SX+fV5ebSszGXw1wiB+GDUZ3HnwXD
 GjQUlkOLteph/9nOVJkqu4u7PcLNYd4m541rF/GVWkpMc6LD9l1b2a0o6zNlWV90vhoY
 7O7I0ZG3S3P4kWBOcazVkHZYo+uu5gau35DfanhSCskFPAMR15QGHCekzKlOl3QmlUYw
 ApzvAHXdBIAi9H9lDzHMRoTcl2oZ0p8uYYWx3UwUSxb+cAKQghiSaLtqE46QV1OhPYyx
 nbxqdxRWNKRj9CG+7R7W37jy3yNm9B12EjxK4+TASqRjPRasyUeL3J90uCUx2M0/aHZ8
 phXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TMrda6tjCCXp0du5oqf+s2+EYqCfr+PFtVlCSOV/qYw=;
 b=y13AHFRUpuNqGXwMhbS4IFlaf3GJfub5/fe8Irh3y2vVCYGZz4iWv5tlmhMvmgnLHc
 DV4zc/ECJgWFVBUKm2sscynp0eRMrzMs/fmcgzxyU/HtO3Wia/+X1etKPdJEUw8f/uJB
 efIIZitmT5l6ZBD/pTPCP6kzfLjIruivsYEoc5xhmXk2vLpsEA7TCThrC6jz7f3SH7go
 DCoxnTn1O+LTaArBDkVeIYdjunKtS25VnrBLhMw+DxQPUOc1Q0FUHmzbiQM8CyJ8A3iU
 Xhv8WpQ4F/OZI798X1OH1005MGGrBOOB3GgVdeBm8LVTd0wA16yTSUABc9uudfvFjt6R
 JT+w==
X-Gm-Message-State: AOAM531+xwUo6iaxDI775WF3F9szhpYGVwFppxm3hBsf1MbdLQYFfPgy
 5Xs3ADQQSlGKmerTThKSpUk=
X-Google-Smtp-Source: ABdhPJzy2+aEZEQDIR38h5gxhbmaKjxhx7Q0e2CINQMnCuBBJMve5upoS5aNYDDyQvwtprQ3l9wXIg==
X-Received: by 2002:adf:c605:: with SMTP id n5mr20672241wrg.564.1638521847903; 
 Fri, 03 Dec 2021 00:57:27 -0800 (PST)
Received: from [192.168.1.34] (abayonne-654-1-79-213.w86-222.abo.wanadoo.fr.
 [86.222.222.213])
 by smtp.gmail.com with ESMTPSA id p2sm4538080wmq.23.2021.12.03.00.57.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 00:57:27 -0800 (PST)
Message-ID: <376b89da-f619-9e36-5364-15eac19ecf03@amsat.org>
Date: Fri, 3 Dec 2021 09:57:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 14/15] linux-user/strace: Fix print_syscall_err
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211202204900.50973-1-richard.henderson@linaro.org>
 <20211202204900.50973-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211202204900.50973-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.938,
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/21 21:48, Richard Henderson wrote:
> Errors are not all negative numbers, but only the top 4k.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/strace.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

