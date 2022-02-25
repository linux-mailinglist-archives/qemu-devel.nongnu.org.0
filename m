Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BB34C422D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 11:20:38 +0100 (CET)
Received: from localhost ([::1]:36660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNXiH-00070f-Mo
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 05:20:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nNWcZ-0005sp-Gj
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 04:10:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nNWcV-0005vP-9Y
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 04:10:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645780233;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MAV2GiKKZo+vOGOunNIe3p0wrqEwwak5oWbEaidkMfI=;
 b=UrRFRtZeupI81ANTydJVaqT5PQzbEjJUGKknOFvnzyvGdfF5o7RH4Tlk26aR/v4DeNmC77
 yT1YBPxE/T8L8xKd/aP2qJEVIu0j6+WbOdsbaeHXeKGtYyNIQ4lzs+rE1PTmfEDrZapHXk
 EFPiTZ7UYZ2zmrLVOhx6ZKuKvVn3QJw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-j7BjiIPJPpmuats1mRt_ag-1; Fri, 25 Feb 2022 04:10:24 -0500
X-MC-Unique: j7BjiIPJPpmuats1mRt_ag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 407E11006AA5;
 Fri, 25 Feb 2022 09:10:23 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7967623760;
 Fri, 25 Feb 2022 09:10:17 +0000 (UTC)
Date: Fri, 25 Feb 2022 09:10:14 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kshitij Suri <kshitij.suri@nutanix.com>
Subject: Re: [PATCH v2] Added parameter to take screenshot with screendump as
 PNG
Message-ID: <Yhic9rkSKDfg6f3P@redhat.com>
References: <20220224115908.102285-1-kshitij.suri@nutanix.com>
 <YhevxnLUi5BHWJ9G@redhat.com>
 <8dad1e54-1118-54c2-baea-7a8c6daee286@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <8dad1e54-1118-54c2-baea-7a8c6daee286@nutanix.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, prerna.saxena@nutanix.com,
 armbru@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 25, 2022 at 11:26:20AM +0530, Kshitij Suri wrote:
> 
> On 24/02/22 9:48 pm, Daniel P. Berrangé wrote:
> > On Thu, Feb 24, 2022 at 11:59:08AM +0000, Kshitij Suri wrote:
> > > Currently screendump only supports PPM format, which is un-compressed and not
> > > standard. Added a "format" parameter to qemu monitor screendump capabilites
> > > to support PNG image capture using libpng. The param was added in QAPI schema
> > > of screendump present in ui.json along with png_save() function which converts
> > > pixman_image to PNG. HMP command equivalent was also modified to support the
> > > feature.
> > > 
> > > Example usage:
> > > { "execute": "screendump", "arguments": { "filename": "/tmp/image", "format":"png" } }
> > > 
> > > Resolves:https://urldefense.proofpoint.com/v2/url?u=https-3A__gitlab.com_qemu-2Dproject_qemu_-2D_issues_718&d=DwIBaQ&c=s883GpUCOChKOHiocYtGcg&r=utjv19Ej9Fb0TB7_DX0o3faQ-OAm2ypPniPyqVSoj_w&m=Hu1QTP-aSF7FeXYQcdODcxg2wW1sBEpxaD4jWHYF5kxD2Z6ihhXkxRFOkovubo-f&s=YwpDKYWnYlYBM7aE1jNrISGXxP9nKm5f9Kfotxm5rZ4&e=
> > > 
> > > Signed-off-by: Kshitij Suri<kshitij.suri@nutanix.com>
> > > ---
> > > diff to v1:
> > >    - Removed repeated alpha conversion operation.
> > >    - Modified logic to mirror png conversion in vnc-enc-tight.c file.
> > >    - Added a new CONFIG_PNG parameter for libpng support.
> > >    - Changed input format to enum instead of string.
> > > 
> > >   hmp-commands.hx    | 11 +++---
> > >   meson.build        | 13 +++++--
> > >   meson_options.txt  |  2 +
> > >   monitor/hmp-cmds.c |  8 +++-
> > >   qapi/ui.json       | 24 ++++++++++--
> > >   ui/console.c       | 97 ++++++++++++++++++++++++++++++++++++++++++++--
> > >   6 files changed, 139 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/hmp-commands.hx b/hmp-commands.hx
> > > index 70a9136ac2..e43c9954b5 100644
> > > --- a/hmp-commands.hx
> > > +++ b/hmp-commands.hx
> > > @@ -244,17 +244,18 @@ ERST
> > >       {
> > >           .name       = "screendump",
> > > -        .args_type  = "filename:F,device:s?,head:i?",
> > > -        .params     = "filename [device [head]]",
> > > -        .help       = "save screen from head 'head' of display device 'device' "
> > > -                      "into PPM image 'filename'",
> > > +        .args_type  = "filename:F,device:s?,head:i?,format:f?",
> > > +        .params     = "filename [device [head]] [format]",
> > > +        .help       = "save screen from head 'head' of display device 'device'"
> > > +                      "in specified format 'format' as image 'filename'."
> > > +                      "Currently only 'png' and 'ppm' formats are supported.",
> > >           .cmd        = hmp_screendump,
> > >           .coroutine  = true,
> > >       },
> > >   SRST
> > >   ``screendump`` *filename*
> > > -  Save screen into PPM image *filename*.
> > > +  Save screen as an image *filename*.
> > >   ERST
> > >       {
> > > diff --git a/meson.build b/meson.build
> > > index 8df40bfac4..fd550c01ec 100644
> > > --- a/meson.build
> > > +++ b/meson.build
> > > @@ -1112,13 +1112,16 @@ if gtkx11.found()
> > >     x11 = dependency('x11', method: 'pkg-config', required: gtkx11.found(),
> > >                      kwargs: static_kwargs)
> > >   endif
> > > -vnc = not_found
> > >   png = not_found
> > > +png = dependency('libpng', required: get_option('png'),
> > > +                   method: 'pkg-config', kwargs: static_kwargs)
> > > +vnc = not_found
> > > +vnc_png = not_found
> > >   jpeg = not_found
> > >   sasl = not_found
> > >   if get_option('vnc').allowed() and have_system
> > >     vnc = declare_dependency() # dummy dependency
> > > -  png = dependency('libpng', required: get_option('vnc_png'),
> > > +  vnc_png = dependency('libpng', required: get_option('vnc_png'),
> > >                      method: 'pkg-config', kwargs: static_kwargs)
> > >     jpeg = dependency('libjpeg', required: get_option('vnc_jpeg'),
> > >                       method: 'pkg-config', kwargs: static_kwargs)
> > > @@ -1537,9 +1540,10 @@ config_host_data.set('CONFIG_TPM', have_tpm)
> > >   config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
> > >   config_host_data.set('CONFIG_VDE', vde.found())
> > >   config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
> > > +config_host_data.set('CONFIG_PNG', png.found())
> > >   config_host_data.set('CONFIG_VNC', vnc.found())
> > >   config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
> > > -config_host_data.set('CONFIG_VNC_PNG', png.found())
> > > +config_host_data.set('CONFIG_VNC_PNG', vnc_png.found())
> > 
> > I think we should be removing  CONFIG_VNC_PNG entirely - the VNC
> > code should just use  CONFIG_PNG.
> > 
> > I'd suggest splitting ths into two patches.  The first patch
> > updates meson.build to look for libpng unconditionally and
> > rename to CONFIG_PNG.  The second patch introduces the PNG
> > support for screendump.
> Yes can remove entirely with a combination of CONFIG_VNC and CONFIG_PNG as
> follows
> 
> #ifdef CONFIG_VNC_PNG -> #if defined(CONFIG_VNC) && defined(CONFIG_PNG)
> 
> But won't removing the vnc_png option cause problems in the build scripts of
> users with the current
> version? Instead, can we use the new png meson-option to denote PNG format
> for VNC as well while maintaining backward compatibility? The change would
> look like

Configure arguments / meson options are not a stable interface
from QEMU. We can change them at any time.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


