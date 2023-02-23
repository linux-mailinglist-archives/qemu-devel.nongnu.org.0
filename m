Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7969F6A0C03
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 15:41:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVClC-0002vR-8E; Thu, 23 Feb 2023 09:39:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVCl9-0002v8-27
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 09:39:47 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVCky-0007dJ-JV
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 09:39:39 -0500
Received: by mail-wr1-x42b.google.com with SMTP id q16so509226wrw.2
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 06:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0Hl9gXkEZJCmd5pIKcwwwVPp/k0Rhd8r6eD3LfRdlHs=;
 b=gaRGNsXfAvM2K9GLp0LrEKQug7RevYKjAVnDDfPTuirBYBoEiMcjm9A8GqEN9YzS7X
 7lrqTM5GPB2CA4kfclGptg/7fJ0MrKJrhapthFO034brAzfXfEN0+1jtdduSXZ3xxO5O
 Pf6MhbenwLvoF3TboX+oe1154f0g7sYP+3tiY/9Nt61LVDc0d3s+kJeHKba3ojoX0qFV
 gDQ8ysrTCdxDArgwZMxN3I5yA3B2l7MdOLsf8czZds6TpcjHAIIW1rgguEMmScGp12NV
 vJNUe+YlkkmjTp+JoElvmgxeD/yU/9r+7Mw73gtLSgLwdfSl7uTEU6MgK5VnkCeCT0ff
 YkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0Hl9gXkEZJCmd5pIKcwwwVPp/k0Rhd8r6eD3LfRdlHs=;
 b=x2Lcnmkv2Eha0Nl/JMJR+8s9d9Kl4WD18Uo3v2tuQ/HMbom8Y2XSCYhoLXDbU2Q3+T
 xD+YHY8Nl4PoThLvvfvJFGBHw9S8UeTW8elV/FKjt+iMh/f2a/RVej158tloYAph3wGF
 xlMSK9wN8EbcgCcBcPI2tVg2F1lGAM4oHq/tAjxVWGd69TtFfCk7El2+purV3FLtyZD6
 x72dT9vTrgZ0d6iPFNCuRukGKaCBO4zq88NIP83uOgSvCzCAyFP5sUEQMaKCXpd3WJCO
 jT4Gjln5WDm/8camN9YizGbok5qkAxKTm2XMEtISg9W2GCeHklQ1E8H4DRvb1lXg7LIV
 V9zg==
X-Gm-Message-State: AO0yUKVgUKgvh+Dff5txG6fCU84j7devXwp7Y4Rpv0r8Gc8CJLYJAmKw
 kDXI4AohI6DRx7+mQj1A6R0y1A==
X-Google-Smtp-Source: AK7set8P9DKksdO1RZvV9GbyfoqHeKWvHrPS4AF7r4+ZelbqtW0XeDRxeX2dtIN91sioSX6cgkhdHw==
X-Received: by 2002:a5d:595e:0:b0:2c5:8d7c:c144 with SMTP id
 e30-20020a5d595e000000b002c58d7cc144mr10641555wri.39.1677163165492; 
 Thu, 23 Feb 2023 06:39:25 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q31-20020a05600c331f00b003e2243cfe15sm5242239wmp.39.2023.02.23.06.39.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 06:39:24 -0800 (PST)
Message-ID: <5de15c0b-6c54-3de5-c8f6-240f0c883d9b@linaro.org>
Date: Thu, 23 Feb 2023 15:39:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] qemu/typedefs: Sort in case-insensitive alphabetical
 order (again)
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20230217141832.24777-1-philmd@linaro.org>
 <20230217141832.24777-2-philmd@linaro.org>
 <7120D9B2-2ED1-4D06-A98B-9FB2CB95C6CE@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <7120D9B2-2ED1-4D06-A98B-9FB2CB95C6CE@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 18/2/23 01:47, Bernhard Beschow wrote:
> 
> 
> Am 17. Februar 2023 14:18:31 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>> Following the recommendation added in commit a98c370c46
>> ("typedefs: (Re-)sort entries alphabetically"), and similarly
>> to commit 64baadc272 ("Sort include/qemu/typedefs.h"), sort
>> again the type definitions (in case-insensitive alphabetical
>> order, using 'sort --ignore-case').
> 
> Since it can be done mechanically: Maybe add a checkpach check?

There are 2 different sections in this file, each sorted
alphabetically :/

