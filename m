Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D299400412
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 19:23:40 +0200 (CEST)
Received: from localhost ([::1]:59748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMCuh-0002YF-7c
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 13:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mMChn-0007JG-IW
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:10:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mMChZ-0004VG-HY
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:10:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630689005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yh7gYRZ+91KwwtoelgNpjz/Nj+BasikYSqp98wQ++1o=;
 b=A/+h/TyFRSTMU2lax9x3EVMPc+dobLz2M260iPmWf+oUKC41mDLEWQPmTvtPEhI8hi7rX0
 b2Fm5x2HTqlX3yEBa+JhsuIlz8OtyXVAXiCPQux80TkhHYAOC905b18XkTrt79teyTXZYr
 fyeOvAO9vC4dObXUCEfnb8xN1YA8i3c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-TJnwtfolOkiOGl9Cqw6aww-1; Fri, 03 Sep 2021 13:10:01 -0400
X-MC-Unique: TJnwtfolOkiOGl9Cqw6aww-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FC80501E0
 for <qemu-devel@nongnu.org>; Fri,  3 Sep 2021 17:10:01 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.phx2.redhat.com [10.3.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC9865C1C5;
 Fri,  3 Sep 2021 17:09:57 +0000 (UTC)
Date: Fri, 3 Sep 2021 12:09:56 -0500
From: Eric Blake <eblake@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 1/5] configure: Add the possibility to read options
 from meson_options.txt
Message-ID: <20210903170956.jowgucp7yaeku3xv@redhat.com>
References: <20210903081358.956267-1-thuth@redhat.com>
 <20210903081358.956267-2-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210903081358.956267-2-thuth@redhat.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Fri, Sep 03, 2021 at 10:13:54AM +0200, Thomas Huth wrote:
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
> index 9a79a004d7..528e9c80c5 100755
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
> +      arg=$(printf %s\\n "$opt" | sed -e "s/--enable-//" -e "s/-/_/g")

Sorry for not pointing this out earlier, but if an annoying user
passes:

./configure --'enable-my bad opt'

this results in $arg being set to 'my bad opt'...

> +      if ! grep -q "option('$arg', type[ ]*: 'feature'" \
> +                $source_path/meson_options.txt; then
> +          printf "ERROR: unknown option %s\n" "$opt"
> +          printf "Try '%s --help' for more information\n" "$0"
> +          exit 1
> +      fi
> +      meson_options="$meson_options -D$arg=enabled"

...and that breaks $meson_options.  Other odd arguments, such as
"--enable-my.*arg" could mess with the grep above.  I don't know if we
care about users that go to such lengths to shoot themselves in the
foot, so it's probably not worth trying to guarantee that $opt
consists only of [a-zA-Z0-9_-].

> +  ;;
> +  --disable-*)
> +      arg=$(printf %s\\n "$opt" | sed -e "s/--disable-//" -e "s/-/_/g")

Whatever we decide above, we should repeat here (including the
decision to leave as-is).

> +      if ! grep -q "option('$arg', type[ ]*: 'feature'" \
> +                $source_path/meson_options.txt; then
> +          printf "ERROR: unknown option %s\n" "$opt"
> +          printf "Try '%s --help' for more information\n" "$0"
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

Unless we thing super-robustness is mandatory, I'm okay with:

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


