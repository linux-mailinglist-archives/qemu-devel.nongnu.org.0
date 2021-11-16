Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF23B45331E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 14:46:21 +0100 (CET)
Received: from localhost ([::1]:46954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmymy-0003dJ-7f
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 08:46:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmyNJ-0002V1-Ju
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 08:19:50 -0500
Received: from [2a00:1450:4864:20::32b] (port=39548
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmyNC-0000WH-P2
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 08:19:45 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso1935837wmr.4
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 05:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ce4YYK1rySsPFZ1Q2jrgIYYU2v34iwHX3m8vTdIP6Ew=;
 b=dXdnRpsQCt+AzjU5ayXhwKrkASlXi9qRCw1etufkPCmqXTo/uAfucnJc1FpujbB8D1
 h/TagV7EetecIxQyiJl49OMaw2MX//LoQd6xt1SuCqNnXQrnilOa4OQnueUSrVutachv
 4M+7WFbzjK0XwcDF/zPjhy0+gq67V15ynHLBf0JqR2vMNHZh9/Y/VyMwGggkiQlBn3K7
 GnFaCnYJrBSDp5UgAR0m62CJd2gqatGmrvIYPEit8wdlXEDeKg3Tw5mUm6tu1yIQedvB
 mIPDfJ3jN5v0KMM7ACKvtN2Sr6oKE0hIO7+sF91jF16dkyyftvRtmHV4xKYoDDsXy+hb
 z7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ce4YYK1rySsPFZ1Q2jrgIYYU2v34iwHX3m8vTdIP6Ew=;
 b=VJJTx4V6a0m2uAcg/4zzwQqbAMnzB3hy7rfyRXdLk6lOyaRxFzGATy9k1R6m28dnT+
 l/n2/XV2RpUHaeFrkuhq2dG5AOwnZcPeZVfzoCZfDeYj5UWbHapSkuDpps090E+fDfjK
 iZgXjq7jDulODwfcYm9Z6NkgCsz2DuHba+0gM6LrS6DooV5iVmWHHfgC64BhAMrIgriV
 h4fy7KvgAXikzRfrHhhVJOBG/GHkd0mRMzO66lLXOW5+GLLlNrOWCXYtk+V+TNqythsr
 GAEBMVCfyUWUTQDOrjjrtOfuy2lyp55fSbEImY/FvM7dEOPFOk590L472cx5nmjHYyyh
 Ulrw==
X-Gm-Message-State: AOAM530xpYZ67As1zCTyJGoMD2UZJP9t5gacoVINQGr8qj2yeNr4WF12
 yA+ShyedQ57Ie+CR6SaCtjE8AA==
X-Google-Smtp-Source: ABdhPJx1RZu0MBhafalEe7fOn733LO59fu0OMtHZDEmX+3H7eD9kqFxRoqlTS2eiy0NLflkCv17ebg==
X-Received: by 2002:a05:600c:1d28:: with SMTP id
 l40mr7821267wms.192.1637068781201; 
 Tue, 16 Nov 2021 05:19:41 -0800 (PST)
Received: from [192.168.8.105] (145.red-37-158-173.dynamicip.rima-tde.net.
 [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id o12sm23793318wrc.85.2021.11.16.05.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 05:19:40 -0800 (PST)
Subject: Re: [PULL 0/3] Machine-next patches for 2021-11-15
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211115224802.2602894-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <31de6047-0f47-e195-9f84-5f11866ce90a@linaro.org>
Date: Tue, 16 Nov 2021 14:19:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115224802.2602894-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.446,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/21 11:47 PM, Philippe Mathieu-Daudé wrote:
> The following changes since commit 42f6c9179be4401974dd3a75ee72defd16b5092d:
> 
>    Merge tag 'pull-ppc-20211112' of https://github.com/legoater/qemu into staging (2021-11-12 12:28:25 +0100)
> 
> are available in the Git repository at:
> 
>    https://github.com/philmd/qemu.git tags/machine-core-20211115
> 
> for you to fetch changes up to 7b6d1bc9629f3dd45647ec3418e0606a92dddd48:
> 
>    tests/unit/test-smp-parse: Explicit MachineClass name (2021-11-15 21:49:16 +0100)
> 
> ----------------------------------------------------------------
> Machine core patches
> 
> - Rework SMP parsing unit test to work on WinGW:
> 
>    https://github.com/qemu/qemu/runs/4078386652
> 
>    This fixes:
> 
>      Test smp_parse failed!
>      Expected error report: Invalid SMP CPUs 1. The min CPUs supported by machine '(null)' is 2
>        Output error report: Invalid SMP CPUs 1. The min CPUs supported by machine '(NULL)' is 2
> 
> ----------------------------------------------------------------
> 
> Philippe Mathieu-Daudé (3):
>    tests/unit/test-smp-parse: Restore MachineClass fields after modifying
>    tests/unit/test-smp-parse: QOM'ify smp_machine_class_init()
>    tests/unit/test-smp-parse: Explicit MachineClass name
> 
>   tests/unit/test-smp-parse.c | 52 +++++++++++++++++++++++--------------
>   1 file changed, 33 insertions(+), 19 deletions(-)

Applied, thanks.

r~


