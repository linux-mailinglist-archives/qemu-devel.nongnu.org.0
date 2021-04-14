Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD4D35F105
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 11:47:14 +0200 (CEST)
Received: from localhost ([::1]:60216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWc77-00024e-H4
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 05:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lWc5W-0001I1-1T
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 05:45:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lWc5S-0004Oi-BD
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 05:45:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618393527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3UG1rqIsXMKmeAz/MNqfWNq6iSitU8OvytV5dMtVHC8=;
 b=egeDm0sQsRhvR+OUJQ17HEA0iPAAPLmOQKPU9nqDOfmKIoxQvCH3zlJLNQb9nYYymMt8j1
 ZlEjgcNTaNyWxVQ0006KSWPyh0kSaXrjI/SCH80R9t7nLmXMBd4iPwROzglP2lAkDkaAAL
 AHSOBvg1QwdaOIYYM8ldUAt6QOCNHBY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-s2teuGkSMFud7Whxxm1K_w-1; Wed, 14 Apr 2021 05:45:23 -0400
X-MC-Unique: s2teuGkSMFud7Whxxm1K_w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6669B8189C8;
 Wed, 14 Apr 2021 09:45:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-165.ams2.redhat.com
 [10.36.114.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 50DAC6F99E;
 Wed, 14 Apr 2021 09:45:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 615B81800936; Wed, 14 Apr 2021 11:45:02 +0200 (CEST)
Date: Wed, 14 Apr 2021 11:45:02 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [PATCH 00/11] Add support for Blob resources feature
Message-ID: <20210414094502.krykle6fcv2ehkvg@sirius.home.kraxel.org>
References: <20210331031001.1564125-1-vivek.kasireddy@intel.com>
 <58a1404f12d9434bae1d336f6553279e@intel.com>
MIME-Version: 1.0
In-Reply-To: <58a1404f12d9434bae1d336f6553279e@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, "Zhang,
 Tina" <tina.zhang@intel.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Kim, Dongwon" <dongwon.kim@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Any other ideas as to how to eliminate that Blit cleanly?

Well, "cleanly" pretty much implies "supported by toolkit".

gtk glarea for example sets up a framebuffer and expects the application
render to that framebuffer.  So qemu glarea code does a fb-to-fb blit.

Other reasons are scaling and cursor rendering.  Not all reasons apply
to all UIs.  I think when using spice qemu doesn't blit (not fully sure
what happens inside spice-server), but it could very well be that the
spice-client does the blit instead, i.e. we just shift the issue to
another place ...

take care,
  Gerd


