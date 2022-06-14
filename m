Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A28D854AD6A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 11:32:03 +0200 (CEST)
Received: from localhost ([::1]:42918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o12u2-0002jh-Mz
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 05:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o12Xw-00089S-Ol
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 05:09:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o12Xu-0003G5-Fe
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 05:09:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655197749;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=klAkLCO1WkFCDZCPyqbLLJHOBgQDGC0P3wzaSZwfu6s=;
 b=FBbxnMY3VD+2mH995V/7aqCQZWMgoVD0XWwF8j3PiEzL3h7Td8lvpIkT6gXO4Dx1zErdvV
 je3bJ0oiiWeKaCYUNpJwbjhT+mpCQh79b++fjkMZM6WYOOQ4kWEF6wD0Xkm2VCpdKw8sNE
 +/pZNE1HmdZ4d5g6VHNxpGYGjeFHnUo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-V6lwkaePPMuY2JIhcAerYQ-1; Tue, 14 Jun 2022 05:09:05 -0400
X-MC-Unique: V6lwkaePPMuY2JIhcAerYQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E04FC82406C;
 Tue, 14 Jun 2022 09:09:04 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.137])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 189EBC23DBF;
 Tue, 14 Jun 2022 09:09:02 +0000 (UTC)
Date: Tue, 14 Jun 2022 10:09:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 4/5] tests/vm: switch CentOS 8 to CentOS 8 Stream
Message-ID: <YqhQLC7vsLDAjLK7@redhat.com>
References: <20220614015044.2501806-1-jsnow@redhat.com>
 <20220614015044.2501806-5-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220614015044.2501806-5-jsnow@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 13, 2022 at 09:50:43PM -0400, John Snow wrote:
> The old CentOS image didn't work anymore because it was already EOL at
> the beginning of 2022.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/vm/centos | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/vm/centos b/tests/vm/centos
> index be4f6ff2f14..f5bbdecf62d 100755
> --- a/tests/vm/centos
> +++ b/tests/vm/centos
> @@ -1,8 +1,8 @@
>  #!/usr/bin/env python3
>  #
> -# CentOS image
> +# CentOS 8 Stream image
>  #
> -# Copyright 2018 Red Hat Inc.
> +# Copyright 2018, 2022 Red Hat Inc.
>  #
>  # Authors:
>  #  Fam Zheng <famz@redhat.com>
> @@ -18,7 +18,7 @@ import basevm
>  import time
>  
>  class CentosVM(basevm.BaseVM):
> -    name = "centos"
> +    name = "centos8s"


What's the effect of this ?  It feels a little odd to set name to 'centos8s'
here but have this file still called just 'centos' - I assume the 'name'
variable was intended to always match the filename

>      arch = "x86_64"
>      BUILD_SCRIPT = """
>          set -e;
> @@ -32,7 +32,7 @@ class CentosVM(basevm.BaseVM):
>      """
>  
>      def build_image(self, img):
> -        cimg = self._download_with_cache("https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-GenericCloud-8.3.2011-20201204.2.x86_64.qcow2")
> +        cimg = self._download_with_cache("https://cloud.centos.org/centos/8-stream/x86_64/images/CentOS-Stream-GenericCloud-8-20220125.1.x86_64.qcow2")
>          img_tmp = img + ".tmp"
>          subprocess.check_call(['cp', '-f', cimg, img_tmp])
>          self.exec_qemu_img("resize", img_tmp, "50G")


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


