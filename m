Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C19368AF64
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 11:52:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOcbs-0005dO-Oi; Sun, 05 Feb 2023 05:51:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOcbr-0005cu-Hf
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 05:50:59 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOcbp-00045A-Ui
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 05:50:59 -0500
Received: by mail-ed1-x52a.google.com with SMTP id m8so9005311edd.10
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 02:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rjY4JynZeCWy7+MtZXKDRJJ8UUUCgJVOfkxfeUfVZBE=;
 b=XAVWHPlREjQkS7dD0nSRcJ7iRXwavqccDp/Jp0GRygrIsTr3r7byUrL/h243CKyLhT
 UGkpBASdPeJApaSuHxST1RDGHSlbtPc1iEp4xUwFH3/iCjsJ/RRR/9Xmo6AdWMRq0ZMz
 ubf11Z1n8KLGgsFp/axUP8cdmkZ5kJKQxRyYQ7B09rQOf6n8JXmjTznjluBQzfLTvONZ
 FulWTzOdox1KDMWgM/jHd378Q30rG2YQ7ostjWPsghKaXO5R03COCSU8hqTy5egB0Kcs
 PoS/fLb9J4QjQziohj17uLHDiPraxayIpsrYJ6N+WMCMK+bKCmP1tO/uHT/9phOMMqdN
 RiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rjY4JynZeCWy7+MtZXKDRJJ8UUUCgJVOfkxfeUfVZBE=;
 b=eM4TlA1yvyy0R5clPhHCHMknILjfiy99/1g9QJdVokh8GSghSd1h6zEdYrm3CUFa2D
 371K7jes0Z16eEMmyatHDYWGdXeDtsyMMlWGs0zvIWuUXlEVh2Ljm43paxmWR8BHPRbM
 urWdi+dr4QKn5TfXZrYYePGJmSuMFNCw5pKx317pP46zAuXQkstBq7OJswmfrXsM3B95
 EYl8M1jznZr72L7xKQ75M9gbx9U9MVvOA9nYHl/g4/22KaLdnmWROIePsoHp9eYPt5GQ
 t3fzd7o/a3453J7sHR4Qhiu+h/as0j/v+uw/V0Wpi0A7vNtAj0FsNAR0BHio6X4r2Aqb
 S49w==
X-Gm-Message-State: AO0yUKWoQZPzP9xyoKeAuu89yk8Is/TSNE9OhUpb3NCSEcziz4SNUd9u
 x/AOt6/d3gKMaAlO5YXF+k9paA==
X-Google-Smtp-Source: AK7set8iN+/mIrqW5/Qr+aqSu9MsIvAJsB27GejEw87Ib7HPmo9xZA/4nsBPgZkcsfmA10rCaMWVnQ==
X-Received: by 2002:a05:6402:1209:b0:47e:15ec:155e with SMTP id
 c9-20020a056402120900b0047e15ec155emr16315564edw.26.1675594254684; 
 Sun, 05 Feb 2023 02:50:54 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 en14-20020a056402528e00b0049622a61f8fsm3623511edb.30.2023.02.05.02.50.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 02:50:54 -0800 (PST)
Message-ID: <110a0c37-872f-fc1e-51bd-4d30e0bac380@linaro.org>
Date: Sun, 5 Feb 2023 11:50:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 02/10] fuzz: add fuzz_reboot API
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20230205042951.3570008-1-alxndr@bu.edu>
 <20230205042951.3570008-3-alxndr@bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230205042951.3570008-3-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 5/2/23 05:29, Alexander Bulekov wrote:
> As we are converting most fuzzers to rely on reboots to reset state,
> introduce an API to make sure reboots are invoked in a consistent
> manner.
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>   tests/qtest/fuzz/fuzz.c | 6 ++++++
>   tests/qtest/fuzz/fuzz.h | 2 +-
>   2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
> index eb7520544b..c2d07a4c7e 100644
> --- a/tests/qtest/fuzz/fuzz.c
> +++ b/tests/qtest/fuzz/fuzz.c
> @@ -51,6 +51,12 @@ void flush_events(QTestState *s)
>       }
>   }
>   
> +void fuzz_reboot(QTestState *s)

"reboot" sounds like guest software triggered.
IIUC from the fuzzer PoV this is more a "power-cycle" right?

> +{
> +    qemu_system_reset(SHUTDOWN_CAUSE_GUEST_RESET);

Is SHUTDOWN_CAUSE_HOST_QMP_SYSTEM_RESET more appropriate?

> +    main_loop_wait(true);
> +}


