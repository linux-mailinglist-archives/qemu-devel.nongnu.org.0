Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1ABC4403F2
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 22:17:52 +0200 (CEST)
Received: from localhost ([::1]:37310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgYJz-0003mu-Pw
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 16:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgXrb-0006rd-EN; Fri, 29 Oct 2021 15:48:31 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgXrZ-0001IU-U4; Fri, 29 Oct 2021 15:48:31 -0400
Received: by mail-wr1-x42d.google.com with SMTP id v17so18124555wrv.9;
 Fri, 29 Oct 2021 12:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b5jGzxkhkidiUBBUIY4FgYSBpvEWkIF2rHv5wrU9tyA=;
 b=KxxwTHAwNzAihQ9Jn4YE67WjeOtQlLsMtXCprlihFx/1nZxY3/E5bj8OU0oaOBRIsm
 tp/De8dGR3pjzAPcwi0RnlPtGYhRaoblB6bZRYKOWashpmxQ+C4809uqhQ3bM/UObrWB
 YQm3TstXoTpey5gpGCRIPWJYbzZDDiv1KFHDkfnrR/6WwzQC3HryEch+UHEGbKZ2K90G
 Bj1JhPcITg/sSj/MoijSZtrGGs/l92gqMOi0Dhf+mAnfaoepXzg5XfEE193VHjhoSgZ7
 dnxCsjp/hQaWswjN6Ua7gZT77Un2FV8SNdqi6p4hXVhzz1DRoxJm7ElvfV6ir9a1AAOV
 mkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b5jGzxkhkidiUBBUIY4FgYSBpvEWkIF2rHv5wrU9tyA=;
 b=xWbuLUvY594E6Iy97DVC2/H0jGyF7TvQmAxQbppCKjklJbCmXvkRgxGKTZp0SOfjDZ
 Imp87/rwZv3S9CXUrLbvhAYx+r0gVHU8DYjrCEAJLiis1Yvk79yy/0mcOgQjeRFzITcH
 GNfVOhdrdtfD0PpDBJwmlb49XOW4k/cK5Pz4CyDa9yssOuZskSxy1gKX9C14r6l6eC4t
 l/yF9qrPVLW7gX9X/8DGurh3kWO5WjkGr2bHwPoTNvdgPMHdkHvyx8VRNCwNlT9qJtPw
 IQYgIP/zOsYvZAt/iOe+foQz30xCcbcKTOo0Jmz3U9NLkjNMcvXxR3G7oJ9LVY8ZkVTj
 RyGg==
X-Gm-Message-State: AOAM530ANWZgJKlOwi5EE7KU0bxZsCkhbW8rdaEZOyw6UiswBD833UOH
 qfxDKTsPLeYXpW6DpRwbHvg=
X-Google-Smtp-Source: ABdhPJy/TzKJW5cPqjRahFJx3RUWLLkb8iqzcaLAOu9ItUGxKP6hUAQTBu8/4aKe0xldOu+UZyLSvQ==
X-Received: by 2002:a7b:c316:: with SMTP id k22mr14352424wmj.22.1635536907890; 
 Fri, 29 Oct 2021 12:48:27 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id t11sm6491756wrz.65.2021.10.29.12.48.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 12:48:27 -0700 (PDT)
Message-ID: <0118d1f6-eb64-09b2-464f-351cb7052ba9@amsat.org>
Date: Fri, 29 Oct 2021 21:48:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 02/15] target/ppc: Move REQUIRE_ALTIVEC/VECTOR to
 translate.c
Content-Language: en-US
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20211029192417.400707-1-luis.pires@eldorado.org.br>
 <20211029192417.400707-3-luis.pires@eldorado.org.br>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211029192417.400707-3-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.512,
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
Cc: richard.henderson@linaro.org, groug@kaod.org,
 Fernando Valle <fernando.valle@eldorado.org.br>,
 Bruno Larsen <bruno.larsen@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 21:24, Luis Pires wrote:
> From: Bruno Larsen <bruno.larsen@eldorado.org.br>
> 
> Move REQUIRE_ALTIVEC to translate.c and rename it to REQUIRE_VECTOR.
> 
> Signed-off-by: Bruno Larsen <bruno.larsen@eldorado.org.br>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> Signed-off-by: Fernando Valle <fernando.valle@eldorado.org.br>
> Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  target/ppc/translate.c                 |  8 ++++++++
>  target/ppc/translate/vector-impl.c.inc | 10 +---------
>  2 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

