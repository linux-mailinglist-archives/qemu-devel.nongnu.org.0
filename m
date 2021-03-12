Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C071F338A66
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:41:04 +0100 (CET)
Received: from localhost ([::1]:39290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKfE7-00070A-Q4
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:41:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKetN-0007Fx-SN
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:19:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKetM-0004cK-5f
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:19:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615544375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xsqoq+5fLaJaBSusGTNNswg6sbrgi93veptlot0bqsU=;
 b=UNN6feAo8FE1in/cw4RBja1Ss6WKDI7gpdx2pHS/XSa6gWmDRVMAZR5N0XteG1EYVBkbB4
 MI/diKQcZI5Sfyklu+w/li8RNaB5wdZSBeVqEwUQtc3XC3E9SVuCNsXl1yxFoJyVl+jljY
 QjNLoJGpfN55pOgWxWpVOQHA8f+FB20=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-SJwgVWqYOLu9v8aRrxqIqg-1; Fri, 12 Mar 2021 05:19:31 -0500
X-MC-Unique: SJwgVWqYOLu9v8aRrxqIqg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98797CC625;
 Fri, 12 Mar 2021 10:19:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CC141002388;
 Fri, 12 Mar 2021 10:19:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C633A18000B4; Fri, 12 Mar 2021 11:19:28 +0100 (CET)
Date: Fri, 12 Mar 2021 11:19:28 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v2] ui/cocoa: Comment about modifier key input quirks
Message-ID: <20210312101928.bqp2mx6zag2krg5t@sirius.home.kraxel.org>
References: <20210311151203.21902-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210311151203.21902-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Konstantin Nazarov <mail@knazarov.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 12, 2021 at 12:12:03AM +0900, Akihiko Odaki wrote:
> Based-on: <20210310042348.21931-1-akihiko.odaki@gmail.com>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>

Well, the comments should not describe what the code is doing, that is
usually pretty clear from reading the code.  The comment should say
*why* the code is doing that, i.e. describe the problem we have to deal
with.

In this case specifically the NSEventTypeFlagsChanged event quirks we
have to deal with:

  (1) we get the keyCode but *not* whenever it was a up or down event.
  (2) we get the modifierFlags but we have only one bit for both shift
      keys so you can't tell whenever the left or right or both shift
      keys are down.

We handle this by using the modifierFlags plus our own state tracking to
generate "up" events, and we have to check both keyCode and
modifierFlags for "down" events.

> -    // emulate caps lock keydown and keyup
> +    /*
> +     * If -[NSEvent modifierFlags] has NSEventModifierFlagCapsLock,
> +     * toggle the current CapsLock state by firing "up" and "down" events in
> +     * sequence.
> +     */

Not very helpful.

> +    /*
> +     * Check for other flags of -[NSEvent modifierFlags].
> +     *
> +     * If a flag is not set, fire "up" events for all keys which correspond to
> +     * the flag. Note that "down" events are not fired here because the flags
> +     * checked here do not tell what exact keys are down.
> +     *
> +     * These operations are performed for any events because the modifier state
> +     * may change while the application is inactive (i.e. no events fire) and
> +     * we want to detect it as early as possible.

Ah, right, (3) for the list above: no updates for inactive apps.

> +     * Up events corresponding to a modifier flag update the current modifier
> +     * state tracked with QKbdState but they are not fired unless all keys which
> +     * match to the flag are up. Therefore, it cannot synchornize Cocoa and
> +     * QkbdState if one of the keys is down. It is still nice that any
> +     * desynchronization can be fixed by completely leaving your hands from the
> +     * keyboard.
> +     */

Better, but description of the NSEventTypeFlagsChanged event issues
should be added to make the motivation for that logic clear.  Feel free
to cut+paste from my lines above.

take care,
  Gerd


