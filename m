Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4020E323BCA
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 13:13:28 +0100 (CET)
Received: from localhost ([::1]:36012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEt2l-00051o-A8
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 07:13:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEt0H-0003xW-DV
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:10:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEt09-0003Eu-Un
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:10:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614168645;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SDjFT6nKlXpbWl9zc8jetTEJiPZVWk5v6deQwXzZTUg=;
 b=IxvCMoooQuHZcmaoSNIT6haAojWwOmYUlAEyS0G83PgzVQ5BXZrGA398sQPj3CPuB5uC44
 yU6iWXOOxffU1Efy3Be6wIchhJisK1RN1+/Sn26p5hOcnoTD5cGHm43LGcVAjGiIX3C6Pg
 DO5w35bkFPhj2b6b18uaXY0ZOWTKWM8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-W7O5nvsaOTaAXKfBM7CrYA-1; Wed, 24 Feb 2021 07:10:33 -0500
X-MC-Unique: W7O5nvsaOTaAXKfBM7CrYA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6D98427DE;
 Wed, 24 Feb 2021 12:08:26 +0000 (UTC)
Received: from redhat.com (ovpn-115-119.ams2.redhat.com [10.36.115.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F53919C47;
 Wed, 24 Feb 2021 12:08:22 +0000 (UTC)
Date: Wed, 24 Feb 2021 12:08:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
Subject: Re: Problem running functional tests from China
Message-ID: <YDZBsz/FFZtRCokJ@redhat.com>
References: <60118671-cd47-1900-59c6-96782dd7e26c@redhat.com>
 <20210224110605.GM6564@kitsune.suse.cz>
 <198ecefe-4d68-b43d-dfae-8a5ceeee9615@redhat.com>
 <20210224120140.GO6564@kitsune.suse.cz>
MIME-Version: 1.0
In-Reply-To: <20210224120140.GO6564@kitsune.suse.cz>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Huth <thuth@redhat.com>, avocado-devel <avocado-devel@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 24, 2021 at 01:01:40PM +0100, Michal Suchánek wrote:
> On Wed, Feb 24, 2021 at 12:37:53PM +0100, Philippe Mathieu-Daudé wrote:
> > On 2/24/21 12:06 PM, Michal Suchánek wrote:
> > > On Wed, Feb 24, 2021 at 10:29:15AM +0100, Philippe Mathieu-Daudé wrote:
> > >> Just to inform the files hosted on github don't work when
> > >> testing from China:
> > > 
> > >>
> > >> raw.githubusercontent.com resolves to 127.0.0.1
> > 
> > Actually not even localhost but 0.0.0.0 :)
> > 
> > > And from where does this come from?
> > > 
> > > Your local system, your ISP, ... ?
> > 
> > Probably the ISP:
> > 
> ...
> > 
> > I raised that problem not to find a way to bypass an ISP
> > firewall, but to see if there is a way to use another
> > storage for test artifacts so all the community can run
> > the tests.
> 
> I don't think protecting from random network malfunction is something
> the qemu project can do.
> 
> That said, downloading the test data during test run does indeed look
> fragile.
> 
> We have the concept of git submodules which is used in qemu extensively
> so the test data could possibly be included directly in the git tree.
> 
> The obvious downside is that the current and past test binaries will take
> up disk space for all users that check out the repository, even those
> that don't run the tests.

We explicitly do not want to be distributing / including the
images ourselves, as that makes the QEMU project responsible for
license compliance and thus provision of full & corresponding source.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


