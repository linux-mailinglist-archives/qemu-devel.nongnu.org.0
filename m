Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E16A222824C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jul 2020 16:34:39 +0200 (CEST)
Received: from localhost ([::1]:58192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxtLq-0002zX-W0
	for lists+qemu-devel@lfdr.de; Tue, 21 Jul 2020 10:34:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jxtKY-0002Ds-Q7
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 10:33:18 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:48414
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jxtKX-0005FP-5w
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 10:33:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595341996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rhOe5HqNqz770YsYpgSggdXC8RtYTYZVpMZtELfQG/s=;
 b=CcIIi911eQjxS2tuoh9XpkjL4dqbAmgQVQxU3Kvrb3zQTuihQOgjzgDn1yeOVmEwTfhgKX
 F7sIC6cDMktiGwczkggQv/DjIfLkgIpX5EiqTE09gRIBNUdbpFzUwASOCoJKdt62cV03J6
 1L0w9xd3TAErSifvM9A3pOMrq87opYo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-ekMqN-D9P1q5Hto14zcvOw-1; Tue, 21 Jul 2020 10:33:13 -0400
X-MC-Unique: ekMqN-D9P1q5Hto14zcvOw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2759C80046D
 for <qemu-devel@nongnu.org>; Tue, 21 Jul 2020 14:33:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-89.ams2.redhat.com
 [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 713522E020;
 Tue, 21 Jul 2020 14:33:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 823659D05; Tue, 21 Jul 2020 16:33:05 +0200 (CEST)
Date: Tue, 21 Jul 2020 16:33:05 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Christophe de Dinechin <dinechin@redhat.com>
Subject: Re: [PATCH v5 05/10] ccid: build smartcard as module
Message-ID: <20200721143305.nsxtsjg6kj57kqj4@sirius.home.kraxel.org>
References: <20200624131045.14512-1-kraxel@redhat.com>
 <20200624131045.14512-6-kraxel@redhat.com>
 <7hd04qmf7z.fsf@turbo.dinechin.lan>
MIME-Version: 1.0
In-Reply-To: <7hd04qmf7z.fsf@turbo.dinechin.lan>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 10:15:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> >  ifeq ($(CONFIG_USB_SMARTCARD),y)
> >  common-obj-y                          += dev-smartcard-reader.o
> 
> I'm curious why you don't use something like:
> 
> common-obj-$(CONFIG_USB_SMARTCARD)
> 
> Do we want to be able to configure individual elements as modules?
> Or is the intent to force as module things that are marked as 'y'?

qemu kconfig miniconf handles bool only, not tristate.

So, yes, for now we can do only "all modules" or "no modules" but
nothing inbetween.

take care,
  Gerd


