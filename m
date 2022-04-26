Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFA8510A73
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 22:29:31 +0200 (CEST)
Received: from localhost ([::1]:52032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njRoQ-0001An-7y
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 16:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njRmg-00070U-T8
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:27:42 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:33597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njRmf-0001CY-6b
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:27:42 -0400
Received: by mail-pl1-x62a.google.com with SMTP id c23so31301802plo.0
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 13:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=s22lZDRWh6uMPyoEVF6k214R2eDfgrO6tfYcK3nQ1nM=;
 b=Vtxom1wdelM7cj1GTi7SbLgzOQlieoiSJ7iAhAKd8VqExtfm66ZQK5ytzE0oBbO5Ug
 WZK+8GY1mZqRmp/b5IG/KcEx+eoxgIzzrq+d7X6guUtMvfljneK+4EWglIejPj5mg4cr
 qjasP1jd1x47IPB5ueCOC0TbM6MidukZHma0nenSdNPvzFm5E53MiYjx3LTN3Ux7Qu5n
 5mx8X9GZOy3V0SlDEllgzAybpVNCk2bpH6KWyy4V3SMVgJAFJVZ0WIFtbx/DANJ6FqUu
 8vwFU3uA4cW91hPc030imZbG8rPjrSQdcWvkDHiHl2fRubM16h7wZKMx/rBD5PBr+1GL
 WDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s22lZDRWh6uMPyoEVF6k214R2eDfgrO6tfYcK3nQ1nM=;
 b=VB1z2A0qYS1zG0dR8Taug7SSL+mwrLU+xNGMYZU1LOMRcEskny5xmetVxRx3fh7aAP
 Fh74iAcurMutEZ+BM7DH7hx9O2XK7qO1KxY7gwbyHTY1Z5eCWTKfIiYKGr+EJoHQ4AWj
 YQ0UrJm4mNfaz4dtizLZT29AROYpLP3Kkgb9eHT/l9gsDOHy5+/PhH1wLrnyQ1t9sNIb
 fVuDYGk/OTMiRPjXpzxF9YFAiw/7xE715d0EnCv84VH4xxraR4Rvc4No4OhKu6jZ6DiP
 i/CScGCE24pEnKbHTRqP6+fabeD1pbrinVa1d8jd30rX+p8bcmfm+UhWNdjMnbYunRqN
 FK1A==
X-Gm-Message-State: AOAM532Zdu1Y35MSY11wh+uHI6xs9/l09qS8NAjG9EavJ14IaIq55Z/0
 8n0AUbp1qowcf+FJVEECXvEp1A==
X-Google-Smtp-Source: ABdhPJwibV3LOhweFaMFlbbTgeVuSFiIjHN8/ga4J9oomjkjdHWBqd6fxp2V8ZsFxFDbYGDH7yAkiQ==
X-Received: by 2002:a17:90a:db95:b0:1d9:782f:a4c8 with SMTP id
 h21-20020a17090adb9500b001d9782fa4c8mr13153261pjv.154.1651004859753; 
 Tue, 26 Apr 2022 13:27:39 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a17090a8b8e00b001d95cdb62d4sm4053798pjn.33.2022.04.26.13.27.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 13:27:39 -0700 (PDT)
Message-ID: <f8d78d32-bf3f-bc6d-cd85-6ef0b369ffec@linaro.org>
Date: Tue, 26 Apr 2022 13:27:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 5/9] docs: convert docs/devel/replay page to rst
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <165062838915.526882.13230207960407998257.stgit@pasha-ThinkPad-X280>
 <165062841642.526882.11679119764732049695.stgit@pasha-ThinkPad-X280>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <165062841642.526882.11679119764732049695.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, pbonzini@redhat.com, philmd@redhat.com,
 wrampazz@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/22 04:53, Pavel Dovgalyuk wrote:
> This patch converts prior .txt replay devel documentation to .rst.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>   docs/devel/index-tcg.rst |    2 ++
>   docs/devel/replay.rst    |   54 ++++++++++++++++++++++++++++++++++++++++++++++
>   docs/devel/replay.txt    |   46 ---------------------------------------
>   3 files changed, 56 insertions(+), 46 deletions(-)
>   create mode 100644 docs/devel/replay.rst
>   delete mode 100644 docs/devel/replay.txt
> 
> diff --git a/docs/devel/index-tcg.rst b/docs/devel/index-tcg.rst
> index 0b0ad12c22..52af5444d6 100644
> --- a/docs/devel/index-tcg.rst
> +++ b/docs/devel/index-tcg.rst
> @@ -8,8 +8,10 @@ are only implementing things for HW accelerated hypervisors.
>   .. toctree::
>      :maxdepth: 2
>   
> +
>      tcg
>      decodetree

Watch extra whitespace.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

