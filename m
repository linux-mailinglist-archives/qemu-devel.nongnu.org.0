Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 908CF51F490
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 08:32:50 +0200 (CEST)
Received: from localhost ([::1]:54014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnwwr-00026b-48
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 02:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nnws6-0000aI-G0
 for qemu-devel@nongnu.org; Mon, 09 May 2022 02:28:07 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:38673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nnws3-00089s-Ck
 for qemu-devel@nongnu.org; Mon, 09 May 2022 02:27:54 -0400
Received: by mail-ej1-x62f.google.com with SMTP id n10so24789917ejk.5
 for <qemu-devel@nongnu.org>; Sun, 08 May 2022 23:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8imME9EbhExSwyNbANoOoghxpvgzo5+0jhHVIHJ4/2U=;
 b=cvrdrOOTBNKvzV/kYJqH4IcLNpRg2PSRsJznCnh7Ir0kjeokliIA/RRvpBHI7a73ka
 WoRWZyOX1iikrzzpOGq0nInEuPf7qloXIVn+AATtPvaHYiXbZWOdSpGqLSf5jgmZXLeV
 N5EkJYMlNsMEdnRH3TsID5cTlQ/yPbjiHHgsplibMLcJKBp264GDVwQjmgCmpSkdsbiC
 W8J0SSXw4E5eSMDqSL9rX6ZXfniwrWo5awHNGe0zDLMEHB7/yXTyZQoE7wPt7n7l91lX
 OljTJHqN+vwN288uV1kkL/z6DxnYLKrRFdL+au29BTvtsjHQ2Huv7v5WaN1s4P0fZWiD
 VaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8imME9EbhExSwyNbANoOoghxpvgzo5+0jhHVIHJ4/2U=;
 b=JiFwfOfajtFIEehDU7gImsnRCLrdTo/2pezKUSejn2r9n1nVShk4enwiQ4yoWLVh6D
 715EmiIvxLwUdkCw+EhfoDHlj7rQ1yrACnHN94zofjD04KM40AiRSCR23Uac2eCUgy8X
 +XI6ZGFnWv7XKryJrY7xekz3639Kbz3FxxQeabPNh9MXBSBG5S+nigGgHv5Bf4bGLsQA
 s2WNLkiSdrTKMJjnx3+E1ULLxxDDzatc6iwmdLQa1YU0OSycDYD0nJnQ9U8pPPwhYzC6
 LltI3BbeqZfCP6Qjudw9WEFonv+Eg5kfnsxmXitmSKRVkJpmnYn0zn/XQn3IRcog8cFs
 DWbg==
X-Gm-Message-State: AOAM533BxV+J9Wev+jCCqH+lL57vYZX3YVei3o0+9KcnjnE5onJcqVVH
 GMwZt2+EcF1QNibNDWLtyifvXIFyE7r/WgpehdmLUQ==
X-Google-Smtp-Source: ABdhPJywJXZ3ZW/ZJXJs4fA+OeJMnBv6TqfZ1IZU40ftEX1h6oN01W2eYvvKaLTCGomcWuU7EYZlBObP5b1o39yuSA0=
X-Received: by 2002:a17:907:7247:b0:6f9:bb40:efd8 with SMTP id
 ds7-20020a170907724700b006f9bb40efd8mr4858608ejc.273.1652077668454; Sun, 08
 May 2022 23:27:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220507134320.6289-1-cfontana@suse.de>
 <20220507134320.6289-13-cfontana@suse.de>
In-Reply-To: <20220507134320.6289-13-cfontana@suse.de>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 9 May 2022 11:57:37 +0530
Message-ID: <CAARzgwzrcYPrnYtktVLaOp2ceTqJpggDuUGXv_V60PeA50Y8Gg@mail.gmail.com>
Subject: Re: [libvirt RFCv8 12/27] qemu: capabilities: add multifd to the
 probed migration capabilities
To: Claudio Fontana <cfontana@suse.de>, QEMU Developers <qemu-devel@nongnu.org>
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 libvir-list@redhat.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::62f;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Qemu folks,
It seems we do officially support multifd from version 4.0 :

commit cbfd6c957a4437d4759ca660e621daa381bf2898
Author: Juan Quintela <quintela@redhat.com>
Date:   Wed Feb 6 13:54:06 2019 +0100

    multifd: Drop x-

    We make it supported from now on.

    Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
    Reviewed-by: Markus Armbruster <armbru@redhat.com>
    Signed-off-by: Juan Quintela <quintela@redhat.com>

$ git tag --contains cbfd6c957a4437d4759ca660e621daa381bf2898 | sort
-V | grep -v list | head -1
v4.0.0

Yet it seems we continue to prefix the migration property with "x-"
(x-multifd). This prop was added here and we have continued to use it
as is:

commit 30126bbf1f7fcad0bf4c65b01a21ff22a36a9759
Author: Juan Quintela <quintela@redhat.com>
Date:   Thu Jan 14 12:23:00 2016 +0100

    migration: Add multifd capability

    Signed-off-by: Juan Quintela <quintela@redhat.com>
    Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
    Reviewed-by: Peter Xu <peterx@redhat.com>
    Reviewed-by: Daniel P. Berrange <berrange@redhat.com>

Can anyone explain why?

On Sat, May 7, 2022 at 7:13 PM Claudio Fontana <cfontana@suse.de> wrote:
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>

other than the question above,

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  src/qemu/qemu_capabilities.c                      | 4 ++++
>  src/qemu/qemu_capabilities.h                      | 3 +++
>  tests/qemucapabilitiesdata/caps_4.0.0.aarch64.xml | 1 +
>  tests/qemucapabilitiesdata/caps_4.0.0.ppc64.xml   | 1 +
>  tests/qemucapabilitiesdata/caps_4.0.0.riscv32.xml | 1 +
>  tests/qemucapabilitiesdata/caps_4.0.0.riscv64.xml | 1 +
>  tests/qemucapabilitiesdata/caps_4.0.0.s390x.xml   | 1 +
>  tests/qemucapabilitiesdata/caps_4.0.0.x86_64.xml  | 1 +
>  tests/qemucapabilitiesdata/caps_4.1.0.x86_64.xml  | 1 +
>  tests/qemucapabilitiesdata/caps_4.2.0.aarch64.xml | 1 +
>  tests/qemucapabilitiesdata/caps_4.2.0.ppc64.xml   | 1 +
>  tests/qemucapabilitiesdata/caps_4.2.0.s390x.xml   | 1 +
>  tests/qemucapabilitiesdata/caps_4.2.0.x86_64.xml  | 1 +
>  tests/qemucapabilitiesdata/caps_5.0.0.aarch64.xml | 1 +
>  tests/qemucapabilitiesdata/caps_5.0.0.ppc64.xml   | 1 +
>  tests/qemucapabilitiesdata/caps_5.0.0.riscv64.xml | 1 +
>  tests/qemucapabilitiesdata/caps_5.0.0.x86_64.xml  | 1 +
>  tests/qemucapabilitiesdata/caps_5.1.0.sparc.xml   | 1 +
>  tests/qemucapabilitiesdata/caps_5.1.0.x86_64.xml  | 1 +
>  tests/qemucapabilitiesdata/caps_5.2.0.aarch64.xml | 1 +
>  tests/qemucapabilitiesdata/caps_5.2.0.ppc64.xml   | 1 +
>  tests/qemucapabilitiesdata/caps_5.2.0.riscv64.xml | 1 +
>  tests/qemucapabilitiesdata/caps_5.2.0.s390x.xml   | 1 +
>  tests/qemucapabilitiesdata/caps_5.2.0.x86_64.xml  | 1 +
>  tests/qemucapabilitiesdata/caps_6.0.0.aarch64.xml | 1 +
>  tests/qemucapabilitiesdata/caps_6.0.0.s390x.xml   | 1 +
>  tests/qemucapabilitiesdata/caps_6.0.0.x86_64.xml  | 1 +
>  tests/qemucapabilitiesdata/caps_6.1.0.x86_64.xml  | 1 +
>  tests/qemucapabilitiesdata/caps_6.2.0.aarch64.xml | 1 +
>  tests/qemucapabilitiesdata/caps_6.2.0.ppc64.xml   | 1 +
>  tests/qemucapabilitiesdata/caps_6.2.0.x86_64.xml  | 1 +
>  tests/qemucapabilitiesdata/caps_7.0.0.aarch64.xml | 1 +
>  tests/qemucapabilitiesdata/caps_7.0.0.ppc64.xml   | 1 +
>  tests/qemucapabilitiesdata/caps_7.0.0.x86_64.xml  | 1 +
>  34 files changed, 39 insertions(+)
>
> diff --git a/src/qemu/qemu_capabilities.c b/src/qemu/qemu_capabilities.c
> index 1ed4cda7f0..581b6a40df 100644
> --- a/src/qemu/qemu_capabilities.c
> +++ b/src/qemu/qemu_capabilities.c
> @@ -672,6 +672,9 @@ VIR_ENUM_IMPL(virQEMUCaps,
>                "virtio-iommu-pci", /* QEMU_CAPS_DEVICE_VIRTIO_IOMMU_PCI */
>                "virtio-iommu.boot-bypass", /* QEMU_CAPS_VIRTIO_IOMMU_BOOT_BYPASS */
>                "virtio-net.rss", /* QEMU_CAPS_VIRTIO_NET_RSS */
> +
> +              /* 430 */
> +              "migrate-multifd", /* QEMU_CAPS_MIGRATE_MULTIFD */
>      );
>
>
> @@ -1230,6 +1233,7 @@ struct virQEMUCapsStringFlags virQEMUCapsCommands[] = {
>
>  struct virQEMUCapsStringFlags virQEMUCapsMigration[] = {
>      { "rdma-pin-all", QEMU_CAPS_MIGRATE_RDMA },
> +    { "multifd", QEMU_CAPS_MIGRATE_MULTIFD },
>  };
>
>  /* Use virQEMUCapsQMPSchemaQueries for querying parameters of events */
> diff --git a/src/qemu/qemu_capabilities.h b/src/qemu/qemu_capabilities.h
> index 9b240e47fb..b089f83da1 100644
> --- a/src/qemu/qemu_capabilities.h
> +++ b/src/qemu/qemu_capabilities.h
> @@ -648,6 +648,9 @@ typedef enum { /* virQEMUCapsFlags grouping marker for syntax-check */
>      QEMU_CAPS_VIRTIO_IOMMU_BOOT_BYPASS, /* virtio-iommu.boot-bypass */
>      QEMU_CAPS_VIRTIO_NET_RSS, /* virtio-net rss feature */
>
> +    /* 430 */
> +    QEMU_CAPS_MIGRATE_MULTIFD, /* migrate can set multifd parameter */
> +
>      QEMU_CAPS_LAST /* this must always be the last item */
>  } virQEMUCapsFlags;
>
> diff --git a/tests/qemucapabilitiesdata/caps_4.0.0.aarch64.xml b/tests/qemucapabilitiesdata/caps_4.0.0.aarch64.xml
> index 5adf904fc4..4ca2cfa81c 100644
> --- a/tests/qemucapabilitiesdata/caps_4.0.0.aarch64.xml
> +++ b/tests/qemucapabilitiesdata/caps_4.0.0.aarch64.xml
> @@ -148,6 +148,7 @@
>    <flag name='input-linux'/>
>    <flag name='query-display-options'/>
>    <flag name='virtio-blk.queue-size'/>
> +  <flag name='migrate-multifd'/>
>    <version>4000000</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>61700240</microcodeVersion>
> diff --git a/tests/qemucapabilitiesdata/caps_4.0.0.ppc64.xml b/tests/qemucapabilitiesdata/caps_4.0.0.ppc64.xml
> index a84adc2610..1db978eb4c 100644
> --- a/tests/qemucapabilitiesdata/caps_4.0.0.ppc64.xml
> +++ b/tests/qemucapabilitiesdata/caps_4.0.0.ppc64.xml
> @@ -153,6 +153,7 @@
>    <flag name='input-linux'/>
>    <flag name='query-display-options'/>
>    <flag name='virtio-blk.queue-size'/>
> +  <flag name='migrate-multifd'/>
>    <version>4000000</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>42900240</microcodeVersion>
> diff --git a/tests/qemucapabilitiesdata/caps_4.0.0.riscv32.xml b/tests/qemucapabilitiesdata/caps_4.0.0.riscv32.xml
> index c494254c4d..251d4dfd29 100644
> --- a/tests/qemucapabilitiesdata/caps_4.0.0.riscv32.xml
> +++ b/tests/qemucapabilitiesdata/caps_4.0.0.riscv32.xml
> @@ -145,6 +145,7 @@
>    <flag name='input-linux'/>
>    <flag name='query-display-options'/>
>    <flag name='virtio-blk.queue-size'/>
> +  <flag name='migrate-multifd'/>
>    <version>4000000</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>0</microcodeVersion>
> diff --git a/tests/qemucapabilitiesdata/caps_4.0.0.riscv64.xml b/tests/qemucapabilitiesdata/caps_4.0.0.riscv64.xml
> index d2582fa297..a4af47c6a4 100644
> --- a/tests/qemucapabilitiesdata/caps_4.0.0.riscv64.xml
> +++ b/tests/qemucapabilitiesdata/caps_4.0.0.riscv64.xml
> @@ -145,6 +145,7 @@
>    <flag name='input-linux'/>
>    <flag name='query-display-options'/>
>    <flag name='virtio-blk.queue-size'/>
> +  <flag name='migrate-multifd'/>
>    <version>4000000</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>0</microcodeVersion>
> diff --git a/tests/qemucapabilitiesdata/caps_4.0.0.s390x.xml b/tests/qemucapabilitiesdata/caps_4.0.0.s390x.xml
> index 4f36186044..2bab764867 100644
> --- a/tests/qemucapabilitiesdata/caps_4.0.0.s390x.xml
> +++ b/tests/qemucapabilitiesdata/caps_4.0.0.s390x.xml
> @@ -115,6 +115,7 @@
>    <flag name='input-linux'/>
>    <flag name='query-display-options'/>
>    <flag name='virtio-blk.queue-size'/>
> +  <flag name='migrate-multifd'/>
>    <version>4000000</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>39100240</microcodeVersion>
> diff --git a/tests/qemucapabilitiesdata/caps_4.0.0.x86_64.xml b/tests/qemucapabilitiesdata/caps_4.0.0.x86_64.xml
> index 18e5ebd4f4..aa8a9812e5 100644
> --- a/tests/qemucapabilitiesdata/caps_4.0.0.x86_64.xml
> +++ b/tests/qemucapabilitiesdata/caps_4.0.0.x86_64.xml
> @@ -188,6 +188,7 @@
>    <flag name='input-linux'/>
>    <flag name='query-display-options'/>
>    <flag name='virtio-blk.queue-size'/>
> +  <flag name='migrate-multifd'/>
>    <version>4000000</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>43100240</microcodeVersion>
> diff --git a/tests/qemucapabilitiesdata/caps_4.1.0.x86_64.xml b/tests/qemucapabilitiesdata/caps_4.1.0.x86_64.xml
> index 12c5ebe6f3..bd89f0c6b2 100644
> --- a/tests/qemucapabilitiesdata/caps_4.1.0.x86_64.xml
> +++ b/tests/qemucapabilitiesdata/caps_4.1.0.x86_64.xml
> @@ -195,6 +195,7 @@
>    <flag name='input-linux'/>
>    <flag name='query-display-options'/>
>    <flag name='virtio-blk.queue-size'/>
> +  <flag name='migrate-multifd'/>
>    <version>4001000</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>43100241</microcodeVersion>
> diff --git a/tests/qemucapabilitiesdata/caps_4.2.0.aarch64.xml b/tests/qemucapabilitiesdata/caps_4.2.0.aarch64.xml
> index ee536b7b63..369ef707b9 100644
> --- a/tests/qemucapabilitiesdata/caps_4.2.0.aarch64.xml
> +++ b/tests/qemucapabilitiesdata/caps_4.2.0.aarch64.xml
> @@ -163,6 +163,7 @@
>    <flag name='input-linux'/>
>    <flag name='query-display-options'/>
>    <flag name='virtio-blk.queue-size'/>
> +  <flag name='migrate-multifd'/>
>    <version>4001050</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>61700242</microcodeVersion>
> diff --git a/tests/qemucapabilitiesdata/caps_4.2.0.ppc64.xml b/tests/qemucapabilitiesdata/caps_4.2.0.ppc64.xml
> index 10f5a9e2c5..16c867a46b 100644
> --- a/tests/qemucapabilitiesdata/caps_4.2.0.ppc64.xml
> +++ b/tests/qemucapabilitiesdata/caps_4.2.0.ppc64.xml
> @@ -160,6 +160,7 @@
>    <flag name='input-linux'/>
>    <flag name='query-display-options'/>
>    <flag name='virtio-blk.queue-size'/>
> +  <flag name='migrate-multifd'/>
>    <version>4001050</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>42900242</microcodeVersion>
> diff --git a/tests/qemucapabilitiesdata/caps_4.2.0.s390x.xml b/tests/qemucapabilitiesdata/caps_4.2.0.s390x.xml
> index 069777a49b..b584ba7352 100644
> --- a/tests/qemucapabilitiesdata/caps_4.2.0.s390x.xml
> +++ b/tests/qemucapabilitiesdata/caps_4.2.0.s390x.xml
> @@ -128,6 +128,7 @@
>    <flag name='input-linux'/>
>    <flag name='query-display-options'/>
>    <flag name='virtio-blk.queue-size'/>
> +  <flag name='migrate-multifd'/>
>    <version>4002000</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>39100242</microcodeVersion>
> diff --git a/tests/qemucapabilitiesdata/caps_4.2.0.x86_64.xml b/tests/qemucapabilitiesdata/caps_4.2.0.x86_64.xml
> index 6b61214a0b..5023028678 100644
> --- a/tests/qemucapabilitiesdata/caps_4.2.0.x86_64.xml
> +++ b/tests/qemucapabilitiesdata/caps_4.2.0.x86_64.xml
> @@ -206,6 +206,7 @@
>    <flag name='input-linux'/>
>    <flag name='query-display-options'/>
>    <flag name='virtio-blk.queue-size'/>
> +  <flag name='migrate-multifd'/>
>    <version>4002000</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>43100242</microcodeVersion>
> diff --git a/tests/qemucapabilitiesdata/caps_5.0.0.aarch64.xml b/tests/qemucapabilitiesdata/caps_5.0.0.aarch64.xml
> index 4fd02e786d..c45b2e6cf6 100644
> --- a/tests/qemucapabilitiesdata/caps_5.0.0.aarch64.xml
> +++ b/tests/qemucapabilitiesdata/caps_5.0.0.aarch64.xml
> @@ -175,6 +175,7 @@
>    <flag name='virtio-blk.queue-size'/>
>    <flag name='memory-backend-file.prealloc-threads'/>
>    <flag name='virtio-iommu-pci'/>
> +  <flag name='migrate-multifd'/>
>    <version>5000000</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>61700241</microcodeVersion>
> diff --git a/tests/qemucapabilitiesdata/caps_5.0.0.ppc64.xml b/tests/qemucapabilitiesdata/caps_5.0.0.ppc64.xml
> index f2f3558fdc..a3ad743d70 100644
> --- a/tests/qemucapabilitiesdata/caps_5.0.0.ppc64.xml
> +++ b/tests/qemucapabilitiesdata/caps_5.0.0.ppc64.xml
> @@ -181,6 +181,7 @@
>    <flag name='virtio-blk.queue-size'/>
>    <flag name='memory-backend-file.prealloc-threads'/>
>    <flag name='virtio-iommu-pci'/>
> +  <flag name='migrate-multifd'/>
>    <version>5000000</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>42900241</microcodeVersion>
> diff --git a/tests/qemucapabilitiesdata/caps_5.0.0.riscv64.xml b/tests/qemucapabilitiesdata/caps_5.0.0.riscv64.xml
> index 557949d6d6..e1b5cac26b 100644
> --- a/tests/qemucapabilitiesdata/caps_5.0.0.riscv64.xml
> +++ b/tests/qemucapabilitiesdata/caps_5.0.0.riscv64.xml
> @@ -167,6 +167,7 @@
>    <flag name='virtio-blk.queue-size'/>
>    <flag name='memory-backend-file.prealloc-threads'/>
>    <flag name='virtio-iommu-pci'/>
> +  <flag name='migrate-multifd'/>
>    <version>5000000</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>0</microcodeVersion>
> diff --git a/tests/qemucapabilitiesdata/caps_5.0.0.x86_64.xml b/tests/qemucapabilitiesdata/caps_5.0.0.x86_64.xml
> index f301d8a926..796adb9066 100644
> --- a/tests/qemucapabilitiesdata/caps_5.0.0.x86_64.xml
> +++ b/tests/qemucapabilitiesdata/caps_5.0.0.x86_64.xml
> @@ -215,6 +215,7 @@
>    <flag name='virtio-blk.queue-size'/>
>    <flag name='memory-backend-file.prealloc-threads'/>
>    <flag name='virtio-iommu-pci'/>
> +  <flag name='migrate-multifd'/>
>    <version>5000000</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>43100241</microcodeVersion>
> diff --git a/tests/qemucapabilitiesdata/caps_5.1.0.sparc.xml b/tests/qemucapabilitiesdata/caps_5.1.0.sparc.xml
> index 3a330ebdc0..cb203df125 100644
> --- a/tests/qemucapabilitiesdata/caps_5.1.0.sparc.xml
> +++ b/tests/qemucapabilitiesdata/caps_5.1.0.sparc.xml
> @@ -87,6 +87,7 @@
>    <flag name='input-linux'/>
>    <flag name='query-display-options'/>
>    <flag name='memory-backend-file.prealloc-threads'/>
> +  <flag name='migrate-multifd'/>
>    <version>5001000</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>0</microcodeVersion>
> diff --git a/tests/qemucapabilitiesdata/caps_5.1.0.x86_64.xml b/tests/qemucapabilitiesdata/caps_5.1.0.x86_64.xml
> index 53fcbf3417..7479d942a2 100644
> --- a/tests/qemucapabilitiesdata/caps_5.1.0.x86_64.xml
> +++ b/tests/qemucapabilitiesdata/caps_5.1.0.x86_64.xml
> @@ -219,6 +219,7 @@
>    <flag name='memory-backend-file.prealloc-threads'/>
>    <flag name='virtio-iommu-pci'/>
>    <flag name='virtio-net.rss'/>
> +  <flag name='migrate-multifd'/>
>    <version>5001000</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>43100242</microcodeVersion>
> diff --git a/tests/qemucapabilitiesdata/caps_5.2.0.aarch64.xml b/tests/qemucapabilitiesdata/caps_5.2.0.aarch64.xml
> index 824224302c..268d1444ad 100644
> --- a/tests/qemucapabilitiesdata/caps_5.2.0.aarch64.xml
> +++ b/tests/qemucapabilitiesdata/caps_5.2.0.aarch64.xml
> @@ -182,6 +182,7 @@
>    <flag name='memory-backend-file.prealloc-threads'/>
>    <flag name='virtio-iommu-pci'/>
>    <flag name='virtio-net.rss'/>
> +  <flag name='migrate-multifd'/>
>    <version>5002000</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>61700243</microcodeVersion>
> diff --git a/tests/qemucapabilitiesdata/caps_5.2.0.ppc64.xml b/tests/qemucapabilitiesdata/caps_5.2.0.ppc64.xml
> index b949f88b5a..eabf4b600c 100644
> --- a/tests/qemucapabilitiesdata/caps_5.2.0.ppc64.xml
> +++ b/tests/qemucapabilitiesdata/caps_5.2.0.ppc64.xml
> @@ -186,6 +186,7 @@
>    <flag name='memory-backend-file.prealloc-threads'/>
>    <flag name='virtio-iommu-pci'/>
>    <flag name='virtio-net.rss'/>
> +  <flag name='migrate-multifd'/>
>    <version>5002000</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>42900243</microcodeVersion>
> diff --git a/tests/qemucapabilitiesdata/caps_5.2.0.riscv64.xml b/tests/qemucapabilitiesdata/caps_5.2.0.riscv64.xml
> index 873923992d..0dbaf5a5ec 100644
> --- a/tests/qemucapabilitiesdata/caps_5.2.0.riscv64.xml
> +++ b/tests/qemucapabilitiesdata/caps_5.2.0.riscv64.xml
> @@ -172,6 +172,7 @@
>    <flag name='memory-backend-file.prealloc-threads'/>
>    <flag name='virtio-iommu-pci'/>
>    <flag name='virtio-net.rss'/>
> +  <flag name='migrate-multifd'/>
>    <version>5002000</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>0</microcodeVersion>
> diff --git a/tests/qemucapabilitiesdata/caps_5.2.0.s390x.xml b/tests/qemucapabilitiesdata/caps_5.2.0.s390x.xml
> index 5e9560d7b7..b0fbab9cb5 100644
> --- a/tests/qemucapabilitiesdata/caps_5.2.0.s390x.xml
> +++ b/tests/qemucapabilitiesdata/caps_5.2.0.s390x.xml
> @@ -140,6 +140,7 @@
>    <flag name='memory-backend-file.prealloc-threads'/>
>    <flag name='virtio-iommu-pci'/>
>    <flag name='virtio-net.rss'/>
> +  <flag name='migrate-multifd'/>
>    <version>5002000</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>39100243</microcodeVersion>
> diff --git a/tests/qemucapabilitiesdata/caps_5.2.0.x86_64.xml b/tests/qemucapabilitiesdata/caps_5.2.0.x86_64.xml
> index 3998da9253..1a1717bf2a 100644
> --- a/tests/qemucapabilitiesdata/caps_5.2.0.x86_64.xml
> +++ b/tests/qemucapabilitiesdata/caps_5.2.0.x86_64.xml
> @@ -223,6 +223,7 @@
>    <flag name='memory-backend-file.prealloc-threads'/>
>    <flag name='virtio-iommu-pci'/>
>    <flag name='virtio-net.rss'/>
> +  <flag name='migrate-multifd'/>
>    <version>5002000</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>43100243</microcodeVersion>
> diff --git a/tests/qemucapabilitiesdata/caps_6.0.0.aarch64.xml b/tests/qemucapabilitiesdata/caps_6.0.0.aarch64.xml
> index 51d3628eeb..1c18d122e2 100644
> --- a/tests/qemucapabilitiesdata/caps_6.0.0.aarch64.xml
> +++ b/tests/qemucapabilitiesdata/caps_6.0.0.aarch64.xml
> @@ -190,6 +190,7 @@
>    <flag name='memory-backend-file.prealloc-threads'/>
>    <flag name='virtio-iommu-pci'/>
>    <flag name='virtio-net.rss'/>
> +  <flag name='migrate-multifd'/>
>    <version>6000000</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>61700242</microcodeVersion>
> diff --git a/tests/qemucapabilitiesdata/caps_6.0.0.s390x.xml b/tests/qemucapabilitiesdata/caps_6.0.0.s390x.xml
> index 2e5d0f197a..8fa4cb2307 100644
> --- a/tests/qemucapabilitiesdata/caps_6.0.0.s390x.xml
> +++ b/tests/qemucapabilitiesdata/caps_6.0.0.s390x.xml
> @@ -148,6 +148,7 @@
>    <flag name='memory-backend-file.prealloc-threads'/>
>    <flag name='virtio-iommu-pci'/>
>    <flag name='virtio-net.rss'/>
> +  <flag name='migrate-multifd'/>
>    <version>6000000</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>39100242</microcodeVersion>
> diff --git a/tests/qemucapabilitiesdata/caps_6.0.0.x86_64.xml b/tests/qemucapabilitiesdata/caps_6.0.0.x86_64.xml
> index 3498d6255b..70c67202b1 100644
> --- a/tests/qemucapabilitiesdata/caps_6.0.0.x86_64.xml
> +++ b/tests/qemucapabilitiesdata/caps_6.0.0.x86_64.xml
> @@ -232,6 +232,7 @@
>    <flag name='memory-backend-file.prealloc-threads'/>
>    <flag name='virtio-iommu-pci'/>
>    <flag name='virtio-net.rss'/>
> +  <flag name='migrate-multifd'/>
>    <version>6000000</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>43100242</microcodeVersion>
> diff --git a/tests/qemucapabilitiesdata/caps_6.1.0.x86_64.xml b/tests/qemucapabilitiesdata/caps_6.1.0.x86_64.xml
> index ddeca62290..a5ec77878f 100644
> --- a/tests/qemucapabilitiesdata/caps_6.1.0.x86_64.xml
> +++ b/tests/qemucapabilitiesdata/caps_6.1.0.x86_64.xml
> @@ -236,6 +236,7 @@
>    <flag name='memory-backend-file.prealloc-threads'/>
>    <flag name='virtio-iommu-pci'/>
>    <flag name='virtio-net.rss'/>
> +  <flag name='migrate-multifd'/>
>    <version>6001000</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>43100243</microcodeVersion>
> diff --git a/tests/qemucapabilitiesdata/caps_6.2.0.aarch64.xml b/tests/qemucapabilitiesdata/caps_6.2.0.aarch64.xml
> index 5538940372..92d8ceff7e 100644
> --- a/tests/qemucapabilitiesdata/caps_6.2.0.aarch64.xml
> +++ b/tests/qemucapabilitiesdata/caps_6.2.0.aarch64.xml
> @@ -201,6 +201,7 @@
>    <flag name='memory-backend-file.prealloc-threads'/>
>    <flag name='virtio-iommu-pci'/>
>    <flag name='virtio-net.rss'/>
> +  <flag name='migrate-multifd'/>
>    <version>6001050</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>61700244</microcodeVersion>
> diff --git a/tests/qemucapabilitiesdata/caps_6.2.0.ppc64.xml b/tests/qemucapabilitiesdata/caps_6.2.0.ppc64.xml
> index 9c9d9aa08e..f219912927 100644
> --- a/tests/qemucapabilitiesdata/caps_6.2.0.ppc64.xml
> +++ b/tests/qemucapabilitiesdata/caps_6.2.0.ppc64.xml
> @@ -197,6 +197,7 @@
>    <flag name='memory-backend-file.prealloc-threads'/>
>    <flag name='virtio-iommu-pci'/>
>    <flag name='virtio-net.rss'/>
> +  <flag name='migrate-multifd'/>
>    <version>6002000</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>42900244</microcodeVersion>
> diff --git a/tests/qemucapabilitiesdata/caps_6.2.0.x86_64.xml b/tests/qemucapabilitiesdata/caps_6.2.0.x86_64.xml
> index dba5ecaf87..38fd3878ea 100644
> --- a/tests/qemucapabilitiesdata/caps_6.2.0.x86_64.xml
> +++ b/tests/qemucapabilitiesdata/caps_6.2.0.x86_64.xml
> @@ -238,6 +238,7 @@
>    <flag name='memory-backend-file.prealloc-threads'/>
>    <flag name='virtio-iommu-pci'/>
>    <flag name='virtio-net.rss'/>
> +  <flag name='migrate-multifd'/>
>    <version>6002000</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>43100244</microcodeVersion>
> diff --git a/tests/qemucapabilitiesdata/caps_7.0.0.aarch64.xml b/tests/qemucapabilitiesdata/caps_7.0.0.aarch64.xml
> index 257b0f625d..522e225c8f 100644
> --- a/tests/qemucapabilitiesdata/caps_7.0.0.aarch64.xml
> +++ b/tests/qemucapabilitiesdata/caps_7.0.0.aarch64.xml
> @@ -209,6 +209,7 @@
>    <flag name='virtio-iommu-pci'/>
>    <flag name='virtio-iommu.boot-bypass'/>
>    <flag name='virtio-net.rss'/>
> +  <flag name='migrate-multifd'/>
>    <version>6002092</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>61700243</microcodeVersion>
> diff --git a/tests/qemucapabilitiesdata/caps_7.0.0.ppc64.xml b/tests/qemucapabilitiesdata/caps_7.0.0.ppc64.xml
> index 1ddca7d767..1eb43799c0 100644
> --- a/tests/qemucapabilitiesdata/caps_7.0.0.ppc64.xml
> +++ b/tests/qemucapabilitiesdata/caps_7.0.0.ppc64.xml
> @@ -210,6 +210,7 @@
>    <flag name='virtio-iommu-pci'/>
>    <flag name='virtio-iommu.boot-bypass'/>
>    <flag name='virtio-net.rss'/>
> +  <flag name='migrate-multifd'/>
>    <version>6002092</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>42900243</microcodeVersion>
> diff --git a/tests/qemucapabilitiesdata/caps_7.0.0.x86_64.xml b/tests/qemucapabilitiesdata/caps_7.0.0.x86_64.xml
> index 8074c97ecd..e5023c4219 100644
> --- a/tests/qemucapabilitiesdata/caps_7.0.0.x86_64.xml
> +++ b/tests/qemucapabilitiesdata/caps_7.0.0.x86_64.xml
> @@ -242,6 +242,7 @@
>    <flag name='virtio-iommu-pci'/>
>    <flag name='virtio-iommu.boot-bypass'/>
>    <flag name='virtio-net.rss'/>
> +  <flag name='migrate-multifd'/>
>    <version>7000000</version>
>    <kvmVersion>0</kvmVersion>
>    <microcodeVersion>43100243</microcodeVersion>
> --
> 2.35.3
>

