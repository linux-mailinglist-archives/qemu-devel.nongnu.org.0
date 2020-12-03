Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1431A2CCFC3
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 07:48:04 +0100 (CET)
Received: from localhost ([::1]:56688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkiPK-0004o4-Nj
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 01:48:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkiO1-0004IN-Af
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 01:46:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkiNy-0007C0-Bn
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 01:46:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606977997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M58hhMZueVg3WBMGfU5HlrFXe5pTf8xNFzXOaiVsByw=;
 b=ffJKnbHOpBaKVTe8/R0vkTPpzhIFyMJn/7a9PTLFJRqwR8bCMVgpL7HnBodIfgIwbHAPQe
 6j+bhfK3nNO0TK1quVyTbj8c+FEUxJA1Yqf+44W7LepHxXGM0jiaFdM89xtB3v67qJi+9D
 1oxtrdUM7qav+6wRfFqcIOOwaJk5FMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-Gtb5x-0GNyisjjLgyW6NcQ-1; Thu, 03 Dec 2020 01:46:35 -0500
X-MC-Unique: Gtb5x-0GNyisjjLgyW6NcQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88D228030D6;
 Thu,  3 Dec 2020 06:46:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A94655D6AC;
 Thu,  3 Dec 2020 06:46:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AB2EC11AB8; Thu,  3 Dec 2020 07:46:29 +0100 (CET)
Date: Thu, 3 Dec 2020 07:46:29 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <20201203064629.qbhbzzizuyebdbgd@sirius.home.kraxel.org>
References: <20201201193528.GC6264@merkur.fritz.box>
 <3449b5d6-d094-84c8-a0ea-4cd25364db2d@redhat.com>
 <20201201220854.GC3836@habkost.net>
 <17afbbfe-209f-e4b2-e9e1-b50abe1fce3c@redhat.com>
 <20201202125124.GD3836@habkost.net>
 <69dff34f-d87b-3a8d-640f-35f6bf5db75c@redhat.com>
 <20201202135451.GE3836@habkost.net>
 <20201202151713.GE16765@merkur.fritz.box>
 <20201202160554.GG3836@habkost.net>
 <20201202173506.GH16765@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20201202173506.GH16765@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, libvir-list@redhat.com, armbru@redhat.com,
 jasowang@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> It would be much nicer to do the wrapper the other way round, i.e.
> setting properties before the device is realized would update a
> configuration struct and realize would then call .create() with that
> struct. To me, this sounds much harder, though also a more useful state.

Well, in some places we already have separate config structs.  We have
NICConf for example, which is typically used like this:

	struct USBNetState {
	   USBDevice dev;
	   [ ... ]
	   NICConf conf;
	   [ ... ]
	};

and

	static Property net_properties[] = {
	    DEFINE_NIC_PROPERTIES(USBNetState, conf),
	    DEFINE_PROP_END_OF_LIST(),
	};

So I think we could:

  (1) move *all* properties into structs.
  (2) generate those structs from qapi schemas.
  (3) generate Property lists (or functions with
      object_class_property_add_*() calls) from qapi
      schema.

We could then convert devices one-by-one without breaking anything
or needing two code paths essentially doing the same thing in two
different ways.

take care,
  Gerd


