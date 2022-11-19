Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C860630F41
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Nov 2022 16:24:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owPgH-00022S-Jr; Sat, 19 Nov 2022 10:22:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1owPgF-00021w-7k
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 10:22:55 -0500
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1owPgD-000359-GK
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 10:22:54 -0500
Received: by mail-qv1-xf29.google.com with SMTP id n18so5287572qvt.11
 for <qemu-devel@nongnu.org>; Sat, 19 Nov 2022 07:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=N/E3wb1/lxWEi3W+HL3YWq+ms6NZ4USV5NoIpiKeai4=;
 b=jHqqjS4WiyAas908PkMbWOeBmr9D6rYCx5rX9qcM8Im6XZt0aRC/gJ90Ktw8POfBej
 +t+/3jfmoyHKIyiin2I5MPbGt516LQK0CzGlq7dyQP952t6W8avT2V82ESf2zZ/Oaqi6
 OHE6ESRzYISD+8ADj7k/OXZPyP2K9yzti+qu5PHcDg8HtlnQP9KzjR0rLIj++coScauA
 ID+RbUMrPJg2/iwnqnLGc+wS5pn9D0oG/USsdati8cvnTrvAM2LvBAuOU1O+y2H/8z4r
 ewzsiKetIFRFE+vkYQOXNB7XCMSitybt+LO4aHkwNxsRpYuPfLosVURteulwekfCpPMb
 Tb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N/E3wb1/lxWEi3W+HL3YWq+ms6NZ4USV5NoIpiKeai4=;
 b=1TAyPE0eBXKYLyRKpWAGxqTQerccQg8KP0vMXXo1Y3GcfcIAg4RWle50SOd30NZfFF
 v/WDWuI8AIpAwUnb/6qMJGx9/HVvv1zzCAnROL9Atyjj0Ua9Nw2LiVheaLSm0w8Rnjct
 njXn2WNeVvP/I0IEPQLKv6DsOCJRJNnFW4Wm0TAfP6KQtCUcqhvYoJkCr/CVJNZgR5uN
 ItxWaFyJp805YlI8O2ho7FTv1fusPkYPLEIBZ1FoMKRK+IrDJdKyGHzMUz6GJECYcU7a
 DG3TcwvMTmfo/NDGQa/nVDwUSXI/szMAjtizwF+uF82QQTicGJ7s0OdCwDrmFAR95RKK
 hwxQ==
X-Gm-Message-State: ANoB5pmDQB1bZkbIoqStwyk+fEwZwnTJM/kNNZ6E2e1yMKEtsrpngzch
 rKAb7yQkJlZrhQRXG9j211EWHGUhDUYsACjjl9g6HUsG
X-Google-Smtp-Source: AA0mqf4KTZimBVhRJJalcDVtDGmwxCuLBLT9q9hGaJ14CH4au+4mSOizvydkDiX/lOOsAHiDmV0KYGbIpQ3KhjydzrU=
X-Received: by 2002:a0c:ff2c:0:b0:4c6:924e:30d2 with SMTP id
 x12-20020a0cff2c000000b004c6924e30d2mr425970qvt.114.1668871371998; Sat, 19
 Nov 2022 07:22:51 -0800 (PST)
MIME-Version: 1.0
References: <20221111042225.1115931-1-bin.meng@windriver.com>
 <20221111042225.1115931-6-bin.meng@windriver.com>
 <20221118102951.42d2ce1f@bahia>
 <185421545.bPZoAotuqs@silver> <20221119111915.591afa58@bahia>
In-Reply-To: <20221119111915.591afa58@bahia>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 19 Nov 2022 23:22:41 +0800
Message-ID: <CAEUhbmULPy42=_frBYAWvPzfB_95z=Rgc5Q6E2j6BLG7hAuAUQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/19] hw/9pfs: Update 9pfs to use the new QemuFd_t type
To: Greg Kurz <groug@kaod.org>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf29.google.com
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

Hi Greg,

On Sat, Nov 19, 2022 at 6:20 PM Greg Kurz <groug@kaod.org> wrote:
>
> On Fri, 18 Nov 2022 14:38:00 +0100
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
>
> > On Friday, November 18, 2022 10:29:51 AM CET Greg Kurz wrote:
> > > On Fri, 11 Nov 2022 12:22:11 +0800
> > > Bin Meng <bin.meng@windriver.com> wrote:
> > >
> > > > With this new QemuFd_t type, it significantly reduces the number of
> > >
> > > I cannot find the definition of this type, nor the definition of
> > > qemu_fd_invalid(). Missing patch ?
> >
> > It's in patch 4. Looks like we were not CCed on that patch. :(
> >
>
> Oh I didn't check the numbering. I guess we were not CCed automatically...
>
> > https://lore.kernel.org/qemu-devel/20221111042225.1115931-5-bin.meng@windriver.com/
> >
>
> ... because this only touches include/qemu/osdep.h .
>
> Bin,
>
> Please ensure that the maintainers are in the Cc list for all
> patches in such a series, e.g. with explicit --cc arguments to
> git-send-email.

Sorry, I was only using the get maintainer script for each patch. Will
cc you explicitly next time.

>
> > > Anyway, IIUC this type is an int for linux and a HANDLE for windows,
> > > right ?
> > >
> > > According to win32 documentation at [1] :
> > >
> > > HANDLE
> > > A handle to an object.
> > >
> > > This type is declared in WinNT.h as follows:
> > >
> > > typedef PVOID HANDLE;
> > >
> > > and
> > >
> > > PVOID
> > > A pointer to any type.
> > >
> > > This type is declared in WinNT.h as follows:
> > >
> > > typedef void *PVOID;
> > >
> > > HANDLE is void *.
> > >
> > > From docs/devel/style.rst:
> > >
> > > Naming
> > > ======
> > >
> > > Variables are lower_case_with_underscores; easy to type and read.  Structured
> > > type names are in CamelCase; harder to type but standing out.  Enum type
> > > names and function type names should also be in CamelCase.  Scalar type
> > > names are lower_case_with_underscores_ending_with_a_t, like the POSIX
> > > uint64_t and family.  Note that this last convention contradicts POSIX
> > > and is therefore likely to be changed.
> > >
> > > Both int and void * are scalar types, so I'd rather name it qemu_fd_t,
> > > not using CamelCase at all so that it cannot be confused with a struct.
> > >
> > > [1] https://learn.microsoft.com/en-us/windows/win32/winprog/windows-data-types
> >
> > Not that I had a strong opinion about this issue (as in general with coding
> > style topics). It was one of my suggested type names. To make this type long-
> > term proof I suggested to handle it as if it was a truly opaque type in QEMU:
> >
>
> A true opaque type in C is implemented with a structured type and pointers
> to this type.
>
> > https://lore.kernel.org/qemu-devel/4620086.XpUeK0iDWE@silver/
> >
> > That is to explicitly not try to do things like:
> >
> >     if (fd == -1)
> >
> > at least not hard wired in user code. According to QEMU code style you should
> > probably then drop the trailing "_t" though.
> >
>
> Yes, either one is fine I guess. Most important part is to provide
> a documented API to manipulate that type since, no matter the name,
> it is still a scalar type that can be manipulated as such.
>

This patch will be dropped in the next version, that means we still
use the posix fd for the 9p helpers on different platforms, but on
Windows it will be translated to Windows HANDLE internally in the
helper.

Regards,
Bin

