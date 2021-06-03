Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD15399DB3
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 11:26:31 +0200 (CEST)
Received: from localhost ([::1]:47200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lojcU-0007D7-Iy
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 05:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lojZr-0005el-W2
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:23:48 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lojZp-0005xb-8W
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:23:47 -0400
Received: by mail-wr1-x436.google.com with SMTP id j14so5101157wrq.5
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 02:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=5nrcuU8gPl844vzXNe0nIlxnWePZNoX3GMIi9fVGlF8=;
 b=CUnJcmyceXCWdX8isOBOIG3rjBJk+AarBNsoHZNTRvPXQZVJBs6cYxGLoWaGaYWgKI
 p/bsVT5EuuphZTs1EXEnvNIFNG+H9I5LJJwkq6ylfolL6s93QykECHNu9ez+Dyn8hv+a
 OEYcW76E49Cxokno8hsmmf1Y056LYuSGyhgwAhJ/L1c0aFyKjB5OwvRZQU8BgXmg9YIs
 uANulOxU7Op4BxmJiq/iN0uaOlpeUc/h8WyxqBdOJ1d+RyV2sGGAkXYrH7LjLu/lYjLI
 Rx174i4SsgiGCqrPpM9y7annjeTDYgxqrtpOH9EDgCqfMoRF6iXx65qnr1VAhv18ZACU
 arGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=5nrcuU8gPl844vzXNe0nIlxnWePZNoX3GMIi9fVGlF8=;
 b=RQxF09SjJj4XzzsumKZ5+uq9EcOsYiBvwd7u45A3ch5umc8bwsB1560n+8kctvkVOb
 EACW6extrSNPaNhe4EzGTJ3XmS6mhI3GEf9yG7F8mL7FeV+twRYcKNxr77zwpu4Nwtie
 fiNrM74EXAyvEkJ4J+pZqyoLPc27CfXJKFexJPsNOZBIJweFxIEMFT4HMGoJkkVgO/2i
 U2or6KL6OGBRofCQQBb2rReFUKPRAxDMR9Viy10uqCvVMCedxH0h0bAJJW8IygnxifJU
 32lSEGXJ37npn8xT3B4XXS9+82Bkh5uOrJpZOF9Sw6hJyh8F+Vmm5Vf4tXvPXF99JZS4
 0ErA==
X-Gm-Message-State: AOAM531ahpdj77qCqqZJPRsTsfyuC4ItzWS0VqpVE2DTzztwm4VZUiMt
 tOgg+LPDQ3tmU0kistUNToQXiQ==
X-Google-Smtp-Source: ABdhPJyTqlYGxAOEJlKjC+O6WP67AScL2l4mkR7zdxjGOazEeoSqXz0cnP3JzJJw8HvNZCdy4AgH9w==
X-Received: by 2002:adf:e401:: with SMTP id g1mr5905567wrm.415.1622712223872; 
 Thu, 03 Jun 2021 02:23:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a3sm2826957wra.4.2021.06.03.02.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 02:23:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 932941FF7E;
 Thu,  3 Jun 2021 10:23:42 +0100 (BST)
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-10-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 09/28] softfloat: Reduce FloatFmt
Date: Thu, 03 Jun 2021 10:23:37 +0100
In-reply-to: <20210525150706.294968-10-richard.henderson@linaro.org>
Message-ID: <87im2v9u8x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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

> Remove frac_lsb, frac_lsbm1, roundeven_mask.  Compute
> these from round_mask in parts$N_uncanon_normal.
>
> With floatx80, round_mask will not be tied to frac_shift.
> Everything else is easily computable.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

