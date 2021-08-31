Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D773FC1FE
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 06:34:44 +0200 (CEST)
Received: from localhost ([::1]:49424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKvTu-0001ts-L2
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 00:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mKvSc-0001DY-Hw
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 00:33:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mKvSY-0001Td-7F
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 00:33:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630384394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZnXVKSmb/JS7FFuO7BGWgEJHkrl/h5Ig7wel8Ew4V1I=;
 b=cANg9SxD2IjgUm2TihWdWmlsVha2xAV22rB3Xb0ban0fuGhfDiH0GWDpp7TSnBWsYpx0dG
 6wZuW5sBXkiAJ2T2KFWm73q4EE8GPTcmKgVv65e/b9SCkwU33RGcUN5iHNHNVdLamOmt+u
 K0PBEyB7xUilNAHbSZaS4CdIeiWXk1c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-dnyAi_FYN2mX4ZezNWfgnA-1; Tue, 31 Aug 2021 00:33:12 -0400
X-MC-Unique: dnyAi_FYN2mX4ZezNWfgnA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0E4A1008060;
 Tue, 31 Aug 2021 04:33:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A5775C1A1;
 Tue, 31 Aug 2021 04:33:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B19871800386; Tue, 31 Aug 2021 06:33:09 +0200 (CEST)
Date: Tue, 31 Aug 2021 06:33:09 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: usage of virtio-blk-device etc (microvm?)
Message-ID: <20210831043309.apcno22at6hfk6so@sirius.home.kraxel.org>
References: <95fd8301-713e-fa88-36e0-072860b88e63@msgid.tls.msk.ru>
MIME-Version: 1.0
In-Reply-To: <95fd8301-713e-fa88-36e0-072860b88e63@msgid.tls.msk.ru>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

  Hi,

> In particular, I wasn't able to have a hdd in the virtual machine
> using virtio-blk-device like this:
> 
>  -drive file=foo,if=none,id=drv -device virtio-blk-device,drive=drv
> 
> What modules/options are needed within linux guest to see such a
> drive?  By loading just virtio-blk module (which loads all its
> dependencies) the drive isn't becoming available, like it usually
> happens after loading virtio-pci with the pci version of virtio-blk.

You need both virtio-mmio.ko (transport) and virtio-blk.ko (device).

> Also, is there a way to use virtio-blk-device with, say, q35 machine
> type?

No.

take care,
  Gerd


