Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7043339B4
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:12:27 +0100 (CET)
Received: from localhost ([::1]:45684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJvpL-0000Jc-0X
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:12:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJvgR-0003lF-A8
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:03:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJvgJ-0001ps-Rq
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:03:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615370585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U8/wTnYkW/KqeL64O+R4FJg2PbyDC6aA1fyRAvUvRhU=;
 b=bINj53G6dSGgxf5Ekmbi9NoOumakKC3JXq/0Q+wGNQXCQT3UCYKeANQhtDqySL8mk1JD+9
 HTrCFTK7KF3Hz1Q74kKXZT+If3akkXe3PXRS2qAIsYbMU/HE2Y7EtRFF8BelMdN+LSdYw5
 jMlf053jWEkcNB0hb4DsY7EnnfEJgxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-FbNuxH_ePtWq_3eCEdOPWA-1; Wed, 10 Mar 2021 05:03:01 -0500
X-MC-Unique: FbNuxH_ePtWq_3eCEdOPWA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50DA11005D45;
 Wed, 10 Mar 2021 10:03:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 127AA5945E;
 Wed, 10 Mar 2021 10:03:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D007A18000AC; Wed, 10 Mar 2021 11:02:56 +0100 (CET)
Date: Wed, 10 Mar 2021 11:02:56 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] usb: Un-deprecate -usbdevice (except for -usbdevice
 audio which gets removed)
Message-ID: <20210310100256.ythe5a7smjwrozrf@sirius.home.kraxel.org>
References: <20210309165035.967853-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210309165035.967853-1-thuth@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 09, 2021 at 05:50:35PM +0100, Thomas Huth wrote:
> When trying to remove the -usbdevice option, there were complaints that
> "-usbdevice braille" is still a very useful shortcut for some people.
> Thus we never remove this option. Since it's not such a big burden to
> keep it around, and it's also convenient in the sense that you don't
> have to worry to enable a host controller explicitly with this option,
> we should remove it from he deprecation list again, and rather properly
> document the possible device for this option instead.
> 
> However, there is one exception: "-usbdevice audio" should go away, since
> audio devices without "audiodev=..." parameter are also on the deprecation
> list and you cannot use "-usbdevice audio" with "audiodev".
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Want me pick this up or send a pull yourself?
In case of the latter:

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd


