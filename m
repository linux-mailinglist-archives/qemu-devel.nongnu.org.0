Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CECD154AD85
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 11:44:36 +0200 (CEST)
Received: from localhost ([::1]:37732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o136B-0002VG-QY
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 05:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o132Y-00088h-Jq
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 05:40:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o132V-00009t-9b
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 05:40:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655199645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fWuwP4AFW+8vVLjWWxPmrGzKbgBIGbPERfEvHtPl3i4=;
 b=cL+Av3RKIpoWzFZDd4ndMcXJhHbu8rXr82kNs6nehuvKhVASGB0wEvkC4W7WiQK2SbGlLm
 TwM/FA9CyYduhdA5aSbhQ7P4WcmYERrc86v+wtUapDyzCf1OAp+GYa0DygGoh5j84/5hHg
 c8Cwek6fImFzKbXTr8cH9D4G0N9Z9+s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-_yGR8o1cNFWa8zO5jK1pbw-1; Tue, 14 Jun 2022 05:40:41 -0400
X-MC-Unique: _yGR8o1cNFWa8zO5jK1pbw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 038A28027EE;
 Tue, 14 Jun 2022 09:40:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9447D4010E32;
 Tue, 14 Jun 2022 09:40:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EA7751800084; Tue, 14 Jun 2022 11:40:38 +0200 (CEST)
Date: Tue, 14 Jun 2022 11:40:38 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 xen-devel@lists.xenproject.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Canokeys.org" <contact@canokeys.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Durrant <paul@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, berrange@redhat.com
Subject: Re: [PULL 00/16] Kraxel 20220613 patches
Message-ID: <20220614094038.g2g6lzeviypcnqrb@sirius.home.kraxel.org>
References: <20220613113655.3693872-1-kraxel@redhat.com>
 <37f8f623-bb1c-899b-5801-79acd6185c6d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37f8f623-bb1c-899b-5801-79acd6185c6d@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

On Mon, Jun 13, 2022 at 08:52:21AM -0700, Richard Henderson wrote:
> On 6/13/22 04:36, Gerd Hoffmann wrote:
> > The following changes since commit dcb40541ebca7ec98a14d461593b3cd7282b4fac:
> > 
> >    Merge tag 'mips-20220611' of https://github.com/philmd/qemu into staging (2022-06-11 21:13:27 -0700)
> > 
> > are available in the Git repository at:
> > 
> >    git://git.kraxel.org/qemu tags/kraxel-20220613-pull-request
> > 
> > for you to fetch changes up to 23b87f7a3a13e93e248eef8a4b7257548855a620:
> > 
> >    ui: move 'pc-bios/keymaps' to 'ui/keymaps' (2022-06-13 10:59:25 +0200)
> > 
> > ----------------------------------------------------------------
> > usb: add CanoKey device, fixes for ehci + redir
> > ui: fixes for gtk and cocoa, move keymaps (v2), rework refresh rate
> > virtio-gpu: scanout flush fix
> 
> This doesn't even configure:
> 
> ../src/ui/keymaps/meson.build:55:4: ERROR: File ar does not exist.

Hmm, build worked here and CI passed too.

I think this is one of those cases where the build directory must be
deleted because one subdirectory is replaced by a compatibility
symlink.

Or we drop the symlink idea and update the keymap loading code to check
both old and new location.  Daniel?

take care,
  Gerd


