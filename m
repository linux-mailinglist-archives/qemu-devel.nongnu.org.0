Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E03A3FB87D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 16:48:09 +0200 (CEST)
Received: from localhost ([::1]:55914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKiZz-0006aN-Kv
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 10:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mKiZC-0005vU-2S
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 10:47:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mKiZA-00081B-Ai
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 10:47:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630334835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GPGpmnBibh1Bk3xGRJmViTjTUYyR2s06H+K9w0z7XWA=;
 b=eIYSYblt0HcmzaOoLjc/pMCTzOwqHYzcOCT4UFi5HvgzYwyPTkt8tu/d1O3BnveWLsAN39
 4Jvq/wfyotDvMqBA7KNVkWrh5j1Akz4tznQ4TuFgBsvX/4J15j8Iwc2J+6TmWPBMsxW4Zr
 xXbhV6gCaJQnCE+tZ8cbe6sOf6ZEhlo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-MBdiYrxIMEqvFX7J1NehHg-1; Mon, 30 Aug 2021 10:47:11 -0400
X-MC-Unique: MBdiYrxIMEqvFX7J1NehHg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CB52195D560
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 14:47:11 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.phx2.redhat.com [10.3.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE0F060BF4;
 Mon, 30 Aug 2021 14:47:06 +0000 (UTC)
Date: Mon, 30 Aug 2021 09:47:05 -0500
From: Eric Blake <eblake@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/3] configure: Add the possibility to read options from
 meson_options.txt
Message-ID: <20210830144705.qe3yv2fqcbwe6jnh@redhat.com>
References: <20210829173210.39562-1-thuth@redhat.com>
 <20210829173210.39562-2-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210829173210.39562-2-thuth@redhat.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Aug 29, 2021 at 07:32:08PM +0200, Thomas Huth wrote:
> To avoid double maintenance between the configure script and
> meson_options.txt, add some simple logic in the configure script
> to read the options from meson_options.txt.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 9a79a004d7..b3e6d51916 100755
> --- a/configure
> +++ b/configure
> @@ -836,6 +836,8 @@ fi
>  
>  werror=""
>  
> +meson_options=""
> +
>  for opt do
>    optarg=$(expr "x$opt" : 'x[^=]*=\(.*\)')
>    case "$opt" in
> @@ -1581,6 +1583,26 @@ for opt do
>    ;;
>    --disable-slirp-smbd) slirp_smbd=no
>    ;;
> +  --enable-*)
> +      arg=$(echo "$opt" | sed -e "s/--enable-//" -e "s/-/_/g")

configure is a /bin/sh script, which means that using echo on
user-supplied arguments is unsafe (a malicious user may provide a
backslash, which not all 'echo' implementations treat the same across
different sh implementations).  What's more, $opt starts with
"--enable", and 'echo --enable' may trigger echo to try and warn about
an unknown option.  To be portable, you want:

arg=$(printf %s\\n "$opt" | sed...)

> +      if ! grep -q "option('$arg', type[ ]*: 'feature'" \
> +                $source_path/meson_options.txt; then
> +          echo "ERROR: unknown option $opt"
> +          echo "Try '$0 --help' for more information"
> +          exit 1
> +      fi
> +      meson_options="$meson_options -D$arg=enabled"
> +  ;;
> +  --disable-*)
> +      arg=$(echo "$opt" | sed -e "s/--disable-//" -e "s/-/_/g")

And again.

> +      if ! grep -q "option('$arg', type[ ]*: 'feature'" \
> +                $source_path/meson_options.txt; then
> +          echo "ERROR: unknown option $opt"
> +          echo "Try '$0 --help' for more information"
> +          exit 1
> +      fi
> +      meson_options="$meson_options -D$arg=disabled"
> +  ;;
>    *)
>        echo "ERROR: unknown option $opt"
>        echo "Try '$0 --help' for more information"
> @@ -5211,7 +5233,7 @@ if test "$skip_meson" = no; then
>          -Dvhost_user_blk_server=$vhost_user_blk_server -Dmultiprocess=$multiprocess \
>          -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek -Dguest_agent_msi=$guest_agent_msi -Dbpf=$bpf\
>          $(if test "$default_feature" = no; then echo "-Dauto_features=disabled"; fi) \
> -	-Dtcg_interpreter=$tcg_interpreter \
> +        -Dtcg_interpreter=$tcg_interpreter $meson_options \
>          $cross_arg \
>          "$PWD" "$source_path"

Otherwise looks like a nice idea.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


