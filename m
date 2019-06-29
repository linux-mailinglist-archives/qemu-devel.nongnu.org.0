Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A288C5A8D7
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jun 2019 06:08:14 +0200 (CEST)
Received: from localhost ([::1]:37508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hh4er-0004Hu-8w
	for lists+qemu-devel@lfdr.de; Sat, 29 Jun 2019 00:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39721)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jimw@sifive.com>) id 1hh4db-0003sF-Sy
 for qemu-devel@nongnu.org; Sat, 29 Jun 2019 00:06:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jimw@sifive.com>) id 1hh4da-0000NS-Hf
 for qemu-devel@nongnu.org; Sat, 29 Jun 2019 00:06:55 -0400
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43]:35863)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jimw@sifive.com>) id 1hh4da-0000Jm-Bd
 for qemu-devel@nongnu.org; Sat, 29 Jun 2019 00:06:54 -0400
Received: by mail-vs1-xe43.google.com with SMTP id s141so2365024vsc.3
 for <qemu-devel@nongnu.org>; Fri, 28 Jun 2019 21:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Eli6SkdmsHgSlE2autiwPy6txd43VBuIUQ78qtR9Wlg=;
 b=EzhUmD0Qbwp+R51H1cSRbB1Pzh8Mc6daIVEBZQ/ebNH7tVypvjo/CYdcXuE7vX9PbL
 fYiYW5dF6dmlwML5bR5P3a78iW+6mvvJuK+kfupuXXwcAfmRI8+iDCtKd/bHcPrmVMS/
 crzp3BhQVJfiiFeSPPfWbGIZ6Wgga4PRXs3MVZ5LezRShs3wW+lCBQngP7UlhdQxJEkO
 VWjakz19a1XpFefHUUkDrl79dhiyf2H6Qzpdp5olo/9PaHJYNp9xW1KsPBj9K+iOWpCy
 D8FakDX+ItRqarXdFZ7NzJoRO4MQGbdC9mVgR+kkDWgDv8pd/NSTQSv02CcH6FFRY5Y8
 ybYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Eli6SkdmsHgSlE2autiwPy6txd43VBuIUQ78qtR9Wlg=;
 b=LnSZoXIGjP3tbTVmIOcVUUpl9zIz3FuQmUVrpAf0UaATtaSBkgxQ/5O1vfjrqJpkbD
 zZYvNpxLmLfmaRkJs0fEH929cuvEK3VuWTUj2l18wN1QRJtiboskaUe6C/zrfRyBfmXV
 pIhMKds26I0u7YqzT3iDMnOOzbJb02LZjLS0kqx+rONk025IphzKn6eZMhaELSD6BuAC
 4T5y3AornVv7tza92g7PQj7wyhsHzccjmxbuAlJzCd3M4WEBQnP0MiRFJyk+SIyIFcjH
 LHpT7YrgpHEelt96E1BKiPlRa0gUVKSWa/615MUvYhZpz15aydN7WzG7yZ9bLRR6Idf0
 +Wvw==
X-Gm-Message-State: APjAAAWI/aCw4burmPzeOFl62qlVk53pqp5tfHOPTsIIKYRd+R3VHIv1
 bkOnoq2IKfzkLqERfCpfMLM5skxamtWD2WXbXqOcJA==
X-Google-Smtp-Source: APXvYqw4FAvgqZGD652zFkAnYUkJLPbxaz+IyynqnKsGjYXz4USQL15uu9AhkDdhDMMaty9PLjrxy6S/b3hVDlD3zrw=
X-Received: by 2002:a67:ebcb:: with SMTP id y11mr8569050vso.138.1561781210843; 
 Fri, 28 Jun 2019 21:06:50 -0700 (PDT)
MIME-Version: 1.0
References: <1561718618-20218-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1561718618-20218-2-git-send-email-aleksandar.markovic@rt-rk.com>
 <CAL1e-=gMvPy9SEQicj1d=X0cSu84WuiNXbtacOS5zJoqyXQv+A@mail.gmail.com>
In-Reply-To: <CAL1e-=gMvPy9SEQicj1d=X0cSu84WuiNXbtacOS5zJoqyXQv+A@mail.gmail.com>
From: Jim Wilson <jimw@sifive.com>
Date: Fri, 28 Jun 2019 21:06:40 -0700
Message-ID: <CAFyWVaaQX4MG+76+vt-2qvGq7JeZcJFyXZp9Nw+xuwWLc=pHHA@mail.gmail.com>
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::e43
Subject: Re: [Qemu-devel] [PATCH v16 1/5] linux-user: Add support for
 translation of statx() syscall
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
Cc: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, qemu-devel@nongnu.org,
 amarkovic@wavecomp.com, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 28, 2019 at 5:53 PM Aleksandar Markovic
<aleksandar.m.mail@gmail.com> wrote:
> This patch went trough several transformations in last few days, and I am=
 a little worried that we forgot the primary reasons/scenarios why want it =
in the first place. In that light, may I ask you to recheck this latest ver=
sion of the patch, v16, against your scenarios (you mentioned earlier you h=
ave two significantly different flavors of your scenario, one with Ubuntu 1=
6, and another with Ubuntu 19)?

My use case is that I want 32-bit RISC-V user mode to work.  This
requires a riscv syscall list patch that Palmer Dabbelt added to his
patch set, and the statx patch that is part of your patch set.  The
statx strace support is not required for this use case, but should be
added for completeness as all of the other stat family functions have
strace support, so statx should too.  Since the statx strace patch
needs statx macros that old systems don't have, I test on Ubuntu 16
(no host statx) and Ubuntu 19 (with host statx).  On Ubuntu 19, statx
strace should be fully pretty printed.  On Ubuntu 16, qemu should
still build despite the missing macros, and statx strace should be
partially pretty printed because of the missing macros.

I removed the old patches, updated qemu, added the new patches,
rebuilt qemu, and reran the gcc testsuite for rv32/rv64 Ubuntu 16/19
and it still works as expected.  I also manually checked strace for
rv32/rv64 Ubuntu 16/19 and that also still works as expected.  So this
looks good to me.

I'm leaving on a trip tomorrow, and only taking one laptop with me, so
I won't have access to my Ubuntu 19 machine anymore.

Jim

