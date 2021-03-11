Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B7F33731C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 13:53:38 +0100 (CET)
Received: from localhost ([::1]:43144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKKor-0003gz-BD
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 07:53:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKKfh-0005x7-Lp
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:44:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKKfg-0003j6-0Z
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:44:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615466647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V2XQE9N0Zz8cMkiqWQv5GlUo8dQLruGaBe0GFzpqbsE=;
 b=alsyfuIHp8Ne+ECIqjnrlB6kO6ZlJK7JxTCaMPBFeT8foEOdpqkk84ygdFWOio264eP4VG
 ZwVFiEMicywOpG4Fg2UvW3xyccTsbnk4vwWLxaQagFhtPOlzmLW+O8Oi52BIV6uMLqaQ+p
 PcwQxpXCrArNskhdUeyqnGQaumU8e14=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-1kwx4IxaMbCX-GgtOjQOUQ-1; Thu, 11 Mar 2021 07:44:05 -0500
X-MC-Unique: 1kwx4IxaMbCX-GgtOjQOUQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6023D107ACCA;
 Thu, 11 Mar 2021 12:44:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 283AC5D9F0;
 Thu, 11 Mar 2021 12:44:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 90B64180087E; Thu, 11 Mar 2021 13:44:02 +0100 (CET)
Date: Thu, 11 Mar 2021 13:44:02 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v4] configure: Improve OpenGL dependency detections
Message-ID: <20210311124402.rq6eiks26to33tft@sirius.home.kraxel.org>
References: <20210223055800.87324-1-akihiko.odaki@gmail.com>
 <20210223060307.87736-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210223060307.87736-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 23, 2021 at 03:03:07PM +0900, Akihiko Odaki wrote:
> This has the following visible changes:
> 
> - GBM is required only for OpenGL dma-buf.
> - X11 is explicitly required by gtk-egl.
> - EGL is now mandatory for the OpenGL displays.
> 
> The last one needs some detailed description. Before this change,
> EGL was tested only for OpenGL dma-buf with the check of
> EGL_MESA_image_dma_buf_export. However, all of the OpenGL
> displays depend on EGL and EGL_MESA_image_dma_buf_export is always
> defined by epoxy's EGL interface.
> Therefore, it makes more sense to always check the presence of EGL
> and say the OpenGL displays are available along with OpenGL dma-buf
> if it is present.

Doesn't apply, seems this needs a rebase.

take care,
  Gerd


