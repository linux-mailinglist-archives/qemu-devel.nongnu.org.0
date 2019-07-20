Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 411446F044
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Jul 2019 19:50:58 +0200 (CEST)
Received: from localhost ([::1]:52350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hotVY-0005xM-Uk
	for lists+qemu-devel@lfdr.de; Sat, 20 Jul 2019 13:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43949)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hotVF-00056I-Jy
 for qemu-devel@nongnu.org; Sat, 20 Jul 2019 13:50:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hotVE-0000oN-Qe
 for qemu-devel@nongnu.org; Sat, 20 Jul 2019 13:50:37 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:41599)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hotVE-0000mv-3M
 for qemu-devel@nongnu.org; Sat, 20 Jul 2019 13:50:36 -0400
Received: by mail-pg1-x544.google.com with SMTP id x15so5456960pgg.8
 for <qemu-devel@nongnu.org>; Sat, 20 Jul 2019 10:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RA3TfexPT02l1811xIc91OI3FOh+/3tQKs/o4UiDLhU=;
 b=i0R84YIm4TLSBq9sjS9InoZhRl1IvJHVb4oWjkGgkdbJAiuFV2dR1+Meewj6PvF+Pw
 XhOwJ6ZxeXiSvNXJ+9fhlOz4JxAf7EqL0cSAMC1lgYoHW4hMiZvKVOitACUOIij3Tv23
 47/E9VztAKAgjf0lGhnFilfmwDDrWDKCCgmorI7wIMUi5UeBp7hlZ136hoLjqcyxMve/
 4IklXfSHBdvnDB3alr8AWiTneVcIKl+yZVEIIVihXHXlx5BKRWoxN8F2B9vWnc4SRXGE
 +NtzQkohmApjlfQOaleL7onfBYHamHYC+CwY2nz22I+046kjcJ4c4lqQx+wD1i17LRUD
 0wsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RA3TfexPT02l1811xIc91OI3FOh+/3tQKs/o4UiDLhU=;
 b=kv+VwIQHCsxJnWMMHcP26N63wDukYNjdwCBnFUiOis4wLaqO4Yw/kJ4PrHHQtXtdv/
 7l8XF5c/lzVpytBiFDb4h9nrCaVScaBp+TICZaGawGkBIAq00v2saG0JybORRe0Uri6w
 tutFxF+MtEeCrboTZM5ndXeuis1JL6VNJT757gQi1ajBfgB56+sS4u9Ip/3vmK0sBBYM
 4xSUW5zN0Tl17NHbTeGA2Y8VI8/EuHAnwV8TC8eXcYjOwirCu9iLluMi4yvHvst8vvc+
 KBPP/5gDs/WrQegjrtDwPFihaVvOmOsgwKyktHavmbtDu81PNvE7qcQMuvbu1X6wg7Pj
 JuGw==
X-Gm-Message-State: APjAAAW6aZ8KyqImPrDo95hhPmA0ZTIkapw9R81GZCa7Rlg+Sji+3I2z
 T8Aht19SkzUn8lQxrMgbBbRfyg==
X-Google-Smtp-Source: APXvYqxfasx6yypF2sy0f1c/gtYtPj4J22anDlYO2OpGEci6sJ84Vb3k5VY7QKsQtlpUBi/4rEXVyQ==
X-Received: by 2002:a63:7b4d:: with SMTP id k13mr59692249pgn.182.1563645034918; 
 Sat, 20 Jul 2019 10:50:34 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id q36sm29852232pgl.23.2019.07.20.10.50.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 20 Jul 2019 10:50:33 -0700 (PDT)
To: Jan Bobek <jan.bobek@gmail.com>, qemu-devel@nongnu.org
References: <20190711223300.6061-1-jan.bobek@gmail.com>
 <20190711223300.6061-12-jan.bobek@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <39b692ff-5bda-d812-efcd-fa3190909ae2@linaro.org>
Date: Sat, 20 Jul 2019 10:50:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190711223300.6061-12-jan.bobek@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-devel] [RISU PATCH v3 11/18] x86.risu: add SSE
 instructions
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/11/19 3:32 PM, Jan Bobek wrote:
> +# NP 0F F7 /r: MASKMOVQ mm1, mm2
> +MASKMOVQ SSE 00001111 11110111 \
> +  !constraints { modrm($_); $_->{modrm}{reg} &= 0b111; $_->{modrm}{reg2} &= 0b111 if defined $_->{modrm}{reg2}; defined $_->{modrm}{reg2} } \
> +  !memory { load(size => 8, base => REG_RDI, rollback => 1); }

This one is a store.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

