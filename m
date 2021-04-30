Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5242B36F6DE
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 10:08:01 +0200 (CEST)
Received: from localhost ([::1]:49116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcOBr-0002Dt-Nc
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 04:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcO8V-0000tq-DG
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 04:04:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcO8P-0006G6-2Y
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 04:04:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619769860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XbsdPB3b/dBCAPUd2rf8A7phVYV+ihkX3+47lh36JrE=;
 b=E4OL5HcnLgEp3xtCwDQV8Zbsp74Y4iYdCmkYGOWgHoWTvloD017HtiDlkXFs6ITav4osgN
 gc4grJjRjJqE2YUWSxZGAksIrtkUhTL9JDdGH4WHwMBDby5pJKdQlhOn8vl5cPYPQ6rTPM
 qXSZk9ECL0Q4g39gxBrsH2G4lSqEWS4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-suQEqqRQPG6ccP_8nYnVhg-1; Fri, 30 Apr 2021 04:04:18 -0400
X-MC-Unique: suQEqqRQPG6ccP_8nYnVhg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 099A9107ACCA;
 Fri, 30 Apr 2021 08:04:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85DE860CD0;
 Fri, 30 Apr 2021 08:04:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 82CCA1800380; Fri, 30 Apr 2021 10:04:14 +0200 (CEST)
Date: Fri, 30 Apr 2021 10:04:14 +0200
From: 'Gerd Hoffmann ' <kraxel@redhat.com>
To: gustavo@noronha.eti.br
Subject: Re: [PATCH 2/2] ui/cocoa: add option to swap Option and Command,
 enable by default
Message-ID: <20210430080414.a7ee4ygiamd32ihg@sirius.home.kraxel.org>
References: <20210429234705.83206-1-gustavo@noronha.eti.br>
 <20210429234705.83206-3-gustavo@noronha.eti.br>
MIME-Version: 1.0
In-Reply-To: <20210429234705.83206-3-gustavo@noronha.eti.br>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: 'Peter Maydell ' <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 'Markus Armbruster ' <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> @@ -797,12 +806,22 @@ - (bool) handleEventLocked:(NSEvent *)event
>          qkbd_state_key_event(kbd, Q_KEY_CODE_CTRL_R, false);
>      }
>      if (!(modifiers & NSEventModifierFlagOption)) {
> -        qkbd_state_key_event(kbd, Q_KEY_CODE_ALT, false);
> -        qkbd_state_key_event(kbd, Q_KEY_CODE_ALT_R, false);
> +        if ([self isSwapOptionCommandEnabled]) {
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_META_L, false);
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_META_R, false);
> +        } else {
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_ALT, false);
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_ALT_R, false);
> +        }
>      }
>      if (!(modifiers & NSEventModifierFlagCommand)) {
> -        qkbd_state_key_event(kbd, Q_KEY_CODE_META_L, false);
> -        qkbd_state_key_event(kbd, Q_KEY_CODE_META_R, false);
> +        if ([self isSwapOptionCommandEnabled]) {
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_ALT, false);
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_ALT_R, false);
> +        } else {
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_META_L, false);
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_META_R, false);
> +        }
>      }

Wouldn't it be easier to swap the bits in the modifiers variable once
instead of having lots of isSwapOptionCommandEnabled checks in the code?

take care,
  Gerd


