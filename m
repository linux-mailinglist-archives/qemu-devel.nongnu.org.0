Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D1940C7E6
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 17:09:25 +0200 (CEST)
Received: from localhost ([::1]:37106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQWXM-0005M9-RM
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 11:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQWRp-0008Mi-5j
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 11:03:41 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:45907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQWRV-0004c1-0o
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 11:03:40 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so2242794wms.4
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 08:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GUd1w+baN7XE6e3zzp64AG/hIc6XoPQpDuqiOp0sLtw=;
 b=QcmBcCturRwYmQc2CZDTqWxvub892hZ7mpX2q1YzwWFPo8EUGtcZkzUSc2w47iADYE
 uwY0IbsJzZ/0tnwydNrxql9l1O+tNYN0JBbVejUl3LsQa6oyVbN13oDXcAYGZDmDMvtn
 H5o94GjchXiOhjvkeVr8MZFxoAZhh0bP67vz9RFdhYp/8JCwxFM/emB3cwq6PpygWqOJ
 hw/MqKaO441zeAZqQwktqRiyEqGtPjLHVJm7eE/8ncj03pBbt8PfyBXqeCUoRlue8F99
 cMxGgX0LviVkBBTvfE1mzOg1bkGDWX525h6yaAJg4oKcOsu0vR+uJn/4z82DL9RYmg7I
 N/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GUd1w+baN7XE6e3zzp64AG/hIc6XoPQpDuqiOp0sLtw=;
 b=mWTS1zx6Kc+C6FN0oAm1Ec0vnXVdN9Wqbjw3UQWsg2y7M9DMdIVkvv2q8dDCCpWTqy
 ITzeodIhUrXmJ3kMfN+Lwcn5tRLVOCgBT1s/SuXAh9/bNfZtePwCztKnlSMYyyvwJ87t
 LgR6deooJ7x0l2uPApteF7pQ8z83psoW4Twryuffj8NdHPy4AxGXXKe76ITTqZ0WDxi6
 nlpXDiPuTMD9QT7SxWg6QzWwtXNauOwThkblskylH1R08DLBbBn1SsUtT9QTAOKvE9ZZ
 d7DjA2H0zStwMpn09MBA0viyHLF2x5HpfLZrrGQ1RCDTpd5+arwqP6LrDDSLZt3SBMzj
 Y7fQ==
X-Gm-Message-State: AOAM533t5hyKkEx96y6u6Mb4nl/8uETrr8wWP7KXRuVEQ46VA7WofCso
 N+IBmCMXRgHUutOxbPD8zJ8=
X-Google-Smtp-Source: ABdhPJyHwFwOx3fMZiQJULbBnwnRkZcxOnc+NeMXYgRasfvMCC9/8qc6WB8roDDEMFwLRZmPebvv5w==
X-Received: by 2002:a1c:228b:: with SMTP id i133mr5030174wmi.179.1631718198501; 
 Wed, 15 Sep 2021 08:03:18 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id g13sm199367wmh.20.2021.09.15.08.03.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 08:03:17 -0700 (PDT)
Subject: Re: [PATCH 2/2] gitlab: Add cross-riscv64-system, cross-riscv64-user
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210914185830.1378771-1-richard.henderson@linaro.org>
 <20210914185830.1378771-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a3c943e1-a303-7ff8-19ab-4aef67259706@amsat.org>
Date: Wed, 15 Sep 2021 17:03:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914185830.1378771-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.698,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: willianr@redhat.com, thuth@redhat.com, alex.bennee@linaro.org,
 wainersm@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 8:58 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  .gitlab-ci.d/crossbuilds.yml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index f10168db2e..0fe4a55ac5 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -124,6 +124,20 @@ cross-ppc64el-user:
>    variables:
>      IMAGE: debian-ppc64el-cross
>  
> +cross-riscv64-system:
> +  extends: .cross_system_build_job
> +  needs:
> +    job: riscv64-debian-cross-container
> +  variables:
> +    IMAGE: debian-riscv64-cross
> +
> +cross-riscv64-user:
> +  extends: .cross_user_build_job
> +  needs:
> +    job: riscv64-debian-cross-container
> +  variables:
> +    IMAGE: debian-riscv64-cross
> +

Pending discussion on patch #1 of this series, I believe
this job is likely going to fail, so must use the
'allow_failure: true' tag or something else (manual?).
Meanwhile this is sorted out:
NAcked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

