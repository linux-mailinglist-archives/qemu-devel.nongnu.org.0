Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D05F440B498
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 18:27:30 +0200 (CEST)
Received: from localhost ([::1]:55802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQBHN-00080q-DL
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 12:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQB5s-0005tQ-5C
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 12:15:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQB5o-00069G-3E
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 12:15:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631636129;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Q1r8WPhCj799uAIUKTP90e4rq96KSnLMW/204B7Z4mc=;
 b=UZiEdx5K4tz41P7BSJIycT0LfZ/3gvFU7rNAB6eG4gyKf6s+80bMD06ICQnZ42rO1HGUZr
 LNf/90pRRh7u8zZf2ekI8exGjhyh5oKIryCWty4YDIn4HAyd4bVhlrruPh1C3WshMrKLNq
 wR5+3rmSlCJhxaefIk95lMbscieOFKg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-42cCU9-_MDWGXZ59lk-0eA-1; Tue, 14 Sep 2021 12:15:26 -0400
X-MC-Unique: 42cCU9-_MDWGXZ59lk-0eA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F366802C87;
 Tue, 14 Sep 2021 16:15:25 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 77F5B6A907;
 Tue, 14 Sep 2021 16:15:06 +0000 (UTC)
Date: Tue, 14 Sep 2021 17:15:03 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [RFC v2 2/2] ui: Add a plain Wayland backend for Qemu UI
Message-ID: <YUDKh+83AdvtsV28@redhat.com>
References: <20210913222036.3193732-1-vivek.kasireddy@intel.com>
 <20210913222036.3193732-3-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210913222036.3193732-3-vivek.kasireddy@intel.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 13, 2021 at 03:20:36PM -0700, Vivek Kasireddy wrote:
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  configure         |   8 +-
>  meson.build       |  33 +++
>  meson_options.txt |   2 +
>  qapi/ui.json      |   3 +
>  ui/meson.build    |  52 ++++
>  ui/wayland.c      | 628 ++++++++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 725 insertions(+), 1 deletion(-)
>  create mode 100644 ui/wayland.c


> diff --git a/ui/meson.build b/ui/meson.build
> index a73beb0e54..86fc324c82 100644
> --- a/ui/meson.build
> +++ b/ui/meson.build
> @@ -64,6 +64,58 @@ if config_host.has_key('CONFIG_OPENGL') and gbm.found()
>    ui_modules += {'egl-headless' : egl_headless_ss}
>  endif
>  
> +wayland_scanner = find_program('wayland-scanner')
> +proto_sources = [
> +  ['xdg-shell', 'stable', ],
> +  ['fullscreen-shell', 'unstable', 'v1', ],
> +  ['linux-dmabuf', 'unstable', 'v1', ],
> +]
> +wayland_headers = []
> +wayland_proto_sources = []
> +
> +if wayland.found()
> +  foreach p: proto_sources
> +    proto_name = p.get(0)
> +    proto_stability = p.get(1)
> +
> +    if proto_stability == 'stable'
> +      output_base = proto_name
> +      input = files(join_paths(wlproto_dir, '@0@/@1@/@2@.xml'.format(proto_stability, proto_name, output_base)))
> +    else
> +      proto_version = p.get(2)
> +      output_base = '@0@-@1@-@2@'.format(proto_name, proto_stability, proto_version)
> +      input = files(join_paths(wlproto_dir, '@0@/@1@/@2@.xml'.format(proto_stability, proto_name, output_base)))
> +    endif
> +
> +    wayland_headers += custom_target('@0@ client header'.format(output_base),
> +      input: input,
> +      output: '@0@-client-protocol.h'.format(output_base),
> +      command: [
> +        wayland_scanner,
> +        'client-header',
> +        '@INPUT@', '@OUTPUT@',
> +      ], build_by_default: true
> +    )
> +
> +    wayland_proto_sources += custom_target('@0@ source'.format(output_base),
> +      input: input,
> +      output: '@0@-protocol.c'.format(output_base),
> +      command: [
> +        wayland_scanner,
> +        'private-code',
> +        '@INPUT@', '@OUTPUT@',
> +      ], build_by_default: true
> +    )
> +  endforeach
> +endif
> +
> +if wayland.found()
> +  wayland_ss = ss.source_set()
> +  wayland_ss.add(when: wayland, if_true: files('wayland.c', 'xdg-shell-protocol.c', 'fullscreen-shell-unstable-v1-protocol.c','linux-dmabuf-unstable-v1-protocol.c'))
> +  #wayland_ss.add(when: wayland, if_true: files('wayland.c'), [wayland_proto_sources])
> +  ui_modules += {'wayland' : wayland_ss}
> +endif

Configure fails on this

  Program wayland-scanner found: YES (/usr/bin/wayland-scanner)

  ../ui/meson.build:114:13: ERROR: File xdg-shell-protocol.c does not exist.


the code a few lines above generates xdg-shell-protocol.c, but that
isn't run until you type "make", so when meson is resolving the
source files they don't exist.

The alternative line you have commented out looks more like what we
would need, but it doesn't work either as its syntax is invalid.

How did you actually compile this series ?


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


