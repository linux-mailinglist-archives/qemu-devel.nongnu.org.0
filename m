Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B746410F44
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 07:17:30 +0200 (CEST)
Received: from localhost ([::1]:42460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSBgH-0001CZ-4B
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 01:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mSBeb-0000GC-MG
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 01:15:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mSBeY-0006le-8Y
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 01:15:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632114940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bipTk+zD0J78aP0uz94Sw5muCfcfMbSxjWKT0P/1sWI=;
 b=TfPUUua8DyTXP1YGeWqlK9Tj82jL4yjk1K5Y0HTi67WdK+GWNzICzrS8jCecAADR1kPTgw
 hp0Flh4Xo9q0XyNHn6Awgxd2NsY2mqkOn7ox7Q6FWXehhbAGxsGPg8wHztHPiTRKtNsYBU
 2CyIAGFZmKjouuJaxlPq54g4+2Qfhmw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-so6yu90iM8mc9390MZd1Ww-1; Mon, 20 Sep 2021 01:15:39 -0400
X-MC-Unique: so6yu90iM8mc9390MZd1Ww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CBD318543B6;
 Mon, 20 Sep 2021 05:15:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4379610190A7;
 Mon, 20 Sep 2021 05:15:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9498218000A9; Mon, 20 Sep 2021 07:15:32 +0200 (CEST)
Date: Mon, 20 Sep 2021 07:15:32 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Jose R. Ziviani" <jziviani@suse.de>
Subject: Re: [PATCH 1/2] meson: introduce modules_arch
Message-ID: <20210920051532.tzanl2asdqzuxlzn@sirius.home.kraxel.org>
References: <20210917012904.26544-1-jziviani@suse.de>
 <20210917012904.26544-2-jziviani@suse.de>
 <20210917071404.efhv3tlnad2ezz3e@sirius.home.kraxel.org>
 <YUSS0Jp+GBwNwYg3@pizza>
MIME-Version: 1.0
In-Reply-To: <YUSS0Jp+GBwNwYg3@pizza>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.476,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Yes, I really like your approach, makes more sense indeed. But, how do I
> get the core modules that other modules depend on?
> 
> I see that Kconfig already has something in this line:
> 
> config VGA  (from hw/display)
>     bool
> 
> config PCI  (from hw/pci)
>     bool
> 
> config QXL  (from hw/display)
>     bool
>     depends on SPICE && PCI
>     select VGA
> 
> I assume that independent entries (like VGA and PCI) are core and that I
> can rely on it to add
>   module_need(PCI)
>   module_need(VGA)
> for hw-display-qxl. Am I right?

Yes, looking at kconfig for core dependencies makes sense.

take care,
  Gerd


