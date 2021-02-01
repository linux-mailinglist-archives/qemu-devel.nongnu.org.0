Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A8A30A56F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 11:36:01 +0100 (CET)
Received: from localhost ([::1]:51000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6WYq-0003E1-IK
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 05:36:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6WOd-0001E3-Dh
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:25:30 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:40791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6WOa-0004D3-T4
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:25:27 -0500
Received: by mail-wm1-x32e.google.com with SMTP id c127so12653881wmf.5
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 02:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=my+cruc2dBoFqSY8dVBluRTzfXBeNT8slTzI7l3tb5g=;
 b=R81M8izZm8JJNbtnQ2EmhyMptb0d1vIvgZ4qptj1kNc9zo7ozCk9aL6ki8LSZGxseu
 wpB0z8TXLUUMQwsOwuheeQaTzsVOM/5NAk8gSRyCIX/r0H7krM56RcyXalKEUhrHZlyd
 kpPwa4guHb2MbH3yZ6PV90dDmbHIA58iJYBF2viRbC+JgMGCXeDHqYTiU2qv3RM+ONKy
 +Tj5EC/SYEHwR9hxfJzlavXh45RxAzo5eR/PXHBxM55EGvybQ/S/QP15rCkjD4zaBE4X
 CMUBa0C6j7njahF5bF8M1h0xkRzUwZY+STT9E/fgPuS61TjMpRAo7VDcVFA/WKfsONfC
 upXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=my+cruc2dBoFqSY8dVBluRTzfXBeNT8slTzI7l3tb5g=;
 b=MPfbQbufDk6IT+ZJIGsHKc3kXFusSSSuEPvMHtTvEUSgr9y1wTmv0xM8qep1g7K0U/
 +slvt/ski/u/7jTXqGsJL3UBmFjSj5Qdrjas22/fZ6bME8zjaDiTAiiZc+A2d6XfP0Xw
 WotyafO1OFY1H8MzGtoL3eFEAvvj2iIJuqXu8xBAS69XQlHyqXdLBiNx6CO+YVq8Ayyr
 WRuGQmKMCI/13ZCzOCNUgQvTMutUeJVNoQ8RYORkyv9PTC1XcdH3xnMLugVbcpfoVzRi
 61p/xoxxlvkQ0PQ/wxPDwx+opBkkINqW+xxHTFX7I5ObXR5o+CQxwRz9jQq4RNb69Vd9
 jp1w==
X-Gm-Message-State: AOAM531Y8AHeDlTRxpnFdo6hyhBYxVzf9fZB4sIalXE9pz0Ifzh78Zm0
 pvNKw6n9Jogch+l4QUZBz7wK8w==
X-Google-Smtp-Source: ABdhPJyFa12/Qek6WRITj2IkgqpBYb5YP8V0uz0gUF3JlC5z8zRNpRtuCKni4PD8iafkuQM1e8yNfA==
X-Received: by 2002:a7b:c854:: with SMTP id c20mr14024965wml.127.1612175122539; 
 Mon, 01 Feb 2021 02:25:22 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i6sm27017928wrs.71.2021.02.01.02.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 02:25:21 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7DF5D1FF7E;
 Mon,  1 Feb 2021 10:25:20 +0000 (GMT)
References: <20210131111316.232778-1-f4bug@amsat.org>
 <20210131111316.232778-2-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 01/10] hw/sh4/Kconfig: Rename CONFIG_SH4 ->
 CONFIG_SH4_PERIPHERALS
Date: Mon, 01 Feb 2021 10:24:40 +0000
In-reply-to: <20210131111316.232778-2-f4bug@amsat.org>
Message-ID: <87sg6gw0dr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Mar?= =?utf-8?Q?c-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> We want to be able to use the 'SH4' config for architecture
> specific features. As CONFIG_SH4 is only used to select
> peripherals, rename it CONFIG_SH4_PERIPHERALS.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

I agree with Balaton Zoltan that _DEVICES might be a bit shorter. Either
way:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

