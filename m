Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E5E4EBB8A
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 09:14:25 +0200 (CEST)
Received: from localhost ([::1]:60426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZSXA-0007sv-2t
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 03:14:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nZSUO-00061v-Hf
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 03:11:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nZSUL-0000ja-Gh
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 03:11:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648624288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kKkA3szNQTzuJdyz9MPGUk8ByKVwxSgz9XoSDefChrc=;
 b=R3Ho0Mv3SBVU7HmG+Q0CEAdY/0bu6u5nJ6r/+L8MbsvEwTBxGpZ/ylIzRD3WCshrmiivDd
 cOZvhx0qqMljjr83se5qRSzfyyzGve4Y3cPZW99unLv4c4/yps4lUO6Um/+ftxDkEFekoX
 9foVAATY7jyDj+6wlrZ1sS+B1ubEGV8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-cP-MiYurMvuIHLKnivi_yA-1; Wed, 30 Mar 2022 03:11:25 -0400
X-MC-Unique: cP-MiYurMvuIHLKnivi_yA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 779A22800953;
 Wed, 30 Mar 2022 07:11:23 +0000 (UTC)
Received: from [10.33.192.183] (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 734FC401E78;
 Wed, 30 Mar 2022 07:11:17 +0000 (UTC)
Message-ID: <0102b99e-bf43-3090-96d2-78b899f7bff3@redhat.com>
Date: Wed, 30 Mar 2022 09:11:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 3/4] virtio-ccw: move device type declarations to .c files
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220328143019.682245-1-pbonzini@redhat.com>
 <20220328143019.682245-4-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220328143019.682245-4-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: pasic@linux.ibm.com, borntraeger@linux.ibm.com, farman@linux.ibm.com,
 cohuck@redhat.com, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/03/2022 16.30, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   hw/s390x/s390-virtio-ccw.c    |   1 +
>   hw/s390x/vhost-scsi-ccw.c     |   9 +++
>   hw/s390x/vhost-vsock-ccw.c    |   9 +++
>   hw/s390x/virtio-ccw-9p.c      |   9 +++
>   hw/s390x/virtio-ccw-balloon.c |   9 +++
>   hw/s390x/virtio-ccw-blk.c     |   9 +++
>   hw/s390x/virtio-ccw-crypto.c  |   9 +++
>   hw/s390x/virtio-ccw-gpu.c     |   9 +++
>   hw/s390x/virtio-ccw-input.c   |  20 +++++
>   hw/s390x/virtio-ccw-net.c     |   9 +++
>   hw/s390x/virtio-ccw-rng.c     |   9 +++
>   hw/s390x/virtio-ccw-scsi.c    |   9 +++
>   hw/s390x/virtio-ccw-serial.c  |   9 +++
>   hw/s390x/virtio-ccw.c         |   2 +
>   hw/s390x/virtio-ccw.h         | 133 ----------------------------------
>   15 files changed, 122 insertions(+), 133 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


