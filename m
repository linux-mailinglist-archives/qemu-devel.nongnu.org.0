Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 935CE2C697D
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 17:36:42 +0100 (CET)
Received: from localhost ([::1]:43000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kigjh-0006un-0Q
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 11:36:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1kigiZ-0006M6-Om
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 11:35:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1kigiX-00036C-BU
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 11:35:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606494927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dXcQJ0eYlO0nv8kwCI3Ve46dEit38Wh5Y9lHW/JT5dw=;
 b=ObWpO/jHIXgeyNiHxqMB7JMgDXvFUXLSOx1+4+M8oTEDtLLxr7yJGmuKvgCcSjW1nagZLD
 LQrJeCPPsu78+bFsRkOts37O3bTKtMDgqSIXgVCk/3H6b6ib/oDQJAuYZvH1wQpStNjvTx
 9iOhixdovy81oVTpdKpiHzKBp4VMkns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-B3q4Lr-INkKI0ne-Vucdeg-1; Fri, 27 Nov 2020 11:35:25 -0500
X-MC-Unique: B3q4Lr-INkKI0ne-Vucdeg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 251551842158;
 Fri, 27 Nov 2020 16:35:24 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A529419C46;
 Fri, 27 Nov 2020 16:35:19 +0000 (UTC)
Date: Fri, 27 Nov 2020 17:35:16 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH for-6.0 6/6] qapi: Deprecate 'query-kvm'
Message-ID: <20201127163516.GE105758@angien.pipo.sk>
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
 <20201116131011.26607-7-r.bolshakov@yadro.com>
 <20201127105059.GC1596141@redhat.com>
 <20201127112154.GA105758@angien.pipo.sk>
 <20201127114512.GE67322@SPB-NB-133.local>
 <20201127121809.GB105758@angien.pipo.sk>
 <20201127155316.GG1596141@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201127155316.GG1596141@redhat.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: libvir-list@redhat.com, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 27, 2020 at 15:53:16 +0000, Daniel Berrange wrote:
> On Fri, Nov 27, 2020 at 01:18:09PM +0100, Peter Krempa wrote:
> > On Fri, Nov 27, 2020 at 14:45:12 +0300, Roman Bolshakov wrote:

[...]

> IIUC, this all relies on us importing a dump of the latest QEMU
> capabilities into the libvirt test suite.
> 
> Most of the capabilities we import are the release version, but
> we also periodically import the git snapshot capabilities and
> will refresh them until GA of QEMU.
> 
> Could we arrange it so that libvirt only reports an error for use
> of deprecated interfaces when testing against the GA capabilities
> dump. If testing against QEMU git snapshot capabilities, we can
> emit a warning only.
> 
> That way, we'll have a grace period in which libvirt can see the
> warning from tests, and we would only need to add an override
> to silence it once we import the GA capabilities, at which time
> it is safe to implement the new solution too.

As I've noted in my reply to Markus, in many cases we develop features
on top of unreleased qemu features. I don't really want to throw a
spanner into that process.

While deprecating old interfaces which are changed would lead to
regression in behaviour rather than releasing a broken feature if
changes are done in the API of a new feature the situation is slightly
worse, but it's also a very rare occurence.

I want to basically just an agreement that after such a thing is done
libvirt will be notified. We'll still try to develop replacements sooner
which can actually catch problems in the new features sooner than they
are released in qemu.


