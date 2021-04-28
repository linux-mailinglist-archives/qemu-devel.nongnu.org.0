Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5456B36D9D8
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 16:51:20 +0200 (CEST)
Received: from localhost ([::1]:56746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lblX5-0001vq-EP
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 10:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lblVQ-0000vm-Qq
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:49:36 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:46025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lblVP-00066i-67
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:49:36 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 gc22-20020a17090b3116b02901558435aec1so5535706pjb.4
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 07:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GbDXv+L+U69Nr+QEnLbTORfD6v6+5G+BjzeX0aU6qEQ=;
 b=IzIuxmRr2FSSAcK1O/OeJdiw6XRkTB7C8dKTmrMcXDZR1jG0lh2RPo5fY32fmp/fBc
 kAlOi9HmgJqrD8PoudvpLSG2PYGtmz7mxUClIhd9/LKdvjEbpvsPpMpMU1zsIhFa/AMM
 WlpGd1qM4bI98vuX5GkIF5w3MAotyotVYDyRmo5SAK/q60kdMC9F6aKHHKhGxLlzVUwx
 0Z9g6mhnqZaoCQD8rrvdL/Ta3tbO1pQAuS8yGOC89Opa3ote33RsUqaxUoR/PmwEMHIq
 gK2y8SSB3ZMH2ZjMHus5VCoToppX70AI9MG3ckl7rUUcExtG44CZW+emERt3Y4olImJJ
 3rrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GbDXv+L+U69Nr+QEnLbTORfD6v6+5G+BjzeX0aU6qEQ=;
 b=Vlbte/2ZmY6bkDbWzQ2lQEeYamT2REW1x1Wt1czzo7BDsUDrKAc4Gm8mPrNvXj6/cf
 9D+Eyk+NhTQRAm3OjNCdlKkuNv4NvbbgrC8BScb2pk7+BMDyPmJx5Z4YWMWdXuj8zC5C
 O7ABpUl8XrIGBWeJA9C5alP+gm7ibYcPxki4LDUIs4HlhjFF/hhpMt8BrhK3LLEEBrLd
 jSWHpKHT6wUQ4brMbuMXMFCAObYh28oJJFUU1tQMRuwI4TJUlXt+pUVtLK5SLg74y+Od
 2hh8T5Rs/R3SChUoxzezBNwYv4xsaEFyWXV66KeJxIIhEInDkEPgTraEtcYhOlhJL4eZ
 8ziQ==
X-Gm-Message-State: AOAM533C8sRitdwI/8EKbPbxBk09fcMWvzRdNXg24xe2ZW0IvAT6p84L
 OWoqo2tfU0BzIcmm/QVcxctezw==
X-Google-Smtp-Source: ABdhPJz3ngeQf2+E8hY4sVhCqyd2alGKV8+fcsAQLhhbPZtnXpwgGs/t+sTw59vcjptOjrHEDGwXfA==
X-Received: by 2002:a17:90a:f68f:: with SMTP id
 cl15mr4421408pjb.99.1619621373807; 
 Wed, 28 Apr 2021 07:49:33 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id b7sm143708pjq.36.2021.04.28.07.49.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 07:49:33 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] hw/sparc64: Fix code style for checkpatch.pl
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210428141655.387430-1-f4bug@amsat.org>
 <20210428141655.387430-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <54e2357c-8774-2152-51c0-03c56c5f8f80@linaro.org>
Date: Wed, 28 Apr 2021 07:49:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210428141655.387430-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: KONRAD Frederic <frederic.konrad@adacore.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Fabien Chouteau <chouteau@adacore.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 7:16 AM, Philippe Mathieu-Daudé wrote:
> We are going to move this code, fix its style first.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/sparc64/sparc64.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

