Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5773336E53
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 09:55:49 +0100 (CET)
Received: from localhost ([::1]:33818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKH6i-0002LX-Qy
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 03:55:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKH4t-0001sb-C4
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 03:53:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKH4n-0001IK-94
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 03:53:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615452827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PGJxA5RMmoY3lkyIUx5BzvndPMIyt6d1ASEyY+v+K60=;
 b=dYLuZyGFJrgTMN7H7bdI2O5qJJeGMfvgdCRFueZ6dZJ8XjpgQVCnS2VNkMF2bxkj+dtZAl
 8lwdRRLqphrGKzHoSrZWEAW9yevDyYRDikBy+opYepm6DLgmzb2aYl21WAM4r/jos8EukI
 OObifwHXjsrEAXRerU6Jp7jzn0ELfQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-TFvpVB_fMDyh79IAFF-F4g-1; Thu, 11 Mar 2021 03:53:45 -0500
X-MC-Unique: TFvpVB_fMDyh79IAFF-F4g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27BF28B7D12;
 Thu, 11 Mar 2021 08:53:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5B02101F961;
 Thu, 11 Mar 2021 08:53:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2B92C180087E; Thu, 11 Mar 2021 09:53:33 +0100 (CET)
Date: Thu, 11 Mar 2021 09:53:33 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v3] ui/cocoa: Clear modifiers whenever possible
Message-ID: <20210311085333.s3ww3jrdqp5fkg3i@sirius.home.kraxel.org>
References: <20210310144602.58528-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210310144602.58528-1-akihiko.odaki@gmail.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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

  Hi,

> +            switch ([event keyCode]) {
> +                case kVK_Shift:
> +                    if (!!(modifiers & NSEventModifierFlagShift)) {
> +                        [self toggleKey:Q_KEY_CODE_SHIFT];
> +                    }

Ah, nice, this should get left-shift toggles while holding right-shift
right.

A comment describing the NSEventTypeFlagsChanged quirks would be nice to
make it easier to understand the logic of this code.  Can go as separate
patch, I'll add this to the UI queue.

thanks,
  Gerd


