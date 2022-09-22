Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DCF5E5A8F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 07:17:54 +0200 (CEST)
Received: from localhost ([::1]:44308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obEav-0006LS-Bq
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 01:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1obEX3-0004jg-EA
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 01:13:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1obEX0-00045s-8F
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 01:13:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663823628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OrESZJqNXJ491/h/xiAHmVicgRA4wX/p+xLfqG7MJRI=;
 b=OUsNCN+mvS+jpqSp/Ao2CyikrN99DJR2XEiwy+j+O6Av4Dz4tvm3BNCn1geUpoEmnqAudE
 EaGoSIlBe3Pbd3w0Fg+AahoIPiuLVTrZnqdkGBcSqu26b036e9L308w1MEnghwUQ4kZZmC
 bsZTdX+gZIo9vrhIvguN3qus+UePqXc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-E2Yi4ELzMGCtyHdEgROcfg-1; Thu, 22 Sep 2022 01:13:45 -0400
X-MC-Unique: E2Yi4ELzMGCtyHdEgROcfg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C56CF1C0519C;
 Thu, 22 Sep 2022 05:13:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 998DB1121314;
 Thu, 22 Sep 2022 05:13:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1CB231800084; Thu, 22 Sep 2022 07:13:43 +0200 (CEST)
Date: Thu, 22 Sep 2022 07:13:43 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Liav Albani <liavalb@gmail.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/1] hw/display: expose linear framebuffer address in
 Bochs VBE registers
Message-ID: <20220922051343.edvlguenqofckn7n@sirius.home.kraxel.org>
References: <20220920154922.248790-1-liavalb@gmail.com>
 <20220921061447.e2ii6q24f2e6n64q@sirius.home.kraxel.org>
 <fffdb5eb-0a84-9bcf-e05a-dbe8872280db@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fffdb5eb-0a84-9bcf-e05a-dbe8872280db@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > Why not just use virtio-gpu?
> 
> Trying to run this command:
> qemu-system-x86_64 -M microvm -m 2048 -device virtio-gpu

'-device virtio-gpu-device'

Might also need '-global virtio-mmio.force-legacy=false' to switch
virtio-mmio into 1.0 mode.

take care,
  Gerd


