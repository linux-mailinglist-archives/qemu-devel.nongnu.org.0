Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 392EB54E097
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 14:12:46 +0200 (CEST)
Received: from localhost ([::1]:50368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1oMe-0006hy-0M
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 08:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o1oHR-0005om-Hu
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:07:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o1oHO-0003bi-Un
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:07:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655381238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sez9RUmgYaj+7vlVI3i4YnUcyTgK0nLSSMeHL8X/pw8=;
 b=P6y2k6AuemXvanW5xvhAz9NhPgdCZIYA78cpoDLr0dHLdbJAnLwsrso2gomLnpo4NYi89Q
 kazp6myQ3UDnY41H4PD0b4RpJhY9Bnl5BhMxaf3GnmvQ0n3gf48v6KApVBMR2gOTdON0gc
 6Ib8wqY7AtuCb/VnmIQl9Fm2s8gs7ZA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-PIsT_r05MJ23euf4QQRWHw-1; Thu, 16 Jun 2022 08:07:17 -0400
X-MC-Unique: PIsT_r05MJ23euf4QQRWHw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF77F3C10228;
 Thu, 16 Jun 2022 12:07:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DDCF415F5E;
 Thu, 16 Jun 2022 12:07:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0ACB91800381; Thu, 16 Jun 2022 14:07:15 +0200 (CEST)
Date: Thu, 16 Jun 2022 14:07:15 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>
Subject: Re: Corrupted display changing screen colour depth in
 qemu-system-ppc/MacOS
Message-ID: <20220616120715.uksbwjynvb6usjhu@sirius.home.kraxel.org>
References: <e4c8ced1-3ef4-8956-ead5-91110d3cb38c@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e4c8ced1-3ef4-8956-ead5-91110d3cb38c@ilande.co.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 16, 2022 at 09:54:46AM +0100, Mark Cave-Ayland wrote:
> Hi all,
> 
> Howard pointed me off-list to a corrupted screen display issue experienced
> when changing the screen colour depth in MacOS under qemu-system-ppc. I was
> able to reproduce it here, and noticed from the output that the issue was
> likely due to the host display not updating its depth accordingly.
> 
> After it was confirmed to me that this was working in QEMU 6.2, I was able
> to eventually bisect the problem down to this commit:
> 
> 
> cb8962c146b2633a4b04562281de9b2703bba849 is the first bad commit
> commit cb8962c146b2633a4b04562281de9b2703bba849
> Author: Marc-André Lureau <marcandre.lureau@redhat.com>
> Date:   Tue Feb 15 00:13:37 2022 +0400
> 
>     ui: do not create a surface when resizing a GL scanout
> 
>     qemu_console_resize() will create a blank surface and replace the
>     current scanout with it if called while the current scanout is
>     GL (texture or dmabuf).
> 
>     This is not only very costly, but also can produce glitches on the
>     display/listener side.
> 
>     Instead, compare the current console size with the fitting console
>     functions, which also works when the scanout is GL.
> 
>     Note: there might be still an unnecessary surface creation on calling
>     qemu_console_resize() when the size is actually changing, but display
>     backends currently rely on DisplaySurface details during
>     dpy_gfx_switch() to handle various resize aspects. We would need more
>     refactoring to handle resize without DisplaySurface, this is left for a
>     future improvement.
> 
>     Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>     Message-Id: <20220214201337.1814787-4-marcandre.lureau@redhat.com>
>     Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> 
>  ui/console.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> 
> Some more background: the screen in qemu-system-ppc's MacOS is controlled
> via a custom driver written by Ben which uses the Bochs VBE registers to
> change the screen width/height/depth. The code used to do this can be found
> at https://gitlab.com/qemu-project/QemuMacDrivers/-/blob/master/QemuVGADriver/src/QemuVga.c#L354.
> 
> Looking at the changes in cb8962c146 my guess would be that either the
> updated check in qemu_console_resize() should also check to see if the
> surface depth is unchanged before exiting early, or that there is an extra
> update required in the VGA device when changing just the screen colour depth
> by itself.

Can you try ditch the QEMU_ALLOCATED_FLAG check added by the commit?

Which depth changes triggers this?  Going from direct color to a
paletted mode?

take care,
  Gerd


