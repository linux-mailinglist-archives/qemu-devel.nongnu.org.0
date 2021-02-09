Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB353153C9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 17:27:00 +0100 (CET)
Received: from localhost ([::1]:60074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Vqs-0002lf-SX
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 11:26:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l9Vp5-0001Lb-F8
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 11:25:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l9Vp2-0003mD-0j
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 11:25:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612887902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UL4UTNbThjWolHq6eiVDlaijSBDAiunV8pTMMeOFSWA=;
 b=cnteyXswxH03dwoAK+75Xp+LexCPxpQ+6FHS5+JVoZgzCCw9gG3Wnh+hYGLwhbeFNqJFzH
 ev0Vt7kma7ST7pFqhpMShGu73897UbidT31Za4qMrt43UICKGoNV95TbOe/g/hvV310RRn
 43g/YmTn03uoTdso+WrhqplOZXdYstk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-DANhPKgjOWePsLNZfzB20Q-1; Tue, 09 Feb 2021 11:25:00 -0500
X-MC-Unique: DANhPKgjOWePsLNZfzB20Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AF4D80402C;
 Tue,  9 Feb 2021 16:24:59 +0000 (UTC)
Received: from [10.3.114.150] (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0944660861;
 Tue,  9 Feb 2021 16:24:51 +0000 (UTC)
Subject: Re: [RFC v2 1/7] vhost: Delete trailing dot in errpr_setg argument
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20210209153757.1653598-1-eperezma@redhat.com>
 <20210209153757.1653598-2-eperezma@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <14b2637e-9610-356e-ad18-27a9a8b82508@redhat.com>
Date: Tue, 9 Feb 2021 10:24:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209153757.1653598-2-eperezma@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Rob Miller <rob.miller@broadcom.com>, Michael Lilja <ml@napatech.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 9:37 AM, Eugenio Pérez wrote:
> As error_setg points

Incomplete sentence?

Missing Signed-off-by.

> ---
>  hw/virtio/vhost.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 6e17d631f7..1c5b442081 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -1358,7 +1358,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
>      if (hdev->migration_blocker == NULL) {
>          if (!(hdev->features & (0x1ULL << VHOST_F_LOG_ALL))) {
>              error_setg(&hdev->migration_blocker,
> -                       "Migration disabled: vhost lacks VHOST_F_LOG_ALL feature.");
> +                       "Migration disabled: vhost lacks VHOST_F_LOG_ALL feature");
>          } else if (vhost_dev_log_is_shared(hdev) && !qemu_memfd_alloc_check()) {
>              error_setg(&hdev->migration_blocker,
>                         "Migration disabled: failed to allocate shared memory");
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


