Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F522553F0
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 07:03:36 +0200 (CEST)
Received: from localhost ([::1]:53418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBWY3-0006Vp-Fa
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 01:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kBWXI-0005zt-4Z
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 01:02:48 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:22874
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kBWXE-0007zn-Gf
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 01:02:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598590962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Io6yvH2RvXJsrjsS5gf7crzETU2p3vbCTvSVa5tuu14=;
 b=ZPXNPWvgNDNv2dMiz/fONTasflt1d9juWDwYXAhaAUWekoW/SUjSgkDAGolDWJeiX6AGMM
 AH8Irj16CrhjDkr9HuZuy1PW6Ahw4L8MFpgw1n6XWyrarmM9ITr6a+F0i8vmcTyvfnDU/w
 PjdnZSY1dlyoSmHfuD5pKouvzr5jyjc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-mMPhyQ6LNQCNc_R47wIljg-1; Fri, 28 Aug 2020 01:02:40 -0400
X-MC-Unique: mMPhyQ6LNQCNc_R47wIljg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04CF55202;
 Fri, 28 Aug 2020 05:02:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-54.ams2.redhat.com
 [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D451672CD;
 Fri, 28 Aug 2020 05:02:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 30EBE9D5A; Fri, 28 Aug 2020 07:02:32 +0200 (CEST)
Date: Fri, 28 Aug 2020 07:02:32 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH v6 03/20] seabios: add bios-microvm.bin binary
Message-ID: <20200828050232.jykyjztkwaplkhsu@sirius.home.kraxel.org>
References: <20200826105254.28496-1-kraxel@redhat.com>
 <20200826105254.28496-4-kraxel@redhat.com>
 <20200827144854.vz7yhakvks5xoh63@mhamilton>
MIME-Version: 1.0
In-Reply-To: <20200827144854.vz7yhakvks5xoh63@mhamilton>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/28 01:02:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 27, 2020 at 04:48:54PM +0200, Sergio Lopez wrote:
> On Wed, Aug 26, 2020 at 12:52:37PM +0200, Gerd Hoffmann wrote:
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > ---
> >  pc-bios/bios-microvm.bin | Bin 0 -> 131072 bytes
> >  1 file changed, 0 insertions(+), 0 deletions(-)
> >  create mode 100644 pc-bios/bios-microvm.bin
> 
> Without reproducible builds (which we should probably consider having
> for everything inside "pc-bios", but that's outside the scope of this
> series), this one is hard to debug.

We have roms/Makefile for firmware builds.  "make -C roms bios" will
build seabios binaries (you need the seabios submodule initialized for
this).

And, yes, seabios builds are reproducible.  If you build with the same
compiler (rhel-7 gcc 4.8.5) you should end up with the same binary.

take care,
  Gerd


