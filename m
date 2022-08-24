Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8385C59F16D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 04:39:10 +0200 (CEST)
Received: from localhost ([::1]:53156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQgIP-0003Ur-Fk
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 22:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQgHF-0001I1-8M
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 22:37:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQgHC-0005De-Nv
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 22:37:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661308673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O9KzMi0umOVVrUXm64ipmn6Rjbzg5uTcIRs7pAKfbt4=;
 b=izS/MJIHhMwTErFz0xN0/nfi/R3pD19d/CfkNvk5xI/nPfSas3N7Ru2aHNnuMXXVFMmjEP
 LG19rg/JGS+smIEttyEqB50nUfRV0jWGvt3iw9im5hD2hksmuyE5KmgH9WvtKm/Y9oK6CS
 8VpZCBMXuMKsn47e3cKRE+55iCRQzO8=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-124-YtEH5m_vORaKcvsYclcIaw-1; Tue, 23 Aug 2022 22:37:52 -0400
X-MC-Unique: YtEH5m_vORaKcvsYclcIaw-1
Received: by mail-pf1-f200.google.com with SMTP id
 x25-20020aa79199000000b005358eeebf49so6830690pfa.17
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 19:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=O9KzMi0umOVVrUXm64ipmn6Rjbzg5uTcIRs7pAKfbt4=;
 b=NMTi3ftAQqI606hFMaUuIZ1pgK6k/LQSVb7mx+BF6Zgmw0xnCFoaayr8NlxqNugEh/
 Hq27AP+BjbtvkcV7uYTN9Hmx9xgT10URtPnHI3Br0txBYp8XIvHumnSQdTTbd4rvHI2O
 Ukg6IxlaZePHowTb+ff/xVNPB4Ckq+41YPg3VnNTruUWRhnNREbUAtz7UqmtB2Uapmyd
 iY6e8HeEUXtJ/9OlrgLmxjkyKxjTQzkJW9U0spDTIPwWIiHCTGZEeIM7+V1F/GN5YVTW
 BF2KaoaBHCOmFvD8ceC54pQpDRjje+ESHgxdLem7+QexFLEh9IJ+xLAQ+eZQIFelH2+h
 NfvQ==
X-Gm-Message-State: ACgBeo0poJFqxR3z4KrUCcFmUUDUzP6iPquvIQjMHSaFjlb61fA4d6gJ
 HiS1YoKAUBAK032960Xvh1V5KTMoqrgsKzsIcqO9FEGATqRXH739le65iHoEQlgqzLFpxXCpePh
 A/9Ur8Lg113fIFo0=
X-Received: by 2002:a17:902:f54d:b0:173:c1:6914 with SMTP id
 h13-20020a170902f54d00b0017300c16914mr5282697plf.28.1661308671451; 
 Tue, 23 Aug 2022 19:37:51 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5kl03TcSEE73IUtd73zjChMrEqfOt8f/6sJZNU7T5yWKu26Uzvuo6lnwCTdy66BErVRWMCLQ==
X-Received: by 2002:a17:902:f54d:b0:173:c1:6914 with SMTP id
 h13-20020a170902f54d00b0017300c16914mr5282679plf.28.1661308671173; 
 Tue, 23 Aug 2022 19:37:51 -0700 (PDT)
Received: from [10.72.13.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 o185-20020a625ac2000000b0052b7f0ff197sm11503727pfb.49.2022.08.23.19.37.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 19:37:50 -0700 (PDT)
Message-ID: <50ef3c5f-4d16-bda4-c002-ba77f7167886@redhat.com>
Date: Wed, 24 Aug 2022 10:37:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 10/24] vhost: introduce vhost_dev_virtqueue_restart()
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <df42fc68d6cf780cce0e5d1c0e020cd3b687b42c.1660611460.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <df42fc68d6cf780cce0e5d1c0e020cd3b687b42c.1660611460.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


在 2022/8/16 09:06, Kangjie Xu 写道:
> Introduce vhost_dev_virtqueue_restart(), which can restart the
> virtqueue when the vhost has already started running.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   hw/virtio/vhost.c         | 13 +++++++++++++
>   include/hw/virtio/vhost.h |  2 ++
>   2 files changed, 15 insertions(+)
>
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 1bca9ff48d..fc3f550c76 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -1913,3 +1913,16 @@ void vhost_dev_virtqueue_stop(struct vhost_dev *hdev, VirtIODevice *vdev,
>                             hdev->vqs + idx,
>                             idx);
>   }
> +
> +int vhost_dev_virtqueue_restart(struct vhost_dev *hdev, VirtIODevice *vdev,
> +                                int idx)
> +{
> +    const VhostOps *vhost_ops = hdev->vhost_ops;
> +
> +    assert(vhost_ops);


So we had the comment like:

     /* should only be called after backend is connected */

in vhost_virtqueue_mask().

If this assert has the same reason, let's add a comment here.


> +
> +    return vhost_virtqueue_start(hdev,
> +                                 vdev,
> +                                 hdev->vqs + idx,
> +                                 hdev->vq_index + idx);


So it just a wrapper of vhost_virtqueue_start(), any value to have a 
re-start wrapper?

Thanks


> +}
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index 574888440c..b3394b6348 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -291,4 +291,6 @@ int vhost_dev_get_inflight(struct vhost_dev *dev, uint16_t queue_size,
>   
>   void vhost_dev_virtqueue_stop(struct vhost_dev *hdev, VirtIODevice *vdev,
>                                 int idx);
> +int vhost_dev_virtqueue_restart(struct vhost_dev *hdev, VirtIODevice *vdev,
> +                                int idx);
>   #endif


