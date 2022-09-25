Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 072BE5E911E
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 07:22:19 +0200 (CEST)
Received: from localhost ([::1]:46836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocK5p-0003Do-2U
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 01:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocK3V-0001qy-4o
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 01:19:54 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:36490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocK3T-0005zU-6J
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 01:19:52 -0400
Received: by mail-qv1-xf33.google.com with SMTP id g4so2560822qvo.3
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 22:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=9rntpNV6RX2HbqV/FMSqRo3kstDzDCJHgU6qV6dgid4=;
 b=mZa/scEfMYekRpZ+euPvwiJkZ47cdIQZrLkhXtXufwu5kBoeDQqo2BrGIKxhggcV4K
 vNW39Bv/qV23P3x0jQnkenrwIgonmcrjWANpwr1gO4GYSZtdkEJX47hnBhBTtmkyD1hu
 bP9Vo8F+MF9FM9Lzzf2WFzbNry86j/kxNXNXeLIvqIMYdcl53bJyjNoDlbLgETKkAQja
 RPFu+UrfOyynR4bK04NPTMl/QsgTqvwg6b51yZvqhyaFCdDBg/FfH8DNSOrdxYhE0/9z
 jxS+DXcxbbTJXsCjQDjzM6EfeCrQSH2GUu4VlV0FmqR2TRXpFFpTHNKMGVbBK95kTGCJ
 8rlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9rntpNV6RX2HbqV/FMSqRo3kstDzDCJHgU6qV6dgid4=;
 b=2DoUuqgRjGgmNAitvZkYq+diC7SJeXUMXHo/7VyeZvfy5J6Bc94Mlg5qg7cr8GHNeD
 cKTqiSh0oCF8aHIIIOA+RSjnMNKXhs+f84ll4eAy/R5B4LPlc88csrX5gxbs9ISVjccj
 FF24B1+0EexsAJQZWbzdN3QYqqoTp/88j5aVc+ukQ8nr7Npd+mNE7BXTWMGsY0g5HjLI
 0tCM33AsfnkKlLA3KxOYKOEgvW/oE+uV0tELJGj5IbNV4WCfMe+mCRJt5FlgEUfuVKwP
 JSKTDKLQS+3q3TpsnIF2WYqCq9cB2pWDGQOhzItlzm5gljQ16nhSyWj+xcXEjrq6a61P
 j4lw==
X-Gm-Message-State: ACrzQf1RgUQk3GPb1al1ITVVlzE5fz037NiWwWITwFVPON/uE/iKrgVz
 drm970vEHY3kn9Sbx4wR2DdXGuo6FWIZ4uZ/2z4=
X-Google-Smtp-Source: AMsMyM46ZSVSfbSBU3afpIx7Fd2Fc6huGRlx1R8s+WSulmmSH2y1hlmQLQaJXXyjF3yOhxjjj5eG2CtEooVdy3h6QfE=
X-Received: by 2002:a0c:810f:0:b0:47b:299a:56d7 with SMTP id
 15-20020a0c810f000000b0047b299a56d7mr12855892qvc.12.1664083189845; Sat, 24
 Sep 2022 22:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-26-bmeng.cn@gmail.com>
 <CAJ+F1C+oUW0Cj4BxH_HecV=b+ZA_LtOZDULWQYd4rHjwE_29eg@mail.gmail.com>
 <CAEUhbmX6t_QAOOu2KFCaK63ykNJNBkW-vMa1uUsbXo=KfGmEvw@mail.gmail.com>
In-Reply-To: <CAEUhbmX6t_QAOOu2KFCaK63ykNJNBkW-vMa1uUsbXo=KfGmEvw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 25 Sep 2022 13:19:38 +0800
Message-ID: <CAEUhbmVZL8rysyY2DMVA-KX_yoPEv55GAFvOgvNXoJ8_jtMUrg@mail.gmail.com>
Subject: Re: [PATCH v2 25/39] chardev/char-file: Add FILE_SHARE_WRITE when
 openning the file for win32
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf33.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Sep 24, 2022 at 4:10 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Sep 23, 2022 at 4:09 AM Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> >
> > Hi
> >
> > On Tue, Sep 20, 2022 at 2:33 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>
> >> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> >>
> >> The combination of GENERIC_WRITE and FILE_SHARE_READ options does
> >> not allow the same file to be opened again by CreateFile() from
> >> another QEMU process with the same options when the previous QEMU
> >> process still holds the file handle opened.
> >>
> >> This was triggered by running the test_multifd_tcp_cancel() case on
> >> Windows, which cancels the migration, and launches another QEMU
> >> process to migrate with the same file opened for write. Chances are
> >> that the previous QEMU process does not quit before the new QEMU
> >> process runs hence the old one still holds the file handle that does
> >> not allow shared write permission then the new QEMU process will fail.
> >>
> >> As per [1] we should add FILE_SHARE_WRITE to the share mode to allow
> >> such use case. This change makes the behavior be consistent with the
> >> POSIX platforms.
> >>
> >> [1] https://docs.microsoft.com/en-us/windows/win32/fileio/creating-and=
-opening-files
> >>
> >> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> >> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >> ---
> >>
> >> Changes in v2:
> >> - Update commit message to include the use case why we should set
> >>   FILE_SHARE_WRITE when openning the file for win32
> >
> >
> > As discussed in v1, I would rather leave that patch out of this series,=
 since the visible issue is solved differently elsewhere.
> >
> > Also, I disagree with the approach to make windows behaviour consistent=
 with posix here, since I consider the windows behaviour (exclusive write a=
ccess) superior. I would rather teach the posix implementation about exclus=
ive write access.
> >
>
> Okay, will drop this patch in v3.
>

Oops, I drew the conclusion too early.

Actually there is another test case that needs this patch, which is
boot-serial-test. Log below:

# starting QEMU: ./qemu-system-x86_64 -qtest
unix:G:\msys64\tmp/qtest-37112.sock -qtest-log nul -chardev
socket,path=3DG:\msys64\tmp/qtest-37112.qmp,id=3Dchar0 -mon
chardev=3Dchar0,mode=3Dcontrol -display none -M isapc -no-shutdown
-chardev file,id=3Dserial0,
path=3DG:\msys64\tmp\qtest-boot-serial-sHH9FS1 -serial chardev:serial0
-accel tcg -accel kvm -cpu qemu32 -M graphics=3Doff -accel qtest
qemu-system-x86_64: -chardev
file,id=3Dserial0,path=3DG:\msys64\tmp\qtest-boot-serial-sHH9FS1: open
G:\msys64\tmp\qtest-boot-serial-sHH9FS1 failed

The serial chardev file was created by the qtest executable with
g_file_open_tmp(), and later opened by the QEMU executable.
g_file_open_tmp() opens the file with FILE_SHARE_WRITE, see g_open()
for the details.

Then based on https://learn.microsoft.com/en-us/windows/win32/fileio/creati=
ng-and-opening-files,
there is only one case that first call to CreateFile with
GENERIC_READ, FILE_SHARE_WRITE, and second call to CreateFile with
GENERIC_WRITE, FILE_SHARE_READ is allowed. Other combinations all
require FILE_SHARE_WRITE in the second call. But there is no way for
the second call (in this case the QEMU executable) to know what
combination flags were passed to the first call, so we will have to
add FILE_SHARE_WRITE to the second call.

I will add more details in the commit message in v3.

Regards,
Bin

