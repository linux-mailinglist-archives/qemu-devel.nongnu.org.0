Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FF1580A1C
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 05:51:00 +0200 (CEST)
Received: from localhost ([::1]:33960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGBb1-0004s6-2e
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 23:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGBZZ-0003V1-7Y
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 23:49:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGBZX-0001iZ-Gc
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 23:49:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658807366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ZMlblcpd8btezfi59buXE/tPboNiCR979HsrQolkBk=;
 b=DptI3+QH3+3m+OMREJWD+R3Vh7Rk6ZTXrDR6uIwt5ZixApcNKIirMLcIsh1cfzvoOu+Rz+
 FtJKWuiaIhLyeYRVMz7dr7LmNO1Svxu/BWafQQUZICY8ME/c5dy3d+/Mjj2TRcTrJ0aP/V
 xInOxrXhqKOylAq43lBxRxnRpQBemk0=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-Wcn8czo3PveAD8RBCXeMZA-1; Mon, 25 Jul 2022 23:49:24 -0400
X-MC-Unique: Wcn8czo3PveAD8RBCXeMZA-1
Received: by mail-pj1-f70.google.com with SMTP id
 c15-20020a17090abf0f00b001f221ef494fso8775441pjs.0
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 20:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8ZMlblcpd8btezfi59buXE/tPboNiCR979HsrQolkBk=;
 b=lao8z+5XzpSYMDTMmjZ09ehHPoWQxpAyFKZmPU7EQM7keYBaCzyuu0dG03KfPJ249U
 Xbjn5As/X6rHrFeD59iDh2/xaI+CGeWh7Co1fwNlxVnxe6UrbrSr39F7uSxAFhKStvSP
 nD1gjwp9y9XDT5xMvcz+dcKfVjjfsFB0AKrksZYgDRaTwdpwdAEx+mwuNn5oIqdNs+Yb
 zQ9uvapOYkIv1dV4c4QFfi5aLTmMbVu5KNW6Qmq1ztqhrtjJ4RpzR6rS5GRvdT+8tYaK
 WUijAvvfmCSupWamyHQ2sa4NPkI1YYgsnBEenxIIzfVGrN+sko9hik2Dguixom5RSez6
 9S3g==
X-Gm-Message-State: AJIora9n7b+UMolK/B1AA7ak0g1f3L6xYSripA+IhfMD0eLeDZ15+37Y
 lMJBAgej2Dy8MrANVIG3Quq0ZDR56hYNUMpMf1nr85u3CtaJbMNsGya93plo/l2bWlLdGYmenhl
 pnif6m2PYndGlDeo=
X-Received: by 2002:a05:6a00:c91:b0:52a:cad7:d755 with SMTP id
 a17-20020a056a000c9100b0052acad7d755mr15960526pfv.66.1658807363785; 
 Mon, 25 Jul 2022 20:49:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tm8aB2BeEm8flpTjfPY2s4YQ3RMrMRa8FYw1ifmlQn6SfB220GHbw4Pn5tfXedUSMEVJhk8Q==
X-Received: by 2002:a05:6a00:c91:b0:52a:cad7:d755 with SMTP id
 a17-20020a056a000c9100b0052acad7d755mr15960510pfv.66.1658807363512; 
 Mon, 25 Jul 2022 20:49:23 -0700 (PDT)
Received: from [10.72.12.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 e12-20020a17090301cc00b0016d10267927sm10110233plh.203.2022.07.25.20.49.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 20:49:22 -0700 (PDT)
Message-ID: <b078fc30-0c8b-b56c-e320-c89e6376fb21@redhat.com>
Date: Tue, 26 Jul 2022 11:49:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 08/16] vhost: add op to enable or disable a single vring
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
 <8bf7574d8e133d3fa7e8b09f4deb59369916774a.1658141552.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <8bf7574d8e133d3fa7e8b09f4deb59369916774a.1658141552.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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


在 2022/7/18 19:17, Kangjie Xu 写道:
> The interface to set enable status for a single vring is lacked in
> VhostOps, since the vhost_set_vring_enable_op will manipulate all
> virtqueues in a device.
>
> Resetting a single vq will rely on this interface. It requires a
> reply to indicate that the reset operation is finished, so the
> parameter, wait_for_reply, is added.


The wait reply seems to be a implementation specific thing. Can we hide it?

Thanks


>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   include/hw/virtio/vhost-backend.h | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
> index eab46d7f0b..7bddd1e9a0 100644
> --- a/include/hw/virtio/vhost-backend.h
> +++ b/include/hw/virtio/vhost-backend.h
> @@ -81,6 +81,9 @@ typedef int (*vhost_set_backend_cap_op)(struct vhost_dev *dev);
>   typedef int (*vhost_set_owner_op)(struct vhost_dev *dev);
>   typedef int (*vhost_reset_device_op)(struct vhost_dev *dev);
>   typedef int (*vhost_get_vq_index_op)(struct vhost_dev *dev, int idx);
> +typedef int (*vhost_set_single_vring_enable_op)(struct vhost_dev *dev,
> +                                                int index, int enable,
> +                                                bool wait_for_reply);
>   typedef int (*vhost_set_vring_enable_op)(struct vhost_dev *dev,
>                                            int enable);
>   typedef bool (*vhost_requires_shm_log_op)(struct vhost_dev *dev);
> @@ -155,6 +158,7 @@ typedef struct VhostOps {
>       vhost_set_owner_op vhost_set_owner;
>       vhost_reset_device_op vhost_reset_device;
>       vhost_get_vq_index_op vhost_get_vq_index;
> +    vhost_set_single_vring_enable_op vhost_set_single_vring_enable;
>       vhost_set_vring_enable_op vhost_set_vring_enable;
>       vhost_requires_shm_log_op vhost_requires_shm_log;
>       vhost_migration_done_op vhost_migration_done;


