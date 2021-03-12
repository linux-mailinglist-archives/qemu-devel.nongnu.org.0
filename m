Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18448338A9E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:54:35 +0100 (CET)
Received: from localhost ([::1]:44784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKfRC-0006NQ-5O
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:54:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKf9f-00086e-Uo
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:36:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKf9c-0006cS-Fc
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:36:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615545382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5trOxMHx3auZqbrk85LjDs1nVkGPkNcSIv87Zgnefis=;
 b=UCqImTI7h4I2DLKDtnIeETUAGHughCqLfffY4Z0JqyseaGfUTPSiOAWsAWOyH9CY407Wbt
 Pl/nk+p+R5ARFlB6VxZifFK2id9c2g4jc7Sh3fFiahjrlXdZHeoNgj9pja0Bmn69wPNM86
 eUBdStxoXt/Hh/Y4EWzE0UPpnoBT09g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-PahDJS13Oom6SRpaRmVGUQ-1; Fri, 12 Mar 2021 05:36:21 -0500
X-MC-Unique: PahDJS13Oom6SRpaRmVGUQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 390AE83DD21
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 10:36:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 030E55D9F2;
 Fri, 12 Mar 2021 10:36:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6966118000B4; Fri, 12 Mar 2021 11:36:18 +0100 (CET)
Date: Fri, 12 Mar 2021 11:36:18 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 0/4] ui: improve precision of VNC desktop resizing
Message-ID: <20210312103618.wuddf4iwjcub4zhm@sirius.home.kraxel.org>
References: <20210311182957.486939-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210311182957.486939-1-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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

On Thu, Mar 11, 2021 at 06:29:53PM +0000, Daniel P. Berrangé wrote:
> Currently when resizing the VNC desktop we get a thin black bar down the
> right hand side of the screen 93% of the time, because the VNC server
> rounds up the display to a multiple of 16. This series solves this
> problem by fixing the separation between the server surface dimensions
> (which are important for dirty bitmap tracking) and the client desktop
> size (which is what the client actually renders).
> 
> Daniel P. Berrangé (4):
>   ui: add more trace points for VNC client/server messages
>   ui: avoid sending framebuffer updates outside client desktop bounds
>   ui: use client width/height in WMVi message
>   ui: honour the actual guest display dimensions without rounding

Added to ui patch queue.

thanks,
  Gerd


