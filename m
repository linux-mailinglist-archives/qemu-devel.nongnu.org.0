Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A983323EB
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 12:26:43 +0100 (CET)
Received: from localhost ([::1]:41250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJaVe-00011Y-TV
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 06:26:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJaTV-0008WE-J8
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 06:24:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJaTT-0003NP-Hd
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 06:24:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615289066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LUAUBG4xoHAMVuF1pHxsvjyDOpfJvsKlrG3QFHPv5GM=;
 b=IwUS6qXAvKMiwkGJH4FfssO0dEqSv6FwcNinO6qzVE+aO39lnseRJrmc/CD/2eAwzJy4c+
 aA/1rFQtCU0rl2FtvUrLO2X4oDFOg3kKFmlnjow6WmnHhBHnnYGKZZJJKzlhfPOVmJZrhE
 s2fXsAYHGgFff/1TpvdjVB7jdHI0LjI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-dAPK-ib1MAmZxXE1-B0EuQ-1; Tue, 09 Mar 2021 06:24:24 -0500
X-MC-Unique: dAPK-ib1MAmZxXE1-B0EuQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD20F817468;
 Tue,  9 Mar 2021 11:24:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-41.ams2.redhat.com
 [10.36.113.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94FD66267E;
 Tue,  9 Mar 2021 11:24:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2112718000A2; Tue,  9 Mar 2021 12:24:22 +0100 (CET)
Date: Tue, 9 Mar 2021 12:24:22 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] ui/cocoa: Clear modifiers whenever possible
Message-ID: <20210309112422.glxym6fhj7i7d5gq@sirius.home.kraxel.org>
References: <20210305121909.65249-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210305121909.65249-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 05, 2021 at 09:19:09PM +0900, Akihiko Odaki wrote:
> ui/cocoa does not receive NSEventTypeFlagsChanged when it is not active,
> and the modifier state can be desynchronized in such a situation.
> 
> [NSEvent -modifierFlags] tells whether a modifier is *not* pressed, so
> check it whenever receiving an event and clear the modifier if it is not
> pressed.
> 
> Note that [NSEvent -modifierFlags] does not tell if a certain modifier
> *is* pressed because the documented mask for [NSEvent -modifierFlags]
> generalizes left shift and right shift, for example. CapsLock is the
> only exception. The pressed state is synchronized only with
> NSEventTypeFlagsChanged.
> 
> This change also removes modifier keys from keycode map. If they
> are input with NSEventTypeKeyDown or NSEventTypeKeyUp, it leads to
> desynchronization. Although such a situation is not observed, they are
> removed just in case.

Have you noticed / looked at ui/kbd-state.c?

This provides a bunch of helper functions to track key and modifier
state.  The other UIs used to have their own keystate tracking too,
but most switched over meanwhile.  Nobody did it for cocoa yet, but
looking at your changes I suspect at the end it might be easier to
switch over cocoa to the shared too instead of trying to fix the
private implementation ...

take care,
  Gerd


