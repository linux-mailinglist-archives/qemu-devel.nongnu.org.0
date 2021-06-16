Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 612003A9624
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 11:29:35 +0200 (CEST)
Received: from localhost ([::1]:53872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltRra-0006mW-CY
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 05:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltRqY-0005VN-3h
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 05:28:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltRqU-0004xk-C3
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 05:28:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623835705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ya2KLSTGvxBpsM2nHEX3qNyO/DwACaPlsw9GhUE6as8=;
 b=ZOueZmzcV/2veQieIq5WfkiC+q723C25DNpyZvf3rI+xCB4wDstVHJdL2EjeupL5xMcSq4
 XO0WRmxyBGfsjaqkGq/dplOLPZp+lkmRnMAAbOK4EZqCa9GFqlkneWgQknGqEvOonsKeUv
 bvPqdcz65mIFZ8J5A7pazYsjzb8qIh0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-di74PAMOOcqGrMMstOOStw-1; Wed, 16 Jun 2021 05:28:21 -0400
X-MC-Unique: di74PAMOOcqGrMMstOOStw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9E14100C611;
 Wed, 16 Jun 2021 09:28:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 072AC1A866;
 Wed, 16 Jun 2021 09:28:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8678818000B2; Wed, 16 Jun 2021 11:28:15 +0200 (CEST)
Date: Wed, 16 Jun 2021 11:28:15 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?B?Sm9zw6k=?= Ricardo Ziviani <jose.ziviani@suse.com>
Subject: Re: [PATCH 0/4] modules: add support for target-specific modules.
Message-ID: <20210616092815.rjznyjnvgrrfojq6@sirius.home.kraxel.org>
References: <20210610101553.943689-1-kraxel@redhat.com>
 <5953598.eXybCX72BP@pizza>
 <20210615050930.bmgup2axfr7sqvoa@sirius.home.kraxel.org>
 <2963309.4TrVdrBa0x@pizza>
MIME-Version: 1.0
In-Reply-To: <2963309.4TrVdrBa0x@pizza>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > Hmm, what would be the use case?  Right now qemu has the all-or-nothing
> > approach for modules, i.e. if modules are enabled everything we can
> > build as module will be built as module, and I havn't seen any drawbacks
> > so far.  So, why would one compile parts of qemu as module and other
> > parts not?
> 
> From my point of view, as a QEMU package maintainer, the all-or-nothing module 
> approach is great - specially for accelerators - because we can create a set 
> of officially supported packages and another set of optional modules, that 
> users may get them if they want to.

Same here ;)

> However, please correct me if I'm wrong, I understand that an accelerator as a 
> module will add an overhead that some user won't be willing to pay. So, give 
> them the option to have built-in accelerators seems a good idea.

Modules add some overhead, yes, and there are surely use-cases where you
don't want accel modules.  I would just expect people don't want the
other modules either then, but maybe I'm wrong.

take care,
  Gerd


