Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D663D3818
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 11:53:44 +0200 (CEST)
Received: from localhost ([::1]:54586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6rsF-0006nV-Bv
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 05:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6rrB-00061I-CB
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 05:52:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6rr9-0004G0-Tz
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 05:52:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627033955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MAZ4zWfsyT8VMOTV4VaTCCJSO3lr6/Gf3+LrDEkxqYk=;
 b=V56nJzy0jNSPV2w78skx2dzG4GHLzxsGqQb35DL6qbDCteDU2CNYEHIsqOoOgBhZwYw5qK
 bIZQsdiW19DXUDwdVjRrxDdTrWAwTVImycDrBUBWBvDA4wXl1K8DCy4wVDRowJ9UzV8hwV
 5CktEfzL4rWyv0pkHLQiJ0F3etRGIug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-5qZyabG7Mwme7ZB8-O35PQ-1; Fri, 23 Jul 2021 05:52:34 -0400
X-MC-Unique: 5qZyabG7Mwme7ZB8-O35PQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F26BC87D544;
 Fri, 23 Jul 2021 09:52:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA0EE60C5F;
 Fri, 23 Jul 2021 09:52:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2023A18000A3; Fri, 23 Jul 2021 11:52:31 +0200 (CEST)
Date: Fri, 23 Jul 2021 11:52:31 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v2 1/1] modules: Improve error message when module is not
 found
Message-ID: <20210723095231.sfbkhdwdg43nedkk@sirius.home.kraxel.org>
References: <20210722220952.17444-1-jziviani@suse.de>
 <20210722220952.17444-2-jziviani@suse.de>
 <c26fc6f4-341f-c66f-5384-c811e1342891@suse.de>
MIME-Version: 1.0
In-Reply-To: <c26fc6f4-341f-c66f-5384-c811e1342891@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 "Jose R. Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > -    g_assert(ops != NULL);
> > +    if (ops == NULL) {
> > +        exit(1);
> > +    }
> > +
> 
> 
> Ah, again, why?
> This change looks wrong to me, 
> 
> the ops code should be present when ops interfaces are initialized:
> it should be a code level assertion, as it has to do with the proper order of initializations in QEMU,
> 
> why would we want to do anything else but to assert here?
> 
> Am I blind to something obvious?

Building tcg accel ops modular moves that from coding error to possible
user error (user wants use tcg but has qemu-accel-tcg-$arch.rpm not
installed).

The second part of the patch makes qemu print a message on the failed
module load, so the user would have a chance to figure where the assert
comes from, but replacing the assert with a more friendly message still
makes sense to me.

take care,
  Gerd


