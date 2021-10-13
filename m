Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 164F342B4F0
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 07:23:21 +0200 (CEST)
Received: from localhost ([::1]:45988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maWjX-0005uk-M7
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 01:23:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1maWii-0005Ef-GX
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 01:22:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1maWie-0007EH-S1
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 01:22:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634102543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s/KvGlrRd4Gqs0+rseGxaHWJ5TJKVxV5gLvxw41ukuI=;
 b=A5HROzE2LoEewN5XK+D1e4iK3FyCQQHnTCkZtlv7TVsdu02FIo0+ntmSNRew7ubm0bbE4F
 oOP75nW5cfIOGp7gfo5hSodfJG2oerbLSREKZrEjvtrojavbXsMiVeeHo5CtqvpFuJ1Nfp
 exqglB/eDQsT/n2xOVZszSknH75UMnk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-6q_GB1FEMPG7FxMku9z_RA-1; Wed, 13 Oct 2021 01:22:20 -0400
X-MC-Unique: 6q_GB1FEMPG7FxMku9z_RA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9093A1006AB8
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 05:22:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8E3519E7E;
 Wed, 13 Oct 2021 05:22:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 23B031800906; Wed, 13 Oct 2021 07:22:14 +0200 (CEST)
Date: Wed, 13 Oct 2021 07:22:14 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v2 00/37] Add D-Bus display backend
Message-ID: <20211013052214.stif2dodyueetm3p@sirius.home.kraxel.org>
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Oct 10, 2021 at 01:08:01AM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Hi,
> 
> Both Spice and VNC are relatively complex and inefficient for local-only
> display/console export.
> 
> The goal of this display backend is to export over D-Bus an interface close to
> the QEMU internal APIs. Any -display or -audio backend should be possible to
> implement externally that way. It will allow third-parties to maintain their own
> backends (UI toolkits, servers etc), and eventually reduce the responsability on
> QEMU.
> 
> D-Bus is the protocol of choice for the desktop, it has many convenient bindings
> for various languages and tools. Data blob transfer is more efficient than QMP
> too. Backends can come and go as needed: you can have several display opened
> (say Boxes & virt-manager), while exporting the display over VNC for example
> from a different process. It works best on Unix, but there is some Windows
> support too (even Windows has some AF_UNIX nowadays, and the WSL2 situation may
> change the future of QEMU on Windows anyway).
> 
> Using it only requires "-display dbus" on any reasonable Linux desktop with a
> D-Bus session bus. Then you use can use busctl, d-feet or gdbus, ex:
> $ gdbus introspect --session -r -d org.qemu -o /
> 
> See the different patches and documentation for further options. The p2p=on mode
> should also allow users running bus-less (on MacOS for ex). We can also add TCP
> socket if needed (although more work would be needed in this case to replace
> the FD-passing with some extra TCP listening socket).

Wow.  That series got a lot of fine tuning.  The patches look all good
to me.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

> A WIP Rust/Gtk4 client and VNC server is: https://gitlab.com/marcandre.lureau/qemu-display/
> (check README.md for details, then `cargo run` should connect to QEMU)

Hmm, that wants rather cutting edge versions, stock Fedora 34 isn't new
enough to build it.  And I don't feel like updating to Fedora 35 beta
for that.  So unfortunately I couldn't easily test it, but I'd love to
see that live in action.

Is it possible to keep the client running while starting and stopping
qemu (comparable to "virt-viewer --wait --reconnect" behaviour)?

take care,
  Gerd


