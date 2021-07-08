Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7853C1BFC
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 01:23:38 +0200 (CEST)
Received: from localhost ([::1]:36234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1dMn-00014p-7G
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 19:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m1dLX-0000O7-TW
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 19:22:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m1dLU-0005za-7J
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 19:22:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625786534;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=92UxfcIOqBuc+OBWcIxTQv0cR+knRtgHXpbus9p6rDk=;
 b=OIXIYcCpVjBJ6tEFPTRgsSOkfftWLpeZIVkP6o2u501FRp+AAAJzCM48F5Fw2uKIMa+3XR
 ndOktm6sPN2TQhhiMCF0rPRcueciiutxenY1EMADOZ3uY5+3Anmaj89F4XDRx6PN6h5B3G
 RwjuQ7EWaF8msYsL3kR/rDyuPgsB2v4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430--K65nn4kNGyLWuuP1eMQlQ-1; Thu, 08 Jul 2021 19:22:08 -0400
X-MC-Unique: -K65nn4kNGyLWuuP1eMQlQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2BB6801107;
 Thu,  8 Jul 2021 23:22:07 +0000 (UTC)
Received: from redhat.com (ovpn-112-17.ams2.redhat.com [10.36.112.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 528615D6A8;
 Thu,  8 Jul 2021 23:22:05 +0000 (UTC)
Date: Fri, 9 Jul 2021 00:22:02 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cole Robinson <crobinso@redhat.com>
Subject: Re: [PATCH] Move qemu.sasl to contrib/
Message-ID: <YOeIh9lbc29E2Xs3@redhat.com>
References: <d1a1e265dd846de6ca40406300d91cecfba69ef8.1625769570.git.crobinso@redhat.com>
 <YOdHyyEGzWzMWC0H@redhat.com>
 <CAFEAcA-NER3jDVoTnZN4T=gtzOTOmWvUMNOcPikjcj6Ay3NQJg@mail.gmail.com>
 <c4b6187f-49df-b94a-cad9-2773392671f3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c4b6187f-49df-b94a-cad9-2773392671f3@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 08, 2021 at 04:49:24PM -0400, Cole Robinson wrote:
> On 7/8/21 3:18 PM, Peter Maydell wrote:
> > On Thu, 8 Jul 2021 at 20:14, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >>
> >> On Thu, Jul 08, 2021 at 02:39:57PM -0400, Cole Robinson wrote:
> >>> It's not installed in any way, so seems like contrib/ material
> >>
> >> Not really.
> >>
> >> Contrib is stuff that is included on an ad-hoc basis with no
> >> commitment to support and no guarantee that it is working at
> >> all.  Yes, there is some stuff in contrib/ that doesn't
> >> belong there based on this definition, and should be moved
> >> out.
> > 
> > More generally, I would like to see us get rid of contrib/
> > entirely. We should either support stuff (and have it in
> > sensible places in the source tree) or kick it out.
> > 
> 
> qemu.sasl to ui/ dir then?

Yeah, probably best

> Do you think we should install qemu.sasl to /etc/sasl2/qemu.conf? Its
> what Fedora/RHEL packaging does by hand for qemu. And what libvirt does
> for its equivalent config file

Yes.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


