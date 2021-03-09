Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C008332B5B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:02:08 +0100 (CET)
Received: from localhost ([::1]:43218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeoB-0004Ag-5m
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:02:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJeWl-0002fh-CV
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:44:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJeWh-0005ce-ET
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:44:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615304642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fCKQ/cKmc7swBDql1gE6qoIShzTiG4FXzCCBZhkP3Ww=;
 b=MWCwk8MLZ9P6txhJcJLTSlTP4+Dm+ngpBP9DSG7JZS0tBJqiiU2bMpLmmUe84H4HMoyd8P
 r9KRRnEjr1oACO+15GAxROCbmAo9GKQfPacUdaASOsTEqQV0UhtDRk/kRE/c5GAj2s6xVS
 /v66PrvjXa6cfb6Onhgmu2mYUGKSZlw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-UqLLVZNDPEGsVCPWBk9PPQ-1; Tue, 09 Mar 2021 10:44:00 -0500
X-MC-Unique: UqLLVZNDPEGsVCPWBk9PPQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F98919057D0;
 Tue,  9 Mar 2021 15:43:59 +0000 (UTC)
Received: from [10.3.112.36] (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46DED1037E8A;
 Tue,  9 Mar 2021 15:43:54 +0000 (UTC)
Subject: Re: [PATCH] virtio-gpu: Add spaces around operator
To: lijiejun <a_lijiejun@163.com>, kraxel@redhat.com
References: <1615275756-129881-1-git-send-email-a_lijiejun@163.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <0a9ae121-8bd5-8457-c335-60e8fb0af02a@redhat.com>
Date: Tue, 9 Mar 2021 09:43:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1615275756-129881-1-git-send-email-a_lijiejun@163.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 1:42 AM, lijiejun wrote:
> Fix code style. Operator needs spaces forend sides, and delete line space.

What operator?  'break' is a statement, not an operator.

> 
> Signed-off-by: lijiejun <a_lijiejun@163.com>
> ---
>  hw/display/virtio-gpu-3d.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/display/virtio-gpu-3d.c b/hw/display/virtio-gpu-3d.c
> index 9eb4890..d989648 100644
> --- a/hw/display/virtio-gpu-3d.c
> +++ b/hw/display/virtio-gpu-3d.c
> @@ -438,7 +438,7 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>          break;
>      case VIRTIO_GPU_CMD_RESOURCE_FLUSH:
>          virgl_cmd_resource_flush(g, cmd);
> -       break;
> +        break;
>      case VIRTIO_GPU_CMD_RESOURCE_UNREF:
>          virgl_cmd_resource_unref(g, cmd);
>          break;
> @@ -456,7 +456,6 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>      case VIRTIO_GPU_CMD_GET_CAPSET:
>          virgl_cmd_get_capset(g, cmd);
>          break;
> -
>      case VIRTIO_GPU_CMD_GET_DISPLAY_INFO:
>          virtio_gpu_get_display_info(g, cmd);
>          break;
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


