Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC441EF397
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jun 2020 11:00:28 +0200 (CEST)
Received: from localhost ([::1]:59796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jh8DD-0006XV-Fn
	for lists+qemu-devel@lfdr.de; Fri, 05 Jun 2020 05:00:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jh8CL-00068i-HU
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 04:59:33 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45748
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jh8CK-00052t-GF
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 04:59:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591347571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gRYM1NTKxNwRT1xU0kNVM7f2FUOW6jmLEbDaEu89a20=;
 b=ico5GiCloGSQz/Rb4wzHUrhefDCadBjTlTF9eHZOSZlWAPY/nKlbMuG3djGGusKt5EeCWS
 0lk2+lPdibeZlrJ40KzPejd4hsLZGkicRtHu4cL2H6ckuqHGB1YOho8bwuUfkkFPKyG9ab
 tue0pEzX12IxyvHAgnxw/vmecyEz3Zk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-tD-33ZzJNHStD41iLlDxoQ-1; Fri, 05 Jun 2020 04:59:30 -0400
X-MC-Unique: tD-33ZzJNHStD41iLlDxoQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48BF0835B41
 for <qemu-devel@nongnu.org>; Fri,  5 Jun 2020 08:59:29 +0000 (UTC)
Received: from gondolin (ovpn-113-2.ams2.redhat.com [10.36.113.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 808E95C1B0;
 Fri,  5 Jun 2020 08:59:28 +0000 (UTC)
Date: Fri, 5 Jun 2020 10:59:25 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] linux-headers: update to Linux 5.8-rc1
Message-ID: <20200605105925.124ee876.cohuck@redhat.com>
In-Reply-To: <CABgObfZ7c4Kj5_ic+CaOGpFwAVs_i98TCV1sKGAgGh1M3aqogg@mail.gmail.com>
References: <20200604224148.2536-1-pbonzini@redhat.com>
 <20200605092814.086db16b.cohuck@redhat.com>
 <CABgObfZ7c4Kj5_ic+CaOGpFwAVs_i98TCV1sKGAgGh1M3aqogg@mail.gmail.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=cohuck@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 03:07:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Jun 2020 09:35:33 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Il ven 5 giu 2020, 09:28 Cornelia Huck <cohuck@redhat.com> ha scritto:
> 
> > On Thu,  4 Jun 2020 18:41:48 -0400
> > Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > Isn't it still a bit early for -rc1? :) Probably wants a commit id...
> >  
> > > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > > ---
> > >  include/standard-headers/asm-x86/kvm_para.h |  17 ++-
> > >  include/standard-headers/drm/drm_fourcc.h   | 140 ++++++++++++++++++--
> > >  include/standard-headers/linux/ethtool.h    |  16 ++-
> > >  linux-headers/asm-arm/unistd-common.h       |   1 +
> > >  linux-headers/asm-arm64/mman.h              |   8 ++
> > >  linux-headers/asm-generic/unistd.h          |   4 +-
> > >  linux-headers/asm-mips/unistd_n32.h         |   1 +
> > >  linux-headers/asm-mips/unistd_n64.h         |   1 +
> > >  linux-headers/asm-mips/unistd_o32.h         |   1 +
> > >  linux-headers/asm-powerpc/unistd_32.h       |   1 +
> > >  linux-headers/asm-powerpc/unistd_64.h       |   1 +
> > >  linux-headers/asm-s390/unistd_32.h          |   1 +
> > >  linux-headers/asm-s390/unistd_64.h          |   1 +
> > >  linux-headers/asm-x86/kvm.h                 |  20 ++-
> > >  linux-headers/asm-x86/unistd.h              |  11 +-
> > >  linux-headers/asm-x86/unistd_32.h           |   1 +
> > >  linux-headers/asm-x86/unistd_64.h           |   1 +
> > >  linux-headers/asm-x86/unistd_x32.h          |   1 +
> > >  linux-headers/linux/kvm.h                   |  18 ++-
> > >  linux-headers/linux/psp-sev.h               |   2 +
> > >  20 files changed, 224 insertions(+), 23 deletions(-)  
> >
> > There will be more (e.g. on the vfio side); anything in particular you
> > need this update for?
> >  
> 
> I need it for nested AMD live migration and page ready interrupts
> (basically the KVM bits), but I can post it again when rc1 is really done.

Yeah, that sounds ok, but it really wants the commit id if it isn't the
not-yet-existing -rc1.


