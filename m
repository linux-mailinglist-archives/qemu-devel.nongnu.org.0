Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A02B4140985
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 13:13:11 +0100 (CET)
Received: from localhost ([::1]:56216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isQUw-0001OK-Nv
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 07:13:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39896)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1isQU4-0000vi-Lq
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 07:12:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1isQU3-00079o-EI
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 07:12:16 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:43602)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1isQU3-00078f-9s
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 07:12:15 -0500
Received: by mail-oi1-x232.google.com with SMTP id p125so21965919oif.10
 for <qemu-devel@nongnu.org>; Fri, 17 Jan 2020 04:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lLadbbQrceG83V4N2CzOhiEUJQRbKUOQTgCWLqYJD4k=;
 b=ZGdL41dP0xpPKMDNGM1ZnYDoa3O9SxB4BsQ0JUljEP1z6t6ju6KN837UEmIZ8KV3XU
 m+RFJZQL82eokY5QtPC/uZvNonar8yEa5lgaa0xHEuQK0lpppvB9/XpoLbixOIhnr+Zi
 I/l2OM4b7VWY3CZ1kl2phP+SjiJRri8TMHd7z5qEdiVIvQ0AqaWw9zgBJdt6RIKzRNkc
 Z42+xA1GrHNOLAXkzQVRCIaA6mOeAUbhJ0ZncLQ3QcYkIrTVuO9x52qFoabzNZHYuG9y
 zY/0VCXAWmq0bYVgbjMezY1G/7ak11bGlpETrmfwAwajJIo7m3Mb9owmuTE8/gel4AFW
 0zIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lLadbbQrceG83V4N2CzOhiEUJQRbKUOQTgCWLqYJD4k=;
 b=RWHLnLxcmWKsu0yEKD5tZgKxklYD3saDv/Ogx4eaRdEK6Nb4kQzHfrZxi4pZlKPBnN
 1VT65He3yTay5oeIYA77sqKnBC1MaiuREva3W+QNVe7oiL37mlkZwpfyhOg8jJU/BcUJ
 vznsJYkwBRWmPEu+pMg9JR/9GeNGfwnnbYSHBKkAmu6x/79MWN0KbOyZ9fOtTIG2qtbe
 zv16R4yN0SzXvBfBllDoxEiPAAff4E7d4p0Cnx5yNgteq3tmAInV/LpJsqiqDLWB/NpK
 Z4Yrp6QngQcSHp6UN4jYVqP24tCtngdW/X0LHZjT5bGgxLxQ5/MVj/vLiSJwTYGPnO4S
 oFgw==
X-Gm-Message-State: APjAAAWPMik0WWkjY058xAHuj8bje+ep050wte4IOPcVE1sOPj/SZzVZ
 nRyUS2c/qGrLNcLxJm28s2gKxQpJF/2SVC817eQliA==
X-Google-Smtp-Source: APXvYqzzOwxqM652oSNNFSsD/jlScwmd1Q0oFYy8YNY5m25jzkJh6pR7Jq6kw5vMmFqGOxU/emg2uEzLeNfEgz0n2NQ=
X-Received: by 2002:aca:f484:: with SMTP id s126mr3027665oih.48.1579263134230; 
 Fri, 17 Jan 2020 04:12:14 -0800 (PST)
MIME-Version: 1.0
References: <20200114160235.308040-1-groug@kaod.org>
In-Reply-To: <20200114160235.308040-1-groug@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jan 2020 12:12:03 +0000
Message-ID: <CAFEAcA_64te7d16=8FnT9455vCwzqDxw+299voteTb7t3yZx8Q@mail.gmail.com>
Subject: Re: [PULL 0/5] 9p patches 2020-01-14
To: Greg Kurz <groug@kaod.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::232
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

On Tue, 14 Jan 2020 at 16:02, Greg Kurz <groug@kaod.org> wrote:
>
> The following changes since commit 3c8a6575985b1652b45bfa670b5e1907d642cfa0:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/usb-20200113-pull-request' into staging (2020-01-13 14:19:57 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/gkurz/qemu.git tags/9p-next-2020-01-14
>
> for you to fetch changes up to fa0f22026747fe0ea6ef4b86c4e73e2e0965f05b:
>
>   9pfs/9p.c: remove unneeded labels (2020-01-14 07:59:47 +0100)
>
> ----------------------------------------------------------------
> Assorted fixes and cleanups.
>
> ----------------------------------------------------------------

Compile failure on 32-bit:

/home/peter.maydell/qemu/hw/9pfs/9p.c: In function 'v9fs_xattr_read':
/home/peter.maydell/qemu/hw/9pfs/9p.c:2140:54: error: passing argument
4 of 'v9fs_init_qiov_from_pdu' from incompatible pointer type
[-Werror=incompatible-pointer-types]
     v9fs_init_qiov_from_pdu(&qiov_full, pdu, offset, &read_count, false);
                                                      ^
/home/peter.maydell/qemu/hw/9pfs/9p.c:2092:13: note: expected 'size_t
* {aka unsigned int *}' but argument is of type 'uint64_t * {aka long
long unsigned int *}'
 static void v9fs_init_qiov_from_pdu(QEMUIOVector *qiov, V9fsPDU *pdu,
             ^~~~~~~~~~~~~~~~~~~~~~~

thanks
-- PMM

