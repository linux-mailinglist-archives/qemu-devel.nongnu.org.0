Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9403A3569A2
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 12:28:58 +0200 (CEST)
Received: from localhost ([::1]:34920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU5Qf-0007Kj-Lu
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 06:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lU5Lo-0003q3-L6
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 06:23:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lU5Ln-0004NS-5o
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 06:23:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617791034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NX7kwtXtKSA9HSRY+js4kr9sneO7pQLFTylqPP2ZJZU=;
 b=VfCMLH+6z2PI/8mZbcUV54qhnrtJvHbhAcWjPF6AmQ7cJNDfB69QJY7a2vbxUrGkzOcayO
 dpe1lLTWdrpgMEtV2xnxsYzj0SLopbFs+rZl3ZqPLzKwOHJroL8FLYIjkv+A5MiSShWv+K
 kShApj18w3nD34NndDbp9SYyYSc8CT8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-d5pg8-GFNdqalheCnUw0_w-1; Wed, 07 Apr 2021 06:23:50 -0400
X-MC-Unique: d5pg8-GFNdqalheCnUw0_w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 953D981746B;
 Wed,  7 Apr 2021 10:23:49 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-47.ams2.redhat.com [10.36.115.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A89AD1C4;
 Wed,  7 Apr 2021 10:23:41 +0000 (UTC)
Date: Wed, 7 Apr 2021 12:23:40 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] docs: Add a QEMU Code of Conduct and Conflict Resolution
 Policy document
Message-ID: <YG2ILNrmn0+vVVKJ@merkur.fritz.box>
References: <20210331150527.14857-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210331150527.14857-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 berrange@redhat.com, qemu-devel@nongnu.org, agraf@csgraf.de,
 stefanha@redhat.com, alex.bennee@linaro.org, afaerber@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 31.03.2021 um 17:05 hat Paolo Bonzini geschrieben:
> +respectful.  Examples of unacceptable behavior by participants include:
> +
> +* The use of sexualized language or imagery
> +
> +* Personal attacks
> +
> +* Trolling or insulting/derogatory comments
> +
> +* Public or private harassment
> +
> +* Publishing other's private information, such as physical or electronic
> +addresses, without explicit permission

"Electronic addresses"? No more Cc: in emails without asking for
explicit permission first in each case, especially when looping in
people who are not subscribed to the list? And the same for attribution
in commits (turning informal statements into Reported-by, Acked-by
etc.)? Links to git repositories of other people?

I'm sure that this is not what was intended, but it's pretty clearly the
implication of what is written here.

(This kind of "bugs" is one of the reasons why I'm not a huge fan of
written rules instead of trusting the judgement of community leaders.
In the communities I am involved in, I can't remember many cases where
they actually helped to resolve conflicts, but I can remember many
unproductive discussions about how to interpret the written text and
what it does and doesn't cover.)

Kevin


