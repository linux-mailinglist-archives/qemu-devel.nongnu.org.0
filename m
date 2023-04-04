Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 590A16D61F3
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 15:09:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjgOf-0006zB-28; Tue, 04 Apr 2023 09:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pjgNf-0006vU-SM; Tue, 04 Apr 2023 09:07:26 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pjgNS-0002CL-QQ; Tue, 04 Apr 2023 09:07:14 -0400
Received: by mail-lf1-x12a.google.com with SMTP id g19so29202429lfr.9;
 Tue, 04 Apr 2023 06:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680613627;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6dgEBhBAqz2TXDGQmCc3tyJI5svGkUSabEEtOVFUarA=;
 b=lwXAbh8pkqmO0BP+zP1KrfDrXLf4AioKt/BoDYjvrGb4xPfteOEV/5ALcEllcOEjSV
 W3SysRktLFbvVU+JffHumsoUutDI8FkPkmS5QG8A2fhP1YcsaZERtCiu5Cys1g3gKmrY
 n1mzhXs8Pyrof+Bj3dq0N4hDeO0CkLQkdE58Sw325NeMrIWCHCbmdwd34NNg/aSmeODS
 FIf1AQ/bHujH1SvN7uhuxjetGR9IsjI3eX+ngfzUj93LGzclntL4LgVR1szy8bu/euy0
 IlmaFdrXpSRfWSDBRkna3zitxlczG8fOMYFbeDjgqFYYZuIW1ChsaoZWUGZZvDfghXQd
 3bHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680613627;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6dgEBhBAqz2TXDGQmCc3tyJI5svGkUSabEEtOVFUarA=;
 b=u7n0icAoHDGB9BetT6S1XSGZNRR7qN7NwwCYjeiXIMfNoXyRs5uJZb2LIOemC5FkQi
 9UspAVFA+rPn7g5gNhEktlpjuxfKzRAJW5s84UyN9slesd8nTAKHZEQf8RWfhROU8RmX
 SFeiSBZ//+wMjgMIoJM+5A25SFifF5jxp9g0w43nEhB/8a7GPck6YOgqSMnnlMiw8kq3
 mcMZGhXjCrE9aKkQljzat8gSU/8PMWEpQrAChtcQlNZK84x9U4XU/vg3Twa6aFZDS7oI
 ColYvfb/yGKZhzAhFKEsiRZsMD8woBlThiBlQfCVetjnwW5ebABSiR62yIbgIxtBJcMS
 xrDg==
X-Gm-Message-State: AAQBX9d24h3mDPvExOtaRL5nnM3xz6tm+8P8Y6YXuHYKtIlggoZJj/Y4
 kbshsy4KxVUTOlw0m5RNhF/HFUIz3w9RDzOVHu4=
X-Google-Smtp-Source: AKy350aRFrEhvLB9MHDyDxtopRrtnpwE4s7xXG2jkUmWjGq/GB06VaYymHgA/c8fpznyEMOb2yb3Ppjn3rXTN/E4Cp8=
X-Received: by 2002:ac2:5323:0:b0:4ea:e1d5:33cf with SMTP id
 f3-20020ac25323000000b004eae1d533cfmr737317lfh.11.1680613626659; Tue, 04 Apr
 2023 06:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230404115912.2829251-1-armbru@redhat.com>
In-Reply-To: <20230404115912.2829251-1-armbru@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 4 Apr 2023 17:06:55 +0400
Message-ID: <CAJ+F1C+EGmeECDbT0O7O-pnoPGokjWc3jym40=LVW_baO58r=w@mail.gmail.com>
Subject: Re: [PATCH 00/16] qapi qga/qapi-schema: Doc fixes
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, michael.roth@amd.com, eblake@redhat.com, 
 kwolf@redhat.com, hreitz@redhat.com, pbonzini@redhat.com, 
 arei.gonglei@huawei.com, pizhenwei@bytedance.com, jsnow@redhat.com, 
 vsementsov@yandex-team.ru, eduardo@habkost.net, marcel.apfelbaum@gmail.com, 
 wangyanan55@huawei.com, quintela@redhat.com, jasowang@redhat.com, 
 yuval.shaia.ml@gmail.com, stefanha@redhat.com, kraxel@redhat.com, 
 kkostiuk@redhat.com, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12a.google.com
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

On Tue, Apr 4, 2023 at 4:02=E2=80=AFPM Markus Armbruster <armbru@redhat.com=
> wrote:
>
> It's always nice to get doc fixes into the release, but if it's too
> late, it's too late.
>
> Generated code does not change, except for the last patch, which moves
> a bit of code without changing it.
>
> Markus Armbruster (16):
>   qga/qapi-schema: Tidy up documentation of guest-fsfreeze-status
>   qga/qapi-schema: Fix a misspelled reference
>   qapi: Fix misspelled references
>   qapi: Fix up references to long gone error classes
>   qapi/block-core: Clean up after removal of dirty bitmap @status
>   qapi: @foo should be used to reference, not ``foo``
>   qapi: Tidy up examples
>   qapi: Delete largely misleading "Stability Considerations"
>   qapi: Fix bullet list markup in documentation
>   qapi: Fix unintended definition lists in documentation
>   qga/qapi-schema: Fix member documentation markup
>   qapi: Fix argument documentation markup
>   qapi: Replace ad hoc "since" documentation by member documentation
>   qapi: Fix misspelled section tags in doc comments
>   qapi: Format since information the conventional way: (since X.Y)
>   qapi storage-daemon/qapi: Fix documentation section structure
>
>  docs/devel/qapi-code-gen.rst         |  8 ++-
>  docs/interop/firmware.json           |  6 +-
>  qapi/block-core.json                 | 82 ++++++++++++++--------------
>  qapi/block.json                      |  2 +-
>  qapi/char.json                       |  4 +-
>  qapi/control.json                    |  2 +-
>  qapi/cryptodev.json                  |  4 ++
>  qapi/job.json                        |  4 +-
>  qapi/machine-target.json             |  2 +-
>  qapi/machine.json                    | 26 +++++----
>  qapi/migration.json                  | 37 ++++++++-----
>  qapi/misc.json                       |  6 +-
>  qapi/net.json                        | 25 +++------
>  qapi/qapi-schema.json                | 24 +-------
>  qapi/qdev.json                       |  2 +-
>  qapi/qom.json                        |  4 +-
>  qapi/rdma.json                       |  2 +-
>  qapi/replay.json                     |  3 +
>  qapi/run-state.json                  |  6 +-
>  qapi/stats.json                      |  3 +-
>  qapi/tpm.json                        |  3 +-
>  qapi/trace.json                      |  1 +
>  qapi/ui.json                         | 12 ++--
>  qga/qapi-schema.json                 | 10 ++--
>  storage-daemon/qapi/qapi-schema.json | 22 +++++---
>  25 files changed, 154 insertions(+), 146 deletions(-)
>
> --
> 2.39.2
>
>

lgtm,
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



--=20
Marc-Andr=C3=A9 Lureau

