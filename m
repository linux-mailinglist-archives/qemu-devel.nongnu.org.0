Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBCC2A7FBA
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 14:34:41 +0100 (CET)
Received: from localhost ([::1]:47478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kafPU-0008NS-Nj
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 08:34:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kafOZ-0007rV-Aw
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 08:33:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kafOX-0001Ul-8p
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 08:33:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604583219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x68mKNv7Ycvpr++JNS22VfSU6aVebEiRsXAtiEg4kY0=;
 b=IMF+2by9Ubh7Z4wKa9uh+BzBtozovwrQio+EKtQuSygWXjI4MDx3YbeUIuRGgDvjdwIioJ
 pE9lqvwQcpDJ9wSHo+QaMB6evrXZQk09eIIa2Hru/noTuRIQInlTr3okARp8THGnu4Rxm0
 7sWIJomOCcjsPlsZ/ilqXQZ5XDTtewA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-uz7xROP9OMS50V7aPigzWA-1; Thu, 05 Nov 2020 08:33:37 -0500
X-MC-Unique: uz7xROP9OMS50V7aPigzWA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED2191882FB1;
 Thu,  5 Nov 2020 13:33:35 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-117.ams2.redhat.com [10.36.112.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5919219930;
 Thu,  5 Nov 2020 13:33:07 +0000 (UTC)
Subject: Re: [PATCH-for-6.0 3/3] gitlab-ci: Test the --disable-virtio-legacy
 option
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201105124353.3680057-1-philmd@redhat.com>
 <20201105124353.3680057-4-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <99d3eb29-52a4-609d-c598-aa1801729da3@redhat.com>
Date: Thu, 5 Nov 2020 14:33:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201105124353.3680057-4-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/04 22:46:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/11/2020 13.43, Philippe Mathieu-Daudé wrote:
> Add the recently introduced '--disable-virtio-legacy' configuration
> to the 'build-disabled' job.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  .gitlab-ci.yml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 3b15ae5c302..21fa1a459fd 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -218,6 +218,7 @@ build-disabled:
>        --disable-strip --disable-tpm --disable-usb-redir --disable-vdi
>        --disable-vhost-crypto --disable-vhost-net --disable-vhost-scsi
>        --disable-vhost-user --disable-vhost-vdpa --disable-vhost-vsock
> +      --disable-virtio-legacy
>        --disable-virglrenderer --disable-vnc --disable-vte --disable-vvfat
>        --disable-xen --disable-zstd
>      TARGETS: arm-softmmu i386-softmmu ppc64-softmmu mips64-softmmu
> 

Acked-by: Thomas Huth <thuth@redhat.com>


