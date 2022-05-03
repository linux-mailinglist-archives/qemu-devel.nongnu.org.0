Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A767F518050
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 10:58:10 +0200 (CEST)
Received: from localhost ([::1]:56622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nloMD-0006ge-EM
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 04:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nloIV-0003vS-7g
 for qemu-devel@nongnu.org; Tue, 03 May 2022 04:54:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nloIS-0005lo-5A
 for qemu-devel@nongnu.org; Tue, 03 May 2022 04:54:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651568055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+9AS7y5xHUkI3al3wuAKAY/iGonKG+iBqjrysBRJobE=;
 b=ZeeZ+5rUFPm91I5xgvRx6oIO0as5R6ijeQ1UZ1nzS7AQyBykD8uX3RP7yO+l1nr2Ig9agX
 cMh1O6BJwHafLtlaPIH89yzI33q+Yhsm7S2e0aq8PnWNOnQCF7qIUrSJzn2BP1BNQu5XSG
 R1IN0iXXcfcTk8X86jx5nllRFomSiPs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-iGxjOI1LM9qCuXp7eNQNwg-1; Tue, 03 May 2022 04:54:12 -0400
X-MC-Unique: iGxjOI1LM9qCuXp7eNQNwg-1
Received: by mail-wm1-f72.google.com with SMTP id
 t184-20020a1c46c1000000b00394209f54f1so3237785wma.4
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 01:54:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+9AS7y5xHUkI3al3wuAKAY/iGonKG+iBqjrysBRJobE=;
 b=RM3LMrB4l/0jqwMX/fMjUGKtcNBUfcn3KCtMYzJTaf8yPEFlJh2LS54tCtrnj4e+yv
 va1oM1Je1rDaE5MrfT7m4q9VTTdasOQsiwQhD96lePI6eu3mRR5hE5kRZMq2RHzlnqxN
 NjW2qlSjWoXN5Oz50aI1RysQT/KIEf98nXFwR6pcMz9i4lwpN7C+o4FoJGugKAuxSPvz
 CmtLGMJDDQQ0xeZozERZUdPKeJy/GmHrluu8eu7IPLAdHcVGxe5PsE1jajon1jx24B1i
 GNXauDRPfi/7QpJ/OdSm8L/p9SXrrVn7aeWfkd40AoulwcFQ5EPfm8hS7UqGrHBg6iaH
 A/9A==
X-Gm-Message-State: AOAM532Cu3nWLr1zIzW12QZC5N0nBGUTcC/dLMOz8/2gevQIxJC3hPgh
 4HIxban9s8VQXomgNoQBNfxPALrYtNZgZ6qI6RkR03/dC6r8KvWHVUKlOr6ezq9LUHpVbxnA5N4
 IiQvsfjBTsSVcyzA=
X-Received: by 2002:a05:600c:1548:b0:392:8e1a:18c3 with SMTP id
 f8-20020a05600c154800b003928e1a18c3mr2457785wmg.102.1651568051197; 
 Tue, 03 May 2022 01:54:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlKIyfklKw62VIsJfIEHYkUoDrJ9TiCuUkfBJkx4DYYQ+6SdlsOOZ4VkrGu7Vejwkrg0+cGQ==
X-Received: by 2002:a05:600c:1548:b0:392:8e1a:18c3 with SMTP id
 f8-20020a05600c154800b003928e1a18c3mr2457754wmg.102.1651568050953; 
 Tue, 03 May 2022 01:54:10 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 d15-20020adf9b8f000000b0020c5253d8c9sm8634493wrc.21.2022.05.03.01.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 01:54:10 -0700 (PDT)
Date: Tue, 3 May 2022 10:54:08 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, lvivier@redhat.com,
 eduardo@habkost.net, thuth@redhat.com, berrange@redhat.com,
 shan.gavin@gmail.com, peter.maydell@linaro.org,
 Jonathan.Cameron@Huawei.com, zhenyzha@redhat.com, mst@redhat.com,
 armbru@redhat.com, ani@anisinha.ca, pbonzini@redhat.com,
 drjones@redhat.com, eblake@redhat.com, f4bug@amsat.org,
 wangyanan55@huawei.com
Subject: Re: [PATCH v8 2/5] qtest/numa-test: Specify CPU topology in
 aarch64_numa_cpu()
Message-ID: <20220503105408.60d9e07c@redhat.com>
In-Reply-To: <aa4c165b-6aa1-e633-ffa9-d2ae5b286d36@redhat.com>
References: <20220425032802.365061-1-gshan@redhat.com>
 <20220425032802.365061-3-gshan@redhat.com>
 <20220502105227.0146dcce@redhat.com>
 <aa4c165b-6aa1-e633-ffa9-d2ae5b286d36@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, 2 May 2022 18:07:00 +0800
Gavin Shan <gshan@redhat.com> wrote:

> Hi Igor,
>=20
> On 5/2/22 4:52 PM, Igor Mammedov wrote:
> > On Mon, 25 Apr 2022 11:27:59 +0800
> > Gavin Shan <gshan@redhat.com> wrote:
> >  =20
> >> The CPU topology isn't enabled on arm/virt machine yet, but we're
> >> going to do it in next patch. After the CPU topology is enabled by
> >> next patch, "thrad-id=3D1" becomes invalid because the CPU core is =20
> >                   ^^^ typo
> >  =20
>=20
> hmm, my bad. Lets fix it in next revision.
>=20
> >> preferred on arm/virt machine. It means these two CPUs have 0/1
> >> as their core IDs, but their thread IDs are all 0. It will trigger
> >> test failure as the following message indicates:
> >>
> >>    [14/21 qemu:qtest+qtest-aarch64 / qtest-aarch64/numa-test  ERROR
> >>    1.48s   killed by signal 6 SIGABRT =20
> >>    >>> G_TEST_DBUS_DAEMON=3D/home/gavin/sandbox/qemu.main/tests/dbus-v=
mstate-daemon.sh \ =20
> >>        QTEST_QEMU_STORAGE_DAEMON_BINARY=3D./storage-daemon/qemu-storag=
e-daemon         \
> >>        QTEST_QEMU_BINARY=3D./qemu-system-aarch64                      =
                 \
> >>        QTEST_QEMU_IMG=3D./qemu-img MALLOC_PERTURB_=3D83               =
                   \
> >>        /home/gavin/sandbox/qemu.main/build/tests/qtest/numa-test --tap=
 -k
> >>    =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
> >>    stderr:
> >>    qemu-system-aarch64: -numa cpu,node-id=3D0,thread-id=3D1: no match =
found
> >>
> >> This fixes the issue by providing comprehensive SMP configurations
> >> in aarch64_numa_cpu(). The SMP configurations aren't used before
> >> the CPU topology is enabled in next patch.
> >>
> >> Signed-off-by: Gavin Shan <gshan@redhat.com>
> >> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
> >> ---
> >>   tests/qtest/numa-test.c | 3 ++-
> >>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
> >> index 90bf68a5b3..aeda8c774c 100644
> >> --- a/tests/qtest/numa-test.c
> >> +++ b/tests/qtest/numa-test.c
> >> @@ -223,7 +223,8 @@ static void aarch64_numa_cpu(const void *data)
> >>       QTestState *qts;
> >>       g_autofree char *cli =3D NULL;
> >>  =20
> >> -    cli =3D make_cli(data, "-machine smp.cpus=3D2 "
> >> +    cli =3D make_cli(data, "-machine "
> >> +        "smp.cpus=3D2,smp.sockets=3D1,smp.clusters=3D1,smp.cores=3D1,=
smp.threads=3D2 "
> >>           "-numa node,nodeid=3D0,memdev=3Dram -numa node,nodeid=3D1 "
> >>           "-numa cpu,node-id=3D1,thread-id=3D0 " =20
> >                                  ^^^^
> > make it sensible as well, i.e. socket/cluster/cores-ids ...
> >  =20
>=20
> Could you help if the following command lines are what you want? I don't
> think we can do it. Without PATCH[v8 3/5] applied, {socket,cluster,core}-=
id
> are invalid from arm/virt machine side and we will run into errors.
you are right, you can only fix -numa after 3/5

btw:=20
splitting threads between several numa nodes here probably is unreal
configuration. Should be fixed in follow up patches.

>       -machine                                                           \
>       smp.cpus=3D2,smp.sockets=3D1,smp.clusters=3D1,smp.cores=3D1,smp.thr=
eads=3D2  \
>       -numa node,nodeid=3D0,memdev=3Dram -numa node,nodeid=3D1           =
      \
>       -numa cpu,node-id=3D1,socket-id=3D0,cluster-id=3D0,core-id=3D0,thre=
ad-id=3D0 \
>       -numa cpu,node-id=3D0,socket-id=3D0,cluster-id=3D0,core-id=3D0,thre=
ad-id=3D1
>     =20
>       # make -j 10 check
>         :
>       >>> QTEST_QEMU_IMG=3D./qemu-img MALLOC_PERTURB_=3D237              =
          \ =20
>          QTEST_QEMU_STORAGE_DAEMON_BINARY=3D./storage-daemon/qemu-storage=
-daemon \
>          QTEST_QEMU_BINARY=3D./qemu-system-aarch64                       =
        \
>          G_TEST_DBUS_DAEMON=3D/home/gavin/sandbox/qemu.main/tests/dbus-vm=
state-daemon.sh \
>          /home/gavin/sandbox/qemu.main/build/tests/qtest/numa-test --tap =
-k
>      =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80  =E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95
>      stderr:
>      qemu-system-aarch64: -numa cpu,node-id=3D1,socket-id=3D0,cluster-id=
=3D0,core-id=3D0,thread-id=3D0: core-id is not supported
>      Broken pipe
>=20
>      (The error is reported from hw/core/machine.c::machine_set_cpu_numa_=
node())
>=20
> By the way, could you also help to check if the following patches look
> good to you? I hope to make next revision eligible for merge :)
>=20
>      [PATCH v8 1/5] qapi/machine.json: Add cluster-id
>      [PATCH v8 3/5] hw/arm/virt: Consider SMP configuration in CPU topolo=
gy
>=20
> >>           "-numa cpu,node-id=3D0,thread-id=3D1"); =20
> >  =20
>=20
> Thanks,
> Gavin
>=20


