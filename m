Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCA33FF9AE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 06:46:28 +0200 (CEST)
Received: from localhost ([::1]:52280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM15v-0007Op-EH
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 00:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mM14O-0006jZ-KV
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 00:44:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mM14J-00036e-L9
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 00:44:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630644286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Uvhh1xAWbY8PClyav/O6viFe0r1hNIQALndx4pju0B0=;
 b=ZxJ0H4EuO1vb6bM0MlOQ8bkgUys5WenWuqwVeqzciFg007LfK9RUpkFH2wbqkoESzvlnw7
 M0nToAyo+cRvdBzjvv0m47DNeGSTM0MGNdbkToSCnJYdiazzleuOeZg2FVolqlZBJpWuxv
 ETsaHdXsjLOOoGj6feRsih8IPJ57pEI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-JgpmoRW2PmK3OIpu-cEHiw-1; Fri, 03 Sep 2021 00:44:44 -0400
X-MC-Unique: JgpmoRW2PmK3OIpu-cEHiw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84A2518766D6;
 Fri,  3 Sep 2021 04:44:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0896D100164A;
 Fri,  3 Sep 2021 04:44:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7D3B718000A3; Fri,  3 Sep 2021 06:44:30 +0200 (CEST)
Date: Fri, 3 Sep 2021 06:44:30 +0200
From: "kraxel@redhat.com" <kraxel@redhat.com>
To: VintagePC <vintagepc404@protonmail.com>
Subject: Re: USB-MSD non-functional after merging v5.1 to v6.x (seems to be
 internal USB stack issue?)
Message-ID: <20210903044430.6h5xvq7tlhrkbxfx@sirius.home.kraxel.org>
References: <HiU5xYXWuIPVg8tuVKzH1LTrKtKSBr01C6h_-uUbJ720IWY8SO1Bna1_-ak0HWraabqIa-hkGUoxeG2aQn6v7WAy1gnDxq9b_tklE0dGRYc=@protonmail.com>
 <20210902062232.uau63uq53akr6snr@sirius.home.kraxel.org>
 <vAlTpwWpoR91zKfyUom-_cFnqJA3-xN8UGC9BiCUBK3pVgcjE18OC6e_jfWca_POVxFm-kCa73O6g2Da5FLhDZXwOoY6aq8vZU31NRIAcYc=@protonmail.com>
 <utXX9E4xF79uuQWasw0gE1nMa9D3uG6GXEyHgPcpYUyH4mNwhjnU8JjGVRYBAxIjr_1R7gS-nKrg0V0bMm_nR6Y9EMYGr7ro_7ixYyJ2584=@protonmail.com>
MIME-Version: 1.0
In-Reply-To: <utXX9E4xF79uuQWasw0gE1nMa9D3uG6GXEyHgPcpYUyH4mNwhjnU8JjGVRYBAxIjr_1R7gS-nKrg0V0bMm_nR6Y9EMYGr7ro_7ixYyJ2584=@protonmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> At some point during implementation of the STM USB stack must have run
> into the same problem with the communications choking during MSD init.
> And at the time (which involved a LOT of wireshark comparisons with a
> real USB drive on the host and on the DCW2 Rpi2 stack) I'd added the
> QEMU_PACKED directive to the usb_msd_csw struct.

> Thoughts?

Send a patch adding the QEMU_PACKED,
that should indeed be the correct fix.

thanks,
  Gerd


