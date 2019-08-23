Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 085A09B53D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 19:15:22 +0200 (CEST)
Received: from localhost ([::1]:59874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1D9l-0004DP-3R
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 13:15:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56347)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i1D8d-0003hR-TF
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:14:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i1D8d-0007Tu-3L
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:14:11 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:37471)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i1D8c-0007TR-UC
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 13:14:11 -0400
Received: by mail-pg1-x543.google.com with SMTP id d1so6108347pgp.4
 for <qemu-devel@nongnu.org>; Fri, 23 Aug 2019 10:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UwwDyKsK20hJbCWszD7R2tx8Gw3xJoPyexTPnK2ele8=;
 b=TvNsXiTpqlLwLx4roNlEHeVKyTgEX5zVZ84ANPufUcijNdkXHEi+4HbeQTaBqZjyLQ
 rQOUzzW4bwjV6MtzLEVcQb0Xy4THSx7BTymjNVCD8r0Dj1ngRJjokhBhv/gQU0O2xBsp
 Qb1Dfx2wqNEpYqmBy2sYjqJueSQxyL4SMz1PF3ArLD03ot+DZYpW0uaYWsfdDv6xooke
 tOZ7KtZ55ZhslxxTgDbO6JjOcTPuqDytHfrM3Nb1BlZTzK4ogGrdNznL6P7EBghLpsLk
 FQJtxAuilqR3ffOca+kzmQPkOW6vSbxed2kbqxqkfcNHDNjqHgLB2SMQjFeAiFaKsFn4
 TRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UwwDyKsK20hJbCWszD7R2tx8Gw3xJoPyexTPnK2ele8=;
 b=kCjZzv1s6NKu1UcYYDCV1iN3K3fEZvBOdGnCpaUzTrWO4vsncYS3qljRFoDcr/0iKo
 nxkJdp5zqZF94zq+kohzXqUzHOTGMHqOOXyKVzzCAuttarZ0FjKC3ExV8JjyRWgWet7g
 UNAwlzXvUL/3NQAFUFw/krBAgakmquXJjwNDCbPSS5zXxgG9oB2b3v9cuy8k6GUb6tiU
 Yy0JcMiVjsJ8OwkoeVhmI0jHy+s7/Ni9aV8wyNVDbKMMvaYX5QEWkjFGgDunSG/ZYA1U
 l6gAWKDhYyl4KHJuEAsnspxBq0f5RRddEGktoYbVeT3fx9DhBkqCNtv74mVzjCbZhhgG
 gm6g==
X-Gm-Message-State: APjAAAWkOAFsLyDbsA3VGCE6nAbnBzVoBX/8tjIzdFYjKIfqdqceMfYv
 WU26PEPDcq5poKbzyMt6C7CrTg==
X-Google-Smtp-Source: APXvYqy27tQIHbuz8Kxt3PmOs65BptFnWiJDuM6EfhUqkfbyM1+MMUHSUR59Ef8nMh4a/Y/nLyXq/w==
X-Received: by 2002:aa7:9393:: with SMTP id t19mr6283753pfe.12.1566580450075; 
 Fri, 23 Aug 2019 10:14:10 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id i15sm3194848pfd.160.2019.08.23.10.14.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Aug 2019 10:14:09 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20190823135811.13883-1-philmd@redhat.com>
 <20190823135811.13883-5-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <a26e5860-7fe8-5095-3041-c0f7e188052a@linaro.org>
Date: Fri, 23 Aug 2019 10:14:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823135811.13883-5-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-devel] [PATCH 4/4] RFC target/arm: Do not build
 A/M-profile cpus when using KVM
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/19 6:58 AM, Philippe Mathieu-Daudé wrote:
> +# ARM Microcontroller profile
> +config ARM_V7M
> +    default y
> +    depends on !KVM
> +    bool

Likewise as for the previous patch, "depends on TCG".


r~

