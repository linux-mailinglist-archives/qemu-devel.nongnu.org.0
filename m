Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAAE33F959
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 20:33:10 +0100 (CET)
Received: from localhost ([::1]:33068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMbum-0007cO-Ob
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 15:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMbrw-0006HK-Qk
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 15:30:12 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:34749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMbru-0007oV-V0
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 15:30:12 -0400
Received: by mail-ed1-x529.google.com with SMTP id y6so3729758eds.1
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 12:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CVWKKSF4G63PBAD9DBj8Ev4V36vcKZ+1vqAKTy4osM0=;
 b=GHRvNMvzcwCgmltp9ZBEBzEI92FzS236UAw/CNhi67i07jd47M5lie/JSUyY2U/rRF
 AlnHa9IbxWd7CxTTmxhtK2Z9pNikIUAKpWkz9qZMjIPCdQn6s5LFWeM6hxp+ALmoQGTV
 QpudqpGYNU0NLYXD4m52rF82+wqxfgScEr0LJkdS6PawH5LoQP98RASqq6GXlKx6C6jS
 5yHCZlQ6amEHYDzsx+enITKvmx9n6MpILPZzONq6sE2DrKTzYLafM1dSZrmxoNHPtuaC
 0l6auqfDIXaSb2qoqJRzMJG6pVf9Qi/3u9NXuw9LYLg5sKU/od/UaH7SjxNqLaoLxg1V
 2UXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CVWKKSF4G63PBAD9DBj8Ev4V36vcKZ+1vqAKTy4osM0=;
 b=c7FvF4i3CinVcPbiXkfEZ0FMhDAOWtHZHEuUHjbgbS+xNfuN7LQE6G4zDQ2D8/XfQw
 ZUaLqdHYH6UFRZYChKJ+sBqZbLiYTY/dAIrG8aXW3knVKQbdyXplXP+1BDeu/XxFGPGv
 WmJ6/RLDSM9w+zuj57GZaIMpnTEB8VANfE5LB9kJZAH0HLOM6HijP8y8JCT3K2TRVRID
 F8NWUAgmtaruylxTqVNBIiZKwDGhXJpAx+H/Nikjnc23I+/+koG4xnQaUD21FwM2Ujq8
 zsDCp7HVczroGAIrSxv3YMh1mLRvXrPTRkMp35tgRcPT0UYU6x2hxjwdj6SQpi2cZUmy
 zgQg==
X-Gm-Message-State: AOAM533Pzgf0BB7cwc/UU3rzMohPCBIRgIsE6sPchbZyw/usTUEOlRxt
 Xf4OiMMZw6Mkpd0qAcfXBy9FT2PhjhvSzJTS2YhzIw==
X-Google-Smtp-Source: ABdhPJzDlhfoodoFRbI1eHWXPeeVOYunwMUF3oYWOzElBYBKKSaqVQHbA6+cvmOru8VxaZgnxLa6rS06SSbDY7DZYmc=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr43482157edv.44.1616009409002; 
 Wed, 17 Mar 2021 12:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210316164355.150519-1-berrange@redhat.com>
In-Reply-To: <20210316164355.150519-1-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Mar 2021 19:29:45 +0000
Message-ID: <CAFEAcA-EKKWExs+Srx7+CM9wxvQGfS373xh7TgXqyDNVLUPmWg@mail.gmail.com>
Subject: Re: [PULL 00/13] misc patches removing deprecated features
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 16 Mar 2021 at 16:55, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> The following changes since commit 6e31b3a5c34c6e5be7ef60773e607f189eaa15=
f3:
>
>   Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' i=
nto staging (2021-03-16 10:53:47 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/berrange/qemu tags/dep-many-pull-request
>
> for you to fetch changes up to 13bf1a48d1671e26ca2fa13817d388fbdc4215ff:
>
>   block: remove support for using "file" driver with block/char devices (=
2021-03-16 16:33:52 +0000)
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

Merge conflicts in the docs: could you fix up and resend,
please? They're probably easy to fix, but I have a dozen
pullreqs to process right now, so I am not spending any time
on fixing conflicts...

thanks
-- PMM

