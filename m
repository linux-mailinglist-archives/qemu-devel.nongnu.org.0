Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1651933E9FF
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 07:42:40 +0100 (CET)
Received: from localhost ([::1]:56402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMPt9-0007mV-3u
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 02:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMPrG-0006RH-Iq
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:40:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMPrE-0007NZ-Gy
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:40:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615963239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TigrdA2NQDF4ZdusA8jWtlab3TS1Y6Mlbhn9v4GcICM=;
 b=QMnPypRPRexEVUKV9Fq+XDiopLwJtwaGfp2FwuTyDI4F7Tv/92PzgyofWY5fizeRWWj23o
 uzIpcXJs/J5JpZlAAEt0vwzMdLON1zJXgCsrcIGHIyMmg4LcuyKnAB+ltAb+JPBfjIb4m2
 w8akED04/r3XQt8FRgudKvdZBAfxO3M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-0u7iZrk7Mz64yPbYALOi2A-1; Wed, 17 Mar 2021 02:40:37 -0400
X-MC-Unique: 0u7iZrk7Mz64yPbYALOi2A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98B09107B768
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 06:40:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B06918A69;
 Wed, 17 Mar 2021 06:40:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 11B8D180038B; Wed, 17 Mar 2021 07:40:31 +0100 (CET)
Date: Wed, 17 Mar 2021 07:40:31 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 5/4] usb: Remove "-usbdevice ccid"
Message-ID: <20210317064031.hlluepc6h4trnkh7@sirius.home.kraxel.org>
References: <20210310173323.1422754-1-thuth@redhat.com>
 <20210311092829.1479051-1-thuth@redhat.com>
 <eee1a77f-d44a-d6f9-d706-6c8484a0a45f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <eee1a77f-d44a-d6f9-d706-6c8484a0a45f@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 17, 2021 at 07:04:12AM +0100, Thomas Huth wrote:
> On 11/03/2021 10.28, Thomas Huth wrote:
> > "-usbdevice ccid" was not documented and -usbdevice itself was marked
> > as deprecated before QEMU v6.0. And searching for "-usbdevice ccid"
> > in the internet does not show any useful results, so likely nobody
> > was using the ccid device via the -usbdevice option. Remove it now.
> 
> Any comments on this one? Shall we keep it? Or shall we remove it?

Queued.  ccid is not useful standalone[1], you need hook up something to
the ccid bus it provides, which is probably the reason why -usbdevice
ccid is not used in the wild.

take care,
  Gerd

[1] Well, it'll work fine, but the guest will only see a smartcard
    reader device without smardcard plugged in ...


