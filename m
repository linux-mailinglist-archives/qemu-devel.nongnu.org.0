Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F52067E94C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 16:18:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLQUG-0003Zd-BJ; Fri, 27 Jan 2023 10:17:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pLQUF-0003Vi-4O
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:17:55 -0500
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pLQUD-0000aT-C0
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:17:54 -0500
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-506609635cbso71148197b3.4
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 07:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qtmOJn2ynTbarZpt4sn09eBK6F0W3nGga9MlPF8BeoM=;
 b=qMKuwTcsrrEKcPqZq+U1beo0zgEDd5gWpAx4YHRCBj5PaQbBtCA7AOLniz9QPhLuPP
 IU3SwCLJ+LBYNahQm8PhXyVKm4pEBhC907/ooMVoNgRYWoXKXWszX7urIj4bmxgX6kGW
 u0R6d/lQxpPfvjg/9+1GtXK5x8aZ1sH8A3a6nyZH9yp0McdnDU36Ro6aFfw0Gux9YF4Z
 EO2T/Y7/JnbmfkDtE7H7PNhA8NXh2F8ZMPFUXOS5u+F3qfHygfdoAGo1p6qgP21gdFR7
 ssDzCNggGchuK7SvJKsFjlaVEkNryccZC4MwUmxAD7If7IMvwgisvie2qfwhSD4RDfLz
 sb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qtmOJn2ynTbarZpt4sn09eBK6F0W3nGga9MlPF8BeoM=;
 b=J2AHE+yibr+xrxbqXIHlPMllYriTiZvo2yNdzzrGR5YR/vmkHgiq9QOrM+QARGtjtF
 rohSSxhtmxh/U54tlqP2sv4zHCR76QrC5kj36WZlKBqK74in3oZY3Q276LMBbjbYr2Ja
 tOusESRLQ6seR6K0TG6Cicr7oUK3EwnjnhXAUa1B05ZxzwA66cP3umP6UTtMV8TTj4F7
 Zof9SI6LUSMhy4XJKqHvquRh9FJq1u9s6aXx7F7aBh0QAn08CsmNoH7a1Q/6AsVbHGFF
 2MNEnvPGgKdTOz9HfudmQ0YsbApiV2ktjhmYBAGtkBAYU3t0j8bRWYzGuNPQcYnoS8RM
 TGJw==
X-Gm-Message-State: AO0yUKXx1ujH25TO6um5TMYRC5croHPrZzy5Z2zDtdP4/i12oNtrD+KR
 v9OergwVdByfmtkJYJI6DI5j1SQ3B7nYGCPWy740FItecLg=
X-Google-Smtp-Source: AK7set9MQ4KitPLSUcDuN/or8feHGShMjiiAvNw02sa3lvN6wuzB2dBVneXGl+e7uNURvBEz+4OpxAlXHKKyHV8vlTE=
X-Received: by 2002:a81:4882:0:b0:50e:79ff:776e with SMTP id
 v124-20020a814882000000b0050e79ff776emr105761ywa.206.1674832671947; Fri, 27
 Jan 2023 07:17:51 -0800 (PST)
MIME-Version: 1.0
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 27 Jan 2023 10:17:40 -0500
Message-ID: <CAJSP0QUuuZLC0DJNEfZ7amyd3XnRhRNr1k+1OgLfDeF77X1ZDQ@mail.gmail.com>
Subject: Call for GSoC and Outreachy project ideas for summer 2023
To: qemu-devel <qemu-devel@nongnu.org>, kvm <kvm@vger.kernel.org>, 
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 "Florescu, Andreea" <fandree@amazon.com>,
 Damien <damien.lemoal@opensource.wdc.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Hanna Reitz <hreitz@redhat.com>, 
 Alberto Faria <afaria@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Bernhard Beschow <shentey@gmail.com>, Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, gmaglione@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Dear QEMU, KVM, and rust-vmm communities,
QEMU will apply for Google Summer of Code 2023
(https://summerofcode.withgoogle.com/) and has been accepted into
Outreachy May 2023 (https://www.outreachy.org/). You can now
submit internship project ideas for QEMU, KVM, and rust-vmm!

Please reply to this email by February 6th with your project ideas.

If you have experience contributing to QEMU, KVM, or rust-vmm you can
be a mentor. Mentors support interns as they work on their project. It's a
great way to give back and you get to work with people who are just
starting out in open source.

Good project ideas are suitable for remote work by a competent
programmer who is not yet familiar with the codebase. In
addition, they are:
- Well-defined - the scope is clear
- Self-contained - there are few dependencies
- Uncontroversial - they are acceptable to the community
- Incremental - they produce deliverables along the way

Feel free to post ideas even if you are unable to mentor the project.
It doesn't hurt to share the idea!

I will review project ideas and keep you up-to-date on QEMU's
acceptance into GSoC.

Internship program details:
- Paid, remote work open source internships
- GSoC projects are 175 or 350 hours, Outreachy projects are 30
hrs/week for 12 weeks
- Mentored by volunteers from QEMU, KVM, and rust-vmm
- Mentors typically spend at least 5 hours per week during the coding period

For more background on QEMU internships, check out this video:
https://www.youtube.com/watch?v=xNVCX7YMUL8

Please let me know if you have any questions!

Stefan

