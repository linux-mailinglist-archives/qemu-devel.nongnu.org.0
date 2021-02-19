Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EAF31FBC7
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:14:58 +0100 (CET)
Received: from localhost ([::1]:55960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7Uf-0005Jy-LQ
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:14:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lD75X-0004BB-Qm
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:48:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lD75V-0004PD-QI
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:48:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613746136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IxWDlvFClJ3vcQymCdTFPhdrRp7dXf1XfF+39rEhaDg=;
 b=fzpoAI84f7teBUgntH4bgMM+jg50AC8YrEtjo805fNMDcguAhud3KIguZKG3Y7ZGgu/qCQ
 ccXefVvTrG1PmfQY/aHkkjva0CTjoagFDem0csxUVHC0mpLgg+9SAMJcroxxq19gEs1PRF
 6jA2ePmxxRBienln72jR9+dm2PY1534=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-qg3yJ5hrPQiU3eL0YyMHiA-1; Fri, 19 Feb 2021 09:48:54 -0500
X-MC-Unique: qg3yJ5hrPQiU3eL0YyMHiA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A86B910082F7;
 Fri, 19 Feb 2021 14:48:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43C6560BE5;
 Fri, 19 Feb 2021 14:48:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A107518000A2; Fri, 19 Feb 2021 15:48:48 +0100 (CET)
Date: Fri, 19 Feb 2021 15:48:48 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] ui/console: Assert graphic console surface is not NULL
Message-ID: <20210219144848.wy7wmel4lixaqkyb@sirius.home.kraxel.org>
References: <20210219101702.91002-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210219101702.91002-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 19, 2021 at 07:17:02PM +0900, Akihiko Odaki wrote:
> ui/console used to accept NULL as graphic console surface, but its
> semantics was inconsistent among displays:
> - cocoa and gtk-egl perform NULL dereference.
> - egl-headless, spice and spice-egl do nothing.
> - gtk releases underlying resources.
> - sdl2-2d and sdl2-gl destroys the window.
> - vnc shows a message, "Display output is not active."
> 
> Fortunately, there are only three cases where NULL is assigned as
> graphic console surface, and we can study them to figure out the
> desired behavior:
> - virtio-gpu-base assigns NULL when the device is realized.
>   We have nothing to do in the case because graphic consoles
>   already have a surface with a message saying the content is
>   not initializd yet.
> - virtio-gpu-3d assigns NULL when the device is reset. The initial
>   graphic console surfaces shows a message, so it would be
>   appropriate to do similar.
> - virtio-gpu-3d assigns NULL when scanout is disabled. That
>   affects its operations later but itself do not mean any effects
>   on displays. Removing the operation should be fine.
> 
> This change eliminates NULL as graphic console surface by
> implementing those behaviors.

No.

Background: Some display devices (qxl, virtio) support multiple outputs.
For secondary displays it totally makes sense to allow them being
disabled and the ui hiding the window then.  For the primary display it
usually is problematic though.

So in case the guest disabled the display virtio-gpu will create a
message surface for head 0 and pass NULL otherwise.

We certainly can make the whole thing more consistent.  One option I see
is deal with the surface == NULL case in dpy_gfx_replace_surface().  The
function can check whenever the display is primary (con->index == 0) and
show a message in that case and pass on the NULL otherwise.  We could
maybe also add a flag to the DisplayChangeListener struct to indicate
whenever surface == NULL can be handled (sdl for example) or not (vnc)
so dpy_gfx_replace_surface() could also create a message surface for
secondary displays if needed.

With that in plase virtio-gpu can just pass NULL for disabled displays
no matter what.  DisplayChangeListeners can ask for non-NULL surfaces if
they want.  All logic is in one place (dpy_gfx_replace_surface).

take care,
  Gerd


