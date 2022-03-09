Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2FA4D300D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 14:36:11 +0100 (CET)
Received: from localhost ([::1]:42382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRwU6-0002F6-1m
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 08:36:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nRwPF-0008AA-1O
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 08:31:09 -0500
Received: from [2a00:1450:4864:20::62d] (port=33339
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nRwP8-0005Dp-US
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 08:31:08 -0500
Received: by mail-ej1-x62d.google.com with SMTP id kt27so5154287ejb.0
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 05:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cYBvkoKvDFjPaI+/q3phCZh7HX4nGymOcdxjZ1QAUGg=;
 b=JxfukSGmMlDZtP5ethL2URb/lKz8PkNE40/DHVUOGlXGdOKnjBmp433BbUyZTe5OxQ
 8xeOwFuMNYIk2QZLax7lLzdtsSmZ4rbUs4U5or2w3uqd5O7Mv9YpMZvgDzzrv8oGtVLj
 6oVjjZdNtTp7a3IO/t0SnHxe7iEh6v6Ld9STuNTQAXVVubooOUVNMR873eFdrJxczvOi
 ieLGxb9WyD/NNY1Z+mytog8T+4YOEudMTuTQnuitvCyU0yYlFrQkssv5GXoR/LpXb0FB
 1L4UD+wFPijxWBdQjg9nqehqArEcIRZD29DFBTALYnkuBQEmHt3B1uY9SYk+mndKhyQd
 bJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cYBvkoKvDFjPaI+/q3phCZh7HX4nGymOcdxjZ1QAUGg=;
 b=ojw24B567e2wNqd9rIhJzPyPaE8ZCNtOXnwQK0uXcwZARbpIvNXL+VP3sJLdLo5oy/
 zm4PuvPi2RhlNgvHc7Np1MMH6m5+jgUEWNmQ85/fWulNWGlusGjilscI69dHPxhZFK75
 FvyjvncDggRO2iPjpRxjumUOfYBG0pjk6XnCxZr3a8ldjKR8jwgIfHrNRG7kn8+bh2PT
 qBUIaqLVVGr0MW/N/cCVZrwDALpotbMOc6TgYvUPvnmB1fk5klIR8IQOkK6PaR44bcCc
 3m+GYI7BX5WvxWRmBs0bWjhFwyC5k1hvFYh1E/DzM2XPGBJ3n7eFtz9d854ZnkkeS9IE
 uBJA==
X-Gm-Message-State: AOAM532jZ3zs10NGOm5B/Yf5jhAVDsZplcE0Un8Bd6iAETs9rTBwU1oR
 NR25SpohHs2Dkxvj39wF2xvgYXWD/1dm9TxH7YfDbA==
X-Google-Smtp-Source: ABdhPJxmR2231F7s4BSuTQL+yNB7koIhgzEN7/v+yKS0oa4YjnGmJVUauZsHUgs7NKiC2HiknTNs1A9rezdf4Y/HvmU=
X-Received: by 2002:a17:906:4fd5:b0:6db:7222:89b1 with SMTP id
 i21-20020a1709064fd500b006db722289b1mr1716746ejw.117.1646832660555; Wed, 09
 Mar 2022 05:31:00 -0800 (PST)
MIME-Version: 1.0
References: <20220308145521.3106395-1-kraxel@redhat.com>
 <20220308145521.3106395-6-kraxel@redhat.com>
 <87mthz5oes.fsf@linaro.org>
 <20220309121240.dccpwmjno45hdcrc@sirius.home.kraxel.org>
In-Reply-To: <20220309121240.dccpwmjno45hdcrc@sirius.home.kraxel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 9 Mar 2022 19:00:49 +0530
Message-ID: <CAARzgww3QhGobUmdFecO8q69e_wn4_TM_7sTuYVXRjSGcpX9Pw@mail.gmail.com>
Subject: Re: [PATCH 05/11] edk2: add microvm build
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::62d;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 9, 2022 at 5:43 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Wed, Mar 09, 2022 at 11:55:26AM +0000, Alex Benn=C3=A9e wrote:
> >
> > Gerd Hoffmann <kraxel@redhat.com> writes:
> >
> > > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> >
> > Out of interest how do you usually trigger these builds?
>
> make -C roms efi

Ah good to know. I used instructions here last time:
https://wiki.ubuntu.com/UEFI/EDK2

>
> (try "make -C roms help" for all firmware build targets).
>
> HTH,
>   Gerd
>

