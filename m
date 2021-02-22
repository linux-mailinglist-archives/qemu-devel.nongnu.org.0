Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4F7321EC5
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 19:05:23 +0100 (CET)
Received: from localhost ([::1]:40586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEFaE-0000pB-Mw
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 13:05:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEFXA-0006wQ-7A
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 13:02:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEFX3-00043f-PY
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 13:02:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614016925;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=IDcPCbkKtDJxPr45czbgaT02f4DIQ3Ja1wgv++iyUfs=;
 b=CgExR4ne6v6JcJWHs0YIST/fyWgrMkcIHOl/1gi34AZe9WCB5ptFviJcwczRb6/4F0Vv9v
 TgN2BF0VRNUpcmI0v0cDiN4JnYauCpfc2aV/zKAxj0/Gykz51mrs5SU3LoRRzUTammt7Da
 XZR1ZSBm/5fIO3WRJeVu1ABZwedohrs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-scKIVtL3PA2lKS6MeesT_Q-1; Mon, 22 Feb 2021 13:02:00 -0500
X-MC-Unique: scKIVtL3PA2lKS6MeesT_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92C80107ACF7;
 Mon, 22 Feb 2021 18:01:59 +0000 (UTC)
Received: from redhat.com (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 04B6D60DA0;
 Mon, 22 Feb 2021 18:01:54 +0000 (UTC)
Date: Mon, 22 Feb 2021 18:01:52 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: A brief look at deprecating our JSON extensions over RFC 8259
Message-ID: <YDPxkDTj5iC8TxPl@redhat.com>
References: <875z2knoa5.fsf@dusky.pond.sub.org>
 <ceb5d0f8-3022-e91a-006b-5ac6e5862e4a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ceb5d0f8-3022-e91a-006b-5ac6e5862e4a@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: libvir-list@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 22, 2021 at 06:42:00PM +0100, Paolo Bonzini wrote:
> On 22/02/21 15:57, Markus Armbruster wrote:
> > * The block layer's pseudo-protocol "json:" (which can get embedded in
> >    image headers)
> 
> If it gets embedded in image headers, I don't think we'll be able to
> deprecate it ever.  We'd need to keep a converter for old images, at which
> point it's simpler to keep the extensions.

Even if we can only use a standard JSON parser for QMP + QGA, that's a
already a significant net win long term IMHO. Both of those are security
critical components and also areas where we might want different language
impls as we increasingly use a multi-process model, so avoiding use of
extensins is good.

Even for the block layer, we don't neccessarily need to keep compat at
runtime. It could be sufficient to have an extended deprecation period
and then provide an offline helper script to re-write the qcow2 backing
store field to use " instead of ' ....assuming we actually get real
world pushback from people who really have used ' - we don't know if
there are such people yet.

We can do deprecation in a multi stage process - deprecation for everything,
then block it for QMP + QGA after 2 cycles, while still allowing it for qcow2,
and  eventually block for qcow2 3 years later or something like that.

IOW, I wouldn't give up on trying to deprecate it.



Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


