Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 979986C6B3D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 15:39:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfM4v-00015Q-NB; Thu, 23 Mar 2023 10:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <m@bjorling.me>) id 1pfKxO-0005xS-BA
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 09:26:18 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <m@bjorling.me>) id 1pfKxL-0007K2-To
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 09:26:17 -0400
Received: by mail-ed1-x52d.google.com with SMTP id ew6so23528181edb.7
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 06:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bjorling.me; s=google; t=1679577973;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZynXKaBOZdy4w6ACpnEX28zx5BXt6PUiazSEKSUAnlw=;
 b=d39a52/KOEDT3du7A7P5bT7FZTT+YILP+OI+AUw8gmo3hOgPgAjnijUWZp1LUZ7hv+
 COrOLqSxDxGLBGycGv7lhjxw05r9kTAJoBFpQZsBDZvY9BkM4huYTmk2kZGho42BIzWZ
 3EraOL7ZCN+xxxipRDZPKsvTLbNc7ltu6y29A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679577973;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZynXKaBOZdy4w6ACpnEX28zx5BXt6PUiazSEKSUAnlw=;
 b=P+Mp0jCm6UC0jtGkcHs6ysiDHvXKCMgO0VvEbt91jOI+5dEvOcHCO/9ulwkG3dpPOv
 YOMb26589mLBovsUE/YNCUqM6HPNjjrXk0GVkHaeVXAIUK1aVf6sewY5zQsI3dXWuP+2
 393Az8FuEzLHbEAEhFY6aujuVyc4uv3Dr7XnqkWygeY6s4x1Yb4hqEzGQJVCuj7xV/zc
 +r5wQ6a9NVeKFt4dd3JCWBoqmABvi9gxduBjzQgwJt3qu0ofm4XMZsNPabzFihTlzIg+
 Ma5cPgSW01I+YHnKYGrtvQKHyUACHcfIk8+uuWw4VQ5YSB2heBOMkCFaKbZ69Lo4ziZf
 m+Kg==
X-Gm-Message-State: AO0yUKWO8nZDnxLQ4RH9wB4RX0e4P486ElHXXl6lbyBAxJywMQaGVDYg
 mp8BSm1QPI+AooO/UiA56bGI1w==
X-Google-Smtp-Source: AK7set9wWH8UvdPf7RrbJNAmyeAIoySKNE2q5bncnFXEWEyL8idCKK8LzAGuO4lmiXQ6ysydd9CfXA==
X-Received: by 2002:a17:907:78cf:b0:889:58bd:86f1 with SMTP id
 kv15-20020a17090778cf00b0088958bd86f1mr11019725ejc.14.1679577972614; 
 Thu, 23 Mar 2023 06:26:12 -0700 (PDT)
Received: from [192.168.10.20] ([87.116.37.42])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a170906409700b009334a6ef3e8sm6632022ejj.141.2023.03.23.06.26.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 06:26:11 -0700 (PDT)
Message-ID: <3983f8bc-5be2-bb3c-a5cd-647550f577a0@bjorling.me>
Date: Thu, 23 Mar 2023 14:26:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v8 0/4] Add zoned storage emulation to virtio-blk driver
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, damien.lemoal@opensource.wdc.com,
 kvm@vger.kernel.org, hare@suse.de, Paolo Bonzini <pbonzini@redhat.com>,
 dmitry.fomichev@wdc.com, Hanna Reitz <hreitz@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20230323052828.6545-1-faithilikerun@gmail.com>
From: =?UTF-8?Q?Matias_Bj=c3=b8rling?= <m@bjorling.me>
In-Reply-To: <20230323052828.6545-1-faithilikerun@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=m@bjorling.me; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 23 Mar 2023 10:38:07 -0400
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 23/03/2023 06.28, Sam Li wrote:
> This patch adds zoned storage emulation to the virtio-blk driver.
> 
> The patch implements the virtio-blk ZBD support standardization that is
> recently accepted by virtio-spec. The link to related commit is at
> 
> https://github.com/oasis-tcs/virtio-spec/commit/b4e8efa0fa6c8d844328090ad15db65af8d7d981
> 
> The Linux zoned device code that implemented by Dmitry Fomichev has been
> released at the latest Linux version v6.3-rc1.
> 
> Aside: adding zoned=on alike options to virtio-blk device will be
> considered in following-up plan.
> 
> v7:
> - address Stefan's review comments
>    * rm aio_context_acquire/release in handle_req
>    * rename function return type
>    * rename BLOCK_ACCT_APPEND to BLOCK_ACCT_ZONE_APPEND for clarity
> 
> v6:
> - update headers to v6.3-rc1
> 
> v5:
> - address Stefan's review comments
>    * restore the way writing zone append result to buffer
>    * fix error checking case and other errands
> 
> v4:
> - change the way writing zone append request result to buffer
> - change zone state, zone type value of virtio_blk_zone_descriptor
> - add trace events for new zone APIs
> 
> v3:
> - use qemuio_from_buffer to write status bit [Stefan]
> - avoid using req->elem directly [Stefan]
> - fix error checkings and memory leak [Stefan]
> 
> v2:
> - change units of emulated zone op coresponding to block layer APIs
> - modify error checking cases [Stefan, Damien]
> 
> v1:
> - add zoned storage emulation
> 
> Sam Li (4):
>    include: update virtio_blk headers to v6.3-rc1
>    virtio-blk: add zoned storage emulation for zoned devices
>    block: add accounting for zone append operation
>    virtio-blk: add some trace events for zoned emulation
> 
>   block/qapi-sysemu.c                          |  11 +
>   block/qapi.c                                 |  18 +
>   hw/block/trace-events                        |   7 +
>   hw/block/virtio-blk-common.c                 |   2 +
>   hw/block/virtio-blk.c                        | 405 +++++++++++++++++++
>   include/block/accounting.h                   |   1 +
>   include/standard-headers/drm/drm_fourcc.h    |  12 +
>   include/standard-headers/linux/ethtool.h     |  48 ++-
>   include/standard-headers/linux/fuse.h        |  45 ++-
>   include/standard-headers/linux/pci_regs.h    |   1 +
>   include/standard-headers/linux/vhost_types.h |   2 +
>   include/standard-headers/linux/virtio_blk.h  | 105 +++++
>   linux-headers/asm-arm64/kvm.h                |   1 +
>   linux-headers/asm-x86/kvm.h                  |  34 +-
>   linux-headers/linux/kvm.h                    |   9 +
>   linux-headers/linux/vfio.h                   |  15 +-
>   linux-headers/linux/vhost.h                  |   8 +
>   qapi/block-core.json                         |  62 ++-
>   qapi/block.json                              |   4 +
>   19 files changed, 769 insertions(+), 21 deletions(-)
> 


Hi Sam,

I applied your patches and can report that they work with both SMR HDDs 
and ZNS SSDs. Very nice work!

Regarding the documentation (docs/system/qemu-block-drivers.rst.inc). Is 
it possible to expose the host's zoned block device through something 
else than virtio-blk? If not, I wouldn't mind seeing the documentation 
updated to show a case when using the virtio-blk driver.

For example (this also includes the device part):

-device virtio-blk-pci,drive=drive0,id=virtblk0 \
-blockdev 
host_device,node-name=drive0,filename=/dev/nullb0,cache.direct=on``

It might also be nice to describe the shorthand for those that likes to 
pass in the parameters using only the -drive parameter.

  -drive driver=host_device,file=/dev/nullb0,if=virtio,cache.direct=on

Cheers, Matias

