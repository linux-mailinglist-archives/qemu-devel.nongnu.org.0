Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 568D56779BE
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 12:00:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJuYa-0000xJ-Kt; Mon, 23 Jan 2023 06:00:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pJuYX-0000uq-5T
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 06:00:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pJuYV-0006a6-6p
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 06:00:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674471602;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=DweCGtOWjeQiZkJRN6PJo8Wg1NKYM8gwMehBVn6IKxo=;
 b=NQ+XxJk6VT+4aREw67d7u20AmQNV0nb3AboF7c5kvr20Y8krdX4twwTfAqL2cvcPO7KfYI
 xdQQD8Y1q4nEfY0Bafzb3QlFMV10GnHEWQVIu+Bx/3nvtK0TIYbOMrJRwwCjSVRi86dkaJ
 MjoUlo+UVy7GFnSwHKoAah9ulZHEZnI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-DBS4KEjLMLahFFF-YWiLhA-1; Mon, 23 Jan 2023 06:00:00 -0500
X-MC-Unique: DBS4KEjLMLahFFF-YWiLhA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7221885622;
 Mon, 23 Jan 2023 10:59:59 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82A972166B32;
 Mon, 23 Jan 2023 10:59:58 +0000 (UTC)
Date: Mon, 23 Jan 2023 10:59:56 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: qemu-devel@nongnu.org, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] configure: Expand test which disable -Wmissing-braces
Message-ID: <Y85orFuO9hDqTF9h@redhat.com>
References: <20230106142110.672-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230106142110.672-1-anthony.perard@citrix.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Jan 06, 2023 at 03:21:10PM +0100, Anthony PERARD via wrote:
> From: Anthony PERARD <anthony.perard@citrix.com>
> 
> With "clang 6.0.0-1ubuntu2" on Ubuntu Bionic, the test with build
> fine, but clang still suggest braces around the zero initializer in a
> few places, where there is a subobject. Expand test to include a sub
> struct which doesn't build on clang 6.0.0-1ubuntu2, and give:
>     config-temp/qemu-conf.c:7:8: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
>     } x = {0};
>            ^
>            {}
> 
> These are the error reported by clang on QEMU's code (v7.2.0):
> hw/pci-bridge/cxl_downstream.c:101:51: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
>     dvsec = (uint8_t *)&(CXLDVSECPortExtensions){ 0 };
> 
> hw/pci-bridge/cxl_root_port.c:62:51: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
>     dvsec = (uint8_t *)&(CXLDVSECPortExtensions){ 0 };
> 
> tests/qtest/virtio-net-test.c:322:34: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
>     QOSGraphTestOptions opts = { 0 };
> 
> Reported-by: Andrew Cooper <Andrew.Cooper3@citrix.com>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> 
> While Ubuntu Bionic isn't supposed to be supported anymore, clang v6
> is still the minimum required as tested by ./configure.

The configure checks don't always keep track with our supported OS
versions, because we often don't update the min versions until we
find a technical issue that motivates it. IOW, the supported OS
versions are considered to be the overriding policy regardless of
what the code tool/library versions checks currently implement.

So if the compile problem only exists on OS versions that are outside
our support matrix, then we should be bumping the minimum version
check in configure, which could possibly enable us to get rid of the
entire check for broken -Wmissing-braces.

> ---
>  configure | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/configure b/configure
> index 9f0bc57546..3cd9b8bad4 100755
> --- a/configure
> +++ b/configure
> @@ -1290,7 +1290,11 @@ fi
>  # Disable -Wmissing-braces on older compilers that warn even for
>  # the "universal" C zero initializer {0}.
>  cat > $TMPC << EOF
> +struct s {
> +  void *a;
> +};
>  struct {
> +  struct s s;
>    int a[2];
>  } x = {0};
>  EOF
> -- 
> Anthony PERARD
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


