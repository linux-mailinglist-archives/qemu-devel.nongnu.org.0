Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 027E64842AC
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 14:42:32 +0100 (CET)
Received: from localhost ([::1]:44762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4k59-00047C-03
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 08:42:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n4k2X-0003P4-4s
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 08:39:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n4k2U-0006zm-0O
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 08:39:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641303585;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=JXBpDNQLbLSjkVoIuKY5LdG4mUFYawxwZhaHYClJxtE=;
 b=PetCyNCuUWZvM9g12IFVXkdMvNXvasKOqI0GCagQFumFB0pK/K/8UJUhwHMW1mAI657Oz9
 bQwxMa+wFn6t/IlS4H78jOLyZy4Bo8W+9CEfe9x/AwUJzPb+d6bUS1z0jv+gSIKoEbPPLg
 N2Z0qOD+KveN6tOYsW10eG/gp4JxzgY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-msr6y7hcPceot-ktK9aKiA-1; Tue, 04 Jan 2022 08:39:42 -0500
X-MC-Unique: msr6y7hcPceot-ktK9aKiA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1007FA0C0A;
 Tue,  4 Jan 2022 13:39:41 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A3C17B6C5;
 Tue,  4 Jan 2022 13:39:38 +0000 (UTC)
Date: Tue, 4 Jan 2022 13:39:36 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: [PATCH 0/5] Introduce camera subsystem and USB video device
Message-ID: <YdROGNKYvl+doshs@redhat.com>
References: <20211227142734.691900-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20211227142734.691900-1-pizhenwei@bytedance.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, kraxel@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 27, 2021 at 10:27:29PM +0800, zhenwei pi wrote:
> 1, The full picture of this patch set:
>    +---------+       +------------+     +---------------+
>    |UVC(done)|       |virtio(TODO)|     |other HW device|
>    +---------+       +------------+     +---------------+
>          |                 |                     |
>          |            +------------+             |
> 	 +------------+camera(done)+-------------+
>                       +----+-------+
>                            |
>          +-----------------+---------------------+
>          |                 |                     |
>   +------+------+     +----+-----+        +------+------+
>   |builtin(done)|     |v4l2(done)|        |other drivers|
>   +-------------+     +----------+        +-------------+
> 
> With this patch set, We can run a desktop VM (Ex Ubuntu-2004), several camera
> APPs(cheese, kamoso, guvcview and qcam) work fine.
> 
> Some works still in working:
>   1, hot-plug
>   2, compat with live migration
>   3, several actions defined in UVC SPEC
> 
> Zhenwei Pi (5):
>   camera: Introduce camera subsystem and builtin driver
>   camera: v4l2: Introduce v4l2 camera driver
>   usb: Introduce video&mescellaneous
>   usb: allow max 8192 bytes for desc
>   usb-video: Introduce USB video class
> 
>  camera/builtin.c        |  717 ++++++++++++++++++++
>  camera/camera-int.h     |   19 +
>  camera/camera.c         |  522 +++++++++++++++
>  camera/meson.build      |   20 +
>  camera/trace-events     |   28 +
>  camera/trace.h          |    1 +
>  camera/v4l2.c           |  637 ++++++++++++++++++
>  hw/usb/Kconfig          |    5 +
>  hw/usb/desc.c           |   15 +-
>  hw/usb/desc.h           |    1 +
>  hw/usb/dev-video.c      | 1395 +++++++++++++++++++++++++++++++++++++++
>  hw/usb/meson.build      |    1 +
>  hw/usb/trace-events     |   11 +
>  include/camera/camera.h |  238 +++++++
>  include/hw/usb.h        |    2 +
>  include/hw/usb/video.h  |  303 +++++++++
>  meson.build             |   20 +-
>  meson_options.txt       |    3 +
>  qapi/camera.json        |  101 +++
>  qapi/meson.build        |    1 +
>  qapi/qapi-schema.json   |    1 +
>  qemu-options.hx         |   13 +
>  softmmu/vl.c            |    4 +

There's no MAINTAINERS file update here.

As a general rule, if you are introducing an entire new subsystem
into the QEMU codebase, it is expected someone will be nominated
as the maintainer for the new subsystem. Usually the person adding
it will themselves volunteer to be the maintainer.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


