Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 911203086C7
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 09:00:58 +0100 (CET)
Received: from localhost ([::1]:33852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Oi6-0008Fe-5G
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 03:00:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l5OgS-0007oS-VQ
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 02:59:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l5OgM-0004Tf-Pf
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 02:59:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611907145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BvKec5sy+H5V2RGxwQk6MZfvKC3C7m0JMQcCUEO1h1k=;
 b=Bg6OUdMBTMD6SoELAqYXxtxvCuamIGHiCR7emCOgMnPVSVbQmE6euMSbrP/wuL3LrODxOj
 ZRwMbh79vrtFOexcRl+Y42bKpsHlbisOFULXEaR2kSeWtI5LDEGcRoWs2M0Z4NxzoqaUCM
 f8qxoAFcGQrA6I6IbpkxhVcRfWyTk9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-T54I2x-MMOmoVkJOHGU34w-1; Fri, 29 Jan 2021 02:59:03 -0500
X-MC-Unique: T54I2x-MMOmoVkJOHGU34w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 450515B361
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 07:59:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AB3B71C9F;
 Fri, 29 Jan 2021 07:59:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6424218000A2; Fri, 29 Jan 2021 08:59:00 +0100 (CET)
Date: Fri, 29 Jan 2021 08:59:00 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: vnc clipboard support
Message-ID: <20210129075900.mw7lnpn6f654wajo@sirius.home.kraxel.org>
References: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
 <20210128173504.GS3832029@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210128173504.GS3832029@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 28, 2021 at 05:35:04PM +0000, Daniel P. Berrangé wrote:
> On Thu, Jan 28, 2021 at 06:12:24PM +0100, Gerd Hoffmann wrote:
> >   Hi folks,
> > 
> > I'm looking for a good way to implement cut+paste support for vnc.
> > 
> > The vnc core protocol has support for text/plain cut+paste, and there
> > is an extension adding support for other formats.  That'll cover one
> > part of the problem, exchanging cut+paste data between vnc client and
> > qemu vnc server.
> 
> NB the VNC cut+paste impl is technically undefined  for non-7-bit ascii
> data. In reality though I'd assume most servers/clients and up sending
> UTF8. 

rfbspec says it is latin1 for classic cut_text messages and utf-8 with
the extension.  In reality I've seen tigervnc send utf-8 even in classic
cut_text messages.  Given running in utf-8 locale is sort-of standard
these days I'm not surprised.

> I've never looked at the spice-guest-agent code, but I wonder if there
> is any scope for re-using it with VNC, or is it too closely tangled
> up with SPICE ?  The advantage of reuse is that all existing guest
> OS with spice-guest-agent installed will "just work".

Neat idea.  Need to check.  spice tunnels alot of stuff through the
agent channel, but IIRC there is some kind of feature negotiation so
maybe it isn't that hard to cherry-pick cut+paste and say "not
supported" for everything else.

> The QEMU guest agent is a single system level agent. IIUC, with SPICE
> you have a single system level agent, and then zero or more session
> level agents - one per desktop login basically.

Ok, easy multi-session support is one advantage of the proxy model.

take care,
  Gerd


