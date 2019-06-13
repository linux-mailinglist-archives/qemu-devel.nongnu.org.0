Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB2F43254
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 05:30:16 +0200 (CEST)
Received: from localhost ([::1]:36712 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbGRL-0007iu-Vr
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 23:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54939)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hbGQE-0007Bb-2W
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 23:29:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hbGQA-0005Pv-6C
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 23:29:04 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:45064)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hbGQ9-0005O7-F2
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 23:29:02 -0400
Received: by mail-pg1-x542.google.com with SMTP id w34so10052575pga.12
 for <qemu-devel@nongnu.org>; Wed, 12 Jun 2019 20:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kPAjRA0VL56wavu8e0yujncvRDtEO/XuSjnj30YQgA4=;
 b=YM++op6SAZLXYY1NvBtxbGxJ/sZvlCyPm8BiLsOiszqUOtywdDdAnpR4bN1WnbNo24
 w7ZH04FwaIgl00WVYkd8wUNheoYFMsbnZoXYeECu1b1e2kHZqVNNBcNjYizpU9YUVqqq
 iJ0UbajvztQkxjdZ1VwWG4Ti3f5eP80kyBcvsZevHVvNCavTfPmHynYP6H9urE/+iH2s
 gz6fq22M18IRv8ln3n5TrmBnxkniLZVerEsq4aOoO3MMcQ7M5WsGoxed1X1WNQXY8PRp
 BqkjwOgpry8c+0HX49AI6u97VKwdMvgJp5cDGxoYsFpcd3Gk/1r08yImgRMxyotQTLRp
 b6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kPAjRA0VL56wavu8e0yujncvRDtEO/XuSjnj30YQgA4=;
 b=RxaUNDgV+doIAtWK9y88puATCOeleo10Zgdq/Qvb8CmkQWS/+ZXKQ6WW7XyQQ87o3k
 crKKLOGXFpgSaVDj2rECna3hdmbajLZlQYgiCofY61s8Z1+WduB8BW+ZMI9h82MkIDH+
 1DfJMyBXu4BCIlc4HwywJpVnJpUSZ4Z7SloSlBjrLCg+rwhX+2kZh2FOvGGy79om6B8E
 s2XUDyp7IirhzKCrpnWcgaTwMtHPdT1XQeBxPBMS22STBuKEhL26If6rARr5QfNHSADC
 JuDYjkmpQzOlqQK90JpqX0CCeowFV2ySRIGcuJEFw5u/9wveP2dkv95Lzgll9cORvBtc
 RggA==
X-Gm-Message-State: APjAAAV3/eRmbjb0IFmXliK88gw6N5i0m7jHbdD5ZfBMm/0TR4TuH0NW
 wzOA8rTOa/zHYsmEA0VLV5kb2RE95Xw=
X-Google-Smtp-Source: APXvYqy4Auec2SmT+ooUoBqVe4XovrwDdppRh80x9YYVqMjB4E5tmRpiiKJC3aC6Q25hZrrAXMcepw==
X-Received: by 2002:a62:4e48:: with SMTP id c69mr67627113pfb.176.1560396539548; 
 Wed, 12 Jun 2019 20:28:59 -0700 (PDT)
Received: from [10.1.2.220] (50-247-96-158-static.hfc.comcastbusiness.net.
 [50.247.96.158])
 by smtp.gmail.com with ESMTPSA id a13sm870802pgh.6.2019.06.12.20.28.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 20:28:58 -0700 (PDT)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, rth@twiddle.net,
 gkurz@kaod.org
References: <20190602110903.3431-1-mark.cave-ayland@ilande.co.uk>
 <20190602110903.3431-10-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f6654196-256e-ed4c-d180-d24d03a91c9a@linaro.org>
Date: Wed, 12 Jun 2019 20:28:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190602110903.3431-10-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-devel] [PATCH v2 09/15] target/ppc: introduce
 GEN_VSX_HELPER_X1 macro to fpu_helper.c
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/19 4:08 AM, Mark Cave-Ayland wrote:
> Rather than perform the VSR register decoding within the helper itself,
> introduce a new GEN_VSX_HELPER_X1 macro which performs the decode based
> upon xB at translation time.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  target/ppc/fpu_helper.c             |  6 ++----
>  target/ppc/helper.h                 |  8 ++++----
>  target/ppc/translate/vsx-impl.inc.c | 24 ++++++++++++++++++++----
>  3 files changed, 26 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

