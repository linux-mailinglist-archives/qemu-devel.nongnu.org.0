Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCADD3EA0F3
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 10:47:35 +0200 (CEST)
Received: from localhost ([::1]:51880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE6NC-00006E-Tn
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 04:47:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mE6I4-0005YE-PR
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 04:42:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mE6I3-0004uu-D3
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 04:42:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628757734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DCye+5FoC7TXqcme3JyaOjRE/lfNBlQKfA8so4Oyi54=;
 b=RYL/gPHjWq+aquJw/M9xOZEd5Is0wPOVgE7vfRbvjvMQq7Cm5MA7A7f+z3P13DHAXmYU4I
 CInOiWPJKZecUZDMh0a+iQ5ehlRBv0fT3WO6wMrsbgka7nFlG7uEJyI3glvCIy5BDLy/f5
 4AXZSdK9st393fsW0OSX+v0UtkI4hbw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-LKx39YPaMj67b4i2pC9M5A-1; Thu, 12 Aug 2021 04:42:13 -0400
X-MC-Unique: LKx39YPaMj67b4i2pC9M5A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C3768015C7;
 Thu, 12 Aug 2021 08:42:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC73A5C23A;
 Thu, 12 Aug 2021 08:42:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 785251800922; Thu, 12 Aug 2021 10:42:10 +0200 (CEST)
Date: Thu, 12 Aug 2021 10:42:10 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: clamky@hotmail.com
Subject: Re: [PATCH 3/7] MAINTAINERS: update audio entry.
Message-ID: <20210812084210.kbzoneze3izsrboa@sirius.home.kraxel.org>
References: <20210810083450.2377374-1-kraxel@redhat.com>
 <20210810083450.2377374-4-kraxel@redhat.com>
 <VE1P192MB073307355A0CA329534F9A49DEF79@VE1P192MB0733.EURP192.PROD.OUTLOOK.COM>
 <20210811052227.agdafmkwz7spbp5u@sirius.home.kraxel.org>
 <VE1P192MB0733ED7BB482A45E5768464CDEF89@VE1P192MB0733.EURP192.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <VE1P192MB0733ED7BB482A45E5768464CDEF89@VE1P192MB0733.EURP192.PROD.OUTLOOK.COM>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

> > On Tue, Aug 10, 2021 at 03:17:43PM +0300, clamky@hotmail.com wrote:
> >> Gerd Hoffmann <kraxel@redhat.com> writes:
> >> 
> >> Hell Gerd.
> >> 
> >> > New maintainer wanted. Downgrade status to "Odd Fixes" for now.
> >> 
> >> I can try to retake it.

Given your track record is zero contributions to qemu in recent years
I suggest you start getting involved in the development process as
reviewer.  Just send a patch adding a "R: Name <email>" line for
yourself to the MAINTAINERS file (best based on my pending pull
request to avoid conflicts).  scripts/get_maintainer.pl will Cc: you
on any audio-related patches then.

I'd recommend to open an gitlab.com account (unless you already have
one of course) so you can help triage bugs + issues.  You can also
easily run qemu CI then (just push a branch to a qemu repo fork).

HTH & take care,
  Gerd


