Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D90285FC850
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 17:21:37 +0200 (CEST)
Received: from localhost ([::1]:54072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oidY8-0005Vd-T3
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 11:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oidUg-0000Ju-33
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 11:18:10 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:47076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oidUd-00068T-K4
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 11:18:01 -0400
Received: by mail-qv1-xf34.google.com with SMTP id o67so10640760qvo.13
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 08:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5UH52Tv5kotNHnDJBr5upD9ifzKMGUtnuCjXyDBBl6o=;
 b=AsnPkOsT+7FVA+TVWFmhhDsDaj+GxZb3QMqR9DxSpkYf0aiaGWR1aJvy2zDdDCgOSz
 ug49lIajaDSMeTW7vRVQ5fqEBtGiVNySOQx5xh0IRUaQ1xGH99akUyq5mszGa6Yo4kv/
 0cp54AhKfUH5uS7QwV1mu75ND4q0qI0BZs3x6mMK8HjUrTRYtWbYwlLOnKm88+urdZaJ
 /nAu2SrOtru45ktKOqZ12Pa+LYTF/5tiPkxE1YZ2pq3gtUaRT0aoNxuWLWdLzWYATxmx
 kmSOgSEBDOEva1Js6cZEjE1zCvUZxdIi+7EWWprRb7EE0q/c/wFrYUKa8cuHw8USdZSA
 cs0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5UH52Tv5kotNHnDJBr5upD9ifzKMGUtnuCjXyDBBl6o=;
 b=tKlgYHw0fb4usREwrxlAb4MffPZJSWkN7bIVTnOX8Bx/CAnDPPF5LfTpN+sU9lZt2m
 5VV0SDx5QQdGIgY5TjwI0cyq0fdJyp/aKc/yrWSCDO5NokzP4LHhVjdaOhB5j1U+J/rf
 d8KRhvxpywblX5rbgnyHCg69EtSFBdp2Cf19pH4lfH8ZiAucrystFkKaWr+DJGYQ16YU
 pZ0sIRt0NexerQrAFPuK5neGLuMKF/h2vm6oyENV3V/lcHh6RBJGSV54T7VjS+kYeZlP
 okCzcXBGLh5VQ0fGNrCfrcSsr/0D2JInNAxM7kAzbj0vqPBIAhlyk/rj1L/2Gq+6QK4T
 sYlg==
X-Gm-Message-State: ACrzQf1URt1ynSkQKPReC83bZ/LV/9R2Ev7w5exYP41IbRAgJa63/LhZ
 l3vTXb8A15rnA1i+109+z2B2gZByblo9za7/UEs=
X-Google-Smtp-Source: AMsMyM4YAyoRHb9safEbmbAscQrSirYhmYVG/iK02zX1FhvoO+C3vdDBPzsO6CZl4f7RH0PLWpxbVCpk4BiwtV9jY/M=
X-Received: by 2002:a0c:810f:0:b0:47b:299a:56d7 with SMTP id
 15-20020a0c810f000000b0047b299a56d7mr23315183qvc.12.1665587878618; Wed, 12
 Oct 2022 08:17:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAAJ4Ao87Dbjc11xE9b2Mj=6VMX5J4LHJ2vt_Kn-SPEHWQ7Gu_g@mail.gmail.com>
In-Reply-To: <CAAJ4Ao87Dbjc11xE9b2Mj=6VMX5J4LHJ2vt_Kn-SPEHWQ7Gu_g@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 12 Oct 2022 23:17:46 +0800
Message-ID: <CAEUhbmU561dwFmVCqZG7WdTUhRtfSR_wB8pa0KP2YVXwyHaZuQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] error handling: Use RETRY_ON_EINTR() macro where
 applicable
To: Nikita Ivanov <nivanov@cloudlinux.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Greg Kurz <groug@kaod.org>, Jason Wang <jasowang@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk <kkostiuk@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf34.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On Wed, Oct 12, 2022 at 8:32 PM Nikita Ivanov <nivanov@cloudlinux.com> wrote:
>
> There is a defined RETRY_ON_EINTR() macro in qemu/osdep.h which
> handles the same while loop.
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/415
>
> Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>
> ---
>  block/file-posix.c        | 37 ++++++++++++++++---------------------
>  chardev/char-pty.c        |  4 +---
>  hw/9pfs/9p-local.c        |  8 ++------
>  net/l2tpv3.c              | 17 +++++------------
>  net/socket.c              | 16 +++++++---------
>  net/tap.c                 | 12 ++++--------
>  qga/commands-posix.c      |  4 +---
>  semihosting/syscalls.c    |  4 +---
>  tests/qtest/libqtest.c    | 14 ++++++--------
>  tests/vhost-user-bridge.c |  4 +---
>  util/main-loop.c          |  4 +---
>  util/osdep.c              |  4 +---
>  util/vfio-helpers.c       | 12 ++++++------
>  13 files changed, 52 insertions(+), 88 deletions(-)
>

This patch has to be squashed into patch 1 for bisectability, as TFR
is already removed in patch 1.

Regards,
Bin

