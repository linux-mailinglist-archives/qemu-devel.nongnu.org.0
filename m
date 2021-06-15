Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB8C3A7632
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 06:57:14 +0200 (CEST)
Received: from localhost ([::1]:48336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt18T-0000zl-Pv
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 00:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lt16A-0007F0-3h
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 00:54:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lt167-00020v-VY
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 00:54:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623732885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X7ZwkCArWkvRxX33fkAF2wP9i4AcJI4Axrc53/lfCoU=;
 b=SgcAz5aw9BDGtnrwm1UFPs/jXRoW4t5GYVKJZvGR47GX5A/q2ftyrojwlES17sESoSzUHe
 lA/neSr3515WB88NQHNlCKF0I78vAiVRDOAQwF2CAXr4iEVqvPNpSeYNP3BoxfD/ZjAuMT
 hMUCszdQ6rlD1Yv1KjE8SuAmYJwnWUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-lIsYAvUxOnu0dGgQCaiR7g-1; Tue, 15 Jun 2021 00:54:44 -0400
X-MC-Unique: lIsYAvUxOnu0dGgQCaiR7g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 382D7107ACF6
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 04:54:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03D3A60C0F;
 Tue, 15 Jun 2021 04:54:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6BEA918000B2; Tue, 15 Jun 2021 06:54:41 +0200 (CEST)
Date: Tue, 15 Jun 2021 06:54:41 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2 03/18] modules: add qemu-modinfo utility
Message-ID: <20210615045441.2rgea2hxalb3pb5z@sirius.home.kraxel.org>
References: <20210610055755.538119-1-kraxel@redhat.com>
 <20210610055755.538119-4-kraxel@redhat.com>
 <20210610130424.fj6fsufnunccmhmx@sirius.home.kraxel.org>
 <YMIP/cKc570Ozvdh@redhat.com>
 <1636b96e-9073-b145-3fcc-3370fa2d7506@redhat.com>
 <20210614150159.6ilpce4dqxi7rju4@sirius.home.kraxel.org>
 <YMdw/RlJuGmrFeQj@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YMdw/RlJuGmrFeQj@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > Problem with that approach is that it doesn't work for module
> > dependencies ...
> > 
> > Comments on the idea?  Suggestions for the module dependency problem?
> > Could maybe libbfd be used to find module (symbol) dependencies
> > automatically without writing a full dynamic linker?
> 
> Is there any value in exploring use of libclang ?  It gives us a real
> C parser that we can use to extract information from the C source. In
> libvirt we have experimental patches (not yet merged) using libclang to
> auto-generate XML parser helpers from struct annotations. It is quite
> nice compared to any other hacks for extracting information from C
> source files without using a proper parser.  libclang can be accessed
> from Python3 via its bindings and IIUC should be usable on all our
> build platforms

Could you do something along the lines of ...

  (1) find constructors
  (2) find type_register() calls in the constructor and the
      TypeInfo structs passed to those calls.
  (3) inspect the TypeInfo structs to figure the QOM type names.

... with libclang?

take care,
  Gerd


