Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 331BB323B45
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 12:29:15 +0100 (CET)
Received: from localhost ([::1]:46340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEsLy-0008Bs-8m
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 06:29:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lEsKw-0007hZ-OO
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:28:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lEsKv-0000y5-7s
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:28:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614166088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=be6KR+xR9tVEulr1T78waTA1yz/2g7hFeBhBpj5e97c=;
 b=S2jZZ+EDvVLRrDbqHQzka+4c/axScCScWcUXaBYiSKjDCuFdPpBQcBu/IO/DRPkJWYI2du
 +moGAQIl8NgZv1uPSRgJ4/Ks9bvPQrg40pedytefpurZu4qTD9PTTEsFR32CYr7qAvbsjl
 tmiaWqKG8qOfkFAaB8cPvUNuvPe/z1M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-H9TQyhPuNlO_6pQ6ixuBbw-1; Wed, 24 Feb 2021 06:27:55 -0500
X-MC-Unique: H9TQyhPuNlO_6pQ6ixuBbw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C917E107ACF8;
 Wed, 24 Feb 2021 11:27:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-4.ams2.redhat.com
 [10.36.114.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9198760C5F;
 Wed, 24 Feb 2021 11:27:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CB23518000AE; Wed, 24 Feb 2021 12:27:52 +0100 (CET)
Date: Wed, 24 Feb 2021 12:27:52 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v2] ui/cocoa: Fix mouse association state
Message-ID: <20210224112752.dgdbm7f6avlvh4ib@sirius.home.kraxel.org>
References: <CAFEAcA9bP5TTroWz8k4kkB6bAj81zRBFgR4Uzi0L3BjoNd9JkA@mail.gmail.com>
 <20210222150714.21766-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210222150714.21766-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 23, 2021 at 12:07:14AM +0900, Akihiko Odaki wrote:
> ui/cocoa deassociates the mouse input and the mouse cursor
> position only when relative movement inputs are expected. Such
> inputs may let the mouse cursor leave the view and cause undesired
> side effects if they are associated. On the other hand, the
> problem does not occur when inputting absolute points, and the
> association allows seamless cursor movement across views.
> 
> However, the synchronization of the association and the expected
> input type was only done when grabbing the mouse. In reality, the
> state whether the emulated input device expects absolute pointing
> inputs or relative movement inputs can vary dynamically due to
> USB device hot-plugging, for example.
> 
> This change adds association state updates according to input type
> expectation changes. It also removes an internal flag representing
> the association state because the state can now be determined with
> the current input type expectation and it only adds the
> complexity of the state tracking.

Patch looks reasonable to me, but I'd like to see an review from
someone who knows macos better than I do for this one.

thanks,
  Gerd


