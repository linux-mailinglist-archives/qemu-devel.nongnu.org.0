Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6144ECEA8
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 23:23:35 +0200 (CEST)
Received: from localhost ([::1]:37750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZfmw-0001Qr-8s
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 17:23:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZflM-0000ac-KR
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:21:56 -0400
Received: from [2607:f8b0:4864:20::b33] (port=44791
 helo=mail-yb1-xb33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZflL-0000pN-5x
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:21:56 -0400
Received: by mail-yb1-xb33.google.com with SMTP id y142so38933981ybe.11
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D20dcAe1kJAXOY+OzNUr5V4L6U3RQcIhs9F83V4oJLc=;
 b=DT63xdYtdpqn+g/LGpfIy+0d14GRD0/G7hXQMYm6rujocIxjL+v0fcdSXnnpZV4NXT
 4ENvrw2SSSifxFrISOkn4wDVyR9px3kNRv4tRiF4OpxLnymMIaMcmoBjYqRPxGCDYZmw
 KrX+7u8Ty0EJL8t18iHIE7zCdx92+QKkOfgzTcZK6plEAasXHmkOVrmTSxApj2MCQ0AT
 AVbvYue9FSsa+D1oP4Mm6qhcpqFLackeN/eNWx18HQC8qt93yHNT9mfspuEyDhHSGpqf
 SjtHXP/NelbNiFkiTzf8EaD5z1YmE2um1DZlOKmVPkxJVv4J1PFCZFhE7KBlqlayfiu7
 LRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D20dcAe1kJAXOY+OzNUr5V4L6U3RQcIhs9F83V4oJLc=;
 b=msuXyLxlJCFTuT0F3uMhkEI1Ke4G9bU0kRgZbW1I83gMmt3Ija7P31EyikAMVHC9bj
 CzAlNnmFNJo0UHL3euqB2m1Py0NGSfoAHSBHge7+ZJunzdaBJWpFMsBKJbqwZcZ4beDC
 2rFYPZh9VsOjzoNH46whdxWGdV8ufha/+KK+3dQ1u9Mf5Xk95Sgq6YTop6AyZD8tUYyf
 CruTPuUz+ofRsS765ykjVl0TCz0tg6ES5+oSpZjMbKSontiYEa3ftvhD+de2KGxz8BeH
 u6g1hlMOAKlsYbYpM7dWmij/2jH9FkfTVmtbac2L41jOLZQVQ82DHKVz6+7WnUwDEAtF
 UT/w==
X-Gm-Message-State: AOAM530UomE4tOqQn7eM7+32mPtuziYU8qc0jB+77/LG9leLBtsWNC4+
 O/++URZteN9iKwr5e/u4ckS9rULbBZvdoDaOlwpWAQ==
X-Google-Smtp-Source: ABdhPJw9n+8lb7/iB8fW1Imc32KbSCg7At6aatXu7SIZcCWHt4OEFhonfV6tLKcuOB/205nHkD+o8eSHWCowutofjms=
X-Received: by 2002:a25:7443:0:b0:637:18d3:eea5 with SMTP id
 p64-20020a257443000000b0063718d3eea5mr1628930ybc.39.1648675313842; Wed, 30
 Mar 2022 14:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220330202515.66554-1-lucas.araujo@eldorado.org.br>
 <20220330202515.66554-2-lucas.araujo@eldorado.org.br>
In-Reply-To: <20220330202515.66554-2-lucas.araujo@eldorado.org.br>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 30 Mar 2022 22:21:42 +0100
Message-ID: <CAFEAcA8sAprd9JsyCS-SbhMffNqX45WWsg8U_h8DST2xUMvJZA@mail.gmail.com>
Subject: Re: [PATCH 01/10] qemu/int128: avoid undefined behavior in
 int128_lshift
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, clg@kaod.org,
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?= <frederic.petrot@univ-grenoble-alpes.fr>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Mar 2022 at 21:26, Lucas Mateus Castro(alqotel)
<lucas.araujo@eldorado.org.br> wrote:
>
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>
> Avoid the left shift of negative values in int128_lshift by casting
> a/a.hi to unsigned.

We compile with -fwrapv, so left shift of negative integers
should always be well-defined for us.

thanks
-- PMM

