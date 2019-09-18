Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D863B617B
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Sep 2019 12:32:42 +0200 (CEST)
Received: from localhost ([::1]:57152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAXGL-0007Sa-Gf
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 06:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36386)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sgarzare@redhat.com>) id 1iAXEN-0006t3-2R
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 06:30:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1iAXEM-00066h-55
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 06:30:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49854)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1iAXEM-00066R-03
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 06:30:38 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3B46B81F07
 for <qemu-devel@nongnu.org>; Wed, 18 Sep 2019 10:30:37 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id b6so2206319wrx.0
 for <qemu-devel@nongnu.org>; Wed, 18 Sep 2019 03:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9UfC779la/3EU3JpqPYe3tcB1zqmfFk+Bxp+Hj5B6OY=;
 b=tvFCyGDfLwGbi7uMygeexZAH9X+TwGENAnB3AHQCiRYGJhcXik2MFI3OYekWeNDXSF
 OsHTz0dfkxoSaX5HIs7y1b7ukQ/903VOdF9plwLp3ENMfPSfyFNXPNXJKvvOZt6T3CUR
 RMg22keoQv9BVb+BgAtZPPnd/s/6AoLO3AxL0whhwMLV/iFPDU7U3SPapjjaa28oPWgo
 aogZWENiZxmPJOp6IdY5nw0JJGo2IDq7MrxajDkc5OpxtIbh+dDtw40qIgJoPCIlyVCQ
 kTzs/vfbSG2EFETg4bjTJZatrZo/V8WM/UeMg2K4oe6qDrA6KNN3GVYiJ6CIU0fuJWTD
 kdBQ==
X-Gm-Message-State: APjAAAX4Qse7/6x6e+/OBDYoo3kIBkD9p5VtpX4gY91fRsD0NQxAjcBP
 X0BO51O5wb61c9KjyzbDSo1ToebtdkA45wE3BguPqXqJmlfrSrzWfj92ega10iUwYExUajR4Xn6
 JB1dh5VDHQLh/Mkg=
X-Received: by 2002:a5d:4944:: with SMTP id r4mr2553473wrs.283.1568802635982; 
 Wed, 18 Sep 2019 03:30:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw6nNBT3XJdjWdxI+pldHhp+0Kn2FngVKGdPW1gl+FwG+4eu3B1aBSJEm2tQynXf2zYNJyzlQ==
X-Received: by 2002:a5d:4944:: with SMTP id r4mr2553458wrs.283.1568802635772; 
 Wed, 18 Sep 2019 03:30:35 -0700 (PDT)
Received: from steredhat (host170-61-dynamic.36-79-r.retail.telecomitalia.it.
 [79.36.61.170])
 by smtp.gmail.com with ESMTPSA id r20sm7410524wrg.61.2019.09.18.03.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 03:30:35 -0700 (PDT)
Date: Wed, 18 Sep 2019 12:30:33 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20190918103033.upz7q5spfnyhea5z@steredhat>
References: <CAJSP0QVMjw_zm16MRo25Gq0J9w=9vrKDZtaH=WGwjSJiDAVm9Q@mail.gmail.com>
 <20190918082825.nnrjqvicqwjg3jq6@steredhat>
 <CAJSP0QXCJY4+5P9zU4670dfwjmKEUagB9gFrqF3H9cCPZPbzbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJSP0QXCJY4+5P9zU4670dfwjmKEUagB9gFrqF3H9cCPZPbzbA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [libvirt] Call for volunteers: LWN.net articles
 about KVM Forum talks
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
Cc: libvir-list@redhat.com, qemu-devel <qemu-devel@nongnu.org>,
 kvm <kvm@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 18, 2019 at 11:02:54AM +0100, Stefan Hajnoczi wrote:
> On Wed, Sep 18, 2019 at 9:28 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
> >
> > On Tue, Sep 17, 2019 at 02:02:59PM +0100, Stefan Hajnoczi wrote:
> > I volunteer for "Libvirt: Never too Late to Learn New Tricks" by
> > Daniel Berrange.
> 
> Hi Stefano,
> Paolo has already volunteered for that.  Is there another talk you are
> interested in covering?

Hi Stefan,
another talk I'm interested in is "Making the Most of NBD" by Eric Blake &
Richard Jones.

I hope it's not already covered :-)

Cheers,
Stefano

