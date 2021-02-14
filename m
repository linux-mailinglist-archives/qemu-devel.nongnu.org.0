Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FDB31B200
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:29:59 +0100 (CET)
Received: from localhost ([::1]:53090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBM9e-0006Km-0X
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:29:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBLhK-0007fM-1Y
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:00:47 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:37595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBLh8-0004Ug-4j
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:00:37 -0500
Received: by mail-pf1-x429.google.com with SMTP id b145so2836759pfb.4
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ugzb+y1y3r03e6ihcdhaDtggPB81vwj1v2EWmieb3o8=;
 b=Lmhtp35WUxqqB1/w6mRouxngdHV3T8tuqkBpw0rRQtAkpPUx/Mw/bQ+CY0sVl3Jszg
 7K38dJbrWt7Y6xTgXlOUl+Aax9uP/9mdcCyYmu2EcwVLW7fFbm4xlVH6rNR+cpXe4Iiu
 tn+I01yD6VJoBfexyxt+UYkvc6Ave0dz0rqqVoOkqxgV7LzPelg/sO6qk4E/UKVZTUrY
 KjCswlxIS9QtpJmH8Nu1TGLlRLcYQHSae9yH8IOBXDJs27ewBoP6+nRqGIJkZEZ8CLTg
 UhQHFfxfSCUhgzEtL+Yr9BE5iScyjVLWqDAeecybCMVx3YAnB6H1llDuZf2NyhbLn5m1
 stLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ugzb+y1y3r03e6ihcdhaDtggPB81vwj1v2EWmieb3o8=;
 b=lasbqGgrHGkoNjFKWnSace+Wr5nY8ZomokkIHYjOL10sPWiqQV+t93McGuI8qQq66r
 5wqdGAkwWUcHh61o6lLM+kMzs45/yw+SrHMrAXEikuFUPV4SF9PFufI0toDJNAZNzXBt
 DoNif3UGU3OkMjonCHlndIc4IIqVeF4O1D0YnFSHi494QNa0nj7OOk3J38Exd3ODsqIM
 jYqLsBorgynw+DFgj29LL00txE2fc0xV8Uxmny8sXpxwluAqBmGQmtdYyA4u5LNgzxcp
 rqd1spEvBysv6xy1x9bgldWHB+BIg2tzaETLtEWZZ8eNQCfYOj/HrzdItpMBsopfXMwM
 LmKw==
X-Gm-Message-State: AOAM533bAUrxATDf5d433Ng9Jv+A/6UBqH7agDVxO6fJT1N4PgxRKXku
 eg1wOm814ZLXA64jY6VxvGDzKA==
X-Google-Smtp-Source: ABdhPJztga5w2fLq/mjWSAwAryx5KfFC3KZZ77j3T5xwAprjEFJYTChRWsecV9K9vRMmncEGx3cSFw==
X-Received: by 2002:a63:f447:: with SMTP id p7mr11783833pgk.243.1613325628177; 
 Sun, 14 Feb 2021 10:00:28 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 u142sm14327617pfc.37.2021.02.14.10.00.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 10:00:27 -0800 (PST)
Subject: Re: [PATCH v8 12/35] Hexagon (target/hexagon) instruction attributes
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-13-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7334b8cd-18e7-7e9f-4b71-63d15efe7f0f@linaro.org>
Date: Sun, 14 Feb 2021 10:00:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612763186-18161-13-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: ale@rev.ng, alex.bennee@linaro.org, philmd@redhat.com, laurent@vivier.eu,
 bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/21 9:46 PM, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/hexagon/attribs.h         | 35 +++++++++++++++
>  target/hexagon/attribs_def.h.inc | 97 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 132 insertions(+)
>  create mode 100644 target/hexagon/attribs.h
>  create mode 100644 target/hexagon/attribs_def.h.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

