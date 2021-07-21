Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D283D11EE
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 17:06:45 +0200 (CEST)
Received: from localhost ([::1]:51040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Do4-0007aq-5E
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 11:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6DmZ-00069z-SO
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 11:05:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6DmV-0006Eo-Dv
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 11:05:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626879904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iVa/a9dEsDvb2SH7s0k4MRSBfxxtyzuxayGLXSmM+WY=;
 b=DbX9Fcwaa1fBTeaOCb0Skw0RbuxqtCm9NKtSUcHg6xrxcULsYV90uc0v4dD98yfdA2d12/
 zDZDzTRWtFYUKh0qXlLBJWxaVzhXwBxIoOE1QcJE817ebCwslRRzT3kyv7TK7YIGpgPlUY
 RIsBgP9vWaLuR1+KboG/Zn1Z8GlK1YE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-0SS0RagVMXaKJsld9qi6aA-1; Wed, 21 Jul 2021 11:05:01 -0400
X-MC-Unique: 0SS0RagVMXaKJsld9qi6aA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D2DC1084F4B;
 Wed, 21 Jul 2021 15:05:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F243B1970F;
 Wed, 21 Jul 2021 15:04:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 69A3518000B2; Wed, 21 Jul 2021 17:04:58 +0200 (CEST)
Date: Wed, 21 Jul 2021 17:04:58 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: Re: vulkan support in qemu with virgil
Message-ID: <20210721150458.p3rt4mtg5igwxsjv@sirius.home.kraxel.org>
References: <22cb9b75-b29b-d824-1327-13092b5a8da9@collabora.com>
MIME-Version: 1.0
In-Reply-To: <22cb9b75-b29b-d824-1327-13092b5a8da9@collabora.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Cc: qemu-devel@nongnu.org, Vivek Kasireddy <vivek.kasireddy@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 21, 2021 at 03:09:21PM +0200, Tomeu Vizoso wrote:
> Hi all,
> 
> At Collabora we have started looking at Vulkan support in QEMU with Virgil.
> 
> We have seen the work that Vivek has submitted to support the new virtio-gpu
> BLOB API (thanks!) and have identified a few holes that are still needed for
> Vulkan support.
> 
> We would like to know if anybody else is working on Vulkan support or on
> common tasks such as host-side blobs, CONTEXT_INIT, CROSS_DEVICE,
> HOST_VISIBLE, venus capsets, a new DisplayChangeListenerOps implementation,
> etc.

I'm not aware of anyone working on this in qemu specifically.
The crosvm guys are working on it, not sure what the status is.

take care,
  Gerd


