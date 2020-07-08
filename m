Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 387802188E7
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jul 2020 15:23:44 +0200 (CEST)
Received: from localhost ([::1]:34306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtA34-00053n-PY
	for lists+qemu-devel@lfdr.de; Wed, 08 Jul 2020 09:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtA25-0004cT-OZ
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 09:22:41 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtA23-000213-NL
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 09:22:41 -0400
Received: by mail-ot1-x342.google.com with SMTP id a21so13606614otq.8
 for <qemu-devel@nongnu.org>; Wed, 08 Jul 2020 06:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ks75FQFIRbrY/7yJa5tU6NrAZ/T4RM6/Tmcv0Dmy75c=;
 b=g0yY+tN86yDuY5rJfhy9T9ON362XAVeb/1UY5WRN3fn9tlW3A9KgzcqpScTg52Cfbt
 wWpIplaQcqJrI9hbNjafXKx19KlwLk1DAR//ahOx3krhRwHXnKvEZBl94tnFdpNvi++i
 3TNYHbMoKrZoJAzaa8ks1DBDymnBRseF9rkrdpm7ULRl7HJ2r4bnvPc3XaagNi+xE43b
 8xneSLGsmxbjMAmI4PyhycQou+p5pTeSg3f5IKdbFcUlsfTsqp2MKZYMas+F3B45DMu9
 VsdMpx5rBoBZUak6W8JD/Y2rLN+NCsbN4TaLJvB2tdA2K2CeIM2KWjdf6RUoiKSK0t88
 uBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ks75FQFIRbrY/7yJa5tU6NrAZ/T4RM6/Tmcv0Dmy75c=;
 b=r0h8/vg23IbiCYztiI/d6gO/pQF6A1C2Az7uU7Ac/HE4/6dvFb/VOSDb1HbKrP9GSk
 tP2tmubrzeUa5GjgCsvomcYp2ygxu7gHbrTVN4gCy2/8Q9+Qh+kGLhrGN1tVq+sJj4OC
 qNnQVLPWQqAGOt7X6RePpDja4yWj3mgxq37Go7b3kcoLts/krmpHY1QwKZZ0qX1OZ6PP
 RcVrRlQwWiRTtv3HMLB5TJpv/J/mHf+qqcCjjFyT9EbEiZBKyWWmkSg739F2jiv5IWxc
 A9GeMun9S5leTlMiw+fFADSadNn9NIBE3vw0K6njBfVhcPhuZXiYYTj3iDiZ70s+ga4W
 dr1A==
X-Gm-Message-State: AOAM532AKG+A8n+I5NUy2XASshQOE1a9TFx1oMU0dttc/Z1ZgX5QktV5
 rbKU1zLlQh5PEMxl85yz0NFkIKElauJKWJiZaVbCMlonEZM=
X-Google-Smtp-Source: ABdhPJwHOTOx0gnJJGKRqGUubVGr2uoFtgaFtnJLDLKbe0HJnbAGAbnruweNA1LkYZjcT7zs0iz2DNzPs0ONcl2vpEg=
X-Received: by 2002:a05:6830:1bd3:: with SMTP id
 v19mr47104570ota.91.1594214054780; 
 Wed, 08 Jul 2020 06:14:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200707204333.261506-1-bauerman@linux.ibm.com>
 <20200707214917.GX7276@habkost.net> <87y2nu3nxq.fsf@morokweng.localdomain>
 <c53b36b7-ee7b-bb66-8220-cce788fd631d@redhat.com>
 <20200708100038.GG18595@umbus.fritz.box>
In-Reply-To: <20200708100038.GG18595@umbus.fritz.box>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 8 Jul 2020 14:14:03 +0100
Message-ID: <CAFEAcA9V7Uha9-rz+JY-5HkazCWuTk1vkLnw1m9Lw-bXXKbkvw@mail.gmail.com>
Subject: Re: [PATCH] cpu: Add starts_halted() method
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 8 Jul 2020 at 12:12, David Gibson <david@gibson.dropbear.id.au> wro=
te:
> On Wed, Jul 08, 2020 at 10:38:29AM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Class boolean field certainly sounds better, but I am not sure this
> > is a property of the machine. Rather the arch? So move the field
> > to CPUClass? Maybe not, let's discuss :)
>
> It is absolutely a property of the machine.  e.g. I don't think we
> want this for powernv.  pseries is a bit of a special case since it is
> explicitly a paravirt platform.  But even for emulated hardware, the
> board can absolutely strap things so that cpus do or don't start
> immediately.

It's a property of the individual CPU, I think. One common setup
for Arm systems is that the primary CPU starts powered up but
the secondaries all start powered down.

The original bug as described in the commit message sounds
to me like something we should look to fix in the implementation
of async_run_on_cpu() -- it shouldn't cause a CPU that's halfway
through reset to do a KVM_RUN or otherwise run guest code,
whether that CPU is going to start powered-up or powered-down.

thanks
-- PMM

