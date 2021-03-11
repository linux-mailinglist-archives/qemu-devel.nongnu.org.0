Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A1533731F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 13:54:39 +0100 (CET)
Received: from localhost ([::1]:43936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKKpq-000447-UO
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 07:54:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKKnE-0002qb-3W
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:51:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKKn8-0000DA-FA
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:51:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615467109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qs7C+hySo/JLuMyekUOz3LlzLN5WPU1kCRDv9MWkhIc=;
 b=PpYyJ02I0Qo99o+q1HAX8JbIJnUd9UjgrVxj2/FNjnj4s158Az9wTAttVB9x82wQpdydkD
 ee6WtGdUw9f6up+9ByDUXSyEo1Cy68UzqYCJ3LZlj7rHJ2gxRuUSK8WSoZKYWEzVVDlM73
 qEHE7vdY6ZVi1s+cbAfQxh9c69WnTq0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-8CQGkhfdO52vCbOgrHRQog-1; Thu, 11 Mar 2021 07:51:48 -0500
X-MC-Unique: 8CQGkhfdO52vCbOgrHRQog-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1E4518A072B;
 Thu, 11 Mar 2021 12:51:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCB3519C99;
 Thu, 11 Mar 2021 12:51:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3C31E180087E; Thu, 11 Mar 2021 13:51:45 +0100 (CET)
Date: Thu, 11 Mar 2021 13:51:45 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] opengl: Do not convert format with glTexImage2D on
 OpenGL ES
Message-ID: <20210311125145.n2xyjyqpchd4iaa3@sirius.home.kraxel.org>
References: <20210219094803.90860-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210219094803.90860-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

On Fri, Feb 19, 2021 at 06:48:03PM +0900, Akihiko Odaki wrote:
> OpenGL ES does not support conversion from the given data format
> to the internal format with glTexImage2D.
> 
> Use the given data format as the internal format, and ignore
> the given alpha channels with GL_TEXTURE_SWIZZLE_A in case the
> format contains alpha channels.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>

Added to UI patch queue.

thanks,
  Gerd


