Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B95F931FA5F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 15:13:07 +0100 (CET)
Received: from localhost ([::1]:44056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD6Wo-0007cd-P4
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 09:13:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lD6UW-0006n1-8u
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:10:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lD6UT-00055R-Ig
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:10:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613743840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mOeEgZg5F/I4iAcdYXSEqteNZ9lCy0EEEBX4FFV/dhg=;
 b=AzFExET7ba6JXqPXdi8G4ioLY+1BOwFRgDkvxB3BwE+3yZEj7jJF28cf6UeyExfWg5Mkfo
 EED8svucAX+w64SqMFMIXTQ6ZUE3XFDaNaFoTIKmuor00tlCeYmamL426hbA53iCgGTR3F
 5K+akONup1STvFLF0ta3MEtOHPWUys8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-x6Fr-ZAzOm6jm1rkxUY4-A-1; Fri, 19 Feb 2021 09:10:35 -0500
X-MC-Unique: x6Fr-ZAzOm6jm1rkxUY4-A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D76891005501;
 Fri, 19 Feb 2021 14:10:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78F381F045;
 Fri, 19 Feb 2021 14:10:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6D41A18000A2; Fri, 19 Feb 2021 15:10:32 +0100 (CET)
Date: Fri, 19 Feb 2021 15:10:32 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] ui/console: Remove dpy_gl_ctx_get_current
Message-ID: <20210219141032.5suqvw3apxf7avdh@sirius.home.kraxel.org>
References: <20210219094702.90789-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210219094702.90789-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 19, 2021 at 06:47:02PM +0900, Akihiko Odaki wrote:
> It is not used, and it is unlikely that a new use case will emerge
> anytime soon because the scope of OpenGL contexts are limited due to
> the nature of the frontend, VirGL, processing simple commands from the
> guest.
> 
> Remove the function and ease implementing a new OpenGL backend a little.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>

Most of this is gone already in master.

Seems you are basing your work on the 5.2 release.
Development should better be done against the master branch.

take care,
  Gerd


