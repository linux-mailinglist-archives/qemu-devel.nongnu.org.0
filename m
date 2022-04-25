Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8879750E22B
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 15:44:44 +0200 (CEST)
Received: from localhost ([::1]:35538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niz19-0004sv-JE
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 09:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1niyzb-0002JS-4R
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 09:43:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1niyzZ-0006LQ-BL
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 09:43:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650894184;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vI9/5+Pnwf2x7M8E69CU1K3S6mRtGVR7ogvY4goDUnY=;
 b=XzQ8+JDy25Cr1MMYfDivL+GcJYsbPQm3yuGqlGcFFQyBokuxm9HjdG69PWx15dnMDO77/f
 VV4uWUH5qyjE6eA1z7OLJDMe5o3i8FFmyVhkf5gVqyR+SL/remrz+tPhllPQYvS3JSjc3S
 PUdm7g3EEGHzBwSQn2fVxmadTyCkRFs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-TZ613iq2N2yqqyEcNOEAhg-1; Mon, 25 Apr 2022 09:43:03 -0400
X-MC-Unique: TZ613iq2N2yqqyEcNOEAhg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 593FE1C0512A;
 Mon, 25 Apr 2022 13:43:02 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8ECBAC53360;
 Mon, 25 Apr 2022 13:42:56 +0000 (UTC)
Date: Mon, 25 Apr 2022 14:42:53 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Martin Kletzander <mkletzan@redhat.com>
Subject: Re: [PATCH 05/18] tests/qtest: Specify audiodev= and -audiodev
Message-ID: <YmalXbNVd/knTxnB@redhat.com>
References: <cover.1650874791.git.mkletzan@redhat.com>
 <6e7f2808dd40679a415812767b88f2a411fc137f.1650874791.git.mkletzan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e7f2808dd40679a415812767b88f2a411fc137f.1650874791.git.mkletzan@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Darren Kenny <darren.kenny@oracle.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 25, 2022 at 10:21:48AM +0200, Martin Kletzander wrote:
> This will enable removing deprecated default audiodev support.
> 
> I did not figure out how to make the audiodev represented as an
> interface node, so this is a workaround.  I am not sure what would be
> the proper way.

Not sure I understand what you mean by this 'interface node' reference ?

The code looks fine though

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> 
> Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
> ---
>  tests/qtest/ac97-test.c                 |  3 ++-
>  tests/qtest/es1370-test.c               |  3 ++-
>  tests/qtest/fuzz/generic_fuzz_configs.h |  6 ++++--
>  tests/qtest/intel-hda-test.c            | 15 ++++++++++-----
>  4 files changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/qtest/ac97-test.c b/tests/qtest/ac97-test.c
> index e09f2495d24d..9711f1f6d966 100644
> --- a/tests/qtest/ac97-test.c
> +++ b/tests/qtest/ac97-test.c
> @@ -45,7 +45,8 @@ static void *ac97_create(void *pci_bus, QGuestAllocator *alloc, void *addr)
>  static void ac97_register_nodes(void)
>  {
>      QOSGraphEdgeOptions opts = {
> -        .extra_device_opts = "addr=04.0",
> +        .extra_device_opts = "addr=04.0,audiodev=audio0",
> +        .before_cmd_line = "-audiodev driver=none,id=audio0",
>      };
>      add_qpci_address(&opts, &(QPCIAddress) { .devfn = QPCI_DEVFN(4, 0) });
>  
> diff --git a/tests/qtest/es1370-test.c b/tests/qtest/es1370-test.c
> index 2fd7fd2d3d30..5facda8d0d8d 100644
> --- a/tests/qtest/es1370-test.c
> +++ b/tests/qtest/es1370-test.c
> @@ -46,7 +46,8 @@ static void *es1370_create(void *pci_bus, QGuestAllocator *alloc, void *addr)
>  static void es1370_register_nodes(void)
>  {
>      QOSGraphEdgeOptions opts = {
> -        .extra_device_opts = "addr=04.0",
> +        .extra_device_opts = "addr=04.0,audiodev=audio0",
> +        .before_cmd_line = "-audiodev driver=none,id=audio0",
>      };
>      add_qpci_address(&opts, &(QPCIAddress) { .devfn = QPCI_DEVFN(4, 0) });
>  
> diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
> index 004c701915e1..84a93b3c350b 100644
> --- a/tests/qtest/fuzz/generic_fuzz_configs.h
> +++ b/tests/qtest/fuzz/generic_fuzz_configs.h
> @@ -101,8 +101,10 @@ const generic_fuzz_config predefined_configs[] = {
>      },{
>          .name = "intel-hda",
>          .args = "-machine q35 -nodefaults -device intel-hda,id=hda0 "
> -        "-device hda-output,bus=hda0.0 -device hda-micro,bus=hda0.0 "
> -        "-device hda-duplex,bus=hda0.0",
> +        "-audiodev driver=none,id=audio0",
> +        "-device hda-output,bus=hda0.0,audiodev=audio0 "
> +        "-device hda-micro,bus=hda0.0,audiodev=audio0 "
> +        "-device hda-duplex,bus=hda0.0,audiodev=audio0",
>          .objects = "intel-hda",
>      },{
>          .name = "ide-hd",
> diff --git a/tests/qtest/intel-hda-test.c b/tests/qtest/intel-hda-test.c
> index a58c98e4d11b..39ced2bc6ac6 100644
> --- a/tests/qtest/intel-hda-test.c
> +++ b/tests/qtest/intel-hda-test.c
> @@ -11,20 +11,24 @@
>  #include "libqtest-single.h"
>  
>  #define HDA_ID "hda0"
> -#define CODEC_DEVICES " -device hda-output,bus=" HDA_ID ".0" \
> -                      " -device hda-micro,bus=" HDA_ID ".0" \
> -                      " -device hda-duplex,bus=" HDA_ID ".0"
> +#define AUDIODEV " -audiodev driver=none,id=audio0 "
> +#define AUDIODEV_REF "audiodev=audio0"
> +#define CODEC_DEVICES " -device hda-output,bus=" HDA_ID ".0," AUDIODEV_REF \
> +                      " -device hda-micro,bus=" HDA_ID ".0," AUDIODEV_REF \
> +                      " -device hda-duplex,bus=" HDA_ID ".0," AUDIODEV_REF
>  
>  /* Tests only initialization so far. TODO: Replace with functional tests */
>  static void ich6_test(void)
>  {
> -    qtest_start("-device intel-hda,id=" HDA_ID CODEC_DEVICES);
> +    qtest_start(AUDIODEV "-device intel-hda,id=" HDA_ID CODEC_DEVICES);
>      qtest_end();
>  }
>  
>  static void ich9_test(void)
>  {
> -    qtest_start("-machine q35 -device ich9-intel-hda,bus=pcie.0,addr=1b.0,id="
> +    qtest_start("-machine q35"
> +                AUDIODEV
> +                "-device ich9-intel-hda,bus=pcie.0,addr=1b.0,id="
>                  HDA_ID CODEC_DEVICES);
>      qtest_end();
>  }
> @@ -39,6 +43,7 @@ static void test_issue542_ich6(void)
>      QTestState *s;
>  
>      s = qtest_init("-nographic -nodefaults -M pc-q35-6.2 "
> +                   AUDIODEV
>                     "-device intel-hda,id=" HDA_ID CODEC_DEVICES);
>  
>      qtest_outl(s, 0xcf8, 0x80000804);
> -- 
> 2.35.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


