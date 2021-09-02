Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE8E3FE936
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 08:24:50 +0200 (CEST)
Received: from localhost ([::1]:34126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLg9Y-0001AK-T2
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 02:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLg7e-0007mZ-Ob
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 02:22:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLg7a-0000Zd-Rx
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 02:22:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630563764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mp0qCh3P3bMHVJjkCpxtfEFQT99q/C3Vg3rhE99+Vw0=;
 b=EIuCV1JhL1Qah17LbiNJa4AZ8M96PhIkCUprdKIJDdGoFxA98TRddoYLM969JG8Aku/zVf
 sN+JoQoFcPq2cY38LiFH0slsm1aIcARHRhW3Fa+hXZTdlXUEgC3khkKXZ6Hg9oy1P4zmA1
 T1unDuc/xigDXGvk6LVVrMKqoEvZzZ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-VPiq7zcpPZirkBWtqjJsyA-1; Thu, 02 Sep 2021 02:22:42 -0400
X-MC-Unique: VPiq7zcpPZirkBWtqjJsyA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E6DE107ACC7;
 Thu,  2 Sep 2021 06:22:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B921E7771A;
 Thu,  2 Sep 2021 06:22:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0A82918000AE; Thu,  2 Sep 2021 08:22:32 +0200 (CEST)
Date: Thu, 2 Sep 2021 08:22:32 +0200
From: "kraxel@redhat.com" <kraxel@redhat.com>
To: VintagePC <vintagepc404@protonmail.com>
Subject: Re: USB-MSD non-functional after merging v5.1 to v6.x (seems to be
 internal USB stack issue?)
Message-ID: <20210902062232.uau63uq53akr6snr@sirius.home.kraxel.org>
References: <HiU5xYXWuIPVg8tuVKzH1LTrKtKSBr01C6h_-uUbJ720IWY8SO1Bna1_-ak0HWraabqIa-hkGUoxeG2aQn6v7WAy1gnDxq9b_tklE0dGRYc=@protonmail.com>
MIME-Version: 1.0
In-Reply-To: <HiU5xYXWuIPVg8tuVKzH1LTrKtKSBr01C6h_-uUbJ720IWY8SO1Bna1_-ak0HWraabqIa-hkGUoxeG2aQn6v7WAy1gnDxq9b_tklE0dGRYc=@protonmail.com>
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
Cc: "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> I decided to bisect the merge in order to identify the commit that causes the issue - and much to my surprise, it is this particular commit:
> https://github.com/qemu/qemu/commit/bbd8323d3196c9979385cba1b8b38859836e63c3

Hmm, that is rather strange indeed.

> Given this doesn't seem to be anything more than a relocation of
> declarations (and I don't even use any of these types directly in my
> code), this would seem to suggest an internal issue in linking or
> memory initialization. I'm happy to assist in debugging this where I
> can but I'm hoping someone more knowledgeable about the QEMU USB
> innards might be able to point me to an area to start digging since
> the change seems entirely orthogonal to the actual problem and could
> be just about anywhere.

Try run qemu with valgrind to see if there is any memory corruption?

> I've been told this problem is not unique to my own development setup,
> and a cursory investigation reveals one of the symptoms is a
> divergence in the size of the incoming USB packets.

Is this reproducable on master branch somehow?

> (I'm hoping to set
> up a more detailed packet capture when I have more spare time this
> weekend).

Oh, that is easy, all usb devices have a pcap=<file> property to write
out traces which you can then open in wireshark.

HTH,
  Gerd


