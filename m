Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FB133E9D5
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 07:37:56 +0100 (CET)
Received: from localhost ([::1]:46502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMPoZ-0003cZ-Bb
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 02:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMPhS-0007Sj-7K
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:30:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMPhO-0001ni-8a
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:30:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615962629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j/fZuvwg0LWeieYTgrnpesnTjDKxvoVQHJamHU6RRzo=;
 b=DdUby01S1VCaHUmCL7PtlNZOZkfJT5ML8dhRmvp4U+eLDwwDdOAyW+JkWzH98n1CAL6dj4
 jpbPn90Yr5Aw2xDYcrUBGFRWjZCTAhOAOLLJIG+dw0dEayMQg00vgWn8++GeQ240wDX1Y2
 ZTwglRrgVuFPu3QM6C5NDc/4Tw59GTM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-WNTYyWo4OMSzgAIqeXOYhQ-1; Wed, 17 Mar 2021 02:30:27 -0400
X-MC-Unique: WNTYyWo4OMSzgAIqeXOYhQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E36E107ACCD
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 06:30:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B8F560C13;
 Wed, 17 Mar 2021 06:30:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AD3ED180038B; Wed, 17 Mar 2021 07:30:20 +0100 (CET)
Date: Wed, 17 Mar 2021 07:30:20 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: Half a usb-redir idea
Message-ID: <20210317063020.ldkuvwgdxxdvxlzt@sirius.home.kraxel.org>
References: <YFDo/oHikOEcXFcg@work-vm>
 <630f4307-20ed-8834-4df9-ed90c22ee018@redhat.com>
 <YFD8mXa4P/fVIZd6@work-vm>
MIME-Version: 1.0
In-Reply-To: <YFD8mXa4P/fVIZd6@work-vm>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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
Cc: berrange@redhat.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 victortoso@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > What about DMA accesses?
> 
> I was assuming it was wired to the other half of usbredir than
> the current qemu client side code, so it would handle it.

Yep, that is for the most part handled by the host adapter emulation.
The usb device emulation will see an USBPacket struct with an iovec,
typically pointing to guest ram, but you can easily have the usbredir
server bits point to network packet content instead and the device
emulation code wouldn't notice the difference.

take care,
  Gerd


