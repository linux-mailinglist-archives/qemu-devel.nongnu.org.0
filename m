Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7912C1355
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 19:51:32 +0100 (CET)
Received: from localhost ([::1]:55488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khGvw-0005rB-DP
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 13:51:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khGuQ-0005Ev-Ku
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 13:49:54 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:43582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khGuO-0004SI-Ru
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 13:49:54 -0500
Received: by mail-ej1-x630.google.com with SMTP id k27so24759454ejs.10
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 10:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pA0pmF17LbFr2QuQBzOOHYll9rQrgKjh/yqGMlNsE3M=;
 b=b6y+tL8GttZWEJ0KBUEqqe2ulB5C/RZ/cT6qFkpWhla2Qp9YvXGM6wvhVbnYXiIU3M
 BzwfsQS9maaVREm/ddqU4wP79x2/ogoEVmgrqhk2zZJT++fmMzNkhOHIt+loH3TpTTXh
 pd5Kpg0gfBVWS3inrNryHJjeh0qhMYzx39Ha+XN36K6t3bvJqfQwIOtfg0nBy/4UnmmX
 INROUUuKLZHnN9ryOf+QfSLKSKZV84d6XgU3qQqF38nv2iHyHhmMDfIKwnwRs6tBsN2Y
 iM882kAaNqE1xElRsCREI8BgN0EkQhI0g1L8WO0TaBG1F/PNy+sZnWrmMTLqZjnJoH6s
 84Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pA0pmF17LbFr2QuQBzOOHYll9rQrgKjh/yqGMlNsE3M=;
 b=mR/0DFQISDSQqFZg0GvVc8QL4a6hCqnZJdMl3nrgAY9gjUQ4UzsGtNSBU2YpvTRBdz
 Rz9VdmERwteFzlayrRkqhG8TU63WYYj30eDt+HG8tndno4X3xnE3JcKLOSj467ug9eWb
 oRMj7tg7Ky+T1d1KOKl2dzximWDUKXDsjDjWSlI7StAfBxztwrbQG6RUrJHwcXj5AqqQ
 v0knIjsp5FbyH3YzRI2DAuPSwKzjzk9kRzqX6NJroLohxMZKeqTO6eDjU9XVD39xwENR
 KUyJmv6L3Oac1wOrmwxQou/DFdPHCiZ625rVifuGqCcXo3B1OXiXLH75aU5VJ303ROss
 9bkQ==
X-Gm-Message-State: AOAM532fXeu5Q7C1Nke1bddNFWsd22Hipjr8Oyfj2QBeiVhc3OOV/YE0
 Uc61nCrxsubO1WnYodP4XjFR7EfreWsKmI18VZpKvQ==
X-Google-Smtp-Source: ABdhPJxc2V2XT5XXQeJmYD7I2z1t7KBIlWjjFZ/h+X5du1T1WXxwIqJ/Zifurs2/zSerTW3BPejT3qdmNpog5nc+P6w=
X-Received: by 2002:a17:906:5a88:: with SMTP id
 l8mr853896ejq.407.1606157391082; 
 Mon, 23 Nov 2020 10:49:51 -0800 (PST)
MIME-Version: 1.0
References: <DM6PR11MB3963BA87438B343A71230675F4FC0@DM6PR11MB3963.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB3963BA87438B343A71230675F4FC0@DM6PR11MB3963.namprd11.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Nov 2020 18:49:38 +0000
Message-ID: <CAFEAcA-_ZM7DKk0a0Lkp1boZwUHi-OxD62w1-=NqnYzGKJc9ZA@mail.gmail.com>
Subject: Re: QEMU build dependencies for new board
To: "Ancuta, Cristian" <cristian.ancuta@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Nov 2020 at 17:31, Ancuta, Cristian
<cristian.ancuta@intel.com> wrote:
> I=E2=80=99ve implemented a new CPU target in ./target/arch_name and I=E2=
=80=99m also trying to add a new board to emulate that target on in system =
mode in ./hw/arch_name. The board is based on the versatilepb, but I=E2=80=
=99ll gradually be removing all the arm implementation from it, aiming for =
a minimal implementation with just my custom cpu architecture, system bus, =
main memory and an UART.

Incidentally, versatilepb is a really bad board to start with
as a template, because it's one of the oldest we have, and it
does a lot of things in ways that work but which aren't how
we'd recommend writing a new board model today. You might be
better off looking at something added more recently.

> I=E2=80=99ve also added all the necessary stuff required by minikconf.py =
in
> ./default-configs/<target>-softmmu.mak,

This suggests you're not basing this on current head-of-git,
because this is default-configs/targets/<target>-softmmu.mak
and default-configs/devices/<target>-softmmu.mak now.

> ./hw/<arch>/Kconfig and a source entry in ./hw/Kconfig.

> The problem is that the build system is bringing in other files
> that I didn=E2=80=99t specify (CONFIG_A15MPCORE, CONFIG_A15MPCORE,
> CONFIG_9MPCORE, etc. ), and I=E2=80=99m not sure how they=E2=80=99re endi=
ng
> up in ./build/<target>-softmmu/config_device.mak:

This shouldn't happen, but it's not really possible to identify
the exact problem since you don't provide your code. I would
try first doing a complete build from scratch (ie delete
the build directory) in case the problem is that there are
stale files in the build tree that are getting picked up.
Otherwise re-double-check your default-config files to make
sure they really don't have any CONFIG_whatever or "SELECT whatever"
in that they shouldn't. (Looking at the list of devices, an
accidental "select REALVIEW" would have that effect.)

thanks
-- PMM

