Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4C62517FB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 13:44:17 +0200 (CEST)
Received: from localhost ([::1]:42282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAXNA-0002BP-7B
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 07:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kAXMV-0001kg-4i
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 07:43:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kAXMT-0000hg-9u
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 07:43:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598355811;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+avlk1y1WFWNyWx4IvMmZU6wwUO/wH191KSEflJbQSU=;
 b=Mx0ilNt/cA++LowK9vaepX2kMxkW+LHu9aQm7OHFn750Lpx3B+H8KknijBgLAAYwxIpb4W
 xJIw8DdecFp3lQsADrCec5vcT34KagjWp5nNxmfP2aBwk5v1MiBVNpCmd41RY5c5eeNoec
 KMwZY0a2bvCDQ2a9Vtk2o3TwByTauq0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-1VIWsjiFPiyomsy2g7YDXA-1; Tue, 25 Aug 2020 07:43:26 -0400
X-MC-Unique: 1VIWsjiFPiyomsy2g7YDXA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4996A189E600
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 11:43:25 +0000 (UTC)
Received: from redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F1A77C5F6;
 Tue, 25 Aug 2020 11:43:24 +0000 (UTC)
Date: Tue, 25 Aug 2020 12:43:21 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2 54/58] [semi-automated] Use DECLARE_*CHECKER* when
 possible (--force mode)
Message-ID: <20200825114321.GL107278@redhat.com>
References: <20200820001236.1284548-1-ehabkost@redhat.com>
 <20200820001236.1284548-55-ehabkost@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200820001236.1284548-55-ehabkost@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 06:38:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 19, 2020 at 08:12:32PM -0400, Eduardo Habkost wrote:
> Separate run of the TypeCheckMacro converter using the --force
> flag, for the cases where typedefs weren't found in the same
> header nor in typedefs.h.
> 
> Generated initially using:
> 
>  $ ./scripts/codeconverter/converter.py --force -i \
>    --pattern=TypeCheckMacro $(git grep -l '' -- '*.[ch]')
> 
> Then each case was manually reviewed, and a comment was added
> indicating what's unusual about those type checking
> macros/functions.  Despite not following the usual pattern, the
> changes in this patch were found to be safe.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Changes v1 -> v2:
> * Most of the old changes in this patch are now being handled by
>   the regular TypeCheckMacro patch (without --force mode)
> * Added comments added explaining why these unusual changes
>   remain
> ---
>  include/hw/intc/arm_gic.h       | 9 +++------
>  include/hw/intc/arm_gicv3.h     | 8 +++-----
>  include/hw/ppc/xics_spapr.h     | 4 +++-
>  include/hw/virtio/virtio-mmio.h | 9 +++------
>  hw/intc/apic.c                  | 5 +++--
>  hw/intc/arm_gic_kvm.c           | 9 +++------
>  hw/intc/arm_gicv3_its_kvm.c     | 8 +++-----
>  hw/intc/arm_gicv3_kvm.c         | 9 +++------
>  hw/sd/allwinner-sdhost.c        | 5 +++--
>  hw/sd/bcm2835_sdhost.c          | 5 +++--
>  hw/sd/pxa2xx_mmci.c             | 4 +++-
>  hw/sd/sdhci.c                   | 4 +++-
>  12 files changed, 36 insertions(+), 43 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


