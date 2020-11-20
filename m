Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 266FF2BA2BD
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 07:58:11 +0100 (CET)
Received: from localhost ([::1]:51702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg0N0-0004DV-74
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 01:58:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kg0Kq-0003EG-Lf
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 01:55:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kg0Kj-0001ew-L2
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 01:55:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605855347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ib/7hYLsCfDxjvnYyGCKFaWcMH+TKU8w+rlGIGnOiuc=;
 b=LoZZSLmuJxdaMqvroRyOEuU3a8PzDYaS87NQ3fpuSrugp/Y2V4d5yOzQcGwBGMDv6+Lvgh
 +1iR/5UV8r5GBYHmhz0l92z0XxtR8MvyS7G22GDuSanzagP3FOALgZhpPHlTUGdrdgGY30
 vODjU0GVYE/C85UijFEtxsvphlDVXMU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-hvQ4CcEtPmuqeZCVrR5ouQ-1; Fri, 20 Nov 2020 01:55:46 -0500
X-MC-Unique: hvQ4CcEtPmuqeZCVrR5ouQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8F2C107ACFC;
 Fri, 20 Nov 2020 06:55:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DAB6E5C1D5;
 Fri, 20 Nov 2020 06:55:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AE49117535; Fri, 20 Nov 2020 07:55:36 +0100 (CET)
Date: Fri, 20 Nov 2020 07:55:36 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Bruce Rogers <brogers@suse.com>
Subject: Re: [PATCH v3 04/10] usb/xhci: fixup xhci kconfig deps
Message-ID: <20201120065536.6uyncsyv3nuo3e5b@sirius.home.kraxel.org>
References: <20201020074844.5304-1-kraxel@redhat.com>
 <20201020074844.5304-5-kraxel@redhat.com>
 <2b74eb5bd939bdd7ad1b05590a427afa4d742eec.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <2b74eb5bd939bdd7ad1b05590a427afa4d742eec.camel@suse.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> >  config USB_XHCI
> > -    default y if PCI_DEVICES

> >  config USB_XHCI_SYSBUS
> > +    default y

> I was reviewing what device changes are happening between v5.1.0 and
> v5.2.0 for the QEMU arch's we support and noticed for s390x system
> emulation that usb devices have appeared in the info qdm list in the
> monitor.
> 
> I bisected the change to this patch, now commit 7114f6eac333d99b, which
> does a 'default y' without any conditionals. I'm fairly sure that was
> not the intent, though I do know what the proper conditionals should
> be.

I'm open to suggestions.  Depending on PCI_DEVICES doesn't work any more
because USB_XHCI_SYSBUS doesn't need PCI ...

take care,
  Gerd


