Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C206439F225
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 11:18:07 +0200 (CEST)
Received: from localhost ([::1]:33914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqXs6-0007Wj-DI
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 05:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqXqw-0006SV-Dt
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:16:55 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:42753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqXqs-0003sg-Tx
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:16:54 -0400
Received: by mail-ej1-x62a.google.com with SMTP id k25so25960412eja.9
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 02:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cDTp3gsCrXbDwLMtdA7zV9rCXebTJnWKpHXPpeLoWoo=;
 b=GyaEEO5EJzfZxDeYQhw1Erm/4W8rMeUg4D7qQXL7iSiYD4VenzAFDmhylTpQOzVphV
 s1qReMUEe9i1M5DSmfb67d70VCGMQMH5FEKGGewnoOTzhCbWFIWatB0GZviTrSYddhZc
 aGc0zmpK5OQhRQEfeM/DySY8Kr0r3B4zqekegsq6yjn0GlgUgUMQl2w9Sd7bF1Wxwonn
 fPgaDaapWpNiWIcBFhFjxSjntQM0kJ4fqyx4WbCglFu9pwtMee552as+Rm4IIKXYyBpS
 nRBjo1thLlgFnM66fdCE+aXi5MPvi4iBeSywdlZCMlJzGrtyPiQ7p/tv9zY3AdvZtYzc
 GNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cDTp3gsCrXbDwLMtdA7zV9rCXebTJnWKpHXPpeLoWoo=;
 b=VxVkKILd7dogpslsstKu8BB41J4pQv5862ZB6pL0y+YDn/FEWArKZ3HNajY401C8qw
 zAxJxOKn2gw54tE1tE/X1Bh5e6H9GzRvvJtEx9HKFUkXsKp51Ahwmw4E6Riq1s3tUThv
 9WTZwa4y8APcUkoqWu3di07jt8hSKM0l0dCEhB0YzHwuZsj10uOsQQkE4r4ZP8Z84G3N
 sDIV0rkzjztMJfpCvJ5IMgzaafR4SQGVgcNrmF6f3Sy6vmrleJJwnHlxCbZZRnJkgp8T
 sUfS6Zxn13DFDZDRaN4nPJIkTEtW7aq1sm3Z+l0pcLgSefogg97cLolPTPZ98M1Dzy32
 SVdQ==
X-Gm-Message-State: AOAM532094Jp1gXOPdqD1L0I0UqDGUW7AI5TKH9oFG3D69m6TYiLGKt2
 29tMv3IPhGM/bPxWCLLiRNr+cy7yu0lgbCoktQRaGQ==
X-Google-Smtp-Source: ABdhPJzWuwgxsZ17uNToqfTP0W2Oe1S9RRSR72vcn0rWpDJNy8sZ5sEfFvaPwh+PntB/iTLqSIBreExjpq+DuepoKIw=
X-Received: by 2002:a17:907:9047:: with SMTP id
 az7mr22239524ejc.4.1623143809025; 
 Tue, 08 Jun 2021 02:16:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210603145138.5851-1-shashi.mallela@linaro.org>
In-Reply-To: <20210603145138.5851-1-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Jun 2021 10:16:15 +0100
Message-ID: <CAFEAcA9D+UPfVfU+Z+8mShL1awxrw=0utgZ=kvRV=_Jx1n1yRQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] tests/data/acpi/virt: add IORT files for ITS
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Jun 2021 at 15:51, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Added expected IORT files applicable with latest
> GICv3 ITS changes.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>

I assume this is intended to fix the 'make check' failure with
your ITS patches? This needs to be part of the ITS patch series,
and it has to be a multi-step process. This is documented in
a comment at the top of tests/qtest/bios-tables-test.c --
basically you start with a commit that says "temporarily
differences in these tables are OK", then you have the commits
that add the changes to the system that cause the tables to
change (ie the patch which enables the ITS on the virt board),
and then after that you update the expected tables and remove
the bit that says "differences are OK".

thanks
-- PMM

