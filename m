Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3416A68B5AA
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 07:38:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOv7M-0000Kx-HC; Mon, 06 Feb 2023 01:36:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pOv7J-0000Ki-Pc
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 01:36:41 -0500
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pOv7I-0004Ya-3I
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 01:36:41 -0500
Received: by mail-lj1-x229.google.com with SMTP id b13so11055737ljf.8
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 22:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XSre4+mk+mtlEaFM5djkMGFdRdfgzb1UsbH0xcOY+FA=;
 b=h3yt4A/voGGJ08VxGxusN7/jWicsjuXrjCRYwlCyUbBK46f/+0nrk1ALQu3k38Hl5y
 dv2v6zDQZIZt424j+lPbMj9ug22+CPTzbAvVT7vCXjQxbhIdIZ+9Uf1xFV6+0gMlOGoQ
 EqlFX76Y6efpihAXcl/1kcpphpMnVtVj5ZqaCayDEwCkX6u+HiGXub8qOxze5MMjNp2R
 b9UqDm5Veqrmljrr3Eovaz2MRHbtD+8eJucNd4xXeZjGC0nlZk420W2mpGOv4qDnR1xC
 dYEtB/tbjDKSAiI444WAbTsMi/6wcQ/+PdOrBmp1fhFphANZUMr3hKzlSvR13BtTDCaI
 HnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XSre4+mk+mtlEaFM5djkMGFdRdfgzb1UsbH0xcOY+FA=;
 b=jngx7HqjQIQdaLH6f4DfMDfmGdKWrkETu6qDZNoYaS2DAJYhHSVxF6Ob8BIYvm3Wa1
 tEOhBcGxkcHviVXyubYDl4GFjw19+xlSzI/nyQ80Q0/i81xaPPYl6Wpe7KlAULsFIP2a
 l5qb60dA1us+PQwpl53/AT6Pi/ERXEyUNQY07EjfDbN/mX4hrCepBjWPQqde8eBtGqp3
 JDZapO64zEmNbU0NFTgD5FV3Cmnuv7si4KsuciV23NzAYKrEYteytrOm2RYHyI8vokgM
 ewZbxF4NzY52xFA+5DRX+5MZwuJTFD7sW2ZmSVYQhjgdENbLYbDCsNpi76t9fn00/D+R
 Ns3A==
X-Gm-Message-State: AO0yUKVoMoQAIuVzLIHnffAm3gUgWRDKhF+zgwMk7Js3oeQiaHmcNe10
 u7aPzMs9VfCmzW+xDNkwaGXXfMXpUPry9y9ERI+ZzlR4aIs=
X-Google-Smtp-Source: AK7set8OHqN8aVKLGTvb5VQnOm+DzkNJxSt9ffuwDLd95jLXGzXOewblkTpkysl+FF3w81rasjxhOhkr/He3SkzbxTQ=
X-Received: by 2002:a2e:aaa5:0:b0:27f:bcdf:453a with SMTP id
 bj37-20020a2eaaa5000000b0027fbcdf453amr2995394ljb.116.1675665396892; Sun, 05
 Feb 2023 22:36:36 -0800 (PST)
MIME-Version: 1.0
References: <20230129182414.583349-1-marcandre.lureau@redhat.com>
In-Reply-To: <20230129182414.583349-1-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 6 Feb 2023 10:36:25 +0400
Message-ID: <CAJ+F1C+0FARQP-2q=Lc895aRoYdOOBbcYL_RXH=mVxY3V1b+NQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] Various win32 fixes & teach 'getfd' QMP command to
 import sockets
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Michael Roth <michael.roth@amd.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x229.google.com
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

Hi

On Sun, Jan 29, 2023 at 10:25 PM <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Hi,
>
> The following series first fixes a few tests on win32. The second part fo=
cuses
> on 'add_client' support, by limiting its scope to sockets and adding win3=
2
> support. Finally, it enables vnc-display test on win32, to exercise the n=
ew code
> paths and demonstrate the usage.
>
> A follow up series will add dbus display support on win32, with tests usi=
ng this
> socket import method.
>
> v2:
> - replce the propose new command in v1, with 'wsa-info' argument in 'getf=
d'
> - fix qapi/qmp for commands/events with optional arguments
> - rebase, and tags

ping

>
> Marc-Andr=C3=A9 Lureau (9):
>   tests: fix path separator, use g_build_filename()
>   tests: fix test-io-channel-command on win32
>   tests/docker: fix a win32 error due to portability
>   osdep: implement qemu_socketpair() for win32
>   qmp: 'add_client' actually expects sockets
>   qapi: implement conditional command arguments
>   qmp: teach 'getfd' to import sockets on win32
>   libqtest: make qtest_qmp_add_client work on win32
>   qtest: enable vnc-display test on win32
>
>  qapi/misc.json                          |  16 +++-
>  include/qemu/sockets.h                  |   2 -
>  tests/qtest/libqtest.h                  |   2 -
>  monitor/hmp-cmds.c                      |   6 +-
>  monitor/misc.c                          |  75 ++++++++++++----
>  monitor/qmp-cmds.c                      |  13 ++-
>  tests/qtest/libqtest.c                  |  16 +++-
>  tests/qtest/vnc-display-test.c          |   5 --
>  tests/unit/test-io-channel-command.c    |   8 +-
>  util/oslib-win32.c                      | 110 ++++++++++++++++++++++++
>  scripts/qapi/commands.py                |   4 +
>  scripts/qapi/gen.py                     |  19 ++--
>  scripts/qapi/visit.py                   |   2 +
>  tests/docker/docker.py                  |   6 +-
>  tests/qapi-schema/qapi-schema-test.json |   3 +-
>  15 files changed, 245 insertions(+), 42 deletions(-)
>
> --
> 2.39.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

