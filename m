Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0213A23AF
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 07:03:19 +0200 (CEST)
Received: from localhost ([::1]:58724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrCqc-00063J-HB
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 01:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrCpT-0005NO-TW
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 01:02:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrCpQ-0005S8-2m
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 01:02:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623301322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6H/8VbeQq9UIXSDHx3IFsljesCtqB9fRqjLcOQ906mU=;
 b=FiX/3eU3TMYMQDOOzFemSPJn9HTJxz3OPlzR5R75jum/v87vrI8qq14/oSYnUOZjEruWR6
 gJjLyW90/xthNpnz04Uai6vyA/Svg4VmU41avHaSnlgAWcgU/RuE6ICcrSG05yjfA1xMIz
 tlhb4CD/7gTil3Yl9DLohujcpsOtdIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-jRgsC4D6NV6JcaU6mLWnPA-1; Thu, 10 Jun 2021 01:02:00 -0400
X-MC-Unique: jRgsC4D6NV6JcaU6mLWnPA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB9698030A0
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 05:01:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AA1219C46;
 Thu, 10 Jun 2021 05:01:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A1D3E113865F; Thu, 10 Jun 2021 07:01:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [RFC QEMU PATCH] ui: Make the DisplayType enum entries conditional
References: <20210609100240.1285032-1-thuth@redhat.com>
 <20210609112405.pyv62l22g5ympoe4@sirius.home.kraxel.org>
 <YMCmNrcNByZ+Ozxn@redhat.com>
 <20210609114921.mc4upvizeobfruaw@sirius.home.kraxel.org>
 <16fdaf9e-e3ed-9de5-932c-3db33c6f77ee@redhat.com>
 <20210609125051.l5qh3ub3sau47kow@sirius.home.kraxel.org>
Date: Thu, 10 Jun 2021 07:01:51 +0200
In-Reply-To: <20210609125051.l5qh3ub3sau47kow@sirius.home.kraxel.org> (Gerd
 Hoffmann's message of "Wed, 9 Jun 2021 14:50:51 +0200")
Message-ID: <87h7i6gvnk.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 libvir-list@redhat.com, smitterl@redhat.com, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gerd Hoffmann <kraxel@redhat.com> writes:

>   Hi,
>
>> > The #if CONFIG_SDL approach will not work because qemu will continue to
>> > report sdl as supported even when the sdl module is not installed any
>> > more.
>> 
>> I guess we'd need a separate QMP command to fix that, which tries to load
>> the modules first when being called? Something similar to what is being done
>> in qemu_display_help() ?
>
> That would work, yes.
>
>> That's certainly doable, too, just a little bit more complex...
>
> Alternative idea: turn QemuDisplay into an ObjectClass, then it'll be
> visible in qom introspection.  Likewise a bit more complex ...
>
>> do we want that?  Or is the quick-n-easy way via the schema good
>> enough for most use cases?
>
> Would be better than nothing, but I'd prefer something which works
> properly with modular qemu ...

Define "properly" :)

Without modules, qom-list-types has no side-effects, as introspection
should be.  With modules, it loads *all* modules known to define QOM
types, running their initialization code.

It loads them all even when asked to list only some, with argument
"implements".

In theory, management applications not having to know anything about
modules is nice.  Whether it'll work out in practice remains to be seen.
I'm not exactly confident.

[...]


