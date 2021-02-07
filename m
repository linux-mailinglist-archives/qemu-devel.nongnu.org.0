Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E7F31273F
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 20:44:41 +0100 (CET)
Received: from localhost ([::1]:53380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8pz6-0007QV-17
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 14:44:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l8pxq-0006tx-CW
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 14:43:22 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:35224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l8pxo-00060e-Rp
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 14:43:22 -0500
Received: by mail-ed1-x532.google.com with SMTP id g10so15773499eds.2
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 11:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=g6WqhSbZTmwrr6IwTRD4JR01OICW/h4xkvW30PV0DqU=;
 b=oRKmXYIby93Mg/xKZ0W41ny0HudVdS+S3HWBcWYweEOn2E/Otl9sXrEAatphpZx9we
 zol0r6QIlKXTcyndsH7IsSeK3BkGP4ZWJlS75Zw/cJnJfG3TG1CDA9Xhb+3s4fcrJfWG
 xOc3WLA0tixZRuD049D2HrLXk9NeCKlblfKjmn3rAaAVKHy8fsX+VVoZOQZjJK/Kn/kl
 h3+mGXJl7fqBakH7jmCIcuOj9PaPQ02Um34Zo2+2MZp5nHEKKVuwNh0ARDr92IiiIkIC
 RI80e0CDcgfWhGiElXJgDEqprBtNy8ulzb/nzNoPkbchm0H0YaPk2qZqbVLjz9svXWkB
 zEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g6WqhSbZTmwrr6IwTRD4JR01OICW/h4xkvW30PV0DqU=;
 b=IIsougoBHrhTsSEcgIEF/c3aW6JYkJKgEw/DwR1TU9GGDjWTKyh10i4Wq7eCFSvR+3
 cvCQ4u6dgcUrLqK5/jzX5MpLl1JuunVj0NvMcoSX/iMK0JmhBRijTrhXJj3zj6qVXMYY
 xML8ZBQiwsbMWCJOM6TQmJEi5Z3xAmenRbtg3FLk0ppnUOk24CL3uDFILQu9uv7C3Kty
 2TyIqn73UNPMA9mfG5NTJGoJb4l1y7jf1weHgGaJXPH4dNAAQHonV5BHSv3aTYIHl8tJ
 +pCCNNQJOXnqedL0h0lWmUbWZ7I8is5xJQO5nAzkCtm+YL/47yrI9TnuPieAtveDdGHo
 XiqA==
X-Gm-Message-State: AOAM5321x8Xr1s1wJicpgfUuxIgWfyJNbEZ6KVHVLHWXmYQR2pEtwgd7
 776doSj8vMNNGsZlpk7GJU0hAJJWIrVTRmZm8z5eKA==
X-Google-Smtp-Source: ABdhPJyKvgkErMTeNzXLJHqk0gdlGGPqcdLhg74xheQefy6dXTUllCNyIKc8uuCh3XUrYa8Nje9DSwFFdysajhO76HU=
X-Received: by 2002:a50:e80d:: with SMTP id e13mr13701530edn.251.1612726998562; 
 Sun, 07 Feb 2021 11:43:18 -0800 (PST)
MIME-Version: 1.0
References: <20201022120830.5938-1-peter.maydell@linaro.org>
 <d258bc62-1a17-aeed-13ac-b61297e01a04@amsat.org>
In-Reply-To: <d258bc62-1a17-aeed-13ac-b61297e01a04@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 7 Feb 2021 19:43:07 +0000
Message-ID: <CAFEAcA_T=HyjZWSXUpP1-07rwUsUsQs0rLOjQKNsm-cUAo1FEA@mail.gmail.com>
Subject: Re: [PATCH] migration: Drop unused VMSTATE_FLOAT64 support
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: Juan Quintela <quintela@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 7 Feb 2021 at 17:10, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> On 10/22/20 2:08 PM, Peter Maydell wrote:
> > Commit ef96e3ae9698d6 in January 2019 removed the last user of the
> > VMSTATE_FLOAT64* macros. These were used by targets which defined
> > their floating point register file as an array of 'float64'.
>
> Similar candidate: VMSTATE_CPUDOUBLE_ARRAY()

Isn't that still used by target/sparc ?

-- PMM

