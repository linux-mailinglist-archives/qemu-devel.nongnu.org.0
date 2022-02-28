Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 658604C7F22
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 01:23:45 +0100 (CET)
Received: from localhost ([::1]:46612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOqIq-0006GL-Gu
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 19:23:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOqAT-0006R2-Oz; Mon, 28 Feb 2022 19:15:05 -0500
Received: from [2a00:1450:4864:20::433] (port=34383
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOqAR-0005MY-42; Mon, 28 Feb 2022 19:15:04 -0500
Received: by mail-wr1-x433.google.com with SMTP id d3so17950296wrf.1;
 Mon, 28 Feb 2022 16:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6HPfoB7o/GwBmB/ovQ3yU+o+TFUFj4eo6w6axs3Fxz8=;
 b=DLOXvQzaH8SN+1R1lMQQUwejoLp3VIA8/rBV13SMtCikuJfkxp+MAJJm99rSj+rubn
 plUKf878SvOH+D3D9Bem822hjV5N+GX+SE0Rk6S7RFJ4SDR7w4vqs+Ft9hZRr/VibuDX
 IZKNuilWYFySvoSoe1ic/aScYCpa/y02lHZ31AT53+9NPo7qFbNmHl4efg5h9HzMYwmY
 74H0GdRYm9pOYYV1ouTV6eejMXr4vorYT1Bo5Bq6g2mDFyaXkdwRvmKmia4LlnxS7YC/
 YTHgpMrP4+bjPkotkEwA819i/oblGixYfkI+kYmUd6w22B4C3sLTsJWNB+OhB1pAa23/
 pUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6HPfoB7o/GwBmB/ovQ3yU+o+TFUFj4eo6w6axs3Fxz8=;
 b=YyDkQsxeTlCxoViYez09cS1zhQDFCxahdLHEMX7qUAAWnJWhK/c0r3O5+5NnYJTX57
 Sx1h1xqXqe9fflqJ7EaybTSuMpGNtsfx4MSx9EK3yyJDj7EK4escuxr9cisPloklZNPe
 Dcodqv3n/Eb9C8N7orLnExuN0HgUxM2If2wZeS1Fjh8ZxvH7RmF31BYuyuEbDL7E9C8x
 W4WpGMzYXNlolvf1KSX8J6+u7jnyJmGvLNN2SdRKm+rnu91tPGZmhJM+4hqAPuIVUeqV
 IqljVnZTseg1f8D4F0yKEi6Re6HCO1RMOUX9zogCybXI6lamKbCRnkJxAa14hSyk+uLh
 rBuA==
X-Gm-Message-State: AOAM533CIH7DX4r5VD51WeZJ81COGKrLwCUL5LnRB6MPh5x6S/QaLzCK
 j5skKnK+v4wqffD4k+ZLOkE=
X-Google-Smtp-Source: ABdhPJxm3GCwyPMMw06yF+hnDJjEjbrXfOOtBk7af2U/bEO4QTOLuR+XD+sMaz7uJiTNeaodvPpusA==
X-Received: by 2002:a5d:64c3:0:b0:1e5:94d3:5bf2 with SMTP id
 f3-20020a5d64c3000000b001e594d35bf2mr17546071wri.488.1646093701565; 
 Mon, 28 Feb 2022 16:15:01 -0800 (PST)
Received: from [192.168.131.175] (62.red-95-127-166.staticip.rima-tde.net.
 [95.127.166.62]) by smtp.gmail.com with ESMTPSA id
 r17-20020a056000015100b001ea7db074cdsm16213625wrx.117.2022.02.28.16.15.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 16:15:01 -0800 (PST)
Message-ID: <9a67f1d2-aed2-5bee-881a-8ff0d4cd0323@gmail.com>
Date: Tue, 1 Mar 2022 00:58:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 9/9] osdep: Move memalign-related functions to their own
 header
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220226180723.1706285-1-peter.maydell@linaro.org>
 <20220226180723.1706285-10-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220226180723.1706285-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/2/22 19:07, Peter Maydell wrote:
> Move the various memalign-related functions out of osdep.h and into
> their own header, which we include only where they are used.
> While we're doing this, add some brief documentation comments.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/qemu/memalign.h        | 61 ++++++++++++++++++++++++++++++++++
>   include/qemu/osdep.h           | 18 ----------
>   block/blkverify.c              |  1 +
>   block/block-copy.c             |  1 +
>   block/commit.c                 |  1 +
>   block/crypto.c                 |  1 +
>   block/dmg.c                    |  1 +
>   block/export/fuse.c            |  1 +
>   block/file-posix.c             |  1 +
>   block/io.c                     |  1 +
>   block/mirror.c                 |  1 +
>   block/nvme.c                   |  1 +
>   block/parallels-ext.c          |  1 +
>   block/parallels.c              |  1 +
>   block/qcow.c                   |  1 +
>   block/qcow2-cache.c            |  1 +
>   block/qcow2-cluster.c          |  1 +
>   block/qcow2-refcount.c         |  1 +
>   block/qcow2-snapshot.c         |  1 +
>   block/qcow2.c                  |  1 +
>   block/qed-l2-cache.c           |  1 +
>   block/qed-table.c              |  1 +
>   block/qed.c                    |  1 +
>   block/quorum.c                 |  1 +
>   block/raw-format.c             |  1 +
>   block/vdi.c                    |  1 +
>   block/vhdx-log.c               |  1 +
>   block/vhdx.c                   |  1 +
>   block/vmdk.c                   |  1 +
>   block/vpc.c                    |  1 +
>   block/win32-aio.c              |  1 +
>   hw/block/dataplane/xen-block.c |  1 +
>   hw/block/fdc.c                 |  1 +
>   hw/ide/core.c                  |  1 +
>   hw/ppc/spapr.c                 |  1 +
>   hw/ppc/spapr_softmmu.c         |  1 +
>   hw/scsi/scsi-disk.c            |  1 +
>   hw/tpm/tpm_ppi.c               |  2 +-
>   nbd/server.c                   |  1 +
>   net/l2tpv3.c                   |  2 +-
>   plugins/loader.c               |  1 +
>   qemu-img.c                     |  1 +
>   qemu-io-cmds.c                 |  1 +
>   qom/object.c                   |  1 +
>   softmmu/physmem.c              |  1 +
>   target/i386/hvf/hvf.c          |  1 +
>   target/i386/kvm/kvm.c          |  1 +
>   tcg/region.c                   |  1 +
>   tests/bench/atomic_add-bench.c |  1 +
>   tests/bench/qht-bench.c        |  1 +
>   util/atomic64.c                |  1 +
>   util/memalign.c                |  1 +
>   util/qht.c                     |  1 +
>   53 files changed, 112 insertions(+), 20 deletions(-)
>   create mode 100644 include/qemu/memalign.h

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

