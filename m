Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2474D8AC7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 18:27:17 +0100 (CET)
Received: from localhost ([::1]:42818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nToTU-0001Qq-KE
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 13:27:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nToQm-0006LS-Ou
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:24:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nToQk-00060G-2Y
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:24:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647278665;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XmUEggvj5V5jiP6KlzAsy1LdrU7Qs0vdR+0O81Gs1Ew=;
 b=OgzSjiJ7EoOiFPGqBAEjvyOLifrpoOdR4IZ8Xyg1Nfwd0FgzzvAz2ppOP69sQ22rTPQbAz
 7sbc1EgZhoirwxZzej/ZDmHsySRwX3n0l5b/CTk6I41vwh/p4skUQLbFM/aXYflFMHZra0
 nfzHexhT02EJZyydWlvMPAwwxSL1cDE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-qKDUKpFsONukKrZrMFo7sw-1; Mon, 14 Mar 2022 13:24:23 -0400
X-MC-Unique: qKDUKpFsONukKrZrMFo7sw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56D0B80281D;
 Mon, 14 Mar 2022 17:24:23 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFDF02D47D;
 Mon, 14 Mar 2022 17:24:17 +0000 (UTC)
Date: Mon, 14 Mar 2022 17:24:15 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/18] migration queue
Message-ID: <Yi96P/Y4uZ3lLj4i@redhat.com>
References: <20220302182936.227719-1-dgilbert@redhat.com>
 <CAFEAcA9CrHEu8F7PGGTvsdyLnFJhan9V9FkHDgvapje+_E=hVA@mail.gmail.com>
 <f750a1a4-223c-9456-ab23-a616f7eb2625@gmail.com>
 <Yieku+cTxY0Xyp5C@work-vm>
 <CAFEAcA-Y_8KTxCPoSN3P0Cgfe6cEN74b-5U1SeKtAP7FdzFvZA@mail.gmail.com>
 <Yi92SN2Z3OZi82pS@redhat.com>
 <CAFEAcA-Chg3LQkh5PHmSyGCkmnYoPnTGMD=zm8jj-jxWeOLTxQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Chg3LQkh5PHmSyGCkmnYoPnTGMD=zm8jj-jxWeOLTxQ@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: thuth@redhat.com, quintela@redhat.com, s.reiter@proxmox.com,
 qemu-devel@nongnu.org, peterx@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 hreitz@redhat.com, f.ebner@proxmox.com, jinpu.wang@ionos.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 14, 2022 at 05:15:57PM +0000, Peter Maydell wrote:
> On Mon, 14 Mar 2022 at 17:07, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > So the test harness is waiting for a reply to 'query-migrate'.
> >
> > This should be fast unless QEMU has hung in the main event
> > loop servicing monitor commands, or stopped.
> 
> I was kind of loose with the terminology -- I don't remember whether
> it was actually hung in the sense of stopped entirely, or just
> "sat in a loop waiting for a migration state that never arrives".
> I'll try to look more closely if I can catch it in the act again.

Ah yes, if it is just forever migrating, that would match the
stack traces shown from the QEMUs. 

> One thing that makes this bug investigation trickier, incidentally,
> is that the migration-test code seems to depend on userfaultfd.
> That means you can't run it under 'rr'.

Yeah, we also can't turn on the tracing for a live QEMU since the
monitor connection is already in use. Kinda need to have a second
monitor instance present, that we can connect to for debugging
the migration state.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


