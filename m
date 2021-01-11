Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D3F2F11C7
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 12:49:29 +0100 (CET)
Received: from localhost ([::1]:55602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyvhQ-0007hu-T4
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 06:49:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kyvfU-0007Fc-9O
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 06:47:28 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:35269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kyvfO-0005QX-MP
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 06:47:27 -0500
Received: by mail-pg1-x530.google.com with SMTP id n7so12395983pgg.2
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 03:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=aF/Yu0x3hnsxoa1QDIoOTSGgFkDsUETWdFvZDHJc4Y4=;
 b=aJ9Zx37rav5ow0hfm+zvYA4YpChzO84DX+7RDFSNmP1ZychE9aEqjmVqn1HoUJ88wN
 Y+yXeuHsjDYTQd8sEkk3GWA3d4tdpLE+cFmMCJxHH7C+Bh8vr75Nf4iyCULTrtA48DoU
 k/UfHmv1ctA1mk/8GLcCffdEpkK7U1bay8eOgQ0dM7cpexlMnainYF5spW/a5JMnQsna
 9yDKLZ9f7LpdIzigvi6wvYTblo60JvbxLfljNjg6OOh0FKH0JMh2O21w5TbVrbk5+PGw
 99/haS8pBcE5vUojNaPcaGPWf51aqX6Kkyg7nXCaVnASWhQ+L6hEwYMmYTtRs5weuXZS
 GuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=aF/Yu0x3hnsxoa1QDIoOTSGgFkDsUETWdFvZDHJc4Y4=;
 b=o2NJVn+yu/2+3LNK8Z0DNKAsVZJkYsaUypRHlQ2sQ7McqUqnHdRt0tYnXYY09rmZ7w
 KERXoXOxj929NDerCw79SuU5+dGX0+Ne7DBpZsG3ySMK0GXnUrhxoXlbyr0KE+bXBeFs
 lxIe2+YnRsdAOUjBmTGx9EJ48m4Gh6Nh3S26fEP5W++m5ZPxt7HLZbKI3HEB2YgQVnwk
 RHrPYtpmWsNkIsmacfrMYhC3rRq75HsQyp0YK7VeyVgwJZ0E9sym/ozOSXma8ZtXE8bb
 QHH7kTKe962sXm8KE+eVTvmv5KKTuMkdM/oxLDczjejiAp1Jla2kJSTdhCh5chc2mXAG
 pXTA==
X-Gm-Message-State: AOAM533gPqCnUjpGMAH6v+30fg1ut+461FTQDfjDZlSWxxGhpE9Wqgci
 F1pQJgy3S5pL4hh3g4EdZ8lxB728tHdrth0cu57ThQB6LO7HMpWi
X-Google-Smtp-Source: ABdhPJwAp2ziJIgC4Tkmn5V7R3bpxEuVxFR25Bm+sHHEJ+cteL9IzBZA7PekvUFkOACe1BMjYXdxXGYtHYUR7wSc7ts=
X-Received: by 2002:a65:48cb:: with SMTP id o11mr18866858pgs.121.1610365641185; 
 Mon, 11 Jan 2021 03:47:21 -0800 (PST)
MIME-Version: 1.0
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 11 Jan 2021 11:47:10 +0000
Message-ID: <CAJSP0QWWg__21otbMXAXWGD1FaHYLzZP7axZ47Unq6jtMvdfsA@mail.gmail.com>
Subject: Call for Google Summer of Code 2021 project ideas
To: qemu-devel <qemu-devel@nongnu.org>, kvm <kvm@vger.kernel.org>, 
 rust-vmm@lists.opendev.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Alexander Graf <agraf@csgraf.de>, Alberto Garcia <berto@igalia.com>,
 David Hildenbrand <david@redhat.com>, 
 Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 John Snow <jsnow@redhat.com>, 
 Julia Suvorova <jusual@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Aleksandar Markovic <Aleksandar.Markovic@rt-rk.com>,
 Sergio Lopez <slp@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=stefanha@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dear QEMU, KVM, and rust-vmm community,
QEMU will apply for Google Summer of Code
(https://summerofcode.withgoogle.com/) again this year.  This internship
program offers paid, 10-week, remote work internships for
contributing to open source.  QEMU can act as an umbrella organization
for KVM kernel and rust-vmm projects too.

Please post project ideas on the QEMU wiki before February 14th:
https://wiki.qemu.org/Google_Summer_of_Code_2021

What's new this year:
 * The number of internship hours has been halved to 175 hours over
   10 weeks. Project ideas must be smaller to fit and students will have
   more flexibility with their working hours.
 * Eligibility has been expanded to include "licensed coding school or
   similar type of program".

Good project ideas are suitable for 175 hours (10 weeks half-day) work by a
competent programmer who is not yet familiar with the codebase.  In
addition, they are:
 * Well-defined - the scope is clear
 * Self-contained - there are few dependencies
 * Uncontroversial - they are acceptable to the community
 * Incremental - they produce deliverables along the way

Feel free to post ideas even if you are unable to mentor the project.
It doesn't hurt to share the idea!

I will review project ideas and keep you up-to-date on QEMU's
acceptance into GSoC.

For more background on QEMU internships, check out this video:
https://www.youtube.com/watch?v=xNVCX7YMUL8

Stefan

