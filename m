Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2764731FA72
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 15:17:51 +0100 (CET)
Received: from localhost ([::1]:53306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD6bO-0003Au-5N
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 09:17:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lD6Yc-0001h6-UL
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:14:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lD6YZ-0006im-3z
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:14:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613744094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SgSEeDkMrvEQ5e1PvswJDSf6ReBVGGcLk5AnNVZS6vQ=;
 b=Cdkh9FTIW3oIzv62eYzoIePRKlcy6p8Kr29yKR5Ff4y5P65Ex5WI9yPPoTJlWIdCEQrhbd
 Rj/cxrfZ6Lh2Ojz0YqBf9FRiVhBwZjfeMUyW8nmm5jNaJ+O02hRAcFGSJB4GLqyHX2I79Q
 Zx4v/TDDtLamv02PFv5ESiKgJY38Yp8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-jO7lTcIgPZyQaGZn-cFZaA-1; Fri, 19 Feb 2021 09:14:52 -0500
X-MC-Unique: jO7lTcIgPZyQaGZn-cFZaA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68AE185B660;
 Fri, 19 Feb 2021 14:14:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E5441945B;
 Fri, 19 Feb 2021 14:14:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2A2EC18000A2; Fri, 19 Feb 2021 15:14:46 +0100 (CET)
Date: Fri, 19 Feb 2021 15:14:46 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] opengl: Do not convert format with glTexImage2D on
 OpenGL ES
Message-ID: <20210219141446.ne2mutkfa5pa2dhu@sirius.home.kraxel.org>
References: <20210219094803.90860-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210219094803.90860-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

Hmm.  Do you know what effect this has performance-wise?
Is it maybe useful to not convert for desktop gl too?

take care,
  Gerd


