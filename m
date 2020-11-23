Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D75F12C03B8
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 11:55:56 +0100 (CET)
Received: from localhost ([::1]:45584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh9Vi-0003zn-P4
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 05:55:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kh9UA-0003Pv-DZ
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 05:54:18 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:40342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kh9U7-0001RD-NR
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 05:54:18 -0500
Received: by mail-ed1-x535.google.com with SMTP id d18so16598615edt.7
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 02:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tSz0F43sKLBmBUM2wLbeZuTPj30ukEkPQPdZNLAmqOo=;
 b=M4ivXn7tfIW4DaTYNVYbWJd1p2QEXMzrWtJLQzckMRMzj8ksY52YUj4lcYLVtGdmEj
 Ow8b35w1+OT99fayPsIEs8SEIvKr8kpbHHgvaCn5uJL5Xi4PhArNmicuoq1UOOLH6KSl
 bvUWbDN6ZghPLjQuLXzyKY/zBm8pIFjxgvOzYwhP0rd03yFPT+EC1iELM6mgUKq9oxfK
 z39ztGRkM3nC56i1vD7wR2TDE+DISyt2j/ZSxGDw/zLyWuZrYrtAeO2wSgj3yVvXYZbO
 PakzdG0698N1FWHbWRUofNym1VjnoegQqWrDkpRP1mlJO9Da4osIDwc1Xt+nSAGEmNYx
 WuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tSz0F43sKLBmBUM2wLbeZuTPj30ukEkPQPdZNLAmqOo=;
 b=iUUhK8reY89HU8IAM25Mt9xfdOnGfIZjwI4ToF+0zmGUfpBiW3s8Dn1TbcxAJcmf2N
 1t35Fm7/YNUytK4TrxHo6mRxMe0aO46nLwCYKKzbq2pAb/6FyrfbpKnxqkRMAvh+mytC
 7bmRmOTesKQug1a2d9uBSjKPyIJMBAATeOF7NCcGvr8gfErVkm5XWQViBUfxuY+tlURb
 FGbjcqnnYGJbwD9xzF4UM5N/AFRfcud0SbewxZERaXEnuxoJFiyKtvcXMjN+eI5k230j
 JgLGzNnsp+LAZ6s8uOFaYXIdqCoYJfNAtlIiWQj77CwH45eChFkIjxBRhdheCuPRo0Zv
 9/mA==
X-Gm-Message-State: AOAM532rBvX9Oq1Koh9yWOUaWIunRbYnBh9gjech09HLiSqqQ8djYu9Y
 /U8pW7HeqNVXQpvTMuHIrmNLr1W5DkDV/BwTI8kU1A==
X-Google-Smtp-Source: ABdhPJytPXyMLpRSyT/rqgE4VvzITlrMD2HZMIPXwOTrB69keCD5D/MEbEPiURb+KW3p9WmcvBo3beZW+mO59nKRHrw=
X-Received: by 2002:aa7:db8a:: with SMTP id u10mr47342220edt.204.1606128854238; 
 Mon, 23 Nov 2020 02:54:14 -0800 (PST)
MIME-Version: 1.0
References: <20201120173953.2539469-1-f4bug@amsat.org>
In-Reply-To: <20201120173953.2539469-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Nov 2020 10:54:03 +0000
Message-ID: <CAFEAcA-=_STKckzXdrkf2LP0zo-Jp88vcGzi3x=ZfdeGN+qzuA@mail.gmail.com>
Subject: Re: [PATCH-for-5.2 v2 0/4] docs/system/arm: Document raspi/tosa boards
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Libvirt <libvir-list@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 Nov 2020 at 17:39, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> - Deprecate raspi2/raspi3 machine aliases
> - Document the Raspberry Pi boards
> - Document LED on OpenPOWER Witherspoon
> - Document Sharp Zaurus SL-6000 Tosa
>
> Since v1:
> - cover docs/system/arm/raspi.rst in MAINTAINERS
> - Addressed Peter review comments
> - Added R-b tags
>
> Philippe Mathieu-Daud=C3=A9 (4):
>   docs/system: Deprecate raspi2/raspi3 machine aliases
>   docs/system/arm: Document the various raspi boards
>   docs/system/arm: Document OpenPOWER Witherspoon BMC model Front LEDs
>   docs/system/arm: Document the Sharp Zaurus SL-6000



Applied to target-arm.next, thanks.

-- PMM

