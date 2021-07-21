Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 052FE3D0EAD
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 14:16:04 +0200 (CEST)
Received: from localhost ([::1]:40148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6B8s-00062X-IA
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 08:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6B7V-0005Fo-0J
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 08:14:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6B7S-00022x-9S
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 08:14:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626869672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CnHzVMkLTBJj0HDYyYhoohRvjp/LUAosvczDCngVcfM=;
 b=K09O5tBVzJaoOmQOnf9QjqqhaBd1Um5qH659NYl5p1O6MLTFV6dSq+uZ79AariqNR3xUha
 gz2fAdTLTKhL8EoL6wlJzcdmU7QQbUT3VnnZK8HJGt0QfyUAR924XYyKLBOjI4mfLNdhxY
 AdV+XcvkVBryCgGNAoOFw/Sh+kzZMlc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-BfyHS1FdOvaGbYVt8EMpQw-1; Wed, 21 Jul 2021 08:14:29 -0400
X-MC-Unique: BfyHS1FdOvaGbYVt8EMpQw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7516B5F9CE;
 Wed, 21 Jul 2021 12:14:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 723C95C22B;
 Wed, 21 Jul 2021 12:14:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 37EA118000B2; Wed, 21 Jul 2021 14:14:14 +0200 (CEST)
Date: Wed, 21 Jul 2021 14:14:14 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 5/6] tests/acceptance/virtio-gpu.py: use virtio-vga-gl
Message-ID: <20210721121414.wadyiaimm4cyrhab@sirius.home.kraxel.org>
References: <20210714174051.28164-1-crosa@redhat.com>
 <20210714174051.28164-6-crosa@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210714174051.28164-6-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 14, 2021 at 01:40:50PM -0400, Cleber Rosa wrote:
> Since 49afbca3b, the use of an optional virgl renderer is not
> available anymore, and since b36eb8860f, the way to choose a GL based
> rendered is to use the "virtio-vga-gl" device.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/virtio-gpu.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/acceptance/virtio-gpu.py b/tests/acceptance/virtio-gpu.py
> index fbde278705..0f84affe82 100644
> --- a/tests/acceptance/virtio-gpu.py
> +++ b/tests/acceptance/virtio-gpu.py
> @@ -56,7 +56,7 @@ def wait_for_console_pattern(self, success_message, vm=None):
>  
>      def test_virtio_vga_virgl(self):
>          """
> -        :avocado: tags=device:virtio-vga
> +        :avocado: tags=device:virtio-vga-gl
>          """
>          # FIXME: should check presence of virtio, virgl etc
>          self.require_accelerator('kvm')
> @@ -67,7 +67,7 @@ def test_virtio_vga_virgl(self):
>          self.vm.set_console()
>          self.vm.add_args("-m", "2G")
>          self.vm.add_args("-machine", "pc,accel=kvm")
> -        self.vm.add_args("-device", "virtio-vga,virgl=on")
> +        self.vm.add_args("-device", "virtio-vga-gl")
>          self.vm.add_args("-display", "egl-headless")
>          self.vm.add_args(
>              "-kernel",

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

Side note: virgl=on isn't guaranteed to be present on old qemu versions,
it is only there on --enable-virglrenderer builds.  For upstream/master
this is fine, but in case you want your test cases work on older qemu
versions too you need to check that ...

take care,
  Gerd


