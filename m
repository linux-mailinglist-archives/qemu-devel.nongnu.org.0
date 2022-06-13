Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C68548202
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 10:53:21 +0200 (CEST)
Received: from localhost ([::1]:52908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0fp2-0004Ep-SF
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 04:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o0fi2-0005mC-Oc
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 04:46:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o0fhz-0001Ja-9M
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 04:46:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655109962;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OsmIb8JBjamYO7HSXD7lvz9oKqmWR9je1VCbD+9sYo8=;
 b=PMM5h3q+pC1asss/CPUyee+Plin+2Y/qDLkpdfYjeEZLFi6xT5bfPt+qZtJv9BX/JTsPre
 LBivK/Ptcfj0GabOzBHGFuY7f3n0HHWR9ruNEf4jwnTE103PXv7NNlwL14mlY7A3QOoOLz
 J/CPNPdbKhj7++HrxTmPdZnkazew/ws=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-9IpHJqSjOBatvPQxcG8MFA-1; Mon, 13 Jun 2022 04:46:00 -0400
X-MC-Unique: 9IpHJqSjOBatvPQxcG8MFA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0207D3801FE1;
 Mon, 13 Jun 2022 08:45:41 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B8F5475005;
 Mon, 13 Jun 2022 08:45:37 +0000 (UTC)
Date: Mon, 13 Jun 2022 09:45:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 "Canokeys.org" <contact@canokeys.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>, xen-devel@lists.xenproject.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PULL 00/17] Kraxel 20220610 patches
Message-ID: <Yqb5L31cG/0cVM5B@redhat.com>
References: <20220610092043.1874654-1-kraxel@redhat.com>
 <adec1cff-54f1-e2bf-8092-945601aeb912@linaro.org>
 <60c72935-85ce-4e24-43a5-119f6428b916@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <60c72935-85ce-4e24-43a5-119f6428b916@t-online.de>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jun 11, 2022 at 06:34:28PM +0200, Volker Rümelin wrote:
> Am 10.06.22 um 22:16 schrieb Richard Henderson:
> > On 6/10/22 02:20, Gerd Hoffmann wrote:
> > > The following changes since commit
> > > 9cc1bf1ebca550f8d90f967ccd2b6d2e00e81387:
> > > 
> > >    Merge tag 'pull-xen-20220609' of
> > > https://xenbits.xen.org/git-http/people/aperard/qemu-dm into staging
> > > (2022-06-09 08:25:17 -0700)
> > > 
> > > are available in the Git repository at:
> > > 
> > >    git://git.kraxel.org/qemu tags/kraxel-20220610-pull-request
> > > 
> > > for you to fetch changes up to 02319a4d67d3f19039127b8dc9ca9478b6d6ccd8:
> > > 
> > >    virtio-gpu: Respect UI refresh rate for EDID (2022-06-10 11:11:44
> > > +0200)
> > > 
> > > ----------------------------------------------------------------
> > > usb: add CanoKey device, fixes for ehci + redir
> > > ui: fixes for gtk and cocoa, move keymaps, rework refresh rate
> > > virtio-gpu: scanout flush fix
> > 
> > This introduces regressions:
> > 
> > https://gitlab.com/qemu-project/qemu/-/jobs/2576157660
> > https://gitlab.com/qemu-project/qemu/-/jobs/2576151565
> > https://gitlab.com/qemu-project/qemu/-/jobs/2576154539
> > https://gitlab.com/qemu-project/qemu/-/jobs/2575867208
> > 
> > 
> >  (27/43)
> > tests/avocado/vnc.py:Vnc.test_change_password_requires_a_password:
> > ERROR: ConnectError: Failed to establish session: EOFError\n Exit code:
> > 1\n    Command: ./qemu-system-x86_64 -display none -vga none -chardev socket,id=mon,path=/var/tmp/avo_qemu_sock_4nrz0r37/qemu-2912538-7f732e94e0f0-monitor.sock
> > -mon chardev=mon,mode=control -node... (0.09 s)
> >  (28/43) tests/avocado/vnc.py:Vnc.test_change_password:  ERROR:
> > ConnectError: Failed to establish session: EOFError\n    Exit code:
> > 1\n    Command: ./qemu-system-x86_64 -display none -vga none -chardev socket,id=mon,path=/var/tmp/avo_qemu_sock_yhpzy5c3/qemu-2912543-7f732e94b438-monitor.sock
> > -mon chardev=mon,mode=control -node... (0.09 s)
> >  (29/43)
> > tests/avocado/vnc.py:Vnc.test_change_password_requires_a_password:
> > ERROR: ConnectError: Failed to establish session: EOFError\n Exit code:
> > 1\n    Command: ./qemu-system-x86_64 -display none -vga none -chardev socket,id=mon,path=/var/tmp/avo_qemu_sock_tk3pfmt2/qemu-2912548-7f732e93d7b8-monitor.sock
> > -mon chardev=mon,mode=control -node... (0.09 s)
> > 
> > 
> > r~
> > 
> 
> This is caused by [PATCH 14/17] ui: move 'pc-bios/keymaps' to 'ui/keymaps'.
> After this patch QEMU no longer finds it's keymaps if started directly from
> the build directory.

I just sent Gerd an update version which adds a symlink from the source
tree to the build dir to solve this problem, along with updated commit
message to reflect this need

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


