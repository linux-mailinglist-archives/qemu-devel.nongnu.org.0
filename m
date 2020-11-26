Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D77662C5365
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 12:58:04 +0100 (CET)
Received: from localhost ([::1]:53734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiFuV-0001u6-Rp
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 06:58:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiFs9-0000eF-F0
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:55:37 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:41501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiFs7-0006Vt-Rg
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:55:37 -0500
Received: by mail-ej1-x644.google.com with SMTP id gj5so2512098ejb.8
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 03:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rBm7TqlGv+Y96tWgQKyII0nQ3apBWaTPBQIEewmx53c=;
 b=UyMarC/CxiZPWUKbnRsg6fHhFhdFl+Ayxn2hWCMpvMvhN+qf2KsERFnaJeLd/gKS+3
 hbITYnXbCkVjoZ6xTpiZf+Sz2fQLEGJMlglFIqD4aEMvgQi7ckLRiM5fIX7zciaUcuJQ
 nbMXKmHGKq96Xd/vEiIg0ocOaMGF8rm5tTZaxLsCj/yump5L8ADH6wAY9ZV0+pWzahRh
 h/DGvxL9kysX9XUJVwNx5rx/egM7fm6pz8UELEX0rsB3Xp84z0JRUh8hzEvc4HEsPGib
 BQ5mC2x0r+GDQ9uj04KxO3Yi4XPu42cD0aWX/Kypnn4aVAVWw//jZ5mz5fjY2PXWtvqX
 ZP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rBm7TqlGv+Y96tWgQKyII0nQ3apBWaTPBQIEewmx53c=;
 b=bOyZ068Pu+syZYe24s9G/gNuMJOHH2OUno7ZQc/hkcnjxm3GsIVGbYeH0LtFIqWBxz
 EyV6xQpn48JhhqQLHcoKxrSYhtNGU8MZTlBYc/V/eMrbccPBZS0Nrd2mvdh6rCEm4jxe
 OMM5jaK5uk1hkfisqm81soRw5Uosd/8OAwp8zCNo47CmkoAdry52WNDlDdP7nIwgsmvV
 RU5UxE6BzDZNmKqP/2PbJXsVO55EfxlDxZ3BdtkRpoiEcZe9lx/VNG/4Yi7zKhS/3gTf
 S1bitWO/JzN9UNM26p02AHw925amuVxb6CNtXK51LD+vgSNI/HUitsMHHk3r2YxZuJwp
 LE2Q==
X-Gm-Message-State: AOAM533zeE+F13ZvpjMMGUSW35iFBiTRpNwi8LYiAYQzflPuF0hrXVY5
 a4j22Hq0XGZXuZ+v5sbm+JDrRvLaoSpIfoJkHcn7qw==
X-Google-Smtp-Source: ABdhPJzCDHTLYUFIqd1p0FOpL3OWCUwSBhkiP570JuwyhKPSiAndNfd30aJM+sd31H8D4KhHWzjP9R+MZcV5fd5S1pA=
X-Received: by 2002:a17:906:5a88:: with SMTP id
 l8mr2320201ejq.407.1606391733698; 
 Thu, 26 Nov 2020 03:55:33 -0800 (PST)
MIME-Version: 1.0
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
 <20201126112915.525285-5-marcandre.lureau@redhat.com>
In-Reply-To: <20201126112915.525285-5-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Nov 2020 11:55:22 +0000
Message-ID: <CAFEAcA-P=PMn92xYG4xUo6EuQVzvCDcyTvCpO_mfyOLWLB19Xw@mail.gmail.com>
Subject: Re: [PATCH v2 04/13] compiler.h: remove GCC < 3 __builtin_expect
 fallback
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Nov 2020 at 11:29, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Since commit efc6c07 ("configure: Add a test for the minimum compiler
> version"), QEMU explicitely depends on GCC >=3D 4.8.
>
> (clang >=3D 3.8 advertizes itself as GCC >=3D 4.2 compatible)

All clangs always have advertised themselves as gcc-4.2-compatible,
as far as I'm aware. 3.4 is the version we need to care about,
I think it probably supported __builtin_expect(). (A test
of the whole series with gcc 4.8 and clang 3.4 would confirm this.)

thnaks
-- PMM

