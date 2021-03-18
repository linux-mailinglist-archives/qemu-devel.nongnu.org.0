Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD713340EA2
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 20:56:47 +0100 (CET)
Received: from localhost ([::1]:41372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMylC-0003De-St
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 15:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMyio-00022h-4e
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 15:54:18 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:42563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMyij-0003BA-Dv
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 15:54:17 -0400
Received: by mail-ej1-x635.google.com with SMTP id hq27so5867962ejc.9
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 12:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4h0RlXuMeoi3FFiRB48InI3q95qmSc1s1sEC5B2FKRI=;
 b=wM6ww242XhmJDCOFU+1B86w29z0LTNCqGI+4+QSkvYP621Qypc0ZC0BVBNegOwPT4I
 rSwVX+aw4xRhyyGwExpOIYsZIrEyttjHLOAYvUUg6baMrHLq44rsReiRjxlcG6VQTb3l
 ZRoo0rThZ6jTvFFGfOEjWpp3dBAlQo3iqUIQiUDQfbHFnlpbmF3KZaGJ1jG0ZrUSIGuf
 zQRQdLppjHiE2Rehwj2nyJ2HS3PZBPjBvWFrM3CBsP+YZZXG0no76QpKwZ0Mtg7Urg8J
 bmloxRkFSfI8yepx4n/93nCsHBc9pNGWNUeWqyr2kNgXPoayXiOctRPWASK/7Z+usqFZ
 6rqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4h0RlXuMeoi3FFiRB48InI3q95qmSc1s1sEC5B2FKRI=;
 b=LRmbqS7AMY+dC13/6+iT6hBBP+tMbJhlq08V36NcvjsV7aIpHokX6l8aHMUk5Ep9nx
 FuHJveHv8q4aDEUfdUbuYe5EqEom70hYvr32j8uP+hqECD+B54v0CE/yO/5Gm2E/Abmq
 Vg0nXdwC31tpiwGLG+eAaaaFb44nBi2bpM2+nQpmuEwDoW8rxisRPNwZuyMJPJ2umJQ/
 iubtpx0F9d0doNuOzv70Vo7dquMljHJAggWZOOF774Dj/WBe0fmQ42QUcxV4RSysHtv1
 /ELlA825b4uVog5tB2RPIIp5tGEiXQks0m49KM/lRXyNna0iPm+I3uUFIv4X1bjT0plA
 eFIg==
X-Gm-Message-State: AOAM532neViGQHat77Tq6rcFoPvrhIdtEIzqY20yI+4cOtS0V0iueZr7
 F6U4shJvEmZWzZ1OIMPYvTR+R3lW9bewZncbiSnDgw==
X-Google-Smtp-Source: ABdhPJwLYpTm+AYX3yeTpt//0GQB23+xJwp6s7tjBTt2NQnKzfrOL/eUK8D8qYyNeMX9m8GhctlXcy2yDrFMfp1f/hU=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr284377ejc.250.1616097251494; 
 Thu, 18 Mar 2021 12:54:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210318092512.250725-1-berrange@redhat.com>
In-Reply-To: <20210318092512.250725-1-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Mar 2021 19:53:47 +0000
Message-ID: <CAFEAcA9rxTaVv3XcNJPkibs5xKHAXmiYWAYYae+ub0B6A-zzVw@mail.gmail.com>
Subject: Re: [PULL v2 00/13] misc patches removing deprecated features
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Libvirt <libvir-list@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Mar 2021 at 09:30, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> The following changes since commit 571d413b5da6bc6f1c2aaca8484717642255dd=
b0:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-openbios-20210=
316' into staging (2021-03-17 21:02:37 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/berrange/qemu tags/dep-many-pull-request
>
> for you to fetch changes up to 8d17adf34f501ded65a106572740760f0a75577c:
>
>   block: remove support for using "file" driver with block/char devices (=
2021-03-18 09:22:55 +0000)
>
> ----------------------------------------------------------------
> Remove many old deprecated features
>
> The following features have been deprecated for well over the 2
> release cycle we promise
>
>   ``-drive file=3Djson:{...{'driver':'file'}}`` (since 3.0)
>   ``-vnc acl`` (since 4.0.0)
>   ``-mon ...,control=3Dreadline,pretty=3Don|off`` (since 4.1)
>   ``migrate_set_downtime`` and ``migrate_set_speed`` (since 2.8.0)
>   ``query-named-block-nodes`` result ``encryption_key_missing`` (since 2.=
10.0)
>   ``query-block`` result ``inserted.encryption_key_missing`` (since 2.10.=
0)
>   ``migrate-set-cache-size`` and ``query-migrate-cache-size`` (since 2.11=
.0)
>   ``query-named-block-nodes`` and ``query-block`` result dirty-bitmaps[i]=
.status (since 4.0)
>   ``query-cpus`` (since 2.12.0)
>   ``query-cpus-fast`` ``arch`` output member (since 3.0.0)
>   ``query-events`` (since 4.0)
>   chardev client socket with ``wait`` option (since 4.0)
>   ``acl_show``, ``acl_reset``, ``acl_policy``, ``acl_add``, ``acl_remove`=
` (since 4.0.0)
>   ``ide-drive`` (since 4.2)
>   ``scsi-disk`` (since 4.2)
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

