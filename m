Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A7341E6D7
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 06:41:06 +0200 (CEST)
Received: from localhost ([::1]:60618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWAM5-00008l-Ft
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 00:41:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mWAKx-0007tF-06
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 00:39:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mWAKs-0001YZ-Nc
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 00:39:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633063188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4e8NUHORcGrQGbC94mioBnbAUaT6gu+/WUpF/6eXCds=;
 b=hvAHVmp6rOwCCNK+eml9erelRIUmkJpjnuB1V2+ZN0Neho94oXRu8qvuc9YNzg6LY6EfIu
 PeMkcxflzqUh0Ef8/TQ+cQf8YyGnYYtdWP6dXk/TZMzRUrKYNnRPOEDP6v8DBJAxJgcD+R
 3Pjkh4dBaFLNKIhw3NP/+wCN4x6V0FA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470--PuLp3AwOhmt0QlJ9gVS4w-1; Fri, 01 Oct 2021 00:39:47 -0400
X-MC-Unique: -PuLp3AwOhmt0QlJ9gVS4w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3675A802936;
 Fri,  1 Oct 2021 04:39:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB55960BD8;
 Fri,  1 Oct 2021 04:39:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CDD8518007AC; Fri,  1 Oct 2021 06:39:43 +0200 (CEST)
Date: Fri, 1 Oct 2021 06:39:43 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: OHCI/usb pass through
Message-ID: <20211001043943.2cxyxjfgmr5duicl@sirius.home.kraxel.org>
References: <771189a-95c4-5144-ba7-478d28dfd5ef@eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <771189a-95c4-5144-ba7-478d28dfd5ef@eik.bme.hu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> [...]
>     /* Active packets.  */
>     uint32_t old_ctl;
>     USBPacket usb_packet;
>     uint8_t usb_buf[8192];
>     uint32_t async_td;
>     bool async_complete;
> 
>     void (*ohci_die)(struct OHCIState *ohci);
> } OHCIState;
> 
> Then everything in hcd-ohci seems to reuse ohci->usb_packet and I wonder if
> it can happen that it's overwritten while an async packet is still using it.

Plausible theory.  That also nicely explains why you need traffic on two
endpoints at the same time to trigger it.

> In any case to both fix the device model and to avoid this possible problem
> described above it seems we would need to ditch the packet and async_td
> fields from OHCIState and move them to the endpoint to allow one active
> packet per endpoint.

Either that, or maintain a linked list of packets.

> We can get the endpoint from a packet and from ohci so
> I wonder if we can get the active packet from ep->queue (and how to do that)

I think ohci never looks beyond the active td so there should never be
more than one packet on the list.

HTH,
  Gerd


