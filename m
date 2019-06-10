Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEBB3B2B5
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 12:05:09 +0200 (CEST)
Received: from localhost ([::1]:43098 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haHAq-0007kU-ED
	for lists+qemu-devel@lfdr.de; Mon, 10 Jun 2019 06:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52127)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haH90-0007DD-PN
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 06:03:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haH8w-00006m-Ih
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 06:03:12 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:33774)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haH8s-0008Lu-VZ
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 06:03:08 -0400
Received: by mail-ot1-x333.google.com with SMTP id p4so4523520oti.0
 for <qemu-devel@nongnu.org>; Mon, 10 Jun 2019 03:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7xRVadgGOGec3ZTlbpVtFVsT8JEI8+6BjaMdH7YDrBE=;
 b=oS9+rjn6kq++h0CzrmCKXrNKOzX0j61sksV+r7oF7FwDIvGtoG/XHBNFYAaLxCG1LZ
 BK/azD1eml74i4K7pk95uUfJ9Otme8G9KMV3kCW7wnj6x1ErCQNS8CZ9dhrAyTsWbUHg
 /6iGrFN575mwpgG+c6BxrR8uzDt9kuNlkeICgDaMf05/1ksqJnWAG0FVXz2fCM/jUDUH
 RUdUOtoF80L/ywfAHYC1pihRDGDI0/rO5tYad/x1g3BUQpKRD8y1Isnqpswg7bfpeWCq
 Ixu7t3Phc7FGhzetUtJOGHxL4qqGHcwtgRRsYNC5rI4EgyakPh+/O39r4uFPbDxTxe5y
 JDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7xRVadgGOGec3ZTlbpVtFVsT8JEI8+6BjaMdH7YDrBE=;
 b=LzGAzxYT9rLopjhdrFvoA+DjZlMVVIHOXErjkzy7HBKQfEqZ6IOwXIOXLgicWlfxkV
 AMMNM4zQSP6CaybLMROK3REP9ye8xTA+vRWhAUwd0FNi9osYA+BHaqdm91CosYSoQdFH
 84GtA5wdUOZNz47EtFf3Dzw3d7dXOfZRopEcnDtGawTBvwxvUtYJtjskIdsrWUG32twK
 u/tO0v1aFFAY+G1jf0sWCEBhxJdLUE4bO3cbeE4P6t/9g8vALLNTLjX3QjEFujw9zHsW
 wj9nrt80ycpZhCkW80fRNkk/S9kXKN4gR9RzxvdrRqtCeFmN0rs5Y/kkQbyFR/xQO24S
 FKkQ==
X-Gm-Message-State: APjAAAXmirL/bznpVlzq5s9/Ik9kARRhTueUUF0oodGLJdac9itnkIML
 fIIAwg86HsTnuMyDSB+z04wiVSutuvNlTh4pSLNRuYoUiHI=
X-Google-Smtp-Source: APXvYqwhBbUc7glIJ4ZpnfEL+ovgb2XTHL8GRVSAJVMAuPJHXuDeZVhf6zJ3+PSnjoNxrRhEipeI021zezjzqigFpEU=
X-Received: by 2002:a9d:7245:: with SMTP id a5mr29998650otk.232.1560160978060; 
 Mon, 10 Jun 2019 03:02:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190607152646.4822-1-armbru@redhat.com>
In-Reply-To: <20190607152646.4822-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Jun 2019 11:02:47 +0100
Message-ID: <CAFEAcA-2X2a_rNeg3Q4zmWgLDa=nfESMYR=rTE=+=1Mdsmw0kQ@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::333
Subject: Re: [Qemu-devel] [PULL 00/12] Miscellaneous patches for 2019-06-07
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 7 Jun 2019 at 19:21, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 0d74f3b4277a7ecb0ccb80c865797d11f8e466=
f5:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-pull-=
request' into staging (2019-06-06 14:09:14 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-misc-2019-06-07
>
> for you to fetch changes up to 516741ebae8e2baef456c10897569725663157dd:
>
>   MAINTAINERS: Polish headline decorations (2019-06-07 16:30:59 +0200)
>
> ----------------------------------------------------------------
> Miscellaneous patches for 2019-06-07
>
> ----------------------------------------------------------------
> Markus Armbruster (11):
>       qemu-common: Move tcg_enabled() etc. to sysemu/tcg.h
>       qemu-common: Move qemu_isalnum() etc. to qemu/ctype.h
>       Include qemu/module.h where needed, drop it from qemu-common.h
>       Include qemu-common.h exactly where needed
>       Normalize position of header guard
>       scripts/clean-header-guards: Fix handling of trailing comments
>       Clean up a few header guard symbols
>       Supply missing header guards
>       Clean up a header guard symbols (again)
>       MAINTAINERS: Improve section headlines
>       MAINTAINERS: Polish headline decorations
>
> Philippe Mathieu-Daud=C3=A9 (1):
>       MAINTAINERS: Remove duplicate entries of qemu-devel@nongnu.org
>

Compile failure, I'm afraid, on OSX, NetBSD, FreeBSD and OpenBSD:

/Users/pm215/src/qemu-for-merges/net/tap-bsd.c:68:9: error: implicit
declaration of function 'TFR' is invalid in C99
[-Werror,-Wimplicit-function-declaration]
        TFR(fd =3D open(dname, O_RDWR));
        ^
/Users/pm215/src/qemu-for-merges/net/tap-bsd.c:68:9: error: this
function declaration is not a prototype [-Werror,-Wstrict-prototypes]

thanks
-- PMM

