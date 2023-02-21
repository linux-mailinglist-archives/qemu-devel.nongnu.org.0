Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3214969E443
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 17:10:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUVDH-0003Ca-DN; Tue, 21 Feb 2023 11:09:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUVDF-0003CQ-Ms
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 11:09:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUVDD-0000El-HP
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 11:09:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676995790;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=mwPeIBdehfvf2MpCXh8C7Ko4cDNrTxEWfaprcnrpcEk=;
 b=hWI9Gm7xXIvJuf1BH9Ke5U/Iq3k4rtRJFARc7GbEeLFxHrLQ1L8R+NAAkvkAc7UuNr8+Hf
 psBAq/b1HeTsQ2j7SdWd06ovuBVirwHCkwwNy+fwe6TL+pjDWgRbrSWgVffZNDF3QGTPIq
 gQ6emhtB5YKqCFMjOJbtrnqoIC2pKqk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-1TkOFdujNUe7qJi1-6igfA-1; Tue, 21 Feb 2023 11:09:46 -0500
X-MC-Unique: 1TkOFdujNUe7qJi1-6igfA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DCB5811E9C;
 Tue, 21 Feb 2023 16:09:46 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA430400DFA1;
 Tue, 21 Feb 2023 16:09:44 +0000 (UTC)
Date: Tue, 21 Feb 2023 16:09:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH] tests: Disable migration-test
Message-ID: <Y/Tsxp2dbkcTI1WD@redhat.com>
References: <20230221132726.2892383-1-peter.maydell@linaro.org>
 <Y/Thas4efx14JsBi@work-vm>
 <CAFEAcA9=p0XYti45m0sW+iO9qgF9iXpeOPvHd7Xpy32yCUL3sw@mail.gmail.com>
 <Y/TlB36EjrWwr2ne@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y/TlB36EjrWwr2ne@work-vm>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Feb 21, 2023 at 03:36:39PM +0000, Dr. David Alan Gilbert wrote:
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > On Tue, 21 Feb 2023 at 15:21, Dr. David Alan Gilbert
> > <dgilbert@redhat.com> wrote:
> > > Damn this is really going to impact the stability of migration if we
> > > don't regularly test.
> > > But fundamentally, I've never been able to debug much of the reports
> > > that come from flakyness in gitlab ci; we're not getting the most basic
> > > information like which subtest or where we're upto in the test which
> > > makes it very very hard to debug.
> > 
> > Right, but if you want more information you need to change the
> > tests and/or test harness to provide it.
> 
> I don't think the migration test is doing anything odd in that respect;
> We've just got a bunch of qtest tests; having a test framework which
> doesn't tell you which test failed is very difficult.

Right so the problem here is the use of 'bail out'. From the POV
of the TAP output format that is an immediate termination, so there
is nothing to report about which test was being run.

To make the failing test visible, it needs to NOT trigger a bail
out, but instead report an "not ok" line, which will show the
test case name. AFAIK, this is a limitation of glib's test harness
and its adoption of TAP. You can't get the test case name printed
until the test case is finished. And glib tests fail by calling
assert, so they will inherantly trigger 'bail out' logic from a
TAP POV.

IIRC, the historical non-TAP output format would output the test
case name first, and then once done report ok/not ok.

The workaround would be for glib to use a TAP diagnostic line
to print the test case it is about to run. It already uses the
diagnostic lines to report test groups eg

$ ./build//tests/unit/test-io-channel-command
# random seed: R02S0718b3006d3dcf15099db36b61dff3e8
1..4
# Start of io tests
# Start of channel tests
# Start of command tests
# Start of fifo tests
ok 1 /io/channel/command/fifo/sync
ok 2 /io/channel/command/fifo/async
# End of fifo tests
# Start of echo tests
**
ERROR:../tests/unit/test-io-channel-command.c:102:test_io_channel_command_echo: assertion failed: (rand() < 0.5)
Bail out! ERROR:../tests/unit/test-io-channel-command.c:102:test_io_channel_command_echo: assertion failed: (rand() < 0.5)
Aborted (core dumped)


would have to be changed to report

$ ./build//tests/unit/test-io-channel-command
# random seed: R02S0718b3006d3dcf15099db36b61dff3e8
1..4
# Start of io tests
# Start of channel tests
# Start of command tests
# Start of fifo tests
# Running /io/channel/command/fifo/sync
ok 1 /io/channel/command/fifo/sync
# Running /io/channel/command/fifo/async
ok 2 /io/channel/command/fifo/async
# End of fifo tests
# Start of echo tests
# Running /io/channel/command/echo/sync
**
ERROR:../tests/unit/test-io-channel-command.c:102:test_io_channel_command_echo: assertion failed: (rand() < 0.5)
Bail out! ERROR:../tests/unit/test-io-channel-command.c:102:test_io_channel_command_echo: assertion failed: (rand() < 0.5)
Aborted (core dumped)

so we see exactly what was running.

Without this though, we can still figure out what was running. You
have to look back for the previous 'ok' line and see what it was.
Then locally run '/path/to/test -l' to list the test case names.
The one you want is the one immediately after the last 'ok' (not ok)
line.

Rather tedious for sure, but not impossible.

Worth an RFE for glib, but would be a while before we saw the benefit.

As a workaround, we could print out TAP diagnostic output ourselves
in any qtests that we see as especially unreliable. A diagnostic
output is any line printed on stdout that starts with a '# '

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


