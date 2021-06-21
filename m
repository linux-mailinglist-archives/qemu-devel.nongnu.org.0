Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FA03AF6A0
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 22:06:33 +0200 (CEST)
Received: from localhost ([::1]:60436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvQBk-00034J-6N
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 16:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvQA4-0001eq-75
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 16:04:48 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvQA2-00087Q-Hr
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 16:04:47 -0400
Received: by mail-wr1-x42e.google.com with SMTP id j2so10469609wrs.12
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 13:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UnvbL98CEHfBo1vNrFlWYLH8FrRj/kftOvBXV7A9Tek=;
 b=EALqSqImNlPuOXoXGS9gzT2Q2O1lirvlFie6AfPaqHO13v/2oRXWU6m1cIDmLfMzbe
 R3kRNdimhYisYujP5a65gQuAeYNVRuvDobz55xfzezH8E7JR40BGeIwTzOZ+U+zvUxGG
 6fuDaX2EvlV+0Qd1bpnr+hY7pP+vtl/MPM2Mr6WabCZ4CU42DVraA+pk7EaP51GMoeql
 JS/4kJ1rYs3P4auLSoJAMs2J1VQedz13dohpGyuS/Svc/EcmeH6yteuxw8igAmnZAYo+
 qtil0wGbLXHA0EYA/+52f4R00CIqCYZNxY6tBiMA9nURmqsjSMR6ayNAx4mKzTlVPYsj
 MScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UnvbL98CEHfBo1vNrFlWYLH8FrRj/kftOvBXV7A9Tek=;
 b=aMMwXjwPsyZwRewvaBMIYdTkUrTEnCsYEpQ5yvuSzqL/fS1vm6+3mSJMURaa5lB4/c
 k4u3MyXhgIlVWJHAjxCyYfMS5uBPm395hiJyGNGk7AvkzuLbZoWJLTm3R//f8CJIOeBM
 VQY7WcOyweqb2lHMbJZPA4hFHtjn+89AK1r4dgU8wMQ20cVxlQmLFbUtZfXzJq+dJ+Cc
 aGqYqY1kLnBEWMCpKsC+CXZdy3RLgESkvhgV29u/BzM0mSEGBl+GSXEwP6ECt+HPdqV9
 O/GhvLxR1kxB9SkViJjdOU9AQPjI9ld6ru+PeVq0DqxbnamddwvEWxXYyivPIvqqpcUe
 HfhQ==
X-Gm-Message-State: AOAM5327IC0jPcUmXGtOcx5Xb8keoOaBXy2j60tODrSNLTfOa2K8EJ8p
 MRW4Injuw6AJl9MehgF+spkTpVxMIUFQZA==
X-Google-Smtp-Source: ABdhPJzcjSG8b5vZPC1A7ERdX79GKX19mlav/KsqcKqkmgOTw2hZzTbgA3rFeYcnGuiv8YX7ycoj/Q==
X-Received: by 2002:a5d:4b8d:: with SMTP id b13mr141496wrt.147.1624305884746; 
 Mon, 21 Jun 2021 13:04:44 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id x14sm18621042wrq.78.2021.06.21.13.04.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 13:04:44 -0700 (PDT)
Subject: Re: [PATCH v2 08/11] target/cris: Mark static arrays const
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210620213249.1494274-1-richard.henderson@linaro.org>
 <20210620213249.1494274-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f731e84f-b84a-52e5-8c5e-ad4b17951ac0@amsat.org>
Date: Mon, 21 Jun 2021 22:04:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210620213249.1494274-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/20/21 11:32 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/cris/translate.c         | 19 ++++++++++---------
>  target/cris/translate_v10.c.inc |  6 +++---
>  2 files changed, 13 insertions(+), 12 deletions(-)

>  #if DISAS_CRIS
>  static const char *cc_name(int cc)
>  {
> -    static const char *cc_names[16] = {
> +    static const char * const cc_names[16] = {

char [2]?

>          "cc", "cs", "ne", "eq", "vc", "vs", "pl", "mi",
>          "ls", "hi", "ge", "lt", "gt", "le", "a", "p"
>      };

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

