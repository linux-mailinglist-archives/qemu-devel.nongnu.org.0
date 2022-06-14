Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 140E054ADDE
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 12:01:51 +0200 (CEST)
Received: from localhost ([::1]:59218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o13Ms-0001Ts-M9
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 06:01:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o13DF-0000lR-Rz
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 05:51:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o13D9-0002Jb-D3
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 05:51:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655200306;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=kPsIb46gmdhHq2vvvdI5Q6gA7nrPKFn2iUBOa2L/v9k=;
 b=HkBp8SduvbxuFF2hgFkVYPQuLgf+vDeABKtwQAXMAoeiR0ayJbrnwTcoU8EF6AW0p63QHD
 /vCueEcOlg5RykJcL39ESx+IDA+UwrxVUjzPL1UiMv+lhiH8TQDzrFktSyHIW85HETOb9N
 1oDo4148GUDLhHy+Hwttj99or/6bPWY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-pSbqAgPoOEKx6fcCh6x3dg-1; Tue, 14 Jun 2022 05:51:43 -0400
X-MC-Unique: pSbqAgPoOEKx6fcCh6x3dg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A45431C0513E;
 Tue, 14 Jun 2022 09:51:42 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.137])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9568D1415103;
 Tue, 14 Jun 2022 09:51:40 +0000 (UTC)
Date: Tue, 14 Jun 2022 10:51:38 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Canokeys.org" <contact@canokeys.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PULL 00/16] Kraxel 20220613 patches
Message-ID: <YqhaKi8K2EATpAlN@redhat.com>
References: <20220613113655.3693872-1-kraxel@redhat.com>
 <37f8f623-bb1c-899b-5801-79acd6185c6d@linaro.org>
 <20220614094038.g2g6lzeviypcnqrb@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220614094038.g2g6lzeviypcnqrb@sirius.home.kraxel.org>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, Jun 14, 2022 at 11:40:38AM +0200, Gerd Hoffmann wrote:
> On Mon, Jun 13, 2022 at 08:52:21AM -0700, Richard Henderson wrote:
> > On 6/13/22 04:36, Gerd Hoffmann wrote:
> > > The following changes since commit dcb40541ebca7ec98a14d461593b3cd7282b4fac:
> > > 
> > >    Merge tag 'mips-20220611' of https://github.com/philmd/qemu into staging (2022-06-11 21:13:27 -0700)
> > > 
> > > are available in the Git repository at:
> > > 
> > >    git://git.kraxel.org/qemu tags/kraxel-20220613-pull-request
> > > 
> > > for you to fetch changes up to 23b87f7a3a13e93e248eef8a4b7257548855a620:
> > > 
> > >    ui: move 'pc-bios/keymaps' to 'ui/keymaps' (2022-06-13 10:59:25 +0200)
> > > 
> > > ----------------------------------------------------------------
> > > usb: add CanoKey device, fixes for ehci + redir
> > > ui: fixes for gtk and cocoa, move keymaps (v2), rework refresh rate
> > > virtio-gpu: scanout flush fix
> > 
> > This doesn't even configure:
> > 
> > ../src/ui/keymaps/meson.build:55:4: ERROR: File ar does not exist.
> 
> Hmm, build worked here and CI passed too.
> 
> I think this is one of those cases where the build directory must be
> deleted because one subdirectory is replaced by a compatibility
> symlink.

Except 'configure' deals with that, as it explicitly rm -rf's the
symlink target:

symlink() {
  rm -rf "$2"
  mkdir -p "$(dirname "$2")"
  ln -s "$1" "$2"
}


so i'm pretty confused as to what's going wrong here still


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


