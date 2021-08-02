Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 390B13DD49F
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 13:26:32 +0200 (CEST)
Received: from localhost ([::1]:60720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAW5W-0000oz-TL
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 07:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAW4m-00006l-5w
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:25:44 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAW4i-0000li-K3
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:25:43 -0400
Received: by mail-wr1-x434.google.com with SMTP id h14so21020846wrx.10
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 04:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=8W8+jyDrcdJPoPPIyfZRKxpIUNsSy9w/GSdrzmuHHJE=;
 b=MkhO2NirOzQPa+Qg9BssGz3UkyWxtOPa83wKWZQkeA6EPLNo0NM+t6X1yAmoZJWv8w
 tquiWQy6cVv7MlRz5bdJKcn7pM584xs+lQvb8MZb0t/onF6Niypj8ySBc3c/u7NdK1Bj
 Di09JRn51BGv9Jyoy+gFku531MPCOF0zp1sJAt5SMZY9jOacaHxNKw5Fbs9bzK7zHG2I
 WmV2dcjYFI2u1pNguLnPz9qGQ+PKhFb9tX01kNSMXh9GYtOtvSKrWuHjBfI+xhx9DuTC
 /8XlG8lnLHoJabwn9lr8of/wCqyb/SvpvZ++Xs/DkgaQaGH0IEa2huHfabIasdJdPwKa
 rv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=8W8+jyDrcdJPoPPIyfZRKxpIUNsSy9w/GSdrzmuHHJE=;
 b=JGmd1SZVHSvFvmlrz5TMhx/bi0pWJCoYuXBqnUmfofZpal9CS8+zxp0KAaN509QLbw
 d94QWrRcp+3ff6ueTbCiuCtQoXlUJ9v5KH8m1BN9GpyjwVIGP4wO3Np9wqdW2OMuBuL/
 o0PR1h/BBwqVOytqBqg+ZpRwwOTua6aH2r9sVoDp1jo2iYKkZXGaUzrezhkv4muokdIj
 pqe3b+KrNMwmwvZKlvRyjhx3smZ9OCKIFJYpxmt3y8d6AVN0UaB+HDPLGRP4GZShD2AD
 wzUt7gtCzf8k1MtoJ3lqzgNcE7dCH5RPFTanU60QlmcoQcrxgNPhS/8aCrDFsP/cbUrl
 Wd/g==
X-Gm-Message-State: AOAM530jAQpxH7qnxrtQSou2hCd9Z4Y4rz99b6W4c1sYNTNwoMOMrZ8o
 PSQ9RO+P5GMnfj6wdBc6XRTN7g==
X-Google-Smtp-Source: ABdhPJx9yI8TQwQyNKdutxzfbvEi3ub2bykP5TiPQD1FdNUnHirtCv2ekWZXhUYGiU1RUBxnuJWX9A==
X-Received: by 2002:a05:6000:18a9:: with SMTP id
 b9mr16926372wri.418.1627903538309; 
 Mon, 02 Aug 2021 04:25:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m9sm10859183wrz.75.2021.08.02.04.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 04:25:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CDB0E1FF96;
 Mon,  2 Aug 2021 12:25:36 +0100 (BST)
References: <20210722065428.134608-1-ma.mandourr@gmail.com>
User-agent: mu4e 1.6.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH v3 0/5] plugins/cache: multicore cache modelling and
 minor tweaks
Date: Mon, 02 Aug 2021 12:24:52 +0100
In-reply-to: <20210722065428.134608-1-ma.mandourr@gmail.com>
Message-ID: <87eebcgkb3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: cota@braap.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> Hello,
>
> This series introduce some minor improvements/bug fixes in the cache
> plugins and multicore cache modelling.
>
> Multi-core cache modelling is handled such that for full-system
> emulation, a private L1 cache is maintained to each core available to
> the system. For multi-threaded userspace emulation, a static number of
> cores is maintained for the overall system, and every memory access go
> through one of these, even if the number of fired threads is more than
> that number.
>
> Also, raising the levels of warnings induced some warnings, this is
> fixed in it's own patch.
>
> Patches that still need review (other patches are already queued):
>     1. plugins/cache: Supported multicore cache modelling
>     2. docs/devel/tcg-plugins: added cores arg to cache plugin

Could you re-base this onto the current master please? I skipped the
patches already merged but still couldn't get the series to cleanly
apply.

--=20
Alex Benn=C3=A9e

