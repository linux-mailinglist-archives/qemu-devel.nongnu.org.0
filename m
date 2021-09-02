Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5825E3FEECE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:37:45 +0200 (CEST)
Received: from localhost ([::1]:44570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLmuW-0007ob-DE
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLmeo-0002ib-D8
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:21:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLmel-0003iy-LW
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:21:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630588885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KxmgR2ozc8HEAmR+gqn1jYxhvvHWrSAUXlkyJKHLjxk=;
 b=X/DMTaYJL3kBIvwJDCaFFzR/XBOgy/Pj0AeoSFyssGTGCVIlHWXzVPb02SqjzNDdqZJXXn
 8e4AP4xn6B9359ERN3QcH6g+xuZg87cVagd9z3yvjXxIZgkaNQ11iYi4OdxS6d03s+l8Ps
 +3Xrn9Y5PYIUZlrduo6lXn+sDDNshX4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-WQM06qBtMR2N7zDika6rpQ-1; Thu, 02 Sep 2021 09:21:24 -0400
X-MC-Unique: WQM06qBtMR2N7zDika6rpQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF31F800471
 for <qemu-devel@nongnu.org>; Thu,  2 Sep 2021 13:21:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8864E60E1C;
 Thu,  2 Sep 2021 13:21:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DD04B18000AE; Thu,  2 Sep 2021 15:21:21 +0200 (CEST)
Date: Thu, 2 Sep 2021 15:21:21 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2 3/3] softmmu/vl: Deprecate the -sdl and -curses option
Message-ID: <20210902132121.pirv3hhpk7xgzgwx@sirius.home.kraxel.org>
References: <20210825092023.81396-1-thuth@redhat.com>
 <20210825092023.81396-4-thuth@redhat.com>
 <CABgObfb8GHK0F=GCmDtaB=RqZT9+JnG+RRfNK+4XQ-ofoOxumA@mail.gmail.com>
 <a03ba523-ac40-3090-442e-7cc38022a2cc@redhat.com>
 <YTCuQB5dWMhYC3fW@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YTCuQB5dWMhYC3fW@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Armbruster, Markus" <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> There's also the elephant in the room "-vnc" which has never been mapped
> into -display, but which is also one of the most widely used options for
> display backends :-(

Other way around, -display vnc should be dropped.  -display is about
local displays, and there can be only one instance.  -vnc / -spice
enable remote access, and this can be done in addition to a local
display.

not possible:
 -display gtk + -display sdl

possible:
 -display gtk + -vnc
 -display gtk + -vnc + -spice
 -display none + -vnc + -spice

take care,
  Gerd


