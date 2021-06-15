Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CB63A7647
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 07:11:13 +0200 (CEST)
Received: from localhost ([::1]:52150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt1M0-0004cM-15
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 01:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lt1Kc-0002pY-40
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 01:09:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lt1KY-0005iP-7s
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 01:09:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623733780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ydwrk+nUfiGnApeJf94nXYzQASbQI7aAy9mJH46fpkk=;
 b=b8E+KcC+JCkYxHzaZKWgpYWizQtESNwS/bSBKWFJFlCLB3gaPs1SJjE++qoFzkMdCQNx9S
 nbFYVAsThKmwWIdG+pkrKnpXAe4zLRajosC1OiPRHUf7NvtA/yNxUKWBNfYNrFM4ErWj7Z
 IN+jgOPL95Yo19LVlysCVhzX0IZ4q7w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-_dBlq-DoPne6ueEiLKDGow-1; Tue, 15 Jun 2021 01:09:37 -0400
X-MC-Unique: _dBlq-DoPne6ueEiLKDGow-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C77BFEC1A0;
 Tue, 15 Jun 2021 05:09:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A3C918AD4;
 Tue, 15 Jun 2021 05:09:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A590718000B2; Tue, 15 Jun 2021 07:09:30 +0200 (CEST)
Date: Tue, 15 Jun 2021 07:09:30 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?B?Sm9zw6k=?= Ricardo Ziviani <jose.ziviani@suse.com>
Subject: Re: [PATCH 0/4] modules: add support for target-specific modules.
Message-ID: <20210615050930.bmgup2axfr7sqvoa@sirius.home.kraxel.org>
References: <20210610101553.943689-1-kraxel@redhat.com>
 <20210611082925.7wkppsrj7hywquns@sirius.home.kraxel.org>
 <20210611130321.rp4gnnja7z22p6zl@sirius.home.kraxel.org>
 <5953598.eXybCX72BP@pizza>
MIME-Version: 1.0
In-Reply-To: <5953598.eXybCX72BP@pizza>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 14, 2021 at 10:19:27PM +0000, José Ricardo Ziviani wrote:
> Hello Gerd,
> 
> On sexta-feira, 11 de junho de 2021 10:03:21 -03 Gerd Hoffmann wrote:
> >   Hi,
> > 
> > > Are there any pending patches to handle the remaining tcg dependencies
> > > in qemu?  When trying to build tcg modular (more than only
> > > tcg-accel-ops*) I get lots of unresolved symbols to tcg bits which are
> > > referenced directly (in cpu.c, gdbstub.c, monitor, ...).
> > > 
> > > The CONFIG_TCG=n case is handled either with stubs or with #ifdef
> > > CONFIG_TCG, which doesn't fly for modular tcg ...
> > 
> > So, enough for today, to be continued next week.
> > Work branch pushed to
> >     https://git.kraxel.org/cgit/qemu/log/?h=sirius/modinfo-playground
> > 
> > Topmost patch doesn't compile but shows the build changes.
> 
> I cloned your 'sirius/modinfo-playground-good' and started playing with the 
> command line options to build these modules. I would like to suggest to change 
> the current "--enable-X" with "--X=[enabled,disabled,module]", that seems to 
> make more sense for these modules. For instance:

Hmm, what would be the use case?  Right now qemu has the all-or-nothing
approach for modules, i.e. if modules are enabled everything we can
build as module will be built as module, and I havn't seen any drawbacks
so far.  So, why would one compile parts of qemu as module and other
parts not?

Also: when changing this I think it would be good to maintain backward
compatibility and use something like this:

  --enable-tcg=builtin
  --enable-tcg=module
  --enable-tcg (use default, probably "module" when modules
                are enabled and "builtin" otherwise)
  --disable-tcg

take care,
  Gerd


