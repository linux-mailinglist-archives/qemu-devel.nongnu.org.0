Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 254493323FC
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 12:27:35 +0100 (CET)
Received: from localhost ([::1]:44090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJaWU-0002Fw-7T
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 06:27:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJaUJ-0000tS-79
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 06:25:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJaUE-0003uG-Ox
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 06:25:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615289112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3+EGOOJR1IIig3bg/8zzFxOv8VZiFbkFn9c7zuEEmL4=;
 b=aUJofmCoMGbgp7EdCUHy5N1TMpo0p15Urn3tXyQ945/2UumohrCyAf43lCljdU3+JVklbP
 soqj2WXV2g5ggDktuC/rBgPm3RMbqrMnIBtvdRmVgdv5Y8kr9x+lPOdGAqe1OwHwTqYXTc
 iLPc0FKELQOY4br/nsP18ikmzks7N+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-Cfmnh2R4PWy3PUcqIYKo1Q-1; Tue, 09 Mar 2021 06:25:10 -0500
X-MC-Unique: Cfmnh2R4PWy3PUcqIYKo1Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B24E8801503;
 Tue,  9 Mar 2021 11:25:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-41.ams2.redhat.com
 [10.36.113.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E0A860855;
 Tue,  9 Mar 2021 11:25:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0DB2E18000A2; Tue,  9 Mar 2021 12:25:08 +0100 (CET)
Date: Tue, 9 Mar 2021 12:25:08 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v4] ui/cocoa: Use kCGColorSpaceSRGB
Message-ID: <20210309112508.vhksco52jztjpaop@sirius.home.kraxel.org>
References: <20210305121304.65096-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210305121304.65096-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 05, 2021 at 09:13:04PM +0900, Akihiko Odaki wrote:
> kCGColorSpaceGenericRGB | Apple Developer Documentation
> https://developer.apple.com/documentation/coregraphics/kcgcolorspacegenericrgb
> > Deprecated
> > Use kCGColorSpaceSRGB instead.
> 
> This change also removes the legacy color space specification for
> PowerPC.

Added to UI queue.

thanks,
  Gerd


