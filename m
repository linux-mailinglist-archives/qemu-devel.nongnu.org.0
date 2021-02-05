Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC3031075E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 10:11:35 +0100 (CET)
Received: from localhost ([::1]:39936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7x9J-0004gT-EX
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 04:11:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7x7W-0003ba-Oy
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 04:09:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7x7U-0003cm-SW
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 04:09:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612516180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GpEjnitDwcN/rKPUOoz5i7oTAwlDKQ7At71hLVGeBy4=;
 b=Bm9Wa4rV8+OPAosArS/e1WoL4Osbq1OnB0PqMV1PHdGZk6XZRQyMtL5ekWDYhI/ka7ll7c
 kWtB++m6Vxa6pZrtpQ+Gu3zq3Y+hxkNN6I7kQB7KHU+qZN/bxFxozPQ46jKwUmgQif7t0l
 jx+jn2Hq/9aFBpu0/ve5iSSd2e04KHU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-mCsscWo8PEOfV25YpgTwuQ-1; Fri, 05 Feb 2021 04:09:38 -0500
X-MC-Unique: mCsscWo8PEOfV25YpgTwuQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CA8A15720;
 Fri,  5 Feb 2021 09:09:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-108.ams2.redhat.com
 [10.36.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A699D10013DB;
 Fri,  5 Feb 2021 09:09:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DFCBF18000B6; Fri,  5 Feb 2021 10:09:19 +0100 (CET)
Date: Fri, 5 Feb 2021 10:09:19 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 4/4] hw/usb/bus: Remove the "full-path" property
Message-ID: <20210205090919.bfd6g5e3aof2b2zh@sirius.home.kraxel.org>
References: <20210203171832.483176-1-thuth@redhat.com>
 <20210203171832.483176-5-thuth@redhat.com>
 <20210204083648.b4tbk5kftdk4j6ez@sirius.home.kraxel.org>
 <491c2cc6-ea07-d281-4dfc-01a81d02da77@redhat.com>
MIME-Version: 1.0
In-Reply-To: <491c2cc6-ea07-d281-4dfc-01a81d02da77@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, libvir-list@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 04, 2021 at 04:51:39PM +0100, Thomas Huth wrote:
> On 04/02/2021 09.36, Gerd Hoffmann wrote:
> >    Hi,
> > 
> > >   enum USBDeviceFlags {
> > > -    USB_DEV_FLAG_FULL_PATH,
> > > +    USB_DEV_FLAG_FULL_PATH,             /* unused since QEMU v6.0 */
> > 
> > Why not just drop it?  Any remaining users?
> 
> I didn't want to change the values of the other members of the enum ...

This should be purely internal to qemu hw/usb and not some kind of abi,
so changing the values shouldn't break anything ...

take care,
  Gerd


