Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F843A253A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 09:21:33 +0200 (CEST)
Received: from localhost ([::1]:43816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrF0O-0004dB-5j
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 03:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrEyT-00032i-TK
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 03:19:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrEyQ-00058B-K3
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 03:19:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623309568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AxnuI3e8822lKBzWzvjfQyTAqR+LBsvjcNBHuYtGlIo=;
 b=bDwHVFMm8SUXhK+48Bi72RDyj7pSsSlpoJTUbipngcywIDGu2NJ+tqFLTr+l0Q8q2gfFwn
 sOL3NOaskw/cgAWVAlru+hjb5ybmvGhuF7ko/gpzq8sEENOgbtk6Ez9Dud8Khg7Z6T1R4J
 +V3R92bqsVAdyf86R/LK3ajNleyIBxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-2Ja8NMrMNhK2N-PC1VM91A-1; Thu, 10 Jun 2021 03:19:24 -0400
X-MC-Unique: 2Ja8NMrMNhK2N-PC1VM91A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60A6710C1ADC;
 Thu, 10 Jun 2021 07:19:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 81F08105C877;
 Thu, 10 Jun 2021 07:19:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1D232113865F; Thu, 10 Jun 2021 09:19:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: GSoC Intro - TUI interface for QMP
References: <CAN6ztm-J2GoQKkLb=Az0H2Q8UKK4oE3PgXg7g14=T53sQAUyDg@mail.gmail.com>
 <CAN6ztm9JKPo05_qJo1cFGq2P6f1DzB9vu+VZ054e9MdHVkRLog@mail.gmail.com>
 <YKuq242kdKxhvHAr@stefanha-x1.localdomain>
 <CAN6ztm8rpDARg786+yq2S58T2wQ7TWSQ+H_3xgfUnRTbgc0k+A@mail.gmail.com>
 <d45d686b-ca43-821c-e843-cf0f963e4e6e@redhat.com>
 <87czswxuwn.fsf@dusky.pond.sub.org>
 <1577ce78-bf98-3f3d-7594-2b91d84967ec@redhat.com>
 <87sg1rp7yg.fsf@dusky.pond.sub.org>
 <879a774d-4aa2-9333-b413-bb59ef035525@redhat.com>
Date: Thu, 10 Jun 2021 09:19:15 +0200
In-Reply-To: <879a774d-4aa2-9333-b413-bb59ef035525@redhat.com> (John Snow's
 message of "Wed, 9 Jun 2021 13:06:15 -0400")
Message-ID: <874ke6gpak.fsf@dusky.pond.sub.org>
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
Cc: kwolf@redhat.com, ehabkost@redhat.com, qemu-devel@nongnu.org,
 wainersm@redhat.com, "Niteesh G. S." <niteesh.gs@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 6/9/21 7:56 AM, Markus Armbruster wrote:
>>> The client could cache the information. (Against what kind of an
>>> identifier? Can QEMU report some kind of token that uniquely
>>> identifies its binary or uniquely identifies the set of QAPI commands
>>> it supports?)
>
>> I proposed something like it to permit QMP clients cache
>> query-qmp-schema output.  Libvirt didn't want it, so it never got beyond
>> the idea stage.
>> 
>
> What ideas did you have for a cache key? We don't need to uniquely
> identify every instance or even every binary.
>
> I suppose we could use an md5/sha1 checksum of the QMP introspection output?

commit 39a181581650f4d50f4445bc6276d9716cece050
Author: Markus Armbruster <armbru@redhat.com>
Date:   Wed Sep 16 13:06:28 2015 +0200

    qapi: New QMP command query-qmp-schema for QMP introspection

[...]

    New QMP command query-qmp-schema takes its return value from that
    variable.  Its reply is some 85KiBytes for me right now.

Has since grown to ~160KiB.
    
    If this turns out to be too much, we have a couple of options:
    
    * We can use shorter names in the JSON.  Not the QMP style.
    
    * Optionally return the sub-schema for commands and events given as
      arguments.
    
      Right now qmp_query_schema() sends the string literal computed by
      qmp-introspect.py.  To compute sub-schema at run time, we'd have to
      duplicate parts of qapi-introspect.py in C.  Unattractive.
    
    * Let clients cache the output of query-qmp-schema.
    
      It changes only on QEMU upgrades, i.e. rarely.  Provide a command
      query-qmp-schema-hash.  Clients can have a cache indexed by hash,
      and re-query the schema only when they don't have it cached.  Even
      simpler: put the hash in the QMP greeting.
    
    Signed-off-by: Markus Armbruster <armbru@redhat.com>
    Reviewed-by: Eric Blake <eblake@redhat.com>

Note this glosses over what exactly is hashed.  Back then, we generated
query-qmp-schema's output as a string, so we would have hashed that.
Today, we generate a QLitObject.  Less trivial to hash.  Quite feasible
all the same.

NB: Commit messages are love letters to your future self :)

[...]


