Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05997413D5B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 00:10:43 +0200 (CEST)
Received: from localhost ([::1]:51474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSnyJ-0005kS-NO
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 18:10:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mSnwL-0004lL-F5; Tue, 21 Sep 2021 18:08:37 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:41540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mSnwK-0000ev-1P; Tue, 21 Sep 2021 18:08:37 -0400
Received: by mail-il1-x12b.google.com with SMTP id d11so453253ilc.8;
 Tue, 21 Sep 2021 15:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=goAcV8ftIW9kvS6Mlzot+5X3s27jLf/rS8li3SgMy/w=;
 b=Xe1asyoN9fjAR6WrMA9IUdnf9PSBNHrn+3AfvrG4jOEjPSS8uxtLGpMZLRc9JnY8Qh
 BI3KDPRlcD8XJkcCYqZ7jYEK33lRLVYf24d9u130h/IQlmDY7Ym571p+mju6feJE8bVA
 sp/uVfaxZJoA/xYL49PynXjs/SOeR4EJKv4ZmLRT+tydOed7BzIyLsRyLiCh90VNuE8u
 yhhpeeaLZITTLjWh/cGgYQRaaI9FCjyFqL04t2sc9oZGciZN7darKG7Z+YsLHqmqfkFb
 4hRlJ9ljI7kb0/Y1M61tjgntZD+aEKyN3mIKrTp6yfTuPzEeS97jj4tbi6ZgvKSsMxuw
 xM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=goAcV8ftIW9kvS6Mlzot+5X3s27jLf/rS8li3SgMy/w=;
 b=Ppq1QVHcXpztsiiz9ooANXLm3Q9zi0liU1CjhK1QkqMh+dOMuGuSq86KEexgQke1L4
 xs84pdnghKkR6+sUGM2UZHPmyvwmw2Yv0/pAmT0prlwcKhSlLF0mvY5PeG49xoe7/31u
 d8dvxy3cGoAnrU2q8g94JmTwcDosbaEgqpICK9zlcLaAYFTrJfP40b51nRDfKGnIEPX/
 Pls7Qloh7vOH94cML7h5g0MxNvZ0k6iq5PjUS22pj3tS0H/XRsl/yAXAe+t+t/gA8c4m
 0zxS6iDUl/vY+nTalGkifWpNcnpGBGaGx5gGkAZCIdm3uNeVMmkje1VkN8baui2vQ9Dh
 OGpw==
X-Gm-Message-State: AOAM533S4C4WLN8N9RF6wGpcU/p3eKgzaBKmIW1yreLuwHGscvmhwJYb
 GQyoCeBYx/1AAsV1MMmPYOSX/YMQ6CNfCyslzK8=
X-Google-Smtp-Source: ABdhPJzzEM17VUT7RZEe5HgsLGY4BEunD4pe+boJPnj+ynQ+dASQR08rECFvWckdOMxZX7LS4tQfqh1Zov63RNyroFM=
X-Received: by 2002:a05:6e02:964:: with SMTP id
 q4mr23700634ilt.290.1632262113639; 
 Tue, 21 Sep 2021 15:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210917190136.2246440-1-philmd@redhat.com>
In-Reply-To: <20210917190136.2246440-1-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 22 Sep 2021 08:08:07 +1000
Message-ID: <CAKmqyKMpS8HerZHfu2y55bT68VKsme7y+iv0uP3M5-2pG=d9wA@mail.gmail.com>
Subject: Re: [PATCH] hw/loader: Remove unused rom_add_file_as() definition
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Sep 18, 2021 at 5:02 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> rom_add_file_as() is not used anywhere, remove it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Looks fine, although I'm not convinced removing this gets us anything.
It might be used in the future and doesn't add too much cruft.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/loader.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/include/hw/loader.h b/include/hw/loader.h
> index cbfc1848737..c52a1df8b68 100644
> --- a/include/hw/loader.h
> +++ b/include/hw/loader.h
> @@ -329,8 +329,6 @@ void hmp_info_roms(Monitor *mon, const QDict *qdict);
>      rom_add_blob(_f, _b, _l, _l, _a, NULL, NULL, NULL, NULL, true)
>  #define rom_add_file_mr(_f, _mr, _i)            \
>      rom_add_file(_f, NULL, 0, _i, false, _mr, NULL)
> -#define rom_add_file_as(_f, _as, _i)            \
> -    rom_add_file(_f, NULL, 0, _i, false, NULL, _as)
>  #define rom_add_file_fixed_as(_f, _a, _i, _as)          \
>      rom_add_file(_f, NULL, _a, _i, false, NULL, _as)
>  #define rom_add_blob_fixed_as(_f, _b, _l, _a, _as)      \
> --
> 2.31.1
>
>

