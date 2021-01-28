Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E95307A88
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 17:20:49 +0100 (CET)
Received: from localhost ([::1]:33726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5A2L-0002iN-0j
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 11:20:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5A0Z-0001rP-TX
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:18:59 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5A0X-00033s-S7
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:18:59 -0500
Received: by mail-wr1-x42c.google.com with SMTP id m13so5977266wro.12
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 08:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=eSRcW4z8Ig1m7M7w7mS270Z/8N6VwReBulyuoHdhsQA=;
 b=U4i+ON0pVprGRGFavaVc5q5QNpKP15oqIyoLv12KyLJucHjx5M/AUplgnmhZTwHNLg
 jIbB76ovzLs7qr7BSkbtP3VhKhV/mkxtweamDvHjSwOpFRgdY1G0TvwKtN0tDo32WnlI
 JSzZMwh3F0U8YE0pEnDwrl+HbXMbx1sAWdyoti1PZI62ntiIwtxtEaT6V+NqQpMTVtAF
 tPts/FJ/oWHrZz0YRfGlvmlON1kxsS59JQzttjv2iokeCY8/1b+pN2EMxZp5ifZJud5V
 AoqqmdpqrJhsewUFDrtrh/pqb7VJVC/sleclaArZdUu7rTULTIeTVEgD7SvgSWCmYwhE
 MvMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=eSRcW4z8Ig1m7M7w7mS270Z/8N6VwReBulyuoHdhsQA=;
 b=IKMwZA98gXJmFodn0dacDFboWG/dRIx9Dv87uTJsMrUF2HQ0yYDStlZ9s6ioSbpKlY
 3WGeyi0fpgU+RgK/r2uQZrYZJ0btu5qY5qU9O4ES0FyEEZmkSOp4dkdTRt47HafNhjF5
 EMvTXgiXBuE7UkK1zj0t/tZLkbbNsGSBGJjhgdYw4k17dQwZOeqXUHxgmvNiug8sDGPb
 4Z1gf9HTZFNCFXPbN5NeKCKw+nLjq+3soOBGrBwk7J0tf3Iyc4bpgsNd9fy1pPS+F6mH
 pOqk7ZthC42fLxxvm+5Hf4HKTAH1V8GTzy1egWQYFohQT11gHwm27FqqOBzIhqhyETR6
 xTgA==
X-Gm-Message-State: AOAM530vFBxccf5Y8KGOQqrEBZIlIJwKXTvXnXhpL6oiWG4CwD88Dk93
 QZs8TlgwEr91eyKnuRbIhJsp3A==
X-Google-Smtp-Source: ABdhPJzsZWnHEIAfzATSXShIzE4+ppF+z68yBtc8p52V9CBcID+H9d0qmJvTGBSXCVPXE9bWtPTheQ==
X-Received: by 2002:adf:f183:: with SMTP id h3mr17504955wro.30.1611850736468; 
 Thu, 28 Jan 2021 08:18:56 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y6sm6454167wma.19.2021.01.28.08.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 08:18:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B301A1FF7E;
 Thu, 28 Jan 2021 16:18:54 +0000 (GMT)
References: <20210128082331.196801-1-richard.henderson@linaro.org>
 <20210128082331.196801-13-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 12/23] tcg/tci: Merge INDEX_op_ld8s_{i32,i64}
Date: Thu, 28 Jan 2021 16:18:50 +0000
In-reply-to: <20210128082331.196801-13-richard.henderson@linaro.org>
Message-ID: <8735yluj9t.fsf@linaro.org>
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Eliminating a TODO for ld8s_i32.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

