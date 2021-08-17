Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A6D3EEBC4
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 13:32:30 +0200 (CEST)
Received: from localhost ([::1]:55982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFxKX-0000PK-L7
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 07:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mFxJe-0007jV-Pj
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 07:31:35 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:58013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mFxJc-0002Jx-Pf
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 07:31:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=E//YlMRTjFNeM0eBjKo3SvfGinGeQpWxEMQV+QUqrZY=; b=mgyEjHX4yCx1Qp59YrsxQyKwPP
 8rQZk8kvstGydAH8R6Hb19bp/sZgoMV+tPSpbx1SmLjaSB0sT7y/BiBd4CrbV2lHjyGoP0r2ttW7L
 vKHh5dmvFU+3KpqSTLJ4mHYRveJij/gxWBP5nZLMXnnH4y+4QixvxG5VxJieYoJj6Ty5z/j/ZVwWa
 QbZsDsW714N/twjXywF7OiqVvozuSoR+CgBy07THOx1kPQe1nJFx5BLlYNgzBSh0D8K1zB3c/eGao
 B0EclBhHR/tHx0t5iGswQSSkruiMxdG0WlaM/KVrqKtuNFctQqaR/mvw7TWEVp/v4emKr8bK7+TEj
 EZEwVaSRzzeRcelcjTOfi7Jzp7JNy40679yn7l1U/mk6V/qTEzyFVmidz3po9muNhNRkXDf4dMF66
 NUQ9+C2asaFNCA4upyb52oSi12rpXAnC/Cs5O/yDuzQwXomlR1gEbgHoUAkrUrbbU6vDnBQCf5czN
 SCClBVUk2jWuDWZM/N0fYaudKPNNtyPsJYHbwDCgnfTAk7hJSbgxoieZ/Kn76pn4YqGhPuTfYz+6+
 8FxkGj01P5owCn299PUm3SXtsfVEs6d0HOqkT+IwHLayKa5f9KMwR5iIaxir7XIFufomkCsG0GYCV
 w8N4YnQROeSQoI5BE6HzLgOf/oNgImzTXm4zZ+LYs=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 =?utf-8?B?S8WRdsOhZ8OzIFpvbHTDoW4=?= <dirty.ice.hu@gmail.com>,
 Volker =?ISO-8859-1?Q?R=FCmelin?= <vr_qemu@t-online.de>,
 Yonggang Luo <luoyonggang@gmail.com>, clamky@hotmail.com
Subject: Re: [PATCH 1/3] MAINTAINERS: Split Audio backends VS frontends
Date: Tue, 17 Aug 2021 13:31:16 +0200
Message-ID: <1790111.v9OTG8XKiZ@silver>
In-Reply-To: <20210816191014.2020783-2-philmd@redhat.com>
References: <20210816191014.2020783-1-philmd@redhat.com>
 <20210816191014.2020783-2-philmd@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Montag, 16. August 2021 21:10:12 CEST Philippe Mathieu-Daud=E9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  MAINTAINERS | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6b3697962c1..9ec6baa7e4c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1660,6 +1660,16 @@ F: hw/net/opencores_eth.c
>=20
>  Devices
>  -------
> +Overall Audio frontends
> +M: Gerd Hoffmann <kraxel@redhat.com>
> +S: Odd Fixes
> +F: hw/audio/
> +F: include/hw/audio/
> +F: tests/qtest/ac97-test.c
> +F: tests/qtest/es1370-test.c
> +F: tests/qtest/intel-hda-test.c
> +F: tests/qtest/fuzz-sb16-test.c
> +

I would call that "Audio Hardware Emulation" instead of "Overall Audio=20
frontends".

And probably it would make sense to further subdivide this section into the=
=20
individual hardware models (Sound Blaster, Adlib, PC Speaker, VIA AC97, ...=
),=20
similar to patch 3. Could be split subsequently as well of course.

>  Xilinx CAN
>  M: Vikram Garhwal <fnu.vikram@xilinx.com>
>  M: Francisco Iglesias <francisco.iglesias@xilinx.com>
> @@ -2256,17 +2266,11 @@ F: include/net/can_*.h
>=20
>  Subsystems
>  ----------
> -Audio
> +Overall Audio backends
>  M: Gerd Hoffmann <kraxel@redhat.com>
>  S: Odd Fixes
>  F: audio/
> -F: hw/audio/
> -F: include/hw/audio/
>  F: qapi/audio.json
> -F: tests/qtest/ac97-test.c
> -F: tests/qtest/es1370-test.c
> -F: tests/qtest/intel-hda-test.c
> -F: tests/qtest/fuzz-sb16-test.c
>=20
>  Block layer core
>  M: Kevin Wolf <kwolf@redhat.com>

Likewise I would call this section "Shared/common QEMU audio library/
subsystem" or something like that instead of "Overall Audio backends".

Best regards,
Christian Schoenebeck



