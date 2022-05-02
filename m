Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E339516C9E
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 10:55:46 +0200 (CEST)
Received: from localhost ([::1]:49568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlRqK-0002PK-OZ
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 04:55:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nlRnG-0000le-Qm
 for qemu-devel@nongnu.org; Mon, 02 May 2022 04:52:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nlRnF-0000Ke-6P
 for qemu-devel@nongnu.org; Mon, 02 May 2022 04:52:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651481552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6LTA2/dze/7ZUghvqKYPOWZc5bHVhq3ikE2h8oasSR0=;
 b=JwkCZfcur9NcwOWj0vgahpthgfqesOqh3CvG5N8amrbwK/+ZO7WGGEm8flRB4Ill5oShqb
 7nPRctmZw2iBxOL1/LhkCPjxR7TggnO05VjZst2DnrZ2cfn67+ND0XM+tgwp5kg3LM6YZs
 ey3VnJyD2aAslalzV1n3YjXzBHBCQLk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-iyZafU0NMQq4AQZKLpXLKg-1; Mon, 02 May 2022 04:52:31 -0400
X-MC-Unique: iyZafU0NMQq4AQZKLpXLKg-1
Received: by mail-wm1-f69.google.com with SMTP id
 v184-20020a1cacc1000000b00393e492a398so9679090wme.5
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 01:52:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6LTA2/dze/7ZUghvqKYPOWZc5bHVhq3ikE2h8oasSR0=;
 b=V/T64gmxWzDTfcT6ZxVVb3xuCBaQK5sXxk3pNeLoYnWELDb5t/XRYchV7mTdJ7wl7l
 f0Dhev0+lRKG/k0Hv8BTKWFKc8B/rrxBinnlIakhqUgagOh5XrhgIdzueUE8RHWwZQCY
 ddK7Izl/Uo0sZ0P1VEX5tOshCfFOV9FS9Kn+8l3VEQKP3NIyh+DHmO8u3aQn5mHMS8r1
 rJcGLO22PQgV88Y0ItnSJqzvtJDERD3nSyKU53bQqwl4Nem2+tH1TROM2x2HbI2aIi/r
 FtZF0dRcKmmjKwEYSHo2eNPDSxRKkwgZeaBXyOzaMsk3gnm4GVypf+7vNgax90Bj3VWi
 5t7g==
X-Gm-Message-State: AOAM532Hv1dkqJFWbixLabjNyhqHUkBGsKpM1I36U+em7MT7RHqDAAw0
 f46oks8Srzr7xuzC61aRzE0ueTMe1OIZ/hs4/N09VNobWDJ6KxZln7k45fySI+Y1GZwh3gIl265
 snwz49K9gTzlImGI=
X-Received: by 2002:a7b:c446:0:b0:394:3293:a88f with SMTP id
 l6-20020a7bc446000000b003943293a88fmr6369999wmi.22.1651481550168; 
 Mon, 02 May 2022 01:52:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEGyBTgVxo1Ewsn27IVPf9wVGC2SlfAZ9fmKMyi68rYrmAY+2WpBYIsOVl+cxrV6FegQYkqg==
X-Received: by 2002:a7b:c446:0:b0:394:3293:a88f with SMTP id
 l6-20020a7bc446000000b003943293a88fmr6369970wmi.22.1651481549899; 
 Mon, 02 May 2022 01:52:29 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 s18-20020adf9792000000b0020c5253d8e1sm7837492wrb.45.2022.05.02.01.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 01:52:29 -0700 (PDT)
Date: Mon, 2 May 2022 10:52:27 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v8 2/5] qtest/numa-test: Specify CPU topology in
 aarch64_numa_cpu()
Message-ID: <20220502105227.0146dcce@redhat.com>
In-Reply-To: <20220425032802.365061-3-gshan@redhat.com>
References: <20220425032802.365061-1-gshan@redhat.com>
 <20220425032802.365061-3-gshan@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, eduardo@habkost.net, thuth@redhat.com,
 berrange@redhat.com, peter.maydell@linaro.org, armbru@redhat.com,
 mst@redhat.com, qemu-devel@nongnu.org, zhenyzha@redhat.com, drjones@redhat.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, Jonathan.Cameron@Huawei.com,
 ani@anisinha.ca, pbonzini@redhat.com, wangyanan55@huawei.com,
 eblake@redhat.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 25 Apr 2022 11:27:59 +0800
Gavin Shan <gshan@redhat.com> wrote:

> The CPU topology isn't enabled on arm/virt machine yet, but we're
> going to do it in next patch. After the CPU topology is enabled by
> next patch, "thrad-id=3D1" becomes invalid because the CPU core is
                 ^^^ typo

> preferred on arm/virt machine. It means these two CPUs have 0/1
> as their core IDs, but their thread IDs are all 0. It will trigger
> test failure as the following message indicates:
>=20
>   [14/21 qemu:qtest+qtest-aarch64 / qtest-aarch64/numa-test  ERROR
>   1.48s   killed by signal 6 SIGABRT
>   >>> G_TEST_DBUS_DAEMON=3D/home/gavin/sandbox/qemu.main/tests/dbus-vmsta=
te-daemon.sh \ =20
>       QTEST_QEMU_STORAGE_DAEMON_BINARY=3D./storage-daemon/qemu-storage-da=
emon         \
>       QTEST_QEMU_BINARY=3D./qemu-system-aarch64                          =
             \
>       QTEST_QEMU_IMG=3D./qemu-img MALLOC_PERTURB_=3D83                   =
               \
>       /home/gavin/sandbox/qemu.main/build/tests/qtest/numa-test --tap -k
>   =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
>   stderr:
>   qemu-system-aarch64: -numa cpu,node-id=3D0,thread-id=3D1: no match found
>=20
> This fixes the issue by providing comprehensive SMP configurations
> in aarch64_numa_cpu(). The SMP configurations aren't used before
> the CPU topology is enabled in next patch.
>=20
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  tests/qtest/numa-test.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
> index 90bf68a5b3..aeda8c774c 100644
> --- a/tests/qtest/numa-test.c
> +++ b/tests/qtest/numa-test.c
> @@ -223,7 +223,8 @@ static void aarch64_numa_cpu(const void *data)
>      QTestState *qts;
>      g_autofree char *cli =3D NULL;
> =20
> -    cli =3D make_cli(data, "-machine smp.cpus=3D2 "
> +    cli =3D make_cli(data, "-machine "
> +        "smp.cpus=3D2,smp.sockets=3D1,smp.clusters=3D1,smp.cores=3D1,smp=
.threads=3D2 "
>          "-numa node,nodeid=3D0,memdev=3Dram -numa node,nodeid=3D1 "
>          "-numa cpu,node-id=3D1,thread-id=3D0 "
                                ^^^^
make it sensible as well, i.e. socket/cluster/cores-ids ...

>          "-numa cpu,node-id=3D0,thread-id=3D1");


