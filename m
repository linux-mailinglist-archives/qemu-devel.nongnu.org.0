Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9FE412E2E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 07:26:43 +0200 (CEST)
Received: from localhost ([::1]:54512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSYIk-0007pL-0b
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 01:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mSYHu-00079X-Of
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 01:25:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mSYHs-0004PY-ME
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 01:25:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632201947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y9fTNlz5VymYm+ZfCMz4GldTEYgU1U2AIVw+Mezji2c=;
 b=HulnRNuAjWPJlYBprp2oDRmYP1NTGvttRXsyrM8ZJH14wZsQRvMERN+eVGtHdHejZYcUuk
 UDmjhFv3QINY2aAT6K6xzvV8oD1RO7PhtFezRvzCT2CyEJdEW4d8DSzyRmTy1vaYO9ikAG
 /yqIrr6ONlHGN0PHcAh5pEoSNGr3yJM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-nfLwBXG-NOSkg8x-PBenYg-1; Tue, 21 Sep 2021 01:25:45 -0400
X-MC-Unique: nfLwBXG-NOSkg8x-PBenYg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 812211084681;
 Tue, 21 Sep 2021 05:25:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AFE360C17;
 Tue, 21 Sep 2021 05:25:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9D7AE18000B5; Tue, 21 Sep 2021 07:25:42 +0200 (CEST)
Date: Tue, 21 Sep 2021 07:25:42 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Jose R. Ziviani" <jziviani@suse.de>
Subject: Re: [PATCH 1/2] meson: introduce modules_arch
Message-ID: <20210921052542.h4ehwc3ovt2wo2en@sirius.home.kraxel.org>
References: <20210917012904.26544-1-jziviani@suse.de>
 <20210917012904.26544-2-jziviani@suse.de>
 <20210917071404.efhv3tlnad2ezz3e@sirius.home.kraxel.org>
 <YUSS0Jp+GBwNwYg3@pizza>
 <20210920051532.tzanl2asdqzuxlzn@sirius.home.kraxel.org>
 <YUiGcjBviIqPIyJB@pizza>
MIME-Version: 1.0
In-Reply-To: <YUiGcjBviIqPIyJB@pizza>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
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

> But, in anyway, I'll still need to store the target architecture that
> can use such core module, like I did here in this patch. Otherwise,
> if I compile different targets at the same time, I'll end up with the
> same problem of targets trying to load wrong modules.

That all works just fine today.  If you have target-specific modules
(i.e. source files added to specific_ss instead of softmmu_ss when
compiling into core qemu) you only need to add those to the
target_modules[] (instead of modules[]) and you are set.

In-tree example: qtest accelerator.

take care,
  Gerd


