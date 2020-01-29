Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E92614C41D
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 01:44:31 +0100 (CET)
Received: from localhost ([::1]:39380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwbT3-0001r0-Tu
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 19:44:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48187)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iwbS0-0001SN-Tl
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 19:43:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iwbRz-0007FG-W4
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 19:43:24 -0500
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:33587)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iwbRz-0007EV-Q0
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 19:43:23 -0500
Received: by mail-il1-x134.google.com with SMTP id s18so12064470iln.0
 for <qemu-devel@nongnu.org>; Tue, 28 Jan 2020 16:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VS+vKyfO8Fkg9jPR4zYGYP24JQ14xO5DE4rQjtZfyoM=;
 b=UwQ3tQHQisY1OjiPGnnNfvHB+fLSXQT27xhopkIu3cKBOg3raQ7EW/i8m9NpsrHy/E
 oX1TIouJS8uAZ6jhFlebm6qnG8zHhid5CrolknnJkyj1wNgL7GrZSZ4SNs36UWpW6i/p
 ox/Zv9P5FtbAOyKRwogpTBo7HkMVgYMzyo8OswNHCYI3UKSA1DF+G+NTdjc/JrETjwsx
 uRpwbmL9ARiByegYl1PA751GyDB98nbAbxel9PUUt6RQgHcC1lM+XOvZSf51uFfRFzBP
 lPo4n0KgNzsila1Ea8XF4mtO1GrxfGscPPqp51Wiz+8fMxJLSdDtSMjMJyQNd2swvVrC
 vBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VS+vKyfO8Fkg9jPR4zYGYP24JQ14xO5DE4rQjtZfyoM=;
 b=HIOa58oj+1vufa6TFUKBmPrjIkDGcJgKFXQZ5QCAC8O2le7fnFrhBsoVIfYZOb8J+q
 uhXcG0n7ntM9cjhXFPIwTBFweZQqrNZOs1qDVwOZkvg5E+Ea3COzVVxzIZdkYc8wPxP0
 +nME7p8Smq2HRJBvNvWs+Jg7MxVgGCF/AtQl7KYArfRQ3qoOCAJhEMgoe5m73TECOYBR
 +RyXVdOeexA1XExfD2ZxKFiU/pxk9hyQWKZJRQVLlvGyI+cxXdMWbyAA6LpNJz6Btc/X
 SlPXbgCUojvWy6fecKfY4XpRztbSEYDHntuB+hBJJhUuaylajgJAZ2iXWioR5BrlF2TA
 pPMA==
X-Gm-Message-State: APjAAAUYTGQSfCt/vL9O2dvh5Xu60oHKLq3vQpFTBk1XslqZ+afpaH7j
 C0iXfbR62CzOP/R3OOqH4tMcsAB4EEWYvmy4vYw=
X-Google-Smtp-Source: APXvYqzbp/Z3OlDjHyegkbFkE4AVs7VmqgSf5umzJ0GhRqh6s+tiZ9Hc706LWPmczePJVMIZ2Qjpyuta8/QY/mIJkzk=
X-Received: by 2002:a92:d84c:: with SMTP id h12mr14843586ilq.127.1580258602995; 
 Tue, 28 Jan 2020 16:43:22 -0800 (PST)
MIME-Version: 1.0
References: <CANA1cBJVuJ8Lx5KEQGFRb7trcnOsTbb26+K_efLM+26TB_KfCQ@mail.gmail.com>
In-Reply-To: <CANA1cBJVuJ8Lx5KEQGFRb7trcnOsTbb26+K_efLM+26TB_KfCQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 28 Jan 2020 16:42:56 -0800
Message-ID: <CAKmqyKP45vT+se16sxj6NZRo2e5wck1oDuUPJw2m5papL-m4hg@mail.gmail.com>
Subject: Re: Debugging heterogeneous SoC
To: Nikita Ermakov <arei@altlinux.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::134
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 28, 2020 at 4:29 PM Nikita Ermakov <arei@altlinux.org> wrote:
>
> Hello,
>
> I am trying to debug the sifive_u SoC in the QEMU with GDB.
> SiFive Unleashed contains one E51 core and four U54 cores.
> In the hw/riscv/sifve_u.c E51 and U54 cores are placed in the different CPU clusters.
> In the gdbstub.c, it is searches only the first cluster and it always finds cluster with E51 core, if I understand it correctly.
> In the GDB with `info threads` I could see only E51 core but none of the U54 cores.
>
> Is it possible to somehow get an access to another CPU cluster in the GDB/QEMU?

Use these commands to attach GDB to QEMU:

        target extended-remote :1234
        add-inferior
        inferior 2
        attach 2
        set schedule-multiple
        info threads

Alistair

>
> --
> Thanks,
> Nikita
> B8 00 4C CD 21

