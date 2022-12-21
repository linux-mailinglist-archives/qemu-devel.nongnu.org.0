Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8F86530DC
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 13:35:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7yII-000896-L3; Wed, 21 Dec 2022 07:33:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7yIF-000883-Be
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 07:33:56 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7yIC-0006yE-FN
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 07:33:54 -0500
Received: by mail-pg1-x530.google.com with SMTP id s196so10322808pgs.3
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 04:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2gUepqRJ7JuPnGa6uYh1XSbS16AVlek0FK2REpxb6AA=;
 b=jJG0EVh9zw6L1d9Pn6k0cCNhXTrHPYVTq8iOY6mOGMUpRC3CD55h/je4laY8Fv1H1M
 7HQ1Vj1tnGiaq4gBwHLfr4hWjqJYwglvx/2xxpDgszY0xCZVix239HBtL4yidQfY14Vr
 +iTdGYWT4m5lr2JGDrJPN/LZqCn3Dz3nyrDzgE7bdjLUF+IsfZ1h6VK4l4Sos2QUXNaH
 28HOkvdQm+hhhGlZz/EDKshRrEu1q45AGoF8adXG4gB0QITj9joWw1TQGVsClXj68esR
 t+zQX5f887gF69AJHmc2ZQGocnD8NNVRM66iP1gcL1wfz3Fh/f1ItGrQa4+DnPC5L4GK
 ezwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2gUepqRJ7JuPnGa6uYh1XSbS16AVlek0FK2REpxb6AA=;
 b=rZpJly2t+lt1uMKQ4tKx9/Ivc7bIbdkXRAejJmHAFHYqWZFsonAiI6bLZj+nNAfIZF
 N3sO8k3x/71Ox5C/Jh290jLnDUcDr4nOFVsiJvSHv2C8yRIFcS0aoGmU0+8tQlMJ/xbK
 QpoXQMGiEfPdKCB+hUNYxOzJsl60eNoVUSjg4vAtvbWUTkujT1eNVieGNI1MHDdljgnC
 oH1v+pYDneaC9wUENZliHkDbI4iT9btHX2hmMWjHXxZsjIY+NX8KMuCpAUsxbAKQpbIj
 MExIWY5OKoGvhT0ydwTrryJEh3CsdKPfKpPezqEp6mK7xGqp7BzH2FD8chcLttxlWSa0
 ooxQ==
X-Gm-Message-State: AFqh2koDH9u+D20o/PPeI5q1ft7cTawU5hryGvQZU5VoRdiTuTjrzYbM
 NiPUlXB6UjxkRJ7BkVi4txzLLJXEJf159IQMNQq8kA==
X-Google-Smtp-Source: AMrXdXsh83HjF9RGLEdXJCc+AKRUwIGHGh3J17Ll9HJqw+jo4kbjV/ormeZ6Trl7Ug8aqxWK9HUcA5UybqBQg5Q1TZA=
X-Received: by 2002:a63:3d4:0:b0:492:50dc:da4d with SMTP id
 203-20020a6303d4000000b0049250dcda4dmr53017pgd.192.1671626030627; Wed, 21 Dec
 2022 04:33:50 -0800 (PST)
MIME-Version: 1.0
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-3-philmd@linaro.org>
 <CAFEAcA96ncqvN9iXybCd2SrVKJ9CKsu5t3_GtdNt1ZEDAkFt0w@mail.gmail.com>
 <e8c3fdcb-81f1-7067-217c-c49e8748b84a@gmail.com>
 <CAFEAcA_jH3Zn1cFfnvsd_GhiBj1bNKscs7S7cwFa+FnTC9QC=g@mail.gmail.com>
 <Y6AFLpDEkpS+muSJ@yekko>
 <CAFEAcA9CUtdLXKPOqC0uRCyA0xQFZ_SrJ62SSDvPKESaxL3X2A@mail.gmail.com>
 <Y6JeXJn1qCkeIzuz@yekko>
In-Reply-To: <Y6JeXJn1qCkeIzuz@yekko>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 Dec 2022 12:33:39 +0000
Message-ID: <CAFEAcA96faOvyo9cqpTZm+U1iMpRphnxvXfUuqStonzGGcMTLQ@mail.gmail.com>
Subject: Re: [RFC PATCH-for-8.0 2/3] hw/ppc/spapr: Replace tswap64(HPTE) by
 cpu_to_be64(HPTE)
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>, Jason Wang <jasowang@redhat.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Greg Kurz <groug@kaod.org>, 
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 21 Dec 2022 at 01:35, David Gibson <david@gibson.dropbear.id.au> wrote:
> On Mon, Dec 19, 2022 at 10:39:40AM +0000, Peter Maydell wrote:
> > OK. I still think we should consistently change all the places that are
> > accessing this data structure, though, not just half of them.
>
> Yes, that makes sense.  Although what exactly constitutes "this data
> structure" is a bit complex here.  If we mean just the spapr specific
> "external HPT", then there are only a few more references to it.  If
> we mean all instances of a powerpc hashed page table, then there are a
> bunch more in the cpu target code.

I had in mind "places where we write this specific array of bytes
spapr->htab".

thanks
-- PMM

