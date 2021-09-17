Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8DE40F2F3
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 09:16:23 +0200 (CEST)
Received: from localhost ([::1]:43182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR86f-0004BI-PR
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 03:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mR84c-0003Uh-So
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 03:14:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mR84a-0006kP-Dz
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 03:14:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631862848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=09dK/3DhcHQnOHNwcX8SlX+jZnYGaLmlpvltpHB/QZE=;
 b=LqlKU4RF0ezzgq49CmXFL7Zko/ISmrrYulCHejl3kTNWRk5rV3pyhXgsjjMf6LSYaf9mo5
 IIQjo7Z7M3iGJPEcLf3HQP/27U9pEdRcxWCqAabmLyseS8U+WPEIBXQyXW0mHGNc0pyfO6
 6+T8DOzJC3J5JSjjTA7ygq3QRQbfNYU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-9jBKljE_Ph2Hx1la0izlYw-1; Fri, 17 Sep 2021 03:14:07 -0400
X-MC-Unique: 9jBKljE_Ph2Hx1la0izlYw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1B55100F969;
 Fri, 17 Sep 2021 07:14:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 491C277F29;
 Fri, 17 Sep 2021 07:14:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 86C4218000A9; Fri, 17 Sep 2021 09:14:04 +0200 (CEST)
Date: Fri, 17 Sep 2021 09:14:04 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Jose R. Ziviani" <jziviani@suse.de>
Subject: Re: [PATCH 1/2] meson: introduce modules_arch
Message-ID: <20210917071404.efhv3tlnad2ezz3e@sirius.home.kraxel.org>
References: <20210917012904.26544-1-jziviani@suse.de>
 <20210917012904.26544-2-jziviani@suse.de>
MIME-Version: 1.0
In-Reply-To: <20210917012904.26544-2-jziviani@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> This variable keeps track of all modules enabled for a target
> architecture. This will be used in modinfo to refine the
> architectures that can really load the .so to avoid errors.

I think this is the wrong approach.  The reason why modules are
not loading is typically *not* the architecture, but a feature
or subsystem the device needs not being compiled in.  Often the
subsystem is a bus (pci, usb, ccw), but there are also other
cases (virtio, vga).

We can stick that into modinfo, simliar to module_dep() but for bits
provided by core qemu instead of other modules.  i.e. add something
along the lines of ...

	module_need(BUS_PCI);

... to the modules, store that in modinfo and check it before trying
to load.

That would also allow to remove hacks like commit 2dd9d8cfb4f3 ("s390x:
add have_virtio_ccw")

take care,
  Gerd


