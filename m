Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E442ED3D1
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 16:59:41 +0100 (CET)
Received: from localhost ([::1]:52044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxXhM-0006sh-Uv
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 10:59:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kxXgF-0005zP-F4
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 10:58:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kxXgD-0005h0-6i
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 10:58:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610035107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vq80xUa2iGjLxb1g3ca/LwoXPqVXagkpMDBEfrLTLCU=;
 b=hWz7CvZYidoYz/bc28jvmCqYJd7TrBnK+j5KxJwJ9KJDiXaeaUwNZn7XVmQr1regy3oMWN
 TSkwnGQLtmeti35z+uTMzZv5CcM35SNv6uxGEPz7o2haVXxXSPa9ty9K94o2cExGRhPb6g
 jH9IAOcXRxjImCSuhACy8y7wDvQ8bzM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-KucNN4KTOJ252_Gm_hd9AQ-1; Thu, 07 Jan 2021 10:58:23 -0500
X-MC-Unique: KucNN4KTOJ252_Gm_hd9AQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6455AFA88;
 Thu,  7 Jan 2021 15:58:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-197.ams2.redhat.com
 [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F8125D9DE;
 Thu,  7 Jan 2021 15:58:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EFD08180061B; Thu,  7 Jan 2021 16:58:20 +0100 (CET)
Date: Thu, 7 Jan 2021 16:58:20 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Subject: Re: VirtioSound device emulation implementation
Message-ID: <20210107155820.eww4blxj5kvoletf@sirius.home.kraxel.org>
References: <CAAQ-SiP8G28ade0jHbhTcv0jtGQb4OSgL5p3mAr0MU_FH8vZ3w@mail.gmail.com>
 <87a6tm2sxb.fsf@linaro.org>
 <CAAQ-SiOW8OnWEb0sHUEeS139-Tw0RO2YD1Tx-1s9iuy3ZVQFgw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAQ-SiOW8OnWEb0sHUEeS139-Tw0RO2YD1Tx-1s9iuy3ZVQFgw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > Are you planning to make it an in-QEMU device or maybe a external
> > vhost-user daemon?
> 
> The project page states that we need to use the QEMU audio subsystem
> for playing and capturing audio samples. I am not entirely sure if
> this implies that the device should be an in-QEMU device or if it
> could be an external daemon.  What do you suggest?

I think the easiest would be to make it an in-qemu device.  All the
infrastructure qemu has to play sound in various ways (alsa, pulse,
jack, oss, ...) can be used without much effort then.

That is not set in stone though.  It is certainly possible to implement
the device as separate process, using the vhost-user protocol for
communication with qemu.  On one side it is more effort as you have to
handle the audio streams and sound devices without qemu helping with
that.  On the other side vhost-user is also supported by other
hypervisors, so the implementation could be shared then.

HTH,
  Gerd


