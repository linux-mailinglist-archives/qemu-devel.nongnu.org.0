Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C34243E5615
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 10:58:44 +0200 (CEST)
Received: from localhost ([::1]:44274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDNat-0005ar-RH
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 04:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDNZw-0004PO-Ik
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:57:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDNZv-0000GE-75
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:57:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628585862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YRthl9ASLiFnvlj4UaV979GdcOyZbvH5WtblfcN6utE=;
 b=CkwXj1jompYrigBHrv1rY/YCoyCHrThtrTf+y5Zpmq00vJQMwc/NP29mvcA2pDF9Aq3MtN
 kFPihO4JpIDiQVj+0ECV7c81CLH8Wm64YHMH05ZvtP/U2HewQdnd19iOzulbk5KmeUYg5W
 CytFgAZhWYPib08+Ot5kn3kP5gb8Nnk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-FA5DHrZAMUSJyQHsE8g29Q-1; Tue, 10 Aug 2021 04:57:41 -0400
X-MC-Unique: FA5DHrZAMUSJyQHsE8g29Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4830801A92;
 Tue, 10 Aug 2021 08:57:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CDFE669F3;
 Tue, 10 Aug 2021 08:57:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 04FDE18003AA; Tue, 10 Aug 2021 10:57:39 +0200 (CEST)
Date: Tue, 10 Aug 2021 10:57:38 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] ui/sdl2: Check return value from g_setenv()
Message-ID: <20210810085738.h4ypggotny3omizb@sirius.home.kraxel.org>
References: <20210809161424.32355-1-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210809161424.32355-1-peter.maydell@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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

On Mon, Aug 09, 2021 at 05:14:24PM +0100, Peter Maydell wrote:
> Setting environment variables can fail; check the return value
> from g_setenv() and bail out if we couldn't set SDL_VIDEODRIVER.
> 
> Fixes: Coverity 1458798
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I followed existing practice in this function for how it
> deals with errors (ie, fprintf to stderr and exit).
> ---

Queued for 6.1 (given that the "drop setenv altogether" idea clearly is
6.2 material).

thanks,
  Gerd


