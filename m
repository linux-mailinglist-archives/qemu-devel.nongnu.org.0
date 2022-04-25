Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF64250DE46
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 12:55:15 +0200 (CEST)
Received: from localhost ([::1]:36446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niwN9-0004PA-2T
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 06:55:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1niwKR-00030o-72
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 06:52:28 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:44880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1niwKP-0000mB-9L
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 06:52:26 -0400
Received: by mail-ej1-x62d.google.com with SMTP id u15so28732258ejf.11
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 03:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KJeiWUwSTxBqjtPeV8FyZpVhxnTLR+cqqsiRV+/VniU=;
 b=OoTwx8mWY1KxlNg7ff+ppjHRlf0bz/sLWPLFrS1fIQsyZ5caCl+h097369hAIkblkI
 hPyTwo6lQaSak91OlOpTBGclo0FvZtRMI8CZarlArHTnp4xue8qujNk+NI/8e33simqo
 sfHTdxeni6nJfQduRAelAuMuZDIrnSPkfJKAEy6GJHT09kWtmfCd0H/3Aw4QlZolO21x
 uHyBiiINP0Y146XzyPAsClDMdc9PMrYVj6rugQ7g3O0eQLVjOP6/Bf5LFs4FSVSOvnOm
 YE0qmRned+3dPJSpQm/5Bl5/1r9J3l2dcXScbQenqMhuqMOOMdqPdGUR47ra0V7mjAkK
 MqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KJeiWUwSTxBqjtPeV8FyZpVhxnTLR+cqqsiRV+/VniU=;
 b=tUpnqGmBgF165Iq6gn+Ov9QkU0nbW47cNonFV/c/GSnc0xeGaWkwxzfeQYQ6KWttHb
 IoIYW6SspWtrtV1duR4REayE6AuY1xtv/GZdRxCvlDNTVPwth5Yd7r5Fb+sJwnFqtzsX
 G+NpS9MGIdzkNMjvyJmS/Z0XVIqrP5HNdnkLLQ/NXL+oKkCcAFZKD7PR48PhbiyhezSa
 CS8j4dSiu3F7MKA2c5NTSoOVJEcpkGbRniiRNBs9iFfhr1d20u2kUlXKbaDO1mNh9Ct0
 JYT+fqKbaTDKpKOP/muQ5VmiVO0skOky/WFf1JI1KCJEdflWkJkt+8UIiXysbLYJwLjX
 PRag==
X-Gm-Message-State: AOAM5310kGIDvb8c8i4sKZY5NDLGz23ADPoeUmwxiPHW93FGSLCvvT69
 OSc7lpvGac+4fZp+L4YN4O62j2qqSXxscMAuclM=
X-Google-Smtp-Source: ABdhPJxNeOc8uxq2gtRLHIoUr4h9HhWT1jvLkzo2/6QLLsSng73oYxslgJN/oX0Sb0EzTaQazLKTJc7Mqw67HkoYwm4=
X-Received: by 2002:a17:906:9b89:b0:6da:ac6b:e785 with SMTP id
 dd9-20020a1709069b8900b006daac6be785mr16021539ejc.295.1650883943368; Mon, 25
 Apr 2022 03:52:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220423040835.29254-1-simon@simonsafar.com>
 <CAMo8BfL__NZDQGkTRUXSbaNRoQJ7QhGmvVFy5NDGhDH5eJbguw@mail.gmail.com>
 <6c1d04ae-bbe5-4847-a2e1-5c1786c916fd@www.fastmail.com>
In-Reply-To: <6c1d04ae-bbe5-4847-a2e1-5c1786c916fd@www.fastmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 25 Apr 2022 03:52:11 -0700
Message-ID: <CAMo8BfJn5FoZOMcaZoV5ZCHC7hpViHrNPA=4q3F4nkNQ=BSTFw@mail.gmail.com>
Subject: Re: [PATCH v2] target/xtensa: import core lx106
To: Simon Safar <simon@simonsafar.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Apr 24, 2022 at 10:24 PM Simon Safar <simon@simonsafar.com> wrote:
> On Sat, Apr 23, 2022, at 2:41 PM, Max Filippov wrote:
> > I've noticed that this file is not from the original overlay (which I h=
appen
> > to have here:
> > https://github.com/jcmvbkbc/xtensa-toolchain-build/blob/master/overlays=
/original/lx106.tar.gz),
> > but has been changed (by adding '& ~1' to the 7th column), probably
> > to make some older gdb version work.
> > This change is not needed for the modern gdb versions.
> > I've reverted this change and checked that the mainline gdb-11.1
> > built with the original overlay for the xtensa-elf target correctly
> > interacts with the QEMU. Can you please confirm that?
>
> for simplicity, I just tried re-importing everything with your overlay (v=
s. the one from xtensa); both actual code execution & gdb seems to be worki=
ng nicely. Yours is also nicer since there is about zero mismatch between w=
hat import-core.sh expects & what it has access to (... while I had to twea=
k it a bit, e.g. to skip core-matmap.inc, for it to be satisfied with the x=
tensa version).
>
> Should I send a v3 with the results from importing your variant of the ov=
erlay? (although at this point my "contribution" is really just reordering =
cores.list after running the script :))

I've fixed it up on my side, so there's no need for the v3 if everything
is working for you.
I've applied it to my xtensa tree. Thanks!

-- Max

