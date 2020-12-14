Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD5C2D96AA
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 11:56:23 +0100 (CET)
Received: from localhost ([::1]:60234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kolWd-0002XD-Qp
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 05:56:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kolUy-00024J-RS
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:54:36 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:37876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kolUw-0005DD-P7
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:54:36 -0500
Received: by mail-ed1-x544.google.com with SMTP id cm17so16709888edb.4
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 02:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=037v2Wa+6wX4mKS59G6C8yrvIDFGEse9zXXwPvcKVW0=;
 b=rr4Yj7+LcC8aQNUIvU4Cb5vvxZaHwY21+UlrSnQIw/uBFXIxt0WPEkCPGbN7LYvfCr
 YnUyEWh3hTu8nUCx8Rxvn40I5CLCaGDiAv9d9dcUh83V6RD5ABkzw1UpLAyiUzqv7YbF
 Jt/RRTobVNa1P8hy9NX/R7ZMg4t8ZhXVpFtWv2ln5efURTwmKfUX6aAqOcNBNcZhpaWG
 79GuAPuBI49togdxkYG9N2G86aJCEdBN/OB9q/lAojq9obxpwR/Iz9JGepvfsn2Fn++2
 ByBM6l4UU67ur6tBd5LG1tcKDw0z/8bb29nGRIqHNvhgMy38VMupxKR6VDG+lFWZsx87
 aucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=037v2Wa+6wX4mKS59G6C8yrvIDFGEse9zXXwPvcKVW0=;
 b=F4q2MbEaDBHOCVQzNkonblu7/sNoga8PQFTlIyaQwpa+WhaNbgZ6jpa12ixuPAgrK1
 0StQGys9YW2XiZENGBDfwEBBcXTRkALs0dupXLQS3IHlOQ+VJfO/pah6MbmV+q6R+21Q
 XHpr5x6oAT/0DdRWULKooo/8l+cbwCyZcCWKQmfxk2FY+ROg/ObtEBlA3TmgLSQGoLwK
 VIKeycQsZQ3pMn05iCZJAxaRc1RnlQgxfWYkoUB6NS3eTJmYeYLxkvtuET4f96+hfdWt
 pkl4fxsSIjzCD35J7os5+VJKdPdYGJQzAwN45YpVGd5SawFTJTXKTzXVRRqT8S0kcHGP
 s6GA==
X-Gm-Message-State: AOAM532JPppibpGv9cGPFAthJI/P2shMQJBPi416LmXeHsNXTaYa/BjW
 /FkJVs4oY+UWp2hsA0/WqNcv412dkQaMFDKSacB0Xg==
X-Google-Smtp-Source: ABdhPJybcetTdFj8wX10oA1y4J8LQn0YQ2peVlnFe5i7NpV8DFv2bIAvplLhRrvcZQwj7ggGx3fU38+9P8dDEDGXfyA=
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr23954810edw.52.1607943273060; 
 Mon, 14 Dec 2020 02:54:33 -0800 (PST)
MIME-Version: 1.0
References: <1603891979-11961-1-git-send-email-mihai.carabas@oracle.com>
 <1603891979-11961-2-git-send-email-mihai.carabas@oracle.com>
 <CAFEAcA9P8VD1qg_8taP5SbmmpgKYwDOmAZQNoK6uGr56Pz_Dww@mail.gmail.com>
In-Reply-To: <CAFEAcA9P8VD1qg_8taP5SbmmpgKYwDOmAZQNoK6uGr56Pz_Dww@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Dec 2020 10:54:21 +0000
Message-ID: <CAFEAcA9=5F-5_Csy=ZXd6V5JCb1pqFV6n8MafLTJmcPTeY7ZfA@mail.gmail.com>
Subject: Re: [PATCH 1/6] hw/misc/pvpanic: Build the pvpanic device for any
 machine
To: Mihai Carabas <mihai.carabas@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
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
Cc: Peng Hao <peng.hao2@zte.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Dec 2020 at 10:47, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Wed, 28 Oct 2020 at 14:20, Mihai Carabas <mihai.carabas@oracle.com> wr=
ote:
> >
> > From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >
> > The 'pvpanic' ISA device can be use by any machine with an ISA bus.
> >
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> > Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
> > ---
> >  hw/misc/meson.build | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> > index 793d45b..cb250dd 100644
> > --- a/hw/misc/meson.build
> > +++ b/hw/misc/meson.build
> > @@ -11,6 +11,7 @@ softmmu_ss.add(when: 'CONFIG_TMP105', if_true: files(=
'tmp105.c'))
> >  softmmu_ss.add(when: 'CONFIG_TMP421', if_true: files('tmp421.c'))
> >  softmmu_ss.add(when: 'CONFIG_UNIMP', if_true: files('unimp.c'))
> >  softmmu_ss.add(when: 'CONFIG_EMPTY_SLOT', if_true: files('empty_slot.c=
'))
> > +softmmu_ss.add(when: 'CONFIG_PVPANIC', if_true: files('pvpanic.c'))
> >
> >  # ARM devices
> >  softmmu_ss.add(when: 'CONFIG_PL310', if_true: files('arm_l2x0.c'))
> > @@ -90,7 +91,6 @@ softmmu_ss.add(when: 'CONFIG_IOTKIT_SYSINFO', if_true=
: files('iotkit-sysinfo.c')
> >  softmmu_ss.add(when: 'CONFIG_ARMSSE_CPUID', if_true: files('armsse-cpu=
id.c'))
> >  softmmu_ss.add(when: 'CONFIG_ARMSSE_MHU', if_true: files('armsse-mhu.c=
'))
> >
> > -softmmu_ss.add(when: 'CONFIG_PVPANIC', if_true: files('pvpanic.c'))
> >  softmmu_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
> >  softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_scu.c=
', 'aspeed_sdmc.c', 'aspeed_xdma.c'))
> >  softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-sysreg.c'))
>
> This patch doesn't seem to actually change anything -- it's just
> moving a line of code around in the file ?

Also, this is not the patch which Philippe wrote and I reviewed,
which was this one:
https://patchew.org/QEMU/1544095560-70807-1-git-send-email-peng.hao2@zte.co=
m.cn/1544095560-70807-2-git-send-email-peng.hao2@zte.com.cn/

That patch (for the old build system) does what the commit message
says it does; this one (for the new build system) doesn't. Please
don't retain authorship and reviewed-by tags if the patch is changed
significantly like this.

Have a look at, for example, how the ne2000 ISA and PCI devices
in hw/net are structured and built (source file setup, meson.build,
Kconfig stanzas) to see how to do this kind of "common core, multiple
buses" setup.

thanks
-- PMM

