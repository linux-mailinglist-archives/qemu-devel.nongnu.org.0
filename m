Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FBE5A2870
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 15:22:26 +0200 (CEST)
Received: from localhost ([::1]:38786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRZI1-0001tG-36
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 09:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oRZBN-0005xs-81
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 09:15:34 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:33590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oRZBL-000353-7C
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 09:15:32 -0400
Received: by mail-qv1-xf36.google.com with SMTP id d1so1038909qvs.0
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 06:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=gjaa6kbvxvTgPcX2OGhDh7BEsCnoKOdkkAnp9O1+Dvs=;
 b=ctGKFIisnkTgbWI5KsBg4/BgpgCXvQqh/J3wcwideSoJ2cHjfcIUVHT6HvFpU7vKA+
 bRuVIiXPqcQRo7y0hRts95Ol9cz4FpGJ6dGc8tIIh7W9fkdgOKyFJiNTcOiNCXlynP+g
 ZDlhsrUX7zf4Z3HQAMIVAusRs7Tl62xfrbMGykeVCo2Y/IqG7uVQQ0Wum4+bJVWcmmtk
 /VAacyac/ng90lq/L6upoTbl9v8p+9AYrDqqXDy58d675wQfYct5YM0E+ejriesd9LPF
 0CFSmkICBjEAa4RWjYiPm4zJwsggwXSuq4dOTx3IzXsHEXeyr1/tym2NUrVo3u/g7VEf
 kouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=gjaa6kbvxvTgPcX2OGhDh7BEsCnoKOdkkAnp9O1+Dvs=;
 b=xla/gJwqey+p+Euh4GvK1YBqMj4YoEygt8PZ9SRQbkHeja3yAVt3zSqFDhZPMTsRDF
 C3G6mTaQrtu74IeLYeSZJw/kXnrjOD1cfWkkzoUxntN900y3uouoCtLMzAgtNG5kBxeL
 ksilKLpMdQLK5GetjjhspylI5QeribBIXADd5PQapSnSzeC2jVq3GfQf1LvMEocXqIel
 VzxZVpeCCw1IvQoiIks6mtg4N/pU3v1QwmAOgJDPnOqe32Y+nd/aqzARPOR1M4VqhF1T
 y/y/TA2ovAVdLMM/QrdEWZc9AhuzgF67OynY+LyzlHTYiHnqSiiCqituJeO3nvoFNjrZ
 F41A==
X-Gm-Message-State: ACgBeo08P0q7fB0uRRlKEAOYw51ZKTi8ZJ6lINP/7Mn4W3E0QkOCo4Jp
 GZhl2sKUYIKWIg5uPfZQIQNc3PnCB1M65gMCu6dNCvEv
X-Google-Smtp-Source: AA6agR6aLRsPogaD8keEc0wOq/939eXqTVs6QE13H7kIYmHt4QbG2S+025gsxnZb+b60eoUdZ4b7XCffOt0tgBtHRqg=
X-Received: by 2002:a0c:810f:0:b0:47b:299a:56d7 with SMTP id
 15-20020a0c810f000000b0047b299a56d7mr7917825qvc.12.1661519729173; Fri, 26 Aug
 2022 06:15:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-41-bmeng.cn@gmail.com>
 <CAMxuvawYwmo=-TicWwgn-JRB0u_9a04-Rx80TphOybNQ89Pf6Q@mail.gmail.com>
In-Reply-To: <CAMxuvawYwmo=-TicWwgn-JRB0u_9a04-Rx80TphOybNQ89Pf6Q@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 26 Aug 2022 21:15:17 +0800
Message-ID: <CAEUhbmV28TJGxf9JCrN-D8rDA47vgMJ4nO0gSGBcKcyEqPxEUA@mail.gmail.com>
Subject: Re: [PATCH 40/51] chardev/char-file: Add FILE_SHARE_WRITE when
 openning the file for win32
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Aug 25, 2022 at 3:59 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Hi
>
> On Wed, Aug 24, 2022 at 1:43 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> >
> > The combination of GENERIC_WRITE and FILE_SHARE_READ options does
> > not allow the same file to be opened again by CreateFile() from
> > another QEMU process with the same options when the previous QEMU
> > process still holds the file handle openned.
>
> opened
>
> >
> > As per [1] we should add FILE_SHARE_WRITE to the share mode to allow
> > such use case. This change makes the behavior be consisten with the
> > POSIX platforms.
> >
>
> consistent
>
> > [1] https://docs.microsoft.com/en-us/windows/win32/fileio/creating-and-=
opening-files
> >
> > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
>
>
> What's the benefit to allow multiple processes write access to the
> same file? It seems it could easily lead to corruption or unexpected
> results.

This was triggered by running the test_multifd_tcp_cancel() case on
windows, which cancels the migration, and launches another QEMU
process to migrate with the same file opened for write. Chances are
that the previous QEMU process does not quit before the new QEMU
process runs hence the new one still holds the file handle that does
not allow shared write permission then the new QEMU process will fail.

> To me, it's the other way around, the POSIX implementation should
> learn to lock the file opened for write..
>

Regards,
Bin

