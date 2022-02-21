Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 753BD4BD97B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 12:44:32 +0100 (CET)
Received: from localhost ([::1]:39120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM77H-00051P-I3
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 06:44:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nM75U-0003XR-EU
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 06:42:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nM75R-0005mU-Tr
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 06:42:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645443756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b/XTfEJfwOoR7DA6XRwScYxk3nHg0hdE16NoQpHPX/k=;
 b=YDxZiEmXdSHhtuDDyZ9OU2eqTfo3iti6w/A+Gpre/YTMLbBXkRzpTcH/qVBOLqUVYzYRW4
 aJkN0FMDjRJv9NOivw878GR3ns5hot5V8ZRXGioiAhtnRVEVeZ6pb2KZ9gc427q6eSNamH
 CuApWUEI5BrBrBkVdFpZNgA7RbKcjl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-Tv_TV-vZOU2YdD-qzy5vOw-1; Mon, 21 Feb 2022 06:42:33 -0500
X-MC-Unique: Tv_TV-vZOU2YdD-qzy5vOw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A83C8042F6;
 Mon, 21 Feb 2022 11:42:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E91816E1E8;
 Mon, 21 Feb 2022 11:42:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 25BE71800094; Mon, 21 Feb 2022 12:42:30 +0100 (CET)
Date: Mon, 21 Feb 2022 12:42:30 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: initiating reboot/shutdown for a microvm machine?
Message-ID: <20220221114230.qyxwnvkbaqfwc5ws@sirius.home.kraxel.org>
References: <57e95b59-54ba-deb6-5b4e-8fdd5efde3a0@msgid.tls.msk.ru>
MIME-Version: 1.0
In-Reply-To: <57e95b59-54ba-deb6-5b4e-8fdd5efde3a0@msgid.tls.msk.ru>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Feb 19, 2022 at 02:50:34PM +0300, Michael Tokarev wrote:
> Hi!
> 
> In the ol'good days, I used Ctrl-Alt-Delete sequence to initiate a guest
> shutdown. But with microvm, guest does not see this event anymore.
> What is the good way to tell a guest vm to shut down from the outside,
> besides running full-blown guest agent?

Sending a shutdown request via acpi should work just fine
(machine/powerdown in the gtk ui, there a monitor command for that too).

microvm doesn't have a ps2 keyboard, so if you want send ctrl-alt-del
instead you have to add some keyboard device (virtio or usb) so the
guest has a chance to receive the input event ;)

take care,
  Gerd


