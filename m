Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3127E43D01D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 19:50:50 +0200 (CEST)
Received: from localhost ([::1]:58486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfn4Z-0005H8-Uq
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 13:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfmuQ-0008Qi-CS
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 13:40:18 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfmuO-0000UG-9X
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 13:40:18 -0400
Received: by mail-wr1-x432.google.com with SMTP id v17so5438976wrv.9
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 10:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6N7nNzhFPIRYlVaEyKOYWhl4iwGDjPLQZHfgxvAJBck=;
 b=LzS8Bchw62eD3cnMXxvSUAuLNNykqQQ5ybhAqKGGnsfJ7oUxsoP9aNvzqPDEidCDWj
 1puUZBnPiXb5zOBXRv7FSg02UD6guIkSOzDfDua3qq+RbJSetzqT/sdikhl3l4Fu77+a
 PQhuULW1UBbAY7NL3vl/vkxTOjSHp1zSjoFFwp/LwoohEpkIdcheWROG8XnbXgWXKB0R
 OJuwQ9wvyCfJ6w0pXSVxebskx5GpqHhDOu63T5ur8LxSFPVpsL54aH09jucpXvNXwFsp
 7Ts3vItnHL6oouhoJqQ0GII5v0roCz+fwaQX66wHRVX35XEO4t7k0/Km3sKJGQb9QOSq
 Tc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6N7nNzhFPIRYlVaEyKOYWhl4iwGDjPLQZHfgxvAJBck=;
 b=WKMwD9KHcH/Wn8dkW4HsZyXuWGTRMQMYSXZPGgu41ZOguO+xyaQSW3B7hvgq5YvMrs
 k3684vIYCbAX8Z/s4tqI7OnGHugFws2sgemuJeSukkfDn6x36kdCeWXiFz0j35e+HExM
 64OWon0hMxPPNV7UfT30KLi0dnoM1RJqFsBbajsaQ13oo55iVqu8jDpcIVkVjRZw0W+T
 NxLZMzL3rdVbmPG+mWO/FF7T0usfsEh5JWmATolvOY7WGCnF/tR5pHyamB15aLbFYwMB
 APBNdksaLyeFlB1RxigobsykaaxoGWTUqic4RAmWmGkZpwtIq3EwbQvNbtQUof2Z4W0R
 fqWA==
X-Gm-Message-State: AOAM531H3s1K6K+bJjqHBLo+nzewzLDl7lkBuRXGBtHnTRo0jobF8mFo
 8xLhzTIFpeTnHIYjXOhSZro=
X-Google-Smtp-Source: ABdhPJwRsz3t+u3FvjA0llaOcnG4F2KtZyOnbxkRzRmKie13aBQXMEmVSN7pv2aREJp3Hwb2iDwfDg==
X-Received: by 2002:adf:dc43:: with SMTP id m3mr41736565wrj.66.1635356414360; 
 Wed, 27 Oct 2021 10:40:14 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l21sm4255373wms.16.2021.10.27.10.40.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 10:40:13 -0700 (PDT)
Message-ID: <5ed785fd-e91a-da01-1ce5-94c9881b73bd@amsat.org>
Date: Wed, 27 Oct 2021 19:40:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 27/33] target/mips: Convert MSA COPY_U opcode to decodetree
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-28-f4bug@amsat.org>
 <8f4b1c6d-1ca4-d337-a907-41414569ca71@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <8f4b1c6d-1ca4-d337-a907-41414569ca71@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.847,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/24/21 23:01, Richard Henderson wrote:
> On 10/23/21 2:47 PM, Philippe Mathieu-Daudé wrote:
>> +#define TRANS_DF_W64(NAME, trans_func, gen_func) \
>> +        TRANS_CHECK(NAME, check_msa_access(ctx), trans_func, \
>> +                    DF_HALF, DF_WORD, \
>> +                    gen_func##_b, gen_func##_h, gen_func##_w, NULL)
> 
> Again with the table.
> 
>> +static bool trans_msa_elm_d64(DisasContext *ctx, arg_msa_elm *a,
>> +                              enum CPUMIPSMSADataFormat df_max32,
>> +                              enum CPUMIPSMSADataFormat df_max64,
> 
> I think you should just arrange for the entries in the table to be null
> when the element variant is not defined.

Clever, thank you!

