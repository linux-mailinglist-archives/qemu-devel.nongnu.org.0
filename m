Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA001321532
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 12:38:12 +0100 (CET)
Received: from localhost ([::1]:56154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE9XX-0005lt-OY
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 06:38:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lE9WP-0005LE-CQ
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 06:37:01 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:46134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lE9WL-0000DC-UA
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 06:37:01 -0500
Received: by mail-ej1-x62b.google.com with SMTP id r17so2396292ejy.13
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 03:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NQSiEYIElSVcKFCAkUt87Jdtgr8D59sGeN2wVBmJISc=;
 b=ikKSuFqbOW4XyyCiW+tG5cZn9s2OyLKWJqvVoYSmw/oKheF1+MKaVsuBVixFMBpbZW
 jAbSuy1JvSnmMkilwM0KAxSrpjPObGWKcxdi9Qx5NSGRYCVJDPUBBGFDkSEogCXyLHyA
 1YlvdltCsoglt2h+MYxW487QGoKQeSI9vFeg0Ql6L5MKlNV1ZSBj4P9llGg+DyJv3Qe1
 JL/T25byiUZp/h61Ny/Sd/kRnWw8zeZtdPuzpGKIHS1cGDmBP/gch5X9p/p4wm7trCdt
 e1wQtw7MubUzjj873/QsKVml3LcsotFJo8EAFbxfYt47ssXyD+WqW2MrLuHmAa3CMRRe
 ek8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NQSiEYIElSVcKFCAkUt87Jdtgr8D59sGeN2wVBmJISc=;
 b=AwtHfgWHdtufhZHwd020DBj1HKQcBam39TZ3rQ4N2v7X0SC/BsZJPcJTmcGkfBm7NZ
 /nl1hXy5DcPsa8uKrp0lRMlXqk/d72vwdgGyIc+eKcVFo2xbSMp7XPryupxveoTlGGy7
 oNpTQw6OSTbV1nUaNS4mhQMvkopkvjpZ/chJylwNA5RRBs+4SNZHU76/je2+AMEt6h/5
 UmKuOT1ygRVFnjczm5t7NsVAzIUgMeVJyoYymf2j8T7/pqXvdKfKB+q8U3UNenErf/KP
 HCFACj2qTQW4PRO1PuesQneK6uXiVbm8tjow1Cpr0NuSAN1ZBK0y8/CemqCrk3IvUgTV
 ECuw==
X-Gm-Message-State: AOAM532D2Pp5R3UZ7ZlVqeKxbc4dQMJumRVlHtSckhq2yKKhU2GTnG8y
 vDtsJ00nbT0GzQHMvZHbQ40=
X-Google-Smtp-Source: ABdhPJwhVL7ua7cYk/+81IeK8eRZxXSxJl/1d+KHBd1lzwDpmTWQD6OqZBpHDfcTIQukS/wISRUWXQ==
X-Received: by 2002:a17:906:2818:: with SMTP id
 r24mr14083993ejc.472.1613993816402; 
 Mon, 22 Feb 2021 03:36:56 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y21sm8492957ejj.31.2021.02.22.03.36.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 03:36:55 -0800 (PST)
Subject: Re: [PATCH v2 6/6] docs/devel: add forward reference to check-tcg
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210222101455.12640-1-alex.bennee@linaro.org>
 <20210222101455.12640-7-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <20afa72c-da47-431a-6230-45cc46c15afb@amsat.org>
Date: Mon, 22 Feb 2021 12:36:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222101455.12640-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 11:14 AM, Alex Bennée wrote:
> For completeness reference the check-tcg tests in the container
> preamble text.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Thomas Huth <thuth@redhat.com>
> ---
>  docs/devel/testing.rst | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

