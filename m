Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B8449533
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 00:35:59 +0200 (CEST)
Received: from localhost ([::1]:52316 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hd0EI-0000se-AP
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 18:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34669)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hd0Ap-0008AZ-On
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 18:32:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hd0Am-0006NY-9I
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 18:32:22 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:36436)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hd0Ai-00058u-Hb
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 18:32:17 -0400
Received: by mail-pg1-x542.google.com with SMTP id f21so6551570pgi.3
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 15:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UVGhZBdPUAMSt/6Vmvbr/gW6Tsh9aypLt856AUMtA0g=;
 b=mAqrNjVXziTQxVIELAesC8hIC+jyIp6KLoxCSFQLt+XRxw9w9gkMge9jQEj5n7oAX5
 QsdvSmyU1CAizg01dlZSmEP5TATqL/7HL9pWUJOAaXLN1Wvs8jsWeJxQFg9aYVnZLlq0
 pUY0ZzdYrND3T5sSx5S6KS7WAJaJt17/LotgJNlzsSkBDBjKr5FE8YEmWujPpEspwiuq
 nNzSgV+igPbiaJef9XP7SSeBrjyBf2vAQzz9XnseaCtYwVA+DwIClHVJfyfInfj+EuTO
 xNxZV/QMYHmX3ewMndspeR62NeIL9Wcy+hb4nkP8zmDiDI8sXAr6SzIAZiHS07ZVk/N3
 B3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UVGhZBdPUAMSt/6Vmvbr/gW6Tsh9aypLt856AUMtA0g=;
 b=L0kaEbrwwhndaeMoO8YVYmez/JUmnypUX6ttMa0/HDSL0LxGoD3Q32EP2/mkOw37jO
 iWhh+u6PUWG88SwbwQG15Yq2an2JB3xGqGSpg4sfPV1bEgRg4b8qqdLCXdW8zNygdHV1
 48IPXZT5GkgpcHihHu+EEK/aC3avIAjzUG//TUhLbIUvVX4tvnNxm9F4BFl37lzryevT
 UvNYyRxohThkRE6LIxA614Fb82uDIox7t1zJDTz+jAR6sP6eKbyPXEx7AkF4u3kaMenA
 lAmsRrvWLBWim7u9swFoJboXXxMeIOnSAXdvmU6N0CdS3aVnwkktAiZfgJtpxZz7l0zZ
 yekw==
X-Gm-Message-State: APjAAAWB657yMVWVsNUM+wynqR1diXm2TRuBE93v5MhsGUdq9LFIIP80
 zisqkgbtECku/LhTv1PQad0tfUpRkOA=
X-Google-Smtp-Source: APXvYqw40UcChu9456gHdS2BNEazhHaoEMRb/J2q9UpU9V7lTpYBKzY0/mqiqBtlecOhLAAvvCIxLg==
X-Received: by 2002:a62:5306:: with SMTP id h6mr117964887pfb.29.1560810662095; 
 Mon, 17 Jun 2019 15:31:02 -0700 (PDT)
Received: from [192.168.1.11] (97-113-2-33.tukw.qwest.net. [97.113.2.33])
 by smtp.gmail.com with ESMTPSA id j14sm12804816pfe.10.2019.06.17.15.30.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 15:31:01 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20190614171200.21078-1-alex.bennee@linaro.org>
 <20190614171200.21078-28-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5d5ca4c7-eaeb-99c4-f443-a9833ef6bff4@linaro.org>
Date: Mon, 17 Jun 2019 15:30:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614171200.21078-28-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-devel] [PATCH v3 27/50] target/ppc: fetch code with
 translator_ld
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
Cc: "Emilio G. Cota" <cota@braap.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/19 10:11 AM, Alex Bennée wrote:
> -    if (unlikely(need_byteswap(ctx))) {
> -        ctx->opcode = bswap32(cpu_ldl_code(env, ctx->base.pc_next));
> -    } else {
> -        ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
> -    }
> +    ctx->opcode = translator_ldl_swap(env, ctx->base.pc_next,
> +                                      need_byteswap(ctx));
> +

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

