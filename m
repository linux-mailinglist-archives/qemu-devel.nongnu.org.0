Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E432D323C7D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 13:58:51 +0100 (CET)
Received: from localhost ([::1]:34998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEtkg-00045L-Ve
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 07:58:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEtjR-0003ES-GG
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:57:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEtjM-0006S3-Vj
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:57:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614171447;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wvr+RIocPbV3ORVyHllIG2mWWkjdy+nr7oh+nuWJ66E=;
 b=WvyhMMA87KrMN+GPp3+5SWfPpK8VNipM2YDMccrCyja4RjyTH+kGmrlOeWgYWnRbJeN4/M
 gGdXiEFVSLvDb0TpeHaNGR0suGK+M5Gy/FCWGY+Ig2T+qwWGa0nlcNE24YK6+6zaDFrlWl
 aJfhysS06lUeGlANMkPUQBfPOennthY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-1cVkx6MDMBuLpfakhy8M3w-1; Wed, 24 Feb 2021 07:57:25 -0500
X-MC-Unique: 1cVkx6MDMBuLpfakhy8M3w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDEDD19611A4;
 Wed, 24 Feb 2021 12:57:24 +0000 (UTC)
Received: from redhat.com (ovpn-115-119.ams2.redhat.com [10.36.115.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF43210016F8;
 Wed, 24 Feb 2021 12:57:17 +0000 (UTC)
Date: Wed, 24 Feb 2021 12:57:13 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: Problem running functional tests from China
Message-ID: <YDZNKdD7ll2zoAk/@redhat.com>
References: <60118671-cd47-1900-59c6-96782dd7e26c@redhat.com>
 <20210224110605.GM6564@kitsune.suse.cz>
 <198ecefe-4d68-b43d-dfae-8a5ceeee9615@redhat.com>
 <20210224120140.GO6564@kitsune.suse.cz>
 <YDZBsz/FFZtRCokJ@redhat.com>
 <0de93d2b-32bb-d0eb-646c-e3a8bb1943a7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0de93d2b-32bb-d0eb-646c-e3a8bb1943a7@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
 Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>,
 avocado-devel <avocado-devel@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 24, 2021 at 01:48:25PM +0100, Philippe Mathieu-Daudé wrote:
> On 2/24/21 1:08 PM, Daniel P. Berrangé wrote:
> > On Wed, Feb 24, 2021 at 01:01:40PM +0100, Michal Suchánek wrote:
> >> On Wed, Feb 24, 2021 at 12:37:53PM +0100, Philippe Mathieu-Daudé wrote:
> >>> On 2/24/21 12:06 PM, Michal Suchánek wrote:
> >>>> On Wed, Feb 24, 2021 at 10:29:15AM +0100, Philippe Mathieu-Daudé wrote:
> >>>>> Just to inform the files hosted on github don't work when
> >>>>> testing from China:
> >>>>
> >>>>>
> >>>>> raw.githubusercontent.com resolves to 127.0.0.1
> >>>
> >>> Actually not even localhost but 0.0.0.0 :)
> >>>
> >>>> And from where does this come from?
> >>>>
> >>>> Your local system, your ISP, ... ?
> >>>
> >>> Probably the ISP:
> >>>
> >> ...
> >>>
> >>> I raised that problem not to find a way to bypass an ISP
> >>> firewall, but to see if there is a way to use another
> >>> storage for test artifacts so all the community can run
> >>> the tests.
> >>
> >> I don't think protecting from random network malfunction is something
> >> the qemu project can do.
> >>
> >> That said, downloading the test data during test run does indeed look
> >> fragile.
> >>
> >> We have the concept of git submodules which is used in qemu extensively
> >> so the test data could possibly be included directly in the git tree.
> >>
> >> The obvious downside is that the current and past test binaries will take
> >> up disk space for all users that check out the repository, even those
> >> that don't run the tests.
> > 
> > We explicitly do not want to be distributing / including the
> > images ourselves, as that makes the QEMU project responsible for
> > license compliance and thus provision of full & corresponding source.
> 
> I am not asking that QEMU redistribute these files, I'm asking to the
> community if someone know an alternative to store files so we can run
> QEMU tests in Chinese cloud farms.
> 
> Back to your comment, should we remove these tests?

No, I don't think that we should do that.

If someone has broken ISP and they need to run all tests, then they'll
need to use a VPN.

Regardless of that though, we should make sure that tests automatically
mark themselves as "skipped" if any downloading of assets fails. ie a
download failure shouldn't cause tests to report failure.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


