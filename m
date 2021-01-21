Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 358962FE690
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 10:43:08 +0100 (CET)
Received: from localhost ([::1]:53278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2WUd-0006RP-89
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 04:43:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l2WTE-0005Oi-S6
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 04:41:40 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:34928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l2WT9-0000sE-W1
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 04:41:40 -0500
Received: by mail-ej1-x636.google.com with SMTP id ox12so1698094ejb.2
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 01:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=13bjMcyB39zQ6KQu9Qy4AE4gQI9naAL2EP71A6MRUW4=;
 b=O+xCizvwwv8zcK8HEVL1NwRX+Ru/WXg0JqGf57lyO5mR+ITZnge5K2a/KPZ61B6cDD
 50uhI92zdxeqSd5XiftGH3iPYdLK8A3EDiVLaWsEKe4DMiWjliDvlhE97vqWdPL6srsY
 Io7NfHQsZSB2HkEkMgstMDsfBzKu9rUjLR8Zu6dMrDrOdHzaytW3UJiTW5HemLCR+A4j
 xAW+AzLkKNcCPJo8IDH8/uKDEKaIU/zqAaYQXrrL38aI+rY8ce52xas/zs458YFstY5r
 nEBX8BVnF+g/+Hz+p2F4c2FNHCwdeeDBUA0Im3bxprKTst+aMB+fKbdhP0U6QqcAhBdL
 jWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=13bjMcyB39zQ6KQu9Qy4AE4gQI9naAL2EP71A6MRUW4=;
 b=a9WAJ1oEBcSrnx1IO4ghd1wCK7E+70qg1ogkXaVUMPfXEehC7PBkgmNkWaAqqa1cYk
 RgjSaOAilCY2BJmKtjdUpez7/5caUhvRGH5UpdEYIeLVmN2yZgzlvSZOkh6tOpOCeAAt
 USKd0f99fVc2QJhDh0pcReJO+TAREvmTIxssEceDBVeFWPApf6QGTmg25WFe3qWrrCaN
 IUsr5ZbuMreqzbOkF1pPV0syAPUUlmo4+iSLtKF38cZeUfWQXPtDCvQBE6s7IEYD3+Ed
 8Q0MWGjCMquJss5ZM6HpZFrwCxCgYSTvl6ShOgKJdxmbNYsJcA2ITiTQbl0ZpzE7jla/
 oULw==
X-Gm-Message-State: AOAM5313i4yExU4tpCSDFBLfN62EG5o8gQx9jzyXdI0sWnIAPtqerSOL
 wrvwwSlBX1nbficuW6qknzS29usN2y8X2PU+HxUa6GFBvEtBfg==
X-Google-Smtp-Source: ABdhPJwVOpD65Dkkj3EiHzXcAUyroQkZfHpcmmvABXsyu+dS0Da4Qq8ePfhz5C2ebAI43ovj6G/jxFpc67KhQUju6z0=
X-Received: by 2002:a17:906:5182:: with SMTP id
 y2mr8929982ejk.92.1611222094273; 
 Thu, 21 Jan 2021 01:41:34 -0800 (PST)
MIME-Version: 1.0
References: <20210121082314.458600-1-dje@google.com>
In-Reply-To: <20210121082314.458600-1-dje@google.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 21 Jan 2021 13:41:22 +0400
Message-ID: <CAJ+F1CJ5SB2RHuR6KzoA8K0Tdpeam+=LdSRbax6W6WQ+18qqUA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add ipv6 hostfwd support
To: Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Doug,

On Thu, Jan 21, 2021 at 12:24 PM dje--- via <qemu-devel@nongnu.org> wrote:
>
> Hi. This patchset takes the original patch from Maxim,
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg569573.html
> and updates it.
>
> The first patch is the slirp additions, the second patch adds the u/i.

libslirp is maintained on gitlab. Can you open a merge request?
https://gitlab.freedesktop.org/slirp/libslirp/-/merge_requests

thanks

>
> Doug Evans (2):
>   slirp: Add ipv6 hostfwd support
>   net: Add ipv6_hostfwd option
>
> Slirp:
>  src/libslirp.h |   6 +++
>  src/slirp.c    |  51 +++++++++++++++++++++--
>  src/socket.c   | 109 +++++++++++++++++++++++++++++++++++--------------
>  src/socket.h   |   9 ++++
>  src/udp.c      |  73 ++++++++++++++++++++++++++-------
>  src/udp.h      |   2 +
>  6 files changed, 202 insertions(+), 48 deletions(-)
>
> QEMU:
>  hmp-commands.hx     |  29 ++++-
>  include/net/slirp.h |   2 +
>  net/slirp.c         | 311 +++++++++++++++++++++++++++++++++++---------
>  qapi/net.json       |   1 +
>  slirp               |   2 +-
>  5 files changed, 279 insertions(+), 66 deletions(-)
>
> --
> 2.30.0.296.g2bfb1c46d8-goog
>
>


--=20
Marc-Andr=C3=A9 Lureau

