Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8E22DAEA9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:14:45 +0100 (CET)
Received: from localhost ([::1]:43054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpB6C-0002bp-R9
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:14:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpB2q-0008NO-0M
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:11:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpB2m-0006dK-GF
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:11:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608041470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kxid7UxWSQ+0Imna6OFEV9O6ID9SkP8K6TmfmOxeLJk=;
 b=apoTfofuasEhUvtBJkfuN61YMut3Z6cMo6kPV8pybZwCdXSaCetHeVadlKCO0xCHhveJcT
 l8hqgFwtRWgsKTgtzROeOJnOUGf3aTAOTjQ+lz6ZpR0supSMt7m5808z8a5QdSziQXs+J4
 LIpKCW/bsbL34AY8sD4JY+gybpp1kPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-O_BwJA_fMoW4EhydQNCmTg-1; Tue, 15 Dec 2020 09:11:09 -0500
X-MC-Unique: O_BwJA_fMoW4EhydQNCmTg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DE941934103;
 Tue, 15 Dec 2020 14:11:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 04A5760C17;
 Tue, 15 Dec 2020 14:11:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6F26711329A5; Tue, 15 Dec 2020 15:11:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2 04/12] i386: Register feature bit properties as class
 properties
References: <20201111183823.283752-1-ehabkost@redhat.com>
 <20201111183823.283752-5-ehabkost@redhat.com>
Date: Tue, 15 Dec 2020 15:11:06 +0100
In-Reply-To: <20201111183823.283752-5-ehabkost@redhat.com> (Eduardo Habkost's
 message of "Wed, 11 Nov 2020 13:38:15 -0500")
Message-ID: <87pn3b2m85.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> Class properties make QOM introspection simpler and easier, as
> they don't require an object to be instantiated.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

This is significantly more than just "simpler and easier".

The other day, I played with the QMP core to reduce its appetite for
malloc.  I came up with patches that should approximately halve it, and
felt quite pleased with myself.  I looked for a simple test to
demonstrate the effect.  Something with plenty of output.  Hmm, why not
query-cpu-definitions, it produces about 32KiB.  Instrument, instrument,
run, ... whaaaat?!?

My patches save some 7000 allocations (670 KiB total), roughly matching
my expectations.

Turns out this is a drop in the bucket: query-cpu-definitions still
takes some 180,000 allocations (almost 12 MiB total).  They're hiding
behind this line in qmp_query_cpu_definitions():

    g_slist_foreach(list, x86_cpu_definition_entry, &cpu_list);

The line takes more than a quarter second for me.

Hogging the main loop for a quarter second is not good.

Eduardo's patch reduces run time to 0.02 seconds (40,000 allocations, 9
MiB total).  It's a smaller pig now.


