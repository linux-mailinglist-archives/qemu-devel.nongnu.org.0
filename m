Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04978499EF9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 00:11:47 +0100 (CET)
Received: from localhost ([::1]:49112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC8Uz-0003HX-RD
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 18:11:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC8Tu-0002Xj-WE; Mon, 24 Jan 2022 18:10:40 -0500
Received: from [2607:f8b0:4864:20::102a] (port=41694
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC8Tt-0004dI-6J; Mon, 24 Jan 2022 18:10:38 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so733530pjp.0; 
 Mon, 24 Jan 2022 15:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wMQJf5FdRndRXEN4ryqdeYa3Njod8iaEnv9Q53ZVf4c=;
 b=SyjgPd32XKeGTpXL/DNNJ/cguRNVRk2/ZN0GhUJ4JrL7b1/5dWMw5E9gZ9bdcwKTwh
 zFGoLicO3OhH/09pTualyBDpuk6ksLsjqIGpUnWX7iYrkouiOfFcrBQl83UGnLRzCzbu
 At7NJ/rgWVRI6CbZrN/lmo/83tCecxTEAcrd1RpITUSEyJYQSUDLLabh87ibyyPK+TcY
 qv6r3Jko12lYpdjrdJR0/y2KFHuNS3irjU9QX2F7PM5n5ppt8Y4VWRiJXAGz7UM2sbWy
 q8DghshpG5EFAb/VnY4i8jBtawKOPsP4R6XAIRuxksl9TqyKhhJrp6Yu0iPyMmKJDgoJ
 twLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wMQJf5FdRndRXEN4ryqdeYa3Njod8iaEnv9Q53ZVf4c=;
 b=ZtO1L9u0Qpt/XZ2cjJEhxapRVmRTXGegf1hoHM6NOdwF1fsmrhhzeZmDO8OIGt2VJw
 8h94B9du1si7Z2RZ8kKvejtEcgruAtXJ4oeekfcoWrLRKhBMfWaPj8D33ASQ9mRgqwtq
 dPHNEhPkd4/8HKW2Mo5UyIqADt9TbtikKPcdyUWIFLvqIq5/AEWqwH2NgNyIaYFNjAIN
 m+GTOTHdApJz7gNONuN9sCOBjkHey3M7zg30MT7ND1iSlk3oGdf3kgMn+TPObVIKkeOt
 4Slj0zkF9yZyjMrtQGgnGlfBs1gqRoB/ufN3I+5pSVrueGP8abwzGSnokdlnTpKghTk/
 sb2A==
X-Gm-Message-State: AOAM531IPkLxN2LY4t5lD3pUnfMqrKaPcw5yrdqe+o4qJABxVvHB3odu
 mSNYirQuGk7peLBqrA4TvTk=
X-Google-Smtp-Source: ABdhPJyDMv3ckOzlpmjZWbobzNAPCAanP6YRVdLS2k4B+FQ9D3Avht3ERq1/j2kBHoAbQLeDCv1KFw==
X-Received: by 2002:a17:90a:d144:: with SMTP id t4mr603823pjw.18.1643065833466; 
 Mon, 24 Jan 2022 15:10:33 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id j8sm18222383pfc.127.2022.01.24.15.10.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 15:10:33 -0800 (PST)
Message-ID: <fdd2748c-f36c-e1d9-4ba2-8e9f753e4b39@amsat.org>
Date: Tue, 25 Jan 2022 00:10:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH] target/ppc: Put do_rfi under a TCG-only block
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org
References: <20220124191547.1008391-1-farosas@linux.ibm.com>
In-Reply-To: <20220124191547.1008391-1-farosas@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 24/1/22 20:15, Fabiano Rosas wrote:
> The --disable-tcg build broke when do_rfi stopped being inlined.
> 
> Fixes: 62e79ef914 ("target/ppc: Remove static inline")
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>   target/ppc/excp_helper.c | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

