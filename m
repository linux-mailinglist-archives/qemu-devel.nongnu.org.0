Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E884D8BF6
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 19:56:21 +0100 (CET)
Received: from localhost ([::1]:52318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTprg-0002sB-LQ
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 14:56:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nTppn-0001mP-Od
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 14:54:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nTppl-0003WN-PR
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 14:54:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647284060;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=dcbhIrzTigZ4WxMe1bkx5Tym9p5SQU29bd7Nd2VaeyE=;
 b=RLcAoa0SQJ6mQomeIXznmRKo6Yb9VVOazyuC+O0fGJ8MGxJvve90A6ZeK/rcnsCQA+gweV
 HQ8OFWlSyUkSMAcJX4lvdKwRIy5QHAPYTjwyWiDDTpwWsrBRsBQhkSV1ZLHLB2yc4g66rE
 EE1oGfYU3+zw9wx4D3Yq1yrraNtOwbU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-hAYrWUQVOUOJnZxeRcQb0g-1; Mon, 14 Mar 2022 14:54:06 -0400
X-MC-Unique: hAYrWUQVOUOJnZxeRcQb0g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B20CC1C05AD4;
 Mon, 14 Mar 2022 18:53:37 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E078A5E3A35;
 Mon, 14 Mar 2022 18:53:32 +0000 (UTC)
Date: Mon, 14 Mar 2022 18:53:29 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PULL 00/18] migration queue
Message-ID: <Yi+PKfznFlm9MT1A@redhat.com>
References: <20220302182936.227719-1-dgilbert@redhat.com>
 <CAFEAcA9CrHEu8F7PGGTvsdyLnFJhan9V9FkHDgvapje+_E=hVA@mail.gmail.com>
 <f750a1a4-223c-9456-ab23-a616f7eb2625@gmail.com>
 <Yieku+cTxY0Xyp5C@work-vm>
 <CAFEAcA-Y_8KTxCPoSN3P0Cgfe6cEN74b-5U1SeKtAP7FdzFvZA@mail.gmail.com>
 <Yi92SN2Z3OZi82pS@redhat.com>
 <CAFEAcA-Chg3LQkh5PHmSyGCkmnYoPnTGMD=zm8jj-jxWeOLTxQ@mail.gmail.com>
 <Yi+BbRJ9lbJ4ku9L@work-vm>
 <CAFEAcA_z2M2_MyWXT7iUKAFzpj1vWsw0DPV7o4YHp2d-1scf9g@mail.gmail.com>
 <Yi+HhvvlurQdW/Oq@work-vm>
MIME-Version: 1.0
In-Reply-To: <Yi+HhvvlurQdW/Oq@work-vm>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Cc: Peter Maydell <peter.maydell@linaro.org>, thuth@redhat.com,
 quintela@redhat.com, s.reiter@proxmox.com, qemu-devel@nongnu.org,
 peterx@redhat.com, "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 hreitz@redhat.com, f.ebner@proxmox.com, jinpu.wang@ionos.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 14, 2022 at 06:20:54PM +0000, Dr. David Alan Gilbert wrote:
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > On Mon, 14 Mar 2022 at 17:55, Dr. David Alan Gilbert
> > <dgilbert@redhat.com> wrote:
> > >
> > > Peter Maydell (peter.maydell@linaro.org) wrote:
> > > > One thing that makes this bug investigation trickier, incidentally,
> > > > is that the migration-test code seems to depend on userfaultfd.
> > > > That means you can't run it under 'rr'.
> > >
> > > That should only be the postcopy tests; the others shouldn't use that.
> > 
> > tests/qtest/migration-test.c:main() exits immediately without adding
> > any of the test cases if ufd_version_check() fails, so no userfaultfd
> > means no tests run at all, currently.
> 
> Ouch! I could swear we had a fix for that.
> 
> Anyway, it would be really good to see what migrate-query was returning;
> if it's stuck in running or cancelling then it's a problem with multifd
> that needs to learn to let go if someone is trying to cancel.
> If it's failed or similar then the test needs fixing to not lockup.

This patch of mine may well be helpful:

  https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg03192.html

when debugging my TLS tests various mistakes meant I ended up with
a failed session, but the test was spinning forever on 'query-migrate'.
It was waiting for it to finish one iteration, and never bothering to
validate that the reported status == active.

If that patch was merged, it might well cause the test to abort in an
assertion rather than spining forever, if status == failed.

Of course someone would still need to find out why it failed, but
none the less, I think assert is nicer than spin forever.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


