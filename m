Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC6D6C9FD5
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 11:35:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgjFv-0002S7-Ov; Mon, 27 Mar 2023 05:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pgjFn-0002La-HN
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 05:35:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pgjFl-0006wF-Pa
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 05:35:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679909700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JSASRgioEJ4xNwg056ED3CWrqKc7rZhZl6bj8fYkvO0=;
 b=IUnB6OYNOovgMob9/RIhkDFvFUFwOAXKr3BFPMe6n2RiTuOz2BEKGqyF5BsRmZUeo5ow2/
 gR54aVX3eAEWuo9vBFOBwHcRVI2ARXuUTJUKqBG++h4IWalSMpkKj1g6J9eq/5hBNPh38p
 fVLCPALzEybPb2n327pSe7u4DJQeZIY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-hCmzuW-7M5uDSQCnZ4Qa9Q-1; Mon, 27 Mar 2023 05:34:58 -0400
X-MC-Unique: hCmzuW-7M5uDSQCnZ4Qa9Q-1
Received: by mail-qt1-f199.google.com with SMTP id
 h6-20020ac85846000000b003e3c23d562aso5661059qth.1
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 02:34:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679909698;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JSASRgioEJ4xNwg056ED3CWrqKc7rZhZl6bj8fYkvO0=;
 b=N98Hu9/WgQSQOvHVnWrym8niKq6seIFDtfBxu90oKCDL0ib0eE3bwcowF05mY2xfpG
 QzJAQO/bNJuG/cqGU8GzlnHIDSYRgrZ1af9NDwX04BdS+p/HXv7j1AWWD1YUav08tZbF
 Ird0iQGusJq7Myp0Qs8kl4ATtR6OF2Mii6sZ9Uwaj1hRnSukObBP0PaU7C3xVuBCc+ZL
 szBz6HLBlR1VN1VAx/SBVA9HGwwBSvjxmjg2Nf3oqCcpz78WRGUeen2b3+7bHU50tcI8
 Nyzi6iAQgn6yCMRipm16SAOBpUNVMtm5wGbLtFxLa5PyVQJ3s2VvZVAG4WCLwJF7ztyy
 PyfQ==
X-Gm-Message-State: AAQBX9dbqpwVYXQZ2KLG1EVqMRwQ3dVDt2zOo1Z0WFOhStKIfTnhrUOG
 V3zTIEWgV/IpTEmW5aNT2lJ7ebipA1jfHFgIDvDkegHuf4AUQuA6LfLCPrtwpzPdpWdxsP2Fko7
 2CxyPticA0mob4Ao=
X-Received: by 2002:a05:6214:f67:b0:5ac:e837:4401 with SMTP id
 iy7-20020a0562140f6700b005ace8374401mr21581221qvb.18.1679909698533; 
 Mon, 27 Mar 2023 02:34:58 -0700 (PDT)
X-Google-Smtp-Source: AKy350almk13a/es292mMhSTeKNDSIe4uxHQ93kOPZE2YIvZlIIjnSkL7lXbOKiXvN0RTtsqmugUEQ==
X-Received: by 2002:a05:6214:f67:b0:5ac:e837:4401 with SMTP id
 iy7-20020a0562140f6700b005ace8374401mr21581191qvb.18.1679909698229; 
 Mon, 27 Mar 2023 02:34:58 -0700 (PDT)
Received: from sgarzare-redhat (host-82-53-134-98.retail.telecomitalia.it.
 [82.53.134.98]) by smtp.gmail.com with ESMTPSA id
 mu10-20020a056214328a00b005dd8b9345aasm2779174qvb.66.2023.03.27.02.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 02:34:57 -0700 (PDT)
Date: Mon, 27 Mar 2023 11:34:52 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 alvaro.karsz@solid-run.com, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>,
 si-wei.liu@oracle.com, 
 Eli Cohen <eli@mellanox.com>, Shannon Nelson <snelson@pensando.io>, 
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Cindy Lu <lulu@redhat.com>, longpeng2@huawei.com,
 Harpreet Singh Anand <hanand@xilinx.com>
Subject: Re: [PATCH for 8.1 v2 4/6] vdpa: return errno in
 vhost_vdpa_get_vring_group error
Message-ID: <g2i3ob2iqsronxyjlwud7ude5dd2zu2jxmeawuqki3nw7h447y@yrfjknzwoohh>
References: <20230323195404.1247326-1-eperezma@redhat.com>
 <20230323195404.1247326-5-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230323195404.1247326-5-eperezma@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Mar 23, 2023 at 08:54:02PM +0100, Eugenio Pérez wrote:
>We need to tell in the caller, as some errors are expected in a normal
>workflow.  In particular, parent drivers in recent kernels with
>VHOST_BACKEND_F_IOTLB_ASID may not support vring groups.  In that case,
>-ENOTSUP is returned.
>
>This is the case of vp_vdpa in Linux 6.2.
>
>Next patches in this series will use that information to know if it must
>abort or not.  Also, next patches return properly an errp instead of
>printing with error_report.
>
>Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>---
> net/vhost-vdpa.c | 9 +++++++++
> 1 file changed, 9 insertions(+)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>index 99904a0da7..4397c0d4b3 100644
>--- a/net/vhost-vdpa.c
>+++ b/net/vhost-vdpa.c
>@@ -361,6 +361,14 @@ static NetClientInfo net_vhost_vdpa_info = {
>         .check_peer_type = vhost_vdpa_check_peer_type,
> };
>
>+/**
>+ * Get vring virtqueue group
>+ *
>+ * @device_fd  vdpa device fd
>+ * @vq_index   Virtqueue index
>+ *
>+ * Return -errno in case of error, or vq group if success.
>+ */
> static int64_t vhost_vdpa_get_vring_group(int device_fd, unsigned vq_index)
> {
>     struct vhost_vring_state state = {
>@@ -369,6 +377,7 @@ static int64_t vhost_vdpa_get_vring_group(int device_fd, unsigned vq_index)
>     int r = ioctl(device_fd, VHOST_VDPA_GET_VRING_GROUP, &state);
>
>     if (unlikely(r < 0)) {
>+        r = -errno;
>         error_report("Cannot get VQ %u group: %s", vq_index,
>                      g_strerror(errno));
>         return r;
>-- 
>2.31.1
>


