Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2B7203685
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 14:15:02 +0200 (CEST)
Received: from localhost ([::1]:39258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnLLp-0000w3-6X
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 08:15:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jnLK4-0008GR-4z
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 08:13:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38538
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jnLK2-0007GN-IY
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 08:13:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592827989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q3rcQoBDdNO0HpXBtVRxiSmUaieudgSERv7Z7QvK5yA=;
 b=BYM8EySGkXPf/FFRxrRjYA8WZv1jRCXENQzf8xlvFyVm73pub6wc6ZedoStZRcDD0rHzdM
 MhifpCKOmCjKwM3YNf+ePKOmyk8gT7bh9BhOAoxSwnWJN6kHa8ejGd0oA9V69eqkp+KaDh
 iaLKgW4PvUBxIBKDMX+1Sj/OHAZmjSY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-Vr8ObJp2MGKjEOMpgapz3Q-1; Mon, 22 Jun 2020 08:13:05 -0400
X-MC-Unique: Vr8ObJp2MGKjEOMpgapz3Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D55471B18BC1;
 Mon, 22 Jun 2020 12:13:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C4D979300;
 Mon, 22 Jun 2020 12:12:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1112417477; Mon, 22 Jun 2020 14:12:57 +0200 (CEST)
Date: Mon, 22 Jun 2020 14:12:57 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v3 12/19] audio: add soundhw deprecation notice
Message-ID: <20200622121257.x4klhd7clz2v62xr@sirius.home.kraxel.org>
References: <20200622112914.30454-1-kraxel@redhat.com>
 <20200622112914.30454-13-kraxel@redhat.com>
 <20200622114254.GG736373@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200622114254.GG736373@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 01:27:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
 qemu-devel@nongnu.org, =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 22, 2020 at 12:42:54PM +0100, Daniel P. Berrangé wrote:
> On Mon, Jun 22, 2020 at 01:29:07PM +0200, Gerd Hoffmann wrote:
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > ---
> >  docs/system/deprecated.rst | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> > index 3a255591c341..7ddd9e400745 100644
> > --- a/docs/system/deprecated.rst
> > +++ b/docs/system/deprecated.rst
> > @@ -82,6 +82,15 @@ should specify an ``audiodev=`` property.  Additionally, when using
> >  vnc, you should specify an ``audiodev=`` propery if you plan to
> >  transmit audio through the VNC protocol.
> >  
> > +Creating sound card devices using ``-soundhw`` (since 5.1)
> > +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> > +
> > +Sound card devices should be created using ``-device`` instead.  The
> > +names are the same for most devices.  The exceptions are ``hda`` which
> > +needs two devices (``-device intel-hda --device hda-duplex``) and
> > +``pcspk`` which can be activated using ``-global
> > +pcspk.audiodev=<name>``.
> 
> The previous  "-soundhw pcspk" didn't include any audiodev specification,
> so I presume it activated some kind of default ?

Yes.  First audiodev it finds.

Before -audiodev arrived you could not have multiple backends in the
first place, so this covers backward compatibility with existing
configurations.

> What would be the equivalent audiodev to specify for the new arg to
> match the old default ?

Doesn't exist.  You have to explicitly create an audiodev backend.

See also patch 19/19 which adds "-machine pcspk-audidev=<name>", that'll
probably more useful for libvirt because (a) -global should be avoided
anyway and (b) you can see the new machine property in qapi introspection
and pick pcspk init code path based on that.

take care,
  Gerd


