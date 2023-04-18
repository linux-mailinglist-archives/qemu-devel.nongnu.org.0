Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0846E67E2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 17:17:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pon3i-0006Mx-3s; Tue, 18 Apr 2023 11:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pon3f-0006MQ-RM
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 11:15:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pon3d-0004sh-2D
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 11:15:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681830947;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=hvrtdzA5j2vix4v2SZPYeQRu/2GXgLGffRPfh2Hv2GI=;
 b=PQv95quioElQqSBfFhhx7Crr0VkZNeGQEqHhQHzk5kC+Dwio091lHz2S+pX3sQyENxPU4W
 7s50F7fglx3H42pKNuU4lwqAoNVcaie0kjThYKsUrDT4MVwVEZqciIeK9kdgolThUvSLaQ
 xMFv1iIXxxJOgfoLoELpv21ix1IA2II=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-homKRfseMQyd_idKdD6pLg-1; Tue, 18 Apr 2023 11:15:45 -0400
X-MC-Unique: homKRfseMQyd_idKdD6pLg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DFE210504A0
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 15:15:45 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F74240C20FA;
 Tue, 18 Apr 2023 15:15:44 +0000 (UTC)
Date: Tue, 18 Apr 2023 16:15:42 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] coverity: unify Fedora dockerfiles
Message-ID: <ZD60HofB6D9LkCjT@redhat.com>
References: <20230331174844.376300-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230331174844.376300-1-pbonzini@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Mar 31, 2023 at 01:48:44PM -0400, Paolo Bonzini wrote:
> The Fedora CI and coverity runs are using a slightly different set of
> packages.  Copy most of the content over from tests/docker while
> keeping the commands at the end that unpack the tools.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  scripts/coverity-scan/coverity-scan.docker | 250 ++++++++++++---------
>  1 file changed, 145 insertions(+), 105 deletions(-)
> 
> diff --git a/scripts/coverity-scan/coverity-scan.docker b/scripts/coverity-scan/coverity-scan.docker
> index 6f60a52d23..a349578526 100644
> --- a/scripts/coverity-scan/coverity-scan.docker
> +++ b/scripts/coverity-scan/coverity-scan.docker
> @@ -15,112 +15,152 @@
>  # The work of actually doing the build is handled by the
>  # run-coverity-scan script.

snip

> +               zstd && \
> +    nosync dnf autoremove -y && \
> +    nosync dnf clean all -y && \
> +    rpm -qa | sort > /packages.txt && \
> +    mkdir -p /usr/libexec/ccache-wrappers && \
> +    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
> +    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
> +    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/clang && \
> +    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
> +    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
> +
> +ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
> +ENV LANG "en_US.UTF-8"
> +ENV MAKE "/usr/bin/make"
> +ENV NINJA "/usr/bin/ninja"
> +ENV PYTHON "/usr/bin/python3"
> +ENV QEMU_CONFIGURE_OPTS --meson=internal
> +
> +RUN dnf install -y curl wget

Note this leaves the dnf cache since it doesn't remove 'clean all',
and thus bloats the container layer.

>  ENV COVERITY_TOOL_BASE=/coverity-tools
>  COPY coverity_tool.tgz coverity_tool.tgz
>  RUN mkdir -p /coverity-tools/coverity_tool && cd /coverity-tools/coverity_tool && tar xf /coverity_tool.tgz

We could actually make this entire thing be generated by the
tests/lcitool/refresh script

Create  tests/lcitool/projects/coverity.yml with

--
packages:
  - curl
  - wget

And then pass *both*  'qemu' and 'coverity' as project names when
generating the container, so it'll create a dockerfile that installs
both sets of packages in one command.

The ENV/COPY/RUN commands can be put in the refersh script


coverity_extras = [
 "ENV COVERITY_TOOL_BASE=/coverity-tools"
 "COPY coverity_tool.tgz coverity_tool.tgz"
 "RUN mkdir -p /coverity-tools/coverity_tool && cd /coverity-tools/coverity_tool && tar xf /coverity_tool.tgz"
]

and adding  trailer="".join(coverity_extras)

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


