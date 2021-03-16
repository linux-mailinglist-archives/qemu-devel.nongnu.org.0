Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 198E933DD9F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 20:34:44 +0100 (CET)
Received: from localhost ([::1]:51786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMFSl-0001rg-1l
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 15:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lMEgc-00023k-KN
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 14:44:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lMEgZ-0002tt-LQ
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 14:44:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615920294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7DsBv0dLyyinTfZSdD1WL6hlYf0qDPEpuQoR9yZu8fg=;
 b=VTHMmKJzWP+1meSwhHdIvYO4SDSiyvVPZ3MJNZAQLH+Wrc6Uk8F6HFjcg9FZ2iR4Ys+mNR
 fKdd0UAzk9a/W2yHhOLz1enLqNeY1qe8YoN5sPaXQ/h6nPJqTMq7dliFhusFXXHQG4jaZ5
 PLQdVByCaz2tHrRiSAdTB1oY7T8m1UM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-sTl_SXTSPVizoZYMZBFAjg-1; Tue, 16 Mar 2021 14:44:52 -0400
X-MC-Unique: sTl_SXTSPVizoZYMZBFAjg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 734766EAF8
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 18:44:51 +0000 (UTC)
Received: from work-vm (ovpn-113-133.ams2.redhat.com [10.36.113.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 09D435D74F;
 Tue, 16 Mar 2021 18:44:43 +0000 (UTC)
Date: Tue, 16 Mar 2021 18:44:41 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: Half a usb-redir idea
Message-ID: <YFD8mXa4P/fVIZd6@work-vm>
References: <YFDo/oHikOEcXFcg@work-vm>
 <630f4307-20ed-8834-4df9-ed90c22ee018@redhat.com>
MIME-Version: 1.0
In-Reply-To: <630f4307-20ed-8834-4df9-ed90c22ee018@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: victortoso@redhat.com, berrange@redhat.com, kraxel@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
> On 3/16/21 6:21 PM, Dr. David Alan Gilbert wrote:
> > Hi,
> >   I've got a half-baked idea, which I thought might be worth mentioning.
> > 
> > How hard would it be to give qemu a usbredir server rather than client?
> > It would have nothing guest visible but would look logically like the
> > front (?) half of a usb interface; then you could use all of the
> > existing qemu emulated and passthrough device code, to build a usb
> > hierarchy and present it to a remote qemu.
> > 
> > You'd get the ability to do emulated USB CDROM/storage, audio, network
> > and the glue for host USB connection (and smart cards??) - all in one
> > client that you can then use for connecting to a remote qemu.
> > 
> > The next step of that is to make something analogous to a
> > qemu-storage-daemon, but for USB, so you have something that can
> > do all that USB stuff without actually having any processors.
> > 
> > The even crazier step would then be to add a VNC client, and then you
> > have an almost complete remote client.
> 
> Similarly to the out-of-process feature (on the same host)?
> Are you also interested in remote use (different host)?

I was mainly interested in it for remote access; but potentially this
provides a clean break point to move all of the USB device emulation
into one separate process.

> What about DMA accesses?

I was assuming it was wired to the other half of usbredir than
the current qemu client side code, so it would handle it.

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


