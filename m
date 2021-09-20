Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E6B4128C8
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:21:56 +0200 (CEST)
Received: from localhost ([::1]:39120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRff-00054S-Gm
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSRMI-0007do-QS
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 18:01:54 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSRMH-0006YU-0s
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 18:01:54 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 mv7-20020a17090b198700b0019c843e7233so1010522pjb.4
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 15:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=HQUwQn87E8pVh5CCVwHsYfAVhmEQRevsxd+TrqaGaLY=;
 b=mLIcY33NvgBU7YvuLdEV6b1bLMRw7gEt3g997P7zpLrr37zATfAFSK48WC0efoc4TN
 0xAhViBmVL6kE8sF9SwMflRhWImZCz67kZXEyqF8jlid9K5Ed3HN39hEJRaxshWyt+eh
 qMtqGSHRW42jTVBhfwS5Nv32D3Y1STbs56sAXTwc5Jv3WKLx41fkD4pprzu6XWvK4lCr
 RDHhrDqVo3BseM99aDAII6RGwtN4Gd9ucmkNBNl2kHb4ENe6pBpMeD+101eGs+EP6lsq
 xc4jLt93XXUYHucY7d1Hi8uj+yzy1nPTZL3J5hMYDVn55XyDN8kufjfCsDAzlof6q249
 lsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HQUwQn87E8pVh5CCVwHsYfAVhmEQRevsxd+TrqaGaLY=;
 b=uc5hYcYlwOp/aHcX0/Qyo+KgLYDEpTgrC08YuyEkWfjj9pO7VOhCuuZ/BZv971iKDZ
 VYWff9mk/YXkQRL2cu/Rt9PmAeyZSqPnbPwKPLpisLOsT1+nScJjtP33u7MR6RQMO/wq
 QnPj2RfgIMy5Z+Sq7jTC/l7KYf1uqFlNCzWJXgGie3gTp4JlnohYw92Lh7Wgn618raAF
 DW5ZwgFBdLzWB3fuxxbJ0fv477JMmZBecLLttc5ufTn0zPGFKKVwdz35QsWpVKIIBxpU
 gtb4GHhI9E2AB1Ys/e7u9x8iDlSXFFcW2rXLBJEGPv4lAwIWXZY6e+2O1/YmOi8h03Sq
 7eDQ==
X-Gm-Message-State: AOAM531JRTsA74Kaf+8oQkOKQKwl73/pBIRSKKrt3MBwfPILh8uduUjg
 PconJmHKukybjdNoWJ7eqt6vF+DhR5uktg==
X-Google-Smtp-Source: ABdhPJyoiZH6BKW2VJIpEcD9VY1w1io1KCk/xhnKF12oJ2DuhfwZ21FbZGb7JAJVDJ8LMynxielY5Q==
X-Received: by 2002:a17:903:32cd:b0:13d:9b0e:7897 with SMTP id
 i13-20020a17090332cd00b0013d9b0e7897mr13688502plr.30.1632175311051; 
 Mon, 20 Sep 2021 15:01:51 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id h15sm108743pfr.137.2021.09.20.15.01.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 15:01:50 -0700 (PDT)
Subject: Re: [PATCH v5 08/31] accel/tcg: Implement AccelOpsClass::has_work()
 as stub
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210920214447.2998623-1-f4bug@amsat.org>
 <20210920214447.2998623-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <77ab9dfa-01c0-6d6f-89de-604adc26bd35@linaro.org>
Date: Mon, 20 Sep 2021 15:01:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920214447.2998623-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 2:44 PM, Philippe Mathieu-Daudé wrote:
> +static bool tcg_cpu_has_work(CPUState *cpu)
> +{
> +    CPUClass *cc = CPU_GET_CLASS(cpu);
> +
> +    g_assert(cc->tcg_ops->has_work);
> +    return cc->tcg_ops->has_work(cpu);
> +}

Now, you're expecting cc->has_work to disappear as cc->tcg_ops->has_work appears.  If 
we're expecting cc->has_work to not affect other accelerators, then I think you should 
first move cc->has_work to this function, *before* you add the tcg_ops hook.


r~

