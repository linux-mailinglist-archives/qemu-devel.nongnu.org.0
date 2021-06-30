Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B235D3B809E
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 12:08:31 +0200 (CEST)
Received: from localhost ([::1]:33242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyX8w-00066M-Pa
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 06:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lyX82-0005Ps-Ge
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 06:07:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lyX7x-0001dv-UJ
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 06:07:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625047648;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=LNXIE9a9QEI5ew0jQk+yzvwl1KCd8V7H9GVUJiBV7u4=;
 b=etfSwfJuyqN91fOvOEW7fCjKbxr+SLEstxHtOky3NQh1pzubfQROpYrLlf22IRz7OMHRN5
 hZp5S46rJrKJZb1zYmQRCW2dRLP1Cy54/LYO03x0HSu+SM13kT81+EBaToChmDskmZoU38
 cvRVnMdui+kuD5EGt1cxR90YnRF+WbI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-9zmEFkGdNfWam_hcs4PIpw-1; Wed, 30 Jun 2021 06:07:27 -0400
X-MC-Unique: 9zmEFkGdNfWam_hcs4PIpw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2AFF1019982;
 Wed, 30 Jun 2021 10:07:25 +0000 (UTC)
Received: from redhat.com (ovpn-114-116.ams2.redhat.com [10.36.114.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6F831A26A;
 Wed, 30 Jun 2021 10:07:17 +0000 (UTC)
Date: Wed, 30 Jun 2021 11:07:15 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] ui: Mark the '-no-quit' option as deprecated
Message-ID: <YNxCUw/hqJAEoP1G@redhat.com>
References: <20210630092127.374720-1-thuth@redhat.com>
 <CAFEAcA_XDvTxRHWE3TwP-hZk_DeS-AUCyv9-WZCYKE3zQtSU6Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_XDvTxRHWE3TwP-hZk_DeS-AUCyv9-WZCYKE3zQtSU6Q@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Libvirt <libvir-list@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 30, 2021 at 11:01:06AM +0100, Peter Maydell wrote:
> On Wed, 30 Jun 2021 at 10:22, Thomas Huth <thuth@redhat.com> wrote:
> >
> > It's just a cumbersome wrapper around the -display ...,window_close=off
> > parameter, so we should rather tell our users to use that instead.
> 
> This is an interesting definition of "cumbersome" -- personally
> I would say the long -display option is the cumbersome one :-)

I'd say the primary benefit of the new syntax is that it is obvious
that it only applies when using the SDL option. The '-no-quit' option
sonds like it ought to be applicable to any use of qemu, but isn't
actually once you read its description.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


