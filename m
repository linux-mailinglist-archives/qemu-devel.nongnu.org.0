Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA329332885
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 15:25:24 +0100 (CET)
Received: from localhost ([::1]:34096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJdIZ-0000ts-RB
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 09:25:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lJdEO-00050X-4y; Tue, 09 Mar 2021 09:21:07 -0500
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:36678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lJdEK-0003BC-HQ; Tue, 09 Mar 2021 09:21:03 -0500
Received: by mail-io1-xd2b.google.com with SMTP id n14so14091789iog.3;
 Tue, 09 Mar 2021 06:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pNnlj4yhpAVqphn1RS9uyMihORIIyJWABgL5zTOZsNk=;
 b=SCtZHgd94WrigxaC9z6b0hAeYD7PK5c91VIwN5KkdlRM91tKJ28Fg6+jLDfzTfbL1t
 akCI5uFLQWWeUXvfIuAcPKqgEWEP3LDStOe1v2CXqluMenJsWmuYglwud6cMBqmXEnw7
 zcr0uZhpGi7h4tRRBjf7RyapSMSPg8ljSrr6W6gYFHMfxcIaPkazEktLsHlvYOoup6CF
 A334xkjNcab8B1rRrcUGMPUzs3diTjKJ7TFLYSI8eReqkbViCn9HN8oN0PpgK5fl7Njl
 PNgz0RkAhqFIlqPQlbxK2cue6iiW97gDI4oHquXK4+zxejUB97/T4fDr2oLL/Zo1vBp8
 JkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pNnlj4yhpAVqphn1RS9uyMihORIIyJWABgL5zTOZsNk=;
 b=KaLVsLmHRZzmLVodCoem46m6VFWfgpNzNPHfQkpn+L2AjLIFSVrleDJ19dvV+G3iPs
 FFn/7OZuyJKx0uhPVZEq0zBU5C/idjr+8fdDfRlq7V452Xw8rbuyYYEfgEnFEsJ8X+hV
 ZOQHt0lf5V+TpGGzXAOHrrxf5oJ3vX+ekIYFXsGJdcvDlXlPGb9mm0wltAG/z+SbsAzg
 gek0AiZ5aLHEWHrdq0lBbsiIZmDqlwR/REX/yy8SOFG5P9dsrYQYg0aIGGn9J3exeGRI
 +WiCs71ViOHldxNC40EcgfJiVJ+3MvaxCbRq5pT+c8DEp7hqxWhOlLFqR27ndrzGcIFN
 T4zw==
X-Gm-Message-State: AOAM532LZi9TJI6oApabyS1LnP7tMJg66UMY78LzSO35vzyudot1Dsoc
 STOEZlVfRj5bI1yWgGLa7SN6FENPMr5BZ8nE+KQ=
X-Google-Smtp-Source: ABdhPJxs5to1yTRDHTJW8Z/ScRGuaw9bIXp4aYnOH1dyMKCq8JSmXBwnJdjKRmab8/ITOsUPBsoPwGiNjrKFAUmAwlk=
X-Received: by 2002:a02:94cb:: with SMTP id x69mr29418497jah.8.1615299658778; 
 Tue, 09 Mar 2021 06:20:58 -0800 (PST)
MIME-Version: 1.0
References: <20210211141515.8755-1-peter.maydell@linaro.org>
 <14af0670-caaf-caf1-0b90-fb10c7db13b0@trusted-objects.com>
 <e00943e0-b9a7-1688-b169-3650e8e4290e@trusted-objects.com>
In-Reply-To: <e00943e0-b9a7-1688-b169-3650e8e4290e@trusted-objects.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 9 Mar 2021 09:19:38 -0500
Message-ID: <CAKmqyKP=XGPYFag1kkGhXcmpM0JTuyOHrMRCfyVQVB1RuSewrg@mail.gmail.com>
Subject: Re: Malfunctionning qemu-system-arm ?
To: vincent Dupaquis <v.dupaquis@trusted-objects.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 15, 2021 at 11:37 AM vincent Dupaquis
<v.dupaquis@trusted-objects.com> wrote:
>
>     Hello,
>
>     I am using qemu-system-arm with a netduino2 target, supposingly
> integrating a STM32F2xx chip.
>
>     I tested using the STM HAL in order to make a simple program run,
> and I just failed to have it running correctly, it satyed stuck on the
> starting HAL_init() call.
>
>     Debugging the code, it appeared that stepping-in was making the code
> work while when running it it failed (stayed stuck in an infinite loop,
> but no obvious arm violations).
>
>     Has anyone any idea of what could be the cause for this ? I am using
> the latest STM32 HAL, with a qemu version 5.1.0 on a Ubuntu 20.04
> machine. What is the level of support this type of target is supposed to
> have, and posibly which limitations should I take into account ?

Hey Vincent,

The model was never tested with the HAL. HALs commonly have infinite
loops inside them and it seems like you have hit one of them where the
HAL is waiting on some bit to change. I'm surprised that single
stepping fixes the problem though.

You will probably need to figure out where the loop is occuring
(either through GDB or prints/assembly/execution output), after which
it should be possible to fix the hang.

Alistair

>
>     Best regards,
>         Vincent.
>
>
> --
>
> *Vincent Dupaquis*
> Software security & Cryptography expert
> 06 24 58 17 05
> /Europarc de Pichaury B=C3=A2timent B8 1330 rue Guillibert Gautier de la
> Lauzi=C3=A8re 13290 Aix-en-Provence/
>
> www.trusted-objects.com <http://www.trusted-objects.com>
>

