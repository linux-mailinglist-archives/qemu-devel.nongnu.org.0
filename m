Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8892F3086CB
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 09:04:46 +0100 (CET)
Received: from localhost ([::1]:38478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Olp-0001yr-L3
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 03:04:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l5Okc-0001Xh-Am
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 03:03:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l5Oka-0006Gm-Te
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 03:03:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611907408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=406r24dzyv6vW1KErA51cQW3KADx1worSm0ysAHctjk=;
 b=IPuBv0IFrVN6hmwNWNIto5iRXOwVMSOTd68u3ovVi1Kp1NXBUW8CC3uZafQXaBmTryjcR+
 +5qgVBdyoQo08LzaGaM17PoerVslKY4kSkJi5o26c0MK2GrPFMigcm/ER1yKVjUj1YZRz0
 ewqxwI38GIA+OjQ30klbMiaazCkuJ0I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489--ozV4IelNYKmatwp-CpgLw-1; Fri, 29 Jan 2021 03:03:26 -0500
X-MC-Unique: -ozV4IelNYKmatwp-CpgLw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 680E2107ACE3
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 08:03:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 323E171C8D;
 Fri, 29 Jan 2021 08:03:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3511318000A2; Fri, 29 Jan 2021 09:03:23 +0100 (CET)
Date: Fri, 29 Jan 2021 09:03:23 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Christophe de Dinechin <cdupontd@redhat.com>
Subject: Re: vnc clipboard support
Message-ID: <20210129080323.xuvokq5kytoomx6j@sirius.home.kraxel.org>
References: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
 <C26A91E6-A5AE-4258-A470-91B6B5BC7C7F@redhat.com>
MIME-Version: 1.0
In-Reply-To: <C26A91E6-A5AE-4258-A470-91B6B5BC7C7F@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> >  (1) Have some guest agent (spice does it that way).
> >      Advantage: more flexible, allows more features.
> >      Disadvantage: requires agent in the guest.
> 
> What about running the option to relay data to a VNC server in the
> guest if there is one running? In other words, using an existing
> VNC server as an agent, with the option of having a stripped-down,
> clipboard only VNC server as a later optimization.

Well, if you run Xvnc in the guest anyway why use the qemu vnc server
in the first place?

take care,
  Gerd


