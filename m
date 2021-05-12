Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 984C237BB9B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 13:16:04 +0200 (CEST)
Received: from localhost ([::1]:53212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgmqR-0004zx-KO
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 07:16:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgmnq-0001uS-BN
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:13:22 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgmno-0000N8-By
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:13:21 -0400
Received: by mail-wr1-x42a.google.com with SMTP id x8so911860wrq.9
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 04:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=++zlG59kIcGW04JH3G6R/eUYQ6HcLlg60G/2dS9RCyw=;
 b=xZc1lv78hZZ4GeTayl+6BdIahOUC9sclgj/q36WckLAOrKtMXLgzV75haoT+iPZ/nI
 OObpq3tdLRq0+LJFM77AGRnIhlE8LkIfaxHknaElNmpaftuHugehFL1lReiC1nDXBcZy
 kuTedL3Tayjmi0oQB195IkFhwra2XyD98FVA0tTSYJgLjXBsBQX8qFFkCjR/2Skf5EpZ
 otsTlCZpCRZjdVizQCn+EmemOyBFqp/ya77qTzvwiVI1eq4APQQuk9XFSRatWu5/PBDk
 FT3U2kHDZi8oT1bNKAKODUXJfuRKk4Y08MveP0S0eFWz6Y932elVvahqP4IKkECdE1zg
 p2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=++zlG59kIcGW04JH3G6R/eUYQ6HcLlg60G/2dS9RCyw=;
 b=s5wbWAfeuKSMR4X1fVtptUV1tb88S3kfp0xJO//Ndw1fDgZT0fICI6woEd4JkfZoZN
 COl+Vd4SgI06D/bVCD+pqLW2+fQV+WxSbpP8yWpO8u7WR06hAMaDjoC1/zzOIgyoc9Bv
 xd1oUsG7CyReG0kpj9/7oi6UUhDzIiugvbBoZCgZeC0Y4AsXJG77vItul1O/lVKU62KP
 fYNQqZlQ0GEBYjXmAKzL4JFwKMCOTDsw3nIElnRpTAAtz7BDE0jmza3urBb9ul+Wrmjt
 /Use+dEdqbmYdvRJR5WaWAPAwVtCNTdOz4GLud8KHQR3tD5p8DD9iThcGBsCxCvAktcA
 LvVA==
X-Gm-Message-State: AOAM531aj3ezoY1PrV6hi4AOrDmmAZpVH+I5pZd6SPI425Xf+RkK7CGx
 4G9eWlt5RxVTzpcZoMESziE19Q==
X-Google-Smtp-Source: ABdhPJwCOU4qq6NG/6JgSiopGogDA030RW3lBqQLr0uENwOxMvPDHKS/R3aM7C0R2Gsm5XxQWDSfNw==
X-Received: by 2002:a5d:5603:: with SMTP id l3mr43198526wrv.79.1620817997999; 
 Wed, 12 May 2021 04:13:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g8sm854117wmp.40.2021.05.12.04.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 04:13:17 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 10E651FF7E;
 Wed, 12 May 2021 12:13:16 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-26-richard.henderson@linaro.org>
 <87a6p1gyn7.fsf@linaro.org>
 <c9b8721f-c077-37f1-345c-ce3b3ee35d77@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 25/72] softfloat: Rearrange FloatParts64
Date: Wed, 12 May 2021 12:08:56 +0100
In-reply-to: <c9b8721f-c077-37f1-345c-ce3b3ee35d77@linaro.org>
Message-ID: <87v97ofbn8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 5/11/21 8:57 AM, Alex Benn=C3=A9e wrote:
>>> +    union {
>>> +        /* Routines that know the structure may reference the singular=
 name. */
>>> +        uint64_t frac;
>>> +        /*
>>> +         * Routines expanded with multiple structures reference "hi" a=
nd "lo".
>>> +         * In this structure, the one word is both highest and lowest.
>>> +         */
>>> +        uint64_t frac_hi;
>>> +        uint64_t frac_lo;
>> This confuses me. Is this because it could be frac_hi or frac_lo at
>> the
>> "top" of the structure because of endian issues?
>
> Nothing about endianness.  There is exactly one element, so it is both
> the "first" and "last", both "high" and "low".
>
> Generic code will examine the "high" word when looking at overflow and
> things related, and the "low" word when doing rounding.
>
> This anonymous union gives the same element 3 different names.

Right, that makes things clearer. How about:

  Routines expanded with multiple structures reference "hi" and "lo"
  depending on the operation. In the case of FloatParts64 they are both
  the same word but aliased here to make the code easier to follow.

?

Either way have a:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

