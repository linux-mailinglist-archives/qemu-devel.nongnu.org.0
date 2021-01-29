Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92754308907
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 13:21:50 +0100 (CET)
Received: from localhost ([::1]:55730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5SmZ-0004D3-Oc
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 07:21:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l5SH5-0000lA-8Z
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:49:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l5SGz-0002HO-LP
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:49:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611920948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+J61+fE0ka76Ot4mKQgM4jdn0gsAMDeFSYAsm93JTgI=;
 b=NE1BYfytX1Ef2sD9AmnDDFWkaCStQ7TgD7H06QSFdyLDp4+0+RUm2ZfGJ3HYWwb3H7+rZt
 Wc7dbVRq73qzauUJGYAjle96E6FFD82pKAJ9I/JR11ogiD8ZQboy//hH0BPY4QLzDuKtTT
 0Ksgm2TRVyXC9mJtQ7H8DgySsRo+IiA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-CW5nlrkIPz2hQNXvhz3dhA-1; Fri, 29 Jan 2021 06:49:06 -0500
X-MC-Unique: CW5nlrkIPz2hQNXvhz3dhA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AA70911E3
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 11:49:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 142FD5C1B4;
 Fri, 29 Jan 2021 11:49:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1AB3A18000A2; Fri, 29 Jan 2021 12:49:03 +0100 (CET)
Date: Fri, 29 Jan 2021 12:49:03 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Christophe de Dinechin <cdupontd@redhat.com>
Subject: Re: vnc clipboard support
Message-ID: <20210129114903.nh4vll2fexdigusc@sirius.home.kraxel.org>
References: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
 <C26A91E6-A5AE-4258-A470-91B6B5BC7C7F@redhat.com>
 <20210129080323.xuvokq5kytoomx6j@sirius.home.kraxel.org>
 <8E05F8C9-A60D-45A9-AFCB-79D866F57660@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8E05F8C9-A60D-45A9-AFCB-79D866F57660@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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

  Hi,

> - What I'm suggesting is that qemu-vnc could then switch to simply
> relaying VNC traffic to that in-guest server. You'd get the smart update
> algorithm that Apple has put in place to deal with transparency and the
> like, as well as a level of guest OS integration that would otherwise be
> much harder to replicate.

Ok, so basically add a vnc proxy mode and allow switching between
internals server and proxy mode (automatically if possible, or
manually).

> If you don't have it, you fallback to virtual keystrokes, which you can't
> dispense with because of the early boot case, but which will at best
> deal with simple ASCII (making that work with a clipboard containing
> tabs and Control-C/Control-V characters is left as an exercise for the
> reader  ;-)

Well, even simple ascii is tricky.  How do you send 'z', as KEY_Z or as
KEY_Y ?

> Finally, an optimization I alluded to is to have an agent which is basically
> a stripped-down VNC server dealing with only the clipboard aspect, and
> that is your agent. In other words, you don't' invent yet another protocol,
> but you furiously copy-paste the existing VNC code.

Third mode: proxy only clipboard messages.

> Hope this sounds a bit less crazy explained that way…

Well, I can't see a way to make all that work nicely fully automatic ...

take care,
  Gerd


