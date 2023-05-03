Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D32456F5863
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 14:58:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puC2s-0004Lo-2m; Wed, 03 May 2023 08:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1puC2q-0004FT-Ba
 for qemu-devel@nongnu.org; Wed, 03 May 2023 08:57:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1puC2l-0004gn-3c
 for qemu-devel@nongnu.org; Wed, 03 May 2023 08:57:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683118633;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=AQ9q6v6cSzR8U8QnXMAQmXnuNZvV2e670qL7um+9BZ4=;
 b=UL5S8dbbG/6u++++GkutodH1Lmn45q+CX3qr+W3pIarWZpJHBAYKerIQ/6hrV30QeiUeqN
 DhHKTFNb6N8w3uSoofS63AVpg2HcFrontweESAHlhWIhy8xod6xJAUOly6BCoKDr0CNqcl
 IpovRfh+Y4QCKN+J/kddzlxgO+BdqBc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-4QWj4eUBMAKTBh8sS6rz_A-1; Wed, 03 May 2023 08:57:10 -0400
X-MC-Unique: 4QWj4eUBMAKTBh8sS6rz_A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E54829ABA1E;
 Wed,  3 May 2023 12:57:10 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B96B8492C13;
 Wed,  3 May 2023 12:57:08 +0000 (UTC)
Date: Wed, 3 May 2023 13:57:06 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Leonardo Bras <leobras@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>
Subject: Re: [PULL 00/21] Migration 20230428 patches
Message-ID: <ZFJaIglNQIKOCsep@redhat.com>
References: <20230428191203.39520-1-quintela@redhat.com>
 <5f76c54c-b300-8597-1b4e-fd29b3603d35@linaro.org>
 <87jzxrt3u7.fsf@secure.mitica>
 <CAFEAcA_G734ap+L-YfLt5Pd65VXFm2xcx_SFwD_ke8B7pcQGbQ@mail.gmail.com>
 <87lei5sriq.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87lei5sriq.fsf@secure.mitica>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, May 03, 2023 at 11:17:33AM +0200, Juan Quintela wrote:
> Peter Maydell <peter.maydell@linaro.org> wrote:
> > On Tue, 2 May 2023 at 11:39, Juan Quintela <quintela@redhat.com> wrote:
> >> Richard, once that we are here, one of the problem that we are having is
> >> that the test is exiting with an abort, so we have no clue what is
> >> happening.  Is there a way to get a backtrace, or at least the number
> >
> > This has been consistently an issue with the migration tests.
> > As the owner of the tests, if they are not providing you with
> > the level of detail that you need to diagnose failures, I
> > think that is something that is in your court to address:
> > the CI system is always going to only be able to provide
> > you with what your tests are outputting to the logs.
> 
> Right now I would be happy just to see what test it is failing at.
> 
> I am doing something wrong, or from the links that I see on richard
> email, I am not able to reach anywhere where I can see the full logs.
> 
> > For the specific case of backtraces from assertion failures,
> > I think Dan was looking at whether we could put something
> > together for that. It won't help with segfaults and the like, though.
> 
> I am waiting for that O:-)

I did have a play, but didn't get anything satisfactory working.
I could only capture a trace from a single thread and the hard
problems that really want traces usually involve multiple threads.
There's really no good substitute for an OS level crash collector
like systemd-coredump or abrtd :-( This is really worth an RFE
to GitLab as a possible enhancement to their shared runners.

> > You should be able to at least get the number of the subtest out of
> > the logs (either directly in the logs of the job, or else
> > from the more detailed log file that gets stored as a
> > job artefact in most cases).
> 
> Also note that the test is stopping in an abort, with no diagnostic
> message that I can see.  But I don't see where the abort cames from:

Any g_assert  failure will result in an abort, so there are many
possibilities.

We should be uploading the testlog.txt from meson test to show what
one asserts, but I've just discovered we're lacking 'when: always'
on our 'artifacts' declarations. So the artifacts are only uploaded
when the job succeeds, which the least useful scenario for our test
logs !

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


