Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79ECA3994B5
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 22:39:52 +0200 (CEST)
Received: from localhost ([::1]:39248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loXeZ-0001Nw-4S
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 16:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loXdc-0000hI-Sk
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 16:38:52 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loXdb-00073R-73
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 16:38:52 -0400
Received: by mail-wr1-x42c.google.com with SMTP id z8so3548944wrp.12
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 13:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ikiqaTOSZtQ61js9gZ5sZPtzLt/Q6fQF2W8C/82rh3k=;
 b=mgpOrMQ+IFQiaCyuaYS5rcTPpZP/Ja2RKUK+hOpVkTGGYjpkAcQV9ShwzKvCYwXE0R
 QSPvLEL4+9/HdaU/ieY+aQSURHn2OSZmKQHURQIHgdNa/i7860zTuhRyO6wm3EJl8JxX
 64qRHiii3Ja3ktrxnoj4ghON1P9LWfaWZToF8u0SbYA2i8lhSFHP53MCvq88HwPx39ph
 g8ipwQrApAcNUe00LR7f3W058Iv7p7VCTbj9InzjMyd+JJni3W6JZZ36CPWutFInBceH
 oys1fqHWeMop09wSngrLhUNfmjmt+qG/Be1luc4ajgoj0/KMuN5PsEGeBM5P27yYVeld
 ya0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ikiqaTOSZtQ61js9gZ5sZPtzLt/Q6fQF2W8C/82rh3k=;
 b=lxa3qajizblQic/L19HnO7i/UETUFcQTqSmxHEiq+a4uEUbfBuFFg+kd8nkwKfUWeW
 DiiUruUZ1/jYFsV5/7UC4wAqVutXY0+Z6B7NwS5nYfOrfRe68SCS16LvuhJacOx09TF1
 UThLQTE/4mGwvnmtCqmAbnrUUMIUItUslk/KC2wYL+fAtB4SUb4GRqLLb08NksREHkCp
 JNWxZYa25ClBqWiHPlKpiM1A0SF847UhbJGRVBL4ZmUzS2e/MkNrl4EuBw/Q/x6ck7Oj
 Ig1RGhjSqPZm/hm584vetPpARbfTCU6iHQcSV6EZaCtmiXj4668EfOH6lhdO4dwxKQmg
 fTaw==
X-Gm-Message-State: AOAM532Q10taVg7g0X61emXxLt0CbsKwXvYn+Ci/0tFZIeV24JLgmMfB
 OVYKl1i8tT9ThD+9gjb8ydAC6g==
X-Google-Smtp-Source: ABdhPJyG9aMnn2rChirHQ3fiez29JvT2f72/Mj7X2bxCWdvFdPHi/oj/uXs7DY3XpgI9jkuxIY3Erw==
X-Received: by 2002:a5d:58c8:: with SMTP id o8mr2995100wrf.299.1622666329218; 
 Wed, 02 Jun 2021 13:38:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u8sm3581115wmq.29.2021.06.02.13.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 13:38:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 72B301FF7E;
 Wed,  2 Jun 2021 21:38:47 +0100 (BST)
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-5-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 04/28] softfloat: Move minmax_flags to
 softfloat-parts.c.inc
Date: Wed, 02 Jun 2021 21:36:38 +0100
In-reply-to: <20210525150706.294968-5-richard.henderson@linaro.org>
Message-ID: <87wnrc9f3c.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

> Rename to parts$N_minmax.  Combine 3 bool arguments to a bitmask,
> return a tri-state value to indicate nan vs unchanged operand.
> Introduce ftype_minmax functions as a common optimization point.
> Fold bfloat16 expansions into the same macro as the other types.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
<snip>
> -        switch (a.cls) {
> -        case float_class_normal:
> -            a_exp =3D a.exp;
> -            break;
> -        case float_class_inf:
> -            a_exp =3D INT_MAX;
> -            break;
> -        case float_class_zero:
> -            a_exp =3D INT_MIN;
> -            break;
> -        default:
> -            g_assert_not_reached();
> -            break;
> -        }
> -        switch (b.cls) {
> -        case float_class_normal:
> -            b_exp =3D b.exp;
> -            break;
> -        case float_class_inf:
> -            b_exp =3D INT_MAX;
> -            break;
> -        case float_class_zero:
> -            b_exp =3D INT_MIN;
> -            break;
> -        default:
> -            g_assert_not_reached();
> -            break;
> -        }
> -
<snip>
> +    if (unlikely(ab_mask !=3D float_cmask_normal)) {
> +        switch (a->cls) {
> +        case float_class_normal:
> +            break;
> +        case float_class_inf:
> +            a_exp =3D INT16_MAX;

We've gone from min/max of our internal representation to INT16_MIN/MAX
- I guess that doesn't break until we get to Float256 but why the change?


--=20
Alex Benn=C3=A9e

