Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FD0283016
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 07:29:52 +0200 (CEST)
Received: from localhost ([::1]:38654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPJ4J-0005C5-95
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 01:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pauldzim@gmail.com>)
 id 1kPJ3L-0004ly-OH
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 01:28:51 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:40480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pauldzim@gmail.com>)
 id 1kPJ3J-0002zY-OL
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 01:28:51 -0400
Received: by mail-io1-xd41.google.com with SMTP id k25so7827108ioh.7
 for <qemu-devel@nongnu.org>; Sun, 04 Oct 2020 22:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=s/Nw0kA9/z5JP90sTcU0pJZv/MDggn2Cz7N0QXIVke8=;
 b=pE/BcypxBfJ8I1EvcJl2TOyMHoNu7NhidM5IRHLD2AMCW1Gdh22N/SsFmS4woxjQYy
 f/USAKfArjkTxup2W2+rA9cLf/14chRotMHkmGtkuEFmlY4iM8cnVD5ylQsZGQBdy9Gz
 yqdyWtNKRMygNc+RGDLsB2kxSkIJNSddEQpTThgvqNI74i4rosg6XrGm4MKrksnsN+8Y
 GM46BSoBd/U9sxTH47qddyx4bkIAA/GS40ivq1+IEB8gvHJ/kWbD7A/HT07l97KFjji8
 Rnq2WjBqOz2LhO0WYDsitCKXnGqeFu3rwQQApttnLJ2fG/mkdU0Msg6zcLEcaXCAgcdS
 r0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=s/Nw0kA9/z5JP90sTcU0pJZv/MDggn2Cz7N0QXIVke8=;
 b=KsvH7Jv1IJYbMZL/fQnzo/7CdZpiDyrCVQ9cEgqhWu1xqz8uDz43EGFVGjV0W3b9a+
 1QXcwIKRoVxluq6aDx45wO45VnJ8bIKKTzrszKykDdhIGYgg6nMDf1koh5trXk2tx+MC
 Mru8dUX18nwk2k3ggUZ+glYrr2SC/BGb39kuvvBg5znI4XWQunJenAhUJRhBNMW5Ulcd
 H2TMQdBPmmOphrnI6KiS3EAwjyRU5T6qNgoq5lUYxqa34ZkZrjlrQeyFSQO4TLGZ9fNO
 K7fQDXo+YrLPUgUnKGHHGF1B5H7eQ3gwTOb8ttMj0HlvcVj3uwVTHnOBLSQyz/zC5TZ5
 8Qfg==
X-Gm-Message-State: AOAM530jgQIMeF/5MeaL8Z4e24kntIy5JbELqLaw/805LW37e2TiHXRT
 hLkzcYVEkzoJ3MjuTrSW/M/xliLj93yumWTPIXc=
X-Google-Smtp-Source: ABdhPJxHI3/i2X7EPzZA6ceSf31a8wqZEugv0JzZcaXjsaPIuiUH99joMVN5wjHm6JElBTuM1ruozBkkikmbA6ewLtQ=
X-Received: by 2002:a5e:8206:: with SMTP id l6mr9614916iom.127.1601875728252; 
 Sun, 04 Oct 2020 22:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <20201004182506.2038515-1-f4bug@amsat.org>
In-Reply-To: <20201004182506.2038515-1-f4bug@amsat.org>
From: Paul Zimmerman <pauldzim@gmail.com>
Date: Sun, 4 Oct 2020 22:28:21 -0700
Message-ID: <CADBGO7_bewUoNRGYHjm9ATrZL3a7fo=O9xapUdzmqvceOKOsKg@mail.gmail.com>
Subject: Re: [RFC PATCH] contrib/gitdm: Add more individual contributors
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=pauldzim@gmail.com; helo=mail-io1-xd41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: James Hogan <jhogan@kernel.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Sven Schnelle <svens@stackframe.org>, Paul Burton <paulburton@kernel.org>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Finn Thain <fthain@telegraphics.com.au>,
 Ahmed Karaman <ahmedkhaledkaraman@gmail.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?B?S8WRdsOhZ8OzIFpvbHTDoW4=?= <dirty.ice.hu@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, Stefan Weil <sw@weilnetz.de>,
 Alistair Francis <alistair@alistair23.me>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 David Carlier <devnexen@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Oct 4, 2020 at 11:25 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> These individual contributors have a number of contributions,
> add them to the 'individual' group map.
>
> Cc: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
> Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: Artyom Tarasenko <atar4qemu@gmail.com>
> Cc: David Carlier <devnexen@gmail.com>
> Cc: Finn Thain <fthain@telegraphics.com.au>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> Cc: James Hogan <jhogan@kernel.org>
> Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
> Cc: K=C5=91v=C3=A1g=C3=B3 Zolt=C3=A1n <dirty.ice.hu@gmail.com>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: Michael Rolnik <mrolnik@gmail.com>
> Cc: Niek Linnenbank <nieklinnenbank@gmail.com>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Paul Zimmerman <pauldzim@gmail.com>
> Cc: Stefan Weil <sw@weilnetz.de>
> Cc: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> Cc: Sven Schnelle <svens@stackframe.org>
> Cc: Thomas Huth <huth@tuxfamily.org>
> Cc: Volker R=C3=BCmelin <vr_qemu@t-online.de>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> To the developers Cc'ed: If you agree with your entry, please
> reply with a Reviewed-by/Acked-by tag. If you disagree or doesn't
> care, please either reply with Nack-by or ignore this patch.
> I'll repost in 2 weeks as formal patch (not RFC) with only the
> entries acked by their author.
> ---
>  contrib/gitdm/group-map-individuals | 22 ++++++++++++++++++++++
>  contrib/gitdm/group-map-redhat      |  1 -
>  2 files changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-ma=
p-individuals
> index cf8a2ce367..b478fd4576 100644
> --- a/contrib/gitdm/group-map-individuals
> +++ b/contrib/gitdm/group-map-individuals
> @@ -16,3 +16,25 @@ aurelien@aurel32.net
>  balaton@eik.bme.hu
>  e.emanuelegiuseppe@gmail.com
>  andrew.smirnov@gmail.com
> +sw@weilnetz.de
> +huth@tuxfamily.org
> +laurent@vivier.eu
> +atar4qemu@gmail.com
> +hpoussin@reactos.org
> +deller@gmx.de
> +alistair@alistair23.me
> +fthain@telegraphics.com.au
> +svens@stackframe.org
> +aleksandar.qemu.devel@gmail.com
> +jhogan@kernel.org
> +paulburton@kernel.org
> +vr_qemu@t-online.de
> +nieklinnenbank@gmail.com
> +devnexen@gmail.com
> +jcd@tribudubois.net
> +dirty.ice.hu@gmail.com
> +mrolnik@gmail.com
> +pauldzim@gmail.com
> +linux@roeck-us.net
> +sundeep.lkml@gmail.com
> +ahmedkhaledkaraman@gmail.com
> diff --git a/contrib/gitdm/group-map-redhat b/contrib/gitdm/group-map-red=
hat
> index d15db2d35e..4a8ca84b36 100644
> --- a/contrib/gitdm/group-map-redhat
> +++ b/contrib/gitdm/group-map-redhat
> @@ -3,6 +3,5 @@
>  #
>
>  david@gibson.dropbear.id.au
> -laurent@vivier.eu
>  pjp@fedoraproject.org
>  armbru@pond.sub.org
> --
> 2.26.2
>

Acked-by: Paul Zimmerman <pauldzim@gmail.com>

