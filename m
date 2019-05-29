Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E68D12D3FB
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 04:50:59 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46032 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVog7-0006Kl-5S
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 22:50:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59002)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hVofA-0005xM-GA
	for qemu-devel@nongnu.org; Tue, 28 May 2019 22:50:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hVof9-0006ed-FM
	for qemu-devel@nongnu.org; Tue, 28 May 2019 22:50:00 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:45000)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1hVof9-0006d5-B8
	for qemu-devel@nongnu.org; Tue, 28 May 2019 22:49:59 -0400
Received: by mail-qk1-f194.google.com with SMTP id w187so466437qkb.11
	for <qemu-devel@nongnu.org>; Tue, 28 May 2019 19:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=ZYxO6jmBnDiy2fZj9QCDDSWGxuQzRFN+HTvQWdss/vw=;
	b=Ho6i18CUlSULdUhxs5HoTn9gfuisAXkUT2LayCRmjJ6zlOv8gXDpKSl8MWmo7ESgE+
	e+mMU62P01RSl77/WwuFWaJ10EZs6tuFhSZYNa9TryM6h+Gr9i2kd047QZ8xAfiqSaS6
	U8YfuvOHK8Br81AFnGjj4x4PwccjjS9nxAG4pWmqHZMQkoeKo6MMBw7/LSf7SRVbpvw1
	arUuFK3oY9J44BSgn32L6OTRnzCj2IY+U9QryGgnTP7odF5OKjigOUZ167PIecCzHzgp
	4Xe4Av/ZKl/Qo9DwwCSXTRt0IdHrdNe9hGGzqB5jJ1WBzJtOFpNPHdQrFwBkhpHy/rTP
	pC7A==
X-Gm-Message-State: APjAAAU7tbIyU6rLnSakdgE3hPTjF7SUA/iVG/4UUXCIhHGIx8MtlN4i
	LbfuLq2ns37FgNkTwzpU+SVaJQ==
X-Google-Smtp-Source: APXvYqzVZLwseXUpNPezYMmz1nVYdtthhBY1otxc13MEIGEYCR85hGEnZCNQZ3vkbRPGHL4YvjjYwg==
X-Received: by 2002:a05:620a:1084:: with SMTP id
	g4mr93323729qkk.228.1559098198747; 
	Tue, 28 May 2019 19:49:58 -0700 (PDT)
Received: from redhat.com (pool-100-0-197-103.bstnma.fios.verizon.net.
	[100.0.197.103]) by smtp.gmail.com with ESMTPSA id
	n67sm6125649qte.42.2019.05.28.19.49.57
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 28 May 2019 19:49:57 -0700 (PDT)
Date: Tue, 28 May 2019 22:49:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190528224810-mutt-send-email-mst@kernel.org>
References: <20190528204838.21568-1-kraxel@redhat.com>
	<bf45adf2-1594-89b4-6a4d-9af6d9e8ac6e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf45adf2-1594-89b4-6a4d-9af6d9e8ac6e@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.222.194
Subject: Re: [Qemu-devel] [PATCH] q35: split memory at 2G
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?iso-8859-1?B?TOFzemzzIMlyc2Vr?= <lersek@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 29, 2019 at 03:21:16AM +0200, Paolo Bonzini wrote:
> On 28/05/19 22:48, Gerd Hoffmann wrote:
> > Original q35 behavior was to split memory 2.75 GB, leaving space for the
> > mmconfig bar at 0xb000000 and pci I/O window starting at 0xc0000000.
> > 
> > Note: Those machine types have been removed from the qemu codebase
> > meanwhile because they could not be live-migrated so there was little
> > value in keeping them around.
> > 
> > With the effort to allow for gigabyte-alignment of guest memory that
> > behavior was changed:  The split was moved to 2G, but only in case the
> > memory didn't fit below 2.75 GB.
> > 
> > So today the address space between 2G and 2,75G is not used for guest
> > memory in typical use cases, where the guest memory sized at a power of
> > two or a gigabyte number.  But if you configure your guest with some odd
> > amout of memory (such as 2.5G) the address space is used.
> 
> Wasn't it done to ensure pre-PAE OSes could use as much memory as
> possible?  (If you run pre-PAE OSes with more RAM than can fit below 4G,
> you can just reduce the amount of memory and get all the 2.75G).
> 
> Paolo

Absolutely. Gerd is just saying the configuration is rare enough that
it's not worth worrying about. I don't know myself - why do
we bother making this change? What's the advantage?

-- 
MST

