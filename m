Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4E3229329
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jul 2020 10:10:29 +0200 (CEST)
Received: from localhost ([::1]:37086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jy9pc-0005er-Ug
	for lists+qemu-devel@lfdr.de; Wed, 22 Jul 2020 04:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jy9nn-0003iS-B2
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 04:08:35 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:39027
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jy9nl-0004Ph-QD
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 04:08:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595405313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MgfNE+PAR/9BA4UEFBs3QuKsyJVQujP57Hz9n04gMPo=;
 b=HPxUWcIjfpBx3I53nh646OtsLIf9pAm12Nk6Y7qDPRLYyHN1SSVl14wvhu1nVndiCPgO+c
 8oONtxFxuC/xhVZeWV5lb3uunQAf0/NnWWOYW4Nif3A3nDp+hZyabvn/VNWlzF2KUbBcIs
 mqkUWve9ugb+uFPhaMRAlDbf+EzFA2w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-7VsyqTvWN6CPNJVOVbMDLA-1; Wed, 22 Jul 2020 04:08:31 -0400
X-MC-Unique: 7VsyqTvWN6CPNJVOVbMDLA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53186E918
 for <qemu-devel@nongnu.org>; Wed, 22 Jul 2020 08:08:30 +0000 (UTC)
Received: from titinator (ovpn-113-160.ams2.redhat.com [10.36.113.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D0995BAD5;
 Wed, 22 Jul 2020 08:08:22 +0000 (UTC)
References: <20200624131045.14512-1-kraxel@redhat.com>
 <20200624131045.14512-6-kraxel@redhat.com>
 <7hd04qmf7z.fsf@turbo.dinechin.lan>
 <20200721143305.nsxtsjg6kj57kqj4@sirius.home.kraxel.org>
User-agent: mu4e 1.5.2; emacs 26.3
From: Christophe de Dinechin <dinechin@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v5 05/10] ccid: build smartcard as module
In-reply-to: <20200721143305.nsxtsjg6kj57kqj4@sirius.home.kraxel.org>
Date: Wed, 22 Jul 2020 10:08:20 +0200
Message-ID: <lywo2wgeff.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.81; envelope-from=dinechin@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 23:34:34
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
Cc: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr?= =?utf-8?Q?=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020-07-21 at 16:33 CEST, Gerd Hoffmann wrote...
>> >  ifeq ($(CONFIG_USB_SMARTCARD),y)
>> >  common-obj-y                          += dev-smartcard-reader.o
>>
>> I'm curious why you don't use something like:
>>
>> common-obj-$(CONFIG_USB_SMARTCARD)
>>
>> Do we want to be able to configure individual elements as modules?
>> Or is the intent to force as module things that are marked as 'y'?
>
> qemu kconfig miniconf handles bool only, not tristate.

Ah, I guess that right, I had a small "fix" for part of that in a recent
RFC, but you don't have it. OK.

>
> So, yes, for now we can do only "all modules" or "no modules" but
> nothing inbetween.
>
> take care,
>   Gerd


--
Cheers,
Christophe de Dinechin (IRC c3d)


