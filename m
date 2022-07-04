Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E865659AC
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 17:23:24 +0200 (CEST)
Received: from localhost ([::1]:32908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Nv1-00048y-Mx
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 11:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8NtK-00024d-1A
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:21:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8NtI-0002As-F8
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:21:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656948095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oAa20g9OAuQhUxFtb8haoc0C6+H5TmFHdFkWoYZZhpw=;
 b=fvnJMkpEWUkP3XwSBnfcW23mav7fB5bEl9gGxdPHQIQaBBfzaLhQYK70ntxH6MLXzZBiOO
 SAk+BHDWTo3AY67M5CsHvrves3cEUXtNVdiY81BBMd30O7F9kTJM9J2XATI4Yffr0FNiWk
 uI9nwNjTQXFPxo5nsdagIumMsaMnteA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-P7qUZEVuMEu2fx9sk3WSWg-1; Mon, 04 Jul 2022 11:21:23 -0400
X-MC-Unique: P7qUZEVuMEu2fx9sk3WSWg-1
Received: by mail-ej1-f70.google.com with SMTP id
 sa13-20020a1709076d0d00b0072a8791298aso2122911ejc.7
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 08:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oAa20g9OAuQhUxFtb8haoc0C6+H5TmFHdFkWoYZZhpw=;
 b=T4j/roMjzC93JU6L9GclQ0BPyH82Szg9GY27tE7aRNBRDzhjPNc/Lka5lZKNpDq3Oe
 +sRnOW8hdVxUEmaTniiTntiiReP7UnrVECkXnUbJuBIFJS+XeDcrCMu3RkwXk8jQ0KJk
 QLHxFdiHeU9VLIgaeQZXAtIQ2T9bARfJev3xD6Q71Iy25iJs6bo2A+IhCRjv0E4EglUh
 f9hLPmuSY94u3RNBsgDnhfPZ8gMW53Lbj+3LN2pxvD04kjNw/zl21Yk14DU11wLJOpCi
 uHfmfDhohBfsdu7MgY+gnDXEE9mo6f7FPzrBv+SKyWSYNZhEEqoOprcBWOqrDxF27IOy
 ZeLQ==
X-Gm-Message-State: AJIora+YOvF08W/1aJd8r55p+JlzLQ3eXueLm/kieJaAp07q+U+FFSVR
 QhWNK8mfJDoVPT78i0WMAJfkLKf87YqFPeZVcgci2034T2HjZbJ+xxBgJT/9ItbquhNN2CXZzHj
 zP97GIUWgr/wKpX4=
X-Received: by 2002:a05:6402:390b:b0:43a:281e:48fc with SMTP id
 fe11-20020a056402390b00b0043a281e48fcmr10970256edb.214.1656948082135; 
 Mon, 04 Jul 2022 08:21:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tvHbDJuCW1Ge2PaCADvMVlSyrlAVX1BH5Z3DlkUfV7QzSM9H3C7NHR7mXiohkG5H7iO5CTFQ==
X-Received: by 2002:a05:6402:390b:b0:43a:281e:48fc with SMTP id
 fe11-20020a056402390b00b0043a281e48fcmr10970195edb.214.1656948081840; 
 Mon, 04 Jul 2022 08:21:21 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 fi9-20020a170906da0900b00722e5b234basm14391221ejb.179.2022.07.04.08.21.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 08:21:21 -0700 (PDT)
Message-ID: <741358f6-43fd-15d1-86c8-4591cef658bb@redhat.com>
Date: Mon, 4 Jul 2022 17:21:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 03/18] block: Change blk_{pread,pwrite}() param order
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Andrew Jeffery <andrew@aj.id.au>, Beniamino Galvani <b.galvani@gmail.com>,
 qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Kevin Wolf
 <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eric Blake <eblake@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, Jeff Cody <codyprime@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Juan Quintela <quintela@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <laurent@vivier.eu>, Bin Meng <bin.meng@windriver.com>,
 Greg Kurz <groug@kaod.org>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-ppc@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, "Denis V. Lunev" <den@openvz.org>
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113746.198993-1-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220517113746.198993-1-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

On 17.05.22 13:37, Alberto Faria wrote:
> Swap 'buf' and 'bytes' around for consistency with
> blk_co_{pread,pwrite}(), and in preparation to implement these functions
> using generated_co_wrapper.
>
> Callers were updated using this Coccinelle script:
>
>      @@ expression blk, offset, buf, bytes, flags; @@
>      - blk_pread(blk, offset, buf, bytes, flags)
>      + blk_pread(blk, offset, bytes, buf, flags)
>
>      @@ expression blk, offset, buf, bytes, flags; @@
>      - blk_pwrite(blk, offset, buf, bytes, flags)
>      + blk_pwrite(blk, offset, bytes, buf, flags)
>
> It had no effect on hw/block/nand.c, presumably due to the #if, so that
> file was updated manually.
>
> Overly-long lines were then fixed by hand.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block.c                           |  2 +-
>   block/block-backend.c             |  4 +--
>   block/commit.c                    |  4 +--
>   block/crypto.c                    |  2 +-
>   block/export/fuse.c               |  4 +--
>   block/parallels.c                 |  2 +-
>   block/qcow.c                      |  8 +++---
>   block/qcow2.c                     |  4 +--
>   block/qed.c                       |  8 +++---
>   block/vdi.c                       |  4 +--
>   block/vhdx.c                      | 20 ++++++-------
>   block/vmdk.c                      | 10 +++----
>   block/vpc.c                       | 12 ++++----
>   hw/arm/allwinner-h3.c             |  2 +-
>   hw/arm/aspeed.c                   |  2 +-
>   hw/block/block.c                  |  2 +-
>   hw/block/fdc.c                    | 20 ++++++-------
>   hw/block/hd-geometry.c            |  2 +-
>   hw/block/m25p80.c                 |  2 +-
>   hw/block/nand.c                   | 47 ++++++++++++++++---------------
>   hw/block/onenand.c                | 32 ++++++++++-----------
>   hw/block/pflash_cfi01.c           |  4 +--
>   hw/block/pflash_cfi02.c           |  4 +--
>   hw/ide/atapi.c                    |  4 +--
>   hw/misc/mac_via.c                 |  4 +--
>   hw/misc/sifive_u_otp.c            | 14 ++++-----
>   hw/nvram/eeprom_at24c.c           |  4 +--
>   hw/nvram/spapr_nvram.c            |  6 ++--
>   hw/nvram/xlnx-bbram.c             |  4 +--
>   hw/nvram/xlnx-efuse.c             |  4 +--
>   hw/ppc/pnv_pnor.c                 |  6 ++--
>   hw/sd/sd.c                        |  4 +--
>   include/sysemu/block-backend-io.h |  4 +--
>   migration/block.c                 |  6 ++--
>   nbd/server.c                      |  8 +++---
>   qemu-img.c                        | 18 ++++++------
>   qemu-io-cmds.c                    |  4 +--
>   tests/unit/test-block-iothread.c  |  8 +++---
>   38 files changed, 150 insertions(+), 149 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


