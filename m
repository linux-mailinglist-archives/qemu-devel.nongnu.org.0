Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCAD3A153A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 15:13:20 +0200 (CEST)
Received: from localhost ([::1]:39184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqy1H-0002f8-2P
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 09:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lqxzg-0001wC-NL
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 09:11:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lqxzd-0001ih-45
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 09:11:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623244295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ATZZ1YU/msSDUO0Idzp5LAMJxyfuSWOYPQ2qn6RdMyU=;
 b=SeUJyICEkLPT+RyJsdeSfnHcCLK6V14VFmZf7F7ZlWi18O4E9YrzOIobmzjjKiY3C+MsvN
 HXeV9rdsYD3FAGkegF06WPKv1DuiyEiJkIYIMyIiLoeugnUKOv25X9FfWqCzjdm96m5aCp
 VmcaE05bk1IuVQ7ooPpycXRzUpRhK4s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-nsURYRdPNRG9UHjE2yLmdQ-1; Wed, 09 Jun 2021 09:11:34 -0400
X-MC-Unique: nsURYRdPNRG9UHjE2yLmdQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61FE8192CC44
 for <qemu-devel@nongnu.org>; Wed,  9 Jun 2021 13:11:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7FC6100238C;
 Wed,  9 Jun 2021 13:11:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5CA73113865F; Wed,  9 Jun 2021 15:11:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [RFC QEMU PATCH] ui: Make the DisplayType enum entries conditional
References: <20210609100240.1285032-1-thuth@redhat.com>
 <20210609112405.pyv62l22g5ympoe4@sirius.home.kraxel.org>
Date: Wed, 09 Jun 2021 15:11:25 +0200
In-Reply-To: <20210609112405.pyv62l22g5ympoe4@sirius.home.kraxel.org> (Gerd
 Hoffmann's message of "Wed, 9 Jun 2021 13:24:05 +0200")
Message-ID: <878s3jmbcy.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: libvir-list@redhat.com, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>, smitterl@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gerd Hoffmann <kraxel@redhat.com> writes:

> On Wed, Jun 09, 2021 at 12:02:40PM +0200, Thomas Huth wrote:
>> Libvirt's "domcapabilities" command has a way to state whether
>> certain graphic frontends are available in QEMU or not. Originally,
>> libvirt looked at the "--help" output of the QEMU binary to determine
>> whether SDL was available or not (by looking for the "-sdl" parameter
>> in the help text), but since libvirt stopped doing this analysis of
>> the help text, the detection of SDL is currently broken, see:
>> 
>>  https://bugzilla.redhat.com/show_bug.cgi?id=1790902
>> 
>> QEMU should provide a way via the QMP interface instead. The simplest
>> way, without introducing additional commands, is to make the DisplayType
>> enum entries conditional, so that the enum only contains the entries if
>> the corresponding CONFIG_xxx switches have been set.
>
> Hmm, that'll break for the "dnf remove qemu-ui-sdl" case ...

By design, query-qmp-schema reflects compile-time configuration.  It
predates modules, and has not been updated for modules.

For stuff that cannot be built as module, yes means yes in
query-qmp-schema.

For stuff that can be built as module, yes means maybe: yes if built-in
or the module is loadable, else no.

Modules are not quite transparent there.  Transparency is a design goal,
but I'm afraid it's an unattainable one.

Parsing -help output would have the same issue.

The only way to upgrade a maybe to a yes is to load the module.  As long
as module loading is implicit (because transparency!), the only way to
load the module is to try using the feature, and recognize "can't load
module" failures.  "Just try and recognize failures" is workable in
simple cases.  In not so simple cases, it can be complex, slow and
fragile (if it wasn't, introspection likely would not exist; see my
"QEMU interface introspection: From hacks to solutions" talk at KVM
Forum 2015).


