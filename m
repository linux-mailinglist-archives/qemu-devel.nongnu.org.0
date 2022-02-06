Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0934AB248
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 22:14:42 +0100 (CET)
Received: from localhost ([::1]:46620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGorp-0003Gk-0w
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 16:14:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGoqf-00026Q-78; Sun, 06 Feb 2022 16:13:29 -0500
Received: from [2a00:1450:4864:20::42c] (port=38607
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGoqd-0002Fm-NM; Sun, 06 Feb 2022 16:13:28 -0500
Received: by mail-wr1-x42c.google.com with SMTP id s10so18918978wra.5;
 Sun, 06 Feb 2022 13:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JC1QD9vIsXZyWYPfKRDh+XPexunFvQS4EJ2p2X3jQIg=;
 b=kECo74qoY9pmaMXQhD6cY1C0NoOuq2NuieO21UDECeazIDKHTTSkEYC4spebX7IOLX
 K0Djma4mC7a4UKPCfws1BJg/ExadvJh0orF9owZUgWgwPA1KOu71FrPGjdlFNAjYZ3XX
 miFcW4wvfQgCvCFat0I+UcWTV3ZlsA7APTNEGJe8k7iV5dQjIJaRVXkxsygUlKIQeOyn
 OLMRYWrkRxTQnZ7J138ifhxTfpjD/dApeMEffHodXPPfWVYPFl3c1en+meqDk3h0GWkN
 QYcm1Gh/ElnKJy8V3/ff6jqspXTmjrsPEzeOqx5o72Kz0wa2WPF5v8XSuLeBoXi28edP
 1FEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JC1QD9vIsXZyWYPfKRDh+XPexunFvQS4EJ2p2X3jQIg=;
 b=LMh7JtvgSfKu4JjC0ZDhQeOhaRHTqbYX4dYE5iIvzw6ay+5thgaI8IhZua6S1AA7eD
 p8Sg8XEwwNe1qTb47alwOmA5OWSBa6IrW203PgPl5/4Q0yY4mykvWW3hD69vh7f7iONi
 1+IJ3alTV9C7Qa0ggX4kN8lWf57yJls6C/tFqbzJtLI/afHAXMRsMmB1kN+7/B43QWEp
 DSWSYRoKgf8itXjYERqRezGRYaZRGcYHrFCOUA/r+7/lqQPf/dX+1JS6KyyhWH4f4Gmp
 8tDCgfu24OTMmRk6FfRXghXzcRuM2+amdAZC2sZIyWzZPVi5Mwat8NPvSR8AxNRf4h4r
 UJLw==
X-Gm-Message-State: AOAM532jRzfHqU2TWq/LobkeXpp1936rZtBrkbBogXPV6KPrpZCVQMhm
 FvShIh7WlmPYgKm3h/gwBcQ=
X-Google-Smtp-Source: ABdhPJzLvOx4vwdU1DT/BpdmIC4R7WBRsxGk5P6Z+ziL6jCF+RulXxfJV2Mn2ZY8UArBjUMIDJyZyQ==
X-Received: by 2002:a5d:6381:: with SMTP id p1mr7455393wru.549.1644182006104; 
 Sun, 06 Feb 2022 13:13:26 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id q140sm4890797wme.16.2022.02.06.13.13.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Feb 2022 13:13:25 -0800 (PST)
Message-ID: <de082768-694d-d3ab-a553-6b862aab5bc5@amsat.org>
Date: Sun, 6 Feb 2022 22:13:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v3 1/2] hw/display/vmware_vga: replace fprintf calls with
 trace events
Content-Language: en-US
To: Carwyn Ellis <carwynellis@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
References: <20220206183956.10694-1-carwynellis@gmail.com>
 <20220206183956.10694-2-carwynellis@gmail.com>
In-Reply-To: <20220206183956.10694-2-carwynellis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 6/2/22 19:39, Carwyn Ellis wrote:
> Debug output was always being sent to STDERR.
> 
> This has been replaced with trace events.
> 
> Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
> ---
>   hw/display/trace-events |  3 +++
>   hw/display/vmware_vga.c | 30 ++++++++++++++++++------------
>   2 files changed, 21 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

