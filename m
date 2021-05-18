Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAECF3880D0
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 21:54:07 +0200 (CEST)
Received: from localhost ([::1]:35578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj5n4-0003UB-PM
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 15:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1lj5kf-0000Y3-Ss
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:51:37 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:39670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1lj5kd-0001Ng-Vn
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:51:37 -0400
Received: by mail-ed1-x531.google.com with SMTP id h16so12638695edr.6
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 12:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tyXck7Um18ApdEwm40WF6AqGkeLHXqrGv35AidTpKn4=;
 b=UlBeNYrI2EBscM7Dd8GcWrz5PreA76lKgSWkn6AY1rh9Kq+NXY54Y5Su8EoRWeecFa
 ql7/38owv9nNZlThAQLlg5Vke104safjcWXMjlt8yGiYAGmcvYWYp/2XEEjH//Lr7TQt
 /VUfd6v/0lIzaLGFGf2ALHmJ10aV5DWJVk77WCa7CewoTiu/hL9emNIKRujTHQ46Czyq
 ylhuDnhNesMwOpnMcYwZhR8R1lsxF6klxr20zzrGQ4ss6xdqW8Vp2hyAGVQJCsJQAmXB
 Khb8la0vHVlVMf93wK7xXp8JrNVgurMNt+K1Njz6Adm2vxtcRprC8LK/CyYr8gHMqE35
 JEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tyXck7Um18ApdEwm40WF6AqGkeLHXqrGv35AidTpKn4=;
 b=f3ix3Sqv0sXc8Ts99kagiML7Jh0182EuvlNrl7htIUcybSTt8U0W4ipFCpHGVtPgZL
 qYJDpg2aKseV/N7O/zJ+ZP4+uWQEf4qNTNkOOPtsTr1hCa2Mdxk9XFbBZ2hNSvyqiug5
 W9NLx31/55HZccpBUMoe7B5oZnlBk2O6fX4u+DeIKX2ICC7oBD0haYY41uEFYI+Ewr+E
 xVVwFn592m+QaFEzQcUpCBqeB6jaCIn04ARh2NAPrUDIUsxmz4tRw+3yTuXkhnPFIZPh
 PZWxeqNG+t0tQdMqwZSSKg57tcboYlisMJqYX3Qjycs31oISYlpCsmxjYVORE563IXKt
 RqZw==
X-Gm-Message-State: AOAM531ltNIZSU2bqG7I+djEFMETLDBjpjwiQhrygLoKpr9wx4JI2I2u
 8ZnNGeji9vJHUIIRxyxBmEqnDHucru61wffum13Bbg==
X-Google-Smtp-Source: ABdhPJwmpv28gLfOINaCAZyvD7p7+P1f4VYLYYgz0h/8SLHVUBWqVgLFut3J4zbHvWgd1ZCcWEN4aE1tY+igwueBN1Q=
X-Received: by 2002:a50:aa95:: with SMTP id q21mr8858159edc.329.1621367494238; 
 Tue, 18 May 2021 12:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210518184527.1037888-1-titusr@google.com>
 <20210518194518.GY11196@minyard.net>
In-Reply-To: <20210518194518.GY11196@minyard.net>
From: Titus Rwantare <titusr@google.com>
Date: Tue, 18 May 2021 15:50:57 -0400
Message-ID: <CAMvPwGquxnT7RDOVCeXG1Jdjg1hU+a1-20Pu4c7ufQDytbNHag@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Add support for PMBus in QEMU
To: Corey Minyard <cminyard@mvista.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Hao Wu <wuhaotsh@google.com>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=titusr@google.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I would also like a directory for sensors. There are quite a few of
those incoming. Any objections?

-Titus

On Tue, 18 May 2021 at 15:45, Corey Minyard <cminyard@mvista.com> wrote:
>
> On Tue, May 18, 2021 at 11:45:22AM -0700, Titus Rwantare wrote:
> > Hello,
> >
> > This patch series adds an interface to start supporting PMBus devices i=
n QEMU.
> > I=E2=80=99ve included two PMBus devices: MAX34451 and ADM1272.
>
> I've reviewed all these patches, and beyond my one comment, they look
> good.
>
> I'm not too excited about putting the device files in misc.  I know some
> SMBus sensors are in there, but they really aren't miscellaneous.  They
> are really sensors.  But unless we want to create a sensors directory
> and move things into that, misc will have to do, I guess.
>
> -corey
>
> >
> > PMBus is a variant of SMBus meant for digital management of power suppl=
ies.
> > PMBus adds to the SMBus standard by defining a number of constants and =
commands
> > used by compliant devices. The specification for PMBus can be found at:
> >
> > https://pmbus.org/specification-archives/
> >
> > Currently, the goal for these devices is to emulate basic functionality=
 by
> > reading and writing registers. Timing, and some logical operation is no=
t
> > implemented. This implementation supports nearly all available register=
s for
> > PMBus including:
> >    - Voltage inputs and outputs
> >    - Current inputs and outputs
> >    - Temperature sensors
> >
> > Unimplimented registers get passed through to the device model, and dev=
ice
> > models can opt out of using the standard registers with flags. The incl=
uded
> > devices make use of these fields and illustrate how to interface with t=
he pmbus
> > class.
> >
> > Datasheets for sensors:
> >
> > https://datasheets.maximintegrated.com/en/ds/MAX34451.pdf
> > https://www.analog.com/media/en/technical-documentation/data-sheets/ADM=
1272.pdf
> >
> > Since v2:
> > - bump for feedback
> > - removed commented out code
> >
> > Since v1:
> > - addressed Joel's comments
> > - split out tests into their own patches
> >
> > Thanks for reviewing,
> >
> > Titus Rwantare
> >
> > Titus Rwantare (5):
> >   hw/i2c: add support for PMBus
> >   hw/misc: add ADM1272 device
> >   tests/qtest: add tests for ADM1272 device model
> >   hw/misc: add MAX34451 device
> >   tests/qtest: add tests for MAX34451 device model
> >
> >  include/hw/i2c/pmbus_device.h |  506 +++++++++++
> >  hw/i2c/pmbus_device.c         | 1596 +++++++++++++++++++++++++++++++++
> >  hw/misc/adm1272.c             |  543 +++++++++++
> >  hw/misc/max34451.c            |  716 +++++++++++++++
> >  tests/qtest/adm1272-test.c    |  445 +++++++++
> >  tests/qtest/max34451-test.c   |  336 +++++++
> >  hw/arm/Kconfig                |    3 +
> >  hw/i2c/Kconfig                |    4 +
> >  hw/i2c/meson.build            |    1 +
> >  hw/misc/Kconfig               |    8 +
> >  hw/misc/meson.build           |    2 +
> >  tests/qtest/meson.build       |    2 +
> >  12 files changed, 4162 insertions(+)
> >  create mode 100644 include/hw/i2c/pmbus_device.h
> >  create mode 100644 hw/i2c/pmbus_device.c
> >  create mode 100644 hw/misc/adm1272.c
> >  create mode 100644 hw/misc/max34451.c
> >  create mode 100644 tests/qtest/adm1272-test.c
> >  create mode 100644 tests/qtest/max34451-test.c
> >
> > --
> > 2.31.1.751.gd2f1c929bd-goog
> >

