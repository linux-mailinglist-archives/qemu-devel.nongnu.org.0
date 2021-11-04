Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CDA444F59
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 07:51:19 +0100 (CET)
Received: from localhost ([::1]:57362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miWaj-00042U-Ss
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 02:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1miWY0-0003Be-5M
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 02:48:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1miWXx-0007a4-RI
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 02:48:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636008504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+0rtvVC629wdzKw1M9HtzvngvMD9r6ikJxBHZiwoFVk=;
 b=Cc9kSg+j0meNKgGBqwq6GAq5P9le+VCIl714gBe7vKMMBEGuVlSuKRCQIjehUaIbakk4qd
 7neXtqXe05s7r6zt+vPVDcumrQJ67lALDlrIL5/1YwDtQQKHdsidQRbBIKIq6MyExfccqP
 8Z7+lw0rAuj9hsW0nDkzvId7Zl1u8bM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-kwVeOGqOOaOiF3zd1s6CjA-1; Thu, 04 Nov 2021 02:48:20 -0400
X-MC-Unique: kwVeOGqOOaOiF3zd1s6CjA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B51E10A8E04;
 Thu,  4 Nov 2021 06:48:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BBF360C0F;
 Thu,  4 Nov 2021 06:47:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 093E81800923; Thu,  4 Nov 2021 07:47:36 +0100 (CET)
Date: Thu, 4 Nov 2021 07:47:35 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 1/6] spice: Update QXLInterface for spice >= 0.15.0
Message-ID: <20211104064735.gjf5kycydszoag6u@sirius.home.kraxel.org>
References: <20211103144844.1285634-1-jsnow@redhat.com>
 <20211103144844.1285634-2-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211103144844.1285634-2-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 03, 2021 at 10:48:39AM -0400, John Snow wrote:
> spice updated the spelling (and arguments) of "attache_worker" in
> 0.15.0. Update QEMU to match, preventing -Wdeprecated-declarations
> compilations from reporting build errors.
> 
> See also:
> https://gitlab.freedesktop.org/spice/spice/-/commit/974692bda1e77af92b71ed43b022439448492cb9

Hmm, quite alot of #ifdef for a relatively simple change.
I don't see a simpler / better way though.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd


