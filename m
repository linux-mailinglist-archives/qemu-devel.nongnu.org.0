Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A682F2C81E3
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 11:12:19 +0100 (CET)
Received: from localhost ([::1]:58612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjgAM-0006fi-Ly
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 05:12:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1kjg7S-0004R3-Av
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 05:09:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1kjg7O-0006Eu-Qx
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 05:09:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606730953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K0yODEoMwYMu1KxnVsbfn5ce5FrEE9jEvTSvCk+MZAs=;
 b=h2jiqEL9UMjeU5EbZmR2JL/DRQIcjW4Ok4KzO7hBXh5jrOGxznEs/swWz0vdBgAWVmSwJ2
 nb9eXXwp0FIGAy/BE7QHBV1aj8g+sgEV+faQMKPZv8N3hURZDS6+RFizFD+tIo6PgCsmdh
 3+7ZAIea2AXRLpm3PxP1HJSNI9mEEK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-8eZtCLbmMPqQOQjPBXjGSQ-1; Mon, 30 Nov 2020 05:09:11 -0500
X-MC-Unique: 8eZtCLbmMPqQOQjPBXjGSQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17F73104ECD1;
 Mon, 30 Nov 2020 10:09:10 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E0F945D9D2;
 Mon, 30 Nov 2020 10:09:04 +0000 (UTC)
Date: Mon, 30 Nov 2020 11:09:01 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH for-6.0 6/6] qapi: Deprecate 'query-kvm'
Message-ID: <20201130100901.GJ105758@angien.pipo.sk>
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
 <20201116131011.26607-7-r.bolshakov@yadro.com>
 <20201127105059.GC1596141@redhat.com>
 <20201127112154.GA105758@angien.pipo.sk>
 <20201127114512.GE67322@SPB-NB-133.local>
 <20201127121809.GB105758@angien.pipo.sk>
 <87h7paoldm.fsf@dusky.pond.sub.org>
 <20201127163013.GD105758@angien.pipo.sk>
 <87zh2zi4jf.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87zh2zi4jf.fsf@dusky.pond.sub.org>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: libvir-list@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 30, 2020 at 10:21:08 +0100, Markus Armbruster wrote:
> Peter Krempa <pkrempa@redhat.com> writes:
> 
> > On Fri, Nov 27, 2020 at 16:44:05 +0100, Markus Armbruster wrote:
> >> Peter Krempa <pkrempa@redhat.com> writes:

[...]

> > I know it's hard to enforce, but probably the cheapest in terms of
> > drawbacks any other solution would be.
> 
> We can and should try.  
> 
> Can we flag problematic interface changes automatically?  Semantic
> changes, no.  What about changes visible in query-qmp-schema?

I don't know the internals of qemu good enough, but from the perspective
of an user of 'query-qmp-schema' it might be possible but not without
additional tooling.

The output of query-qmp-schema is basically unreviewable when we are
updating it. A small change in the schema may trigger a re-numbering of
the internal type names so the result is a giant messy piece of JSON
where it's impossible to differentiate changes from churn.

I've played with generating/expanding all the possibilites and thus
stripping the internal numbering for a tool which would simplify writing
the query strings (a libvirtism for querying whether the QMP schema has
something [1]). This tool could be used in this case to generate a fully
expanded and sorted list which should in most cases be append only when
new stuff is added. This could be then used to see whether something
changed when we'd store the output and compare it against the new one.

Unfortunately that would just make query-qmp-schema dumps more
reviewable in libvirt though. A change in an interface would be noticed
only after it hits qemu upstream.

[1] https://gitlab.com/libvirt/libvirt/-/blob/08ae9e5f40f8bae0c3cf48f84181884ddd310fa0/src/qemu/qemu_qapi.c#L392
    https://gitlab.com/libvirt/libvirt/-/blob/08ae9e5f40f8bae0c3cf48f84181884ddd310fa0/src/qemu/qemu_capabilities.c#L1512


