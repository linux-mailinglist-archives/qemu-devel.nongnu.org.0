Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F008848E792
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 10:33:51 +0100 (CET)
Received: from localhost ([::1]:51098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Ixy-00064d-Ji
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 04:33:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8Iwh-0004is-Ho
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 04:32:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8Iwd-00068N-0e
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 04:32:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642152745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z5SyLXveL26QncFtMscGtR+kUriktjIISKe8ZFN0GiY=;
 b=KV46Bw5X0ZkElM0cQFSfwRGFTHORoAM0SnVtiiUlwrBjq9XPKbCWCzswo7TftDQRBkkFDB
 1QYN9YGsoz0IfGa7uIlbUzdzTqRc9AUAxvgSswKUnu2QsnfW9QHbjQcSERYTJwJxJ7UA7x
 aBKeqLSr2J2w1ZStyHVemfzEokov5fk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-wvyIq19dP2OXNazXK-Mhbw-1; Fri, 14 Jan 2022 04:32:22 -0500
X-MC-Unique: wvyIq19dP2OXNazXK-Mhbw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E78A10168C3;
 Fri, 14 Jan 2022 09:32:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFC7B1059587;
 Fri, 14 Jan 2022 09:32:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0873818003A2; Fri, 14 Jan 2022 10:32:16 +0100 (CET)
Date: Fri, 14 Jan 2022 10:32:16 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Ruien Zhang <zhangruien@bytedance.com>
Subject: Re: [PATCH 0/2] Introduce printer subsystem and USB printer device
Message-ID: <20220114093216.aqrh6h3ukzavtasq@sirius.home.kraxel.org>
References: <20220113115659.72788-1-zhangruien@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20220113115659.72788-1-zhangruien@bytedance.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, berrange@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> This patchset introduces:
> 
> 1) Skeleton of QEMU printer subsystem with a dummy builtin driver.
> 
> 2) USB printer device emulation, with definitions in the extension of IPP-over-
>    USB [3].
> 
> WIP:
> 
> 1) QEMU printer subsystem interfaces, which will be finalized with a concrete
>    backend driver.
> 
> 2) IPP-over-USB implementation.

Hmm, I'm wondering what uses cases you have in mind and whenever
it makes sense to introduce a printer subsystem?

Having an ipp-over-usb device looks useful, but the only use case I can
see is to allow guests access a network printer.  I can't see the
benefits of a printer subsystem, especially in a world where non-ipp
printers are going extinct.  We would most likely have just a single
kind of printer backend, where the only job qemu will have is to
forwarding requests and replies, maybe with some http header rewriting.

Likewise usb would be the one and only device (parallel ports are long
gone in printers).  So the indirection added by a printer subsystem
doesn't buy us anything because we just don't need that flexibility.
I'd suggest to pass the url directly to the device instead:

qemu -device usb-ipp-printer,url=ipp://hostname/ipp/printer

take care,
  Gerd


