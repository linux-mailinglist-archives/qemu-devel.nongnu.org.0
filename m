Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 211DE3FB8C7
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 17:08:15 +0200 (CEST)
Received: from localhost ([::1]:39992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKitR-0007rU-OZ
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 11:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mKirz-0006kw-0j
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 11:06:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mKirt-0006jQ-CY
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 11:06:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630335995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OF2W83zlFuOkxrSx3q7lNrGUxxuvGSSW/4SPzOR7QCg=;
 b=G1AqjEQ/VtPMxlFa+4M5Ou4JmyTT5WJzWy6V9T2zcJRiHyJxdiH47tTsZ/Nh7me1fYes1y
 1U+4M7sgZ9l8Mx3zAsU/ixDTi/hjC7BTDuQRiNnR/A1pFDNWQT6No1ho396rXSYba1Csi+
 mpDN4cmbKuzTcghwvh0ElXdmrAOgl4Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-mN2-r1MWMDSBzi21wn-Apg-1; Mon, 30 Aug 2021 11:06:32 -0400
X-MC-Unique: mN2-r1MWMDSBzi21wn-Apg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A61480292A
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 15:06:31 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.phx2.redhat.com [10.3.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C57015DEB8;
 Mon, 30 Aug 2021 15:06:26 +0000 (UTC)
Date: Mon, 30 Aug 2021 10:06:25 -0500
From: Eric Blake <eblake@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/3] configure: Remove options that can be handled via
 meson_options.txt instead
Message-ID: <20210830150625.l76qozj4lzmuqsf7@redhat.com>
References: <20210829173210.39562-1-thuth@redhat.com>
 <20210829173210.39562-3-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210829173210.39562-3-thuth@redhat.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

On Sun, Aug 29, 2021 at 07:32:09PM +0200, Thomas Huth wrote:
> These trivial options can now be handled via the new generic code
> that parses meson_options.txt
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure         | 316 +---------------------------------------------
>  meson_options.txt |   2 +-
>  2 files changed, 5 insertions(+), 313 deletions(-)

Picking on one example...

> 
> diff --git a/configure b/configure
> index b3e6d51916..cb125c3f84 100755
> --- a/configure
> +++ b/configure
> @@ -291,34 +291,14 @@ for opt do
>    esac
>  done
>  
> -brlapi="auto"

> -  --disable-brlapi) brlapi="disabled"
> -  ;;
> -  --enable-brlapi) brlapi="enabled"
> -  ;;

> @@ -5213,25 +4920,10 @@ if test "$skip_meson" = no; then
>          -Db_pie=$(if test "$pie" = yes; then echo true; else echo false; fi) \
>          ${staticpic:+-Db_staticpic=$staticpic} \
>          -Db_coverage=$(if test "$gcov" = yes; then echo true; else echo false; fi) \
> -        -Db_lto=$lto -Dcfi=$cfi -Dcfi_debug=$cfi_debug \
> -        -Dmalloc=$malloc -Dmalloc_trim=$malloc_trim -Dsparse=$sparse \
> -        -Dkvm=$kvm -Dhax=$hax -Dwhpx=$whpx -Dhvf=$hvf -Dnvmm=$nvmm \
> -        -Dxen=$xen -Dxen_pci_passthrough=$xen_pci_passthrough -Dtcg=$tcg \
> -        -Dcocoa=$cocoa -Dgtk=$gtk -Dmpath=$mpath -Dsdl=$sdl -Dsdl_image=$sdl_image \
> -        -Dlibusb=$libusb -Dsmartcard=$smartcard -Dusb_redir=$usb_redir -Dvte=$vte \
> -        -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
> -        -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f -Dvirtiofsd=$virtiofsd \
> -        -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \

Pre-patch, if you used neither --enable-brlapi nor --disable-brlapi,
we called $meson with -Dbrlapi=auto.

> +        -Db_lto=$lto -Dcfi=$cfi -Dcfi_debug=$cfi_debug -Dmalloc=$malloc \
> +        -Ddefault_devices=$default_devices -Dxen=$xen -Dtcg=$tcg -Dsdl=$sdl \
> +        -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt \
> +        -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
>          $(if test "$default_feature" = no; then echo "-Dauto_features=disabled"; fi) \
>          -Dtcg_interpreter=$tcg_interpreter $meson_options \

Post-patch, if you use an option, $meson_options includes
-Dbrlapi=disabled or -Dbrlapi=enabled (per patch 1), but if you omit
an option, now we aren't passing anything.  Does meson treat
-Dbrlapi=auto and the absence of any mention of brlapi identically?
If so, then this patch is good; if not, you are stripping too much.

>          $cross_arg \
> diff --git a/meson_options.txt b/meson_options.txt
> index a9a9b8f4c6..2c89e79e8b 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -120,7 +120,7 @@ option('usb_redir', type : 'feature', value : 'auto',
>         description: 'libusbredir support')
>  option('virglrenderer', type : 'feature', value : 'auto',
>         description: 'virgl rendering support')
> -option('vnc', type : 'feature', value : 'enabled',
> +option('vnc', type : 'feature', value : 'auto',
>         description: 'VNC server')

Why is the default for this option changed?  It looks unrelated to the
mechanical changes in the rest of the patch, enough so to warrant its
own patch, or at least special mention in the commit message.

But I think I just answered my question above: in meson_options.txt,
we typically default an unspecified option to 'auto'.  So now it's
just making sure that all such options removed from configure in this
patch have a sane default.

/me goes reading...

Yep, every option deleted above appears with 'auto' in
meson_options.txt.  It's annoying that we did not have consistent
ordering in any of the three places; alphabetic might have been nice;
we even had --disable-glusterfs and --enable-glusterfs split by
unrelated options in the case statement.

Whether you split the patch or amend the commit message, I've now done
enough review that I'm happy if you add:

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


