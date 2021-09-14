Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D931D40A728
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 09:12:39 +0200 (CEST)
Received: from localhost ([::1]:34284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ2cQ-0004IM-P5
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 03:12:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mQ2ba-0003cQ-0Z
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 03:11:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mQ2bX-0006JN-Id
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 03:11:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631603502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/5100kR8fRljh2puJQVo9bx8+68j1UCj/zLtS20vG/Q=;
 b=E74q3m/1qAsfbSZDysaHKQK5PewzfaLfQFfGFS7udD5nEdBnEMYQfJLhHqUFf9jykl5uY9
 IJ/OBdsQtOyrb0MzmqLM9a2EKj/gt/vwJWYo/ohfFx3k/QEPPHRNoijODDvTxKhcLFaYL3
 uRXqx2zDBtZTQlmAbGdwKtTJ+TDXdJM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-_X-EnWwPNuCA2wRvlxwqzA-1; Tue, 14 Sep 2021 03:11:40 -0400
X-MC-Unique: _X-EnWwPNuCA2wRvlxwqzA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C12F5835DF3;
 Tue, 14 Sep 2021 07:11:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C88810016F5;
 Tue, 14 Sep 2021 07:11:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 97FCF1800990; Tue, 14 Sep 2021 09:11:33 +0200 (CEST)
Date: Tue, 14 Sep 2021 09:11:33 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/6] Vga 20210910 patches
Message-ID: <20210914071133.wvgbf5ezcpbd4kr3@sirius.home.kraxel.org>
References: <20210910131709.3681492-1-kraxel@redhat.com>
 <CAFEAcA_1SdGuiEgquVE2T5p-x6YkJXwAou==wdVoZvRqcZzJDg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_1SdGuiEgquVE2T5p-x6YkJXwAou==wdVoZvRqcZzJDg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 10, 2021 at 05:52:55PM +0100, Peter Maydell wrote:
> On Fri, 10 Sept 2021 at 14:19, Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > The following changes since commit bd662023e683850c085e98c8ff8297142c2dd9f2:
> >
> >   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-openbios-20210908' into staging (2021-09-08 11:06:17 +0100)
> >
> > are available in the Git repository at:
> >
> >   git://git.kraxel.org/qemu tags/vga-20210910-pull-request
> >
> > for you to fetch changes up to 6335c0b56819a5d1219ea84a11a732d0861542db:
> >
> >   qxl: fix pre-save logic (2021-09-10 12:23:12 +0200)
> >
> > ----------------------------------------------------------------
> > virtio-gpu + ui: fence syncronization.
> > qxl: unbreak live migration.
> >
> > ----------------------------------------------------------------
> 
> Hi; this fails to build on the ppc64 system:
> 
> ../../ui/egl-helpers.c:79:6: error: no previous prototype for
> 'egl_dmabuf_create_sync' [-Werror=missing-prototypes]
>    79 | void egl_dmabuf_create_sync(QemuDmaBuf *dmabuf)
>       |      ^~~~~~~~~~~~~~~~~~~~~~
> ../../ui/egl-helpers.c:95:6: error: no previous prototype for
> 'egl_dmabuf_create_fence' [-Werror=missing-prototypes]
>    95 | void egl_dmabuf_create_fence(QemuDmaBuf *dmabuf)
>       |      ^~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> The prototype is hidden behind CONFIG_GBM, but the definition is not.
> 
> Then the callsites fail:
> 
> ../../ui/gtk-gl-area.c: In function 'gd_gl_area_draw':
> ../../ui/gtk-gl-area.c:77:9: error: implicit declaration of function
> 'egl_dmabuf_create_sync' [-Werror=implicit-function-declaration]
>    77 |         egl_dmabuf_create_sync(dmabuf);
>       |         ^~~~~~~~~~~~~~~~~~~~~~
> ../../ui/gtk-gl-area.c:77:9: error: nested extern declaration of
> 'egl_dmabuf_create_sync' [-Werror=nested-externs]
> ../../ui/gtk-gl-area.c:81:9: error: implicit declaration of function
> 'egl_dmabuf_create_fence' [-Werror=implicit-function-declaration]
>    81 |         egl_dmabuf_create_fence(dmabuf);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~
> ../../ui/gtk-gl-area.c:81:9: error: nested extern declaration of
> 'egl_dmabuf_create_fence' [-Werror=nested-externs]
> 
> 
> ../../ui/gtk-egl.c: In function 'gd_egl_draw':
> ../../ui/gtk-egl.c:100:9: error: implicit declaration of function
> 'egl_dmabuf_create_fence' [-Werror=implicit-function-declaration]
>   100 |         egl_dmabuf_create_fence(dmabuf);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~
> ../../ui/gtk-egl.c:100:9: error: nested extern declaration of
> 'egl_dmabuf_create_fence' [-Werror=nested-externs]
> ../../ui/gtk-egl.c: In function 'gd_egl_scanout_flush':
> ../../ui/gtk-egl.c:301:9: error: implicit declaration of function
> 'egl_dmabuf_create_sync' [-Werror=implicit-function-declaration]
>   301 |         egl_dmabuf_create_sync(vc->gfx.guest_fb.dmabuf);
>       |         ^~~~~~~~~~~~~~~~~~~~~~
> ../../ui/gtk-egl.c:301:9: error: nested extern declaration of
> 'egl_dmabuf_create_sync' [-Werror=nested-externs]
> 
> 
> You can probably repro this on any system which has the opengl
> libraries installed but not libgbm.

Vivek?  Can you have a look please?

thanks,
  Gerd


