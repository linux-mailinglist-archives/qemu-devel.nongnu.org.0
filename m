Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF7C6A6B45
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 12:01:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXKCf-0007Dj-EB; Wed, 01 Mar 2023 06:00:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXKCU-00071K-Tb
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 06:00:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXKCS-0006mV-R0
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 06:00:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677668443;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=6MZpvl2Tm2SPd4hQZLfl2MuiASuQIz9lRXyXdFfEFLs=;
 b=OXlBQMLxPl3qat7ma0AomcWsIyvDFksXIIrIUJyvIRtT8F91AeaKD+ZzDzNKajkrwHHH+d
 XwtUyBGQcogZybVoYRBY7Rw4meCFbikzCP/KMnsihTgd5X1ZkIvyNxl6Ao4hxxMzeTn1DM
 kVjIcfSn5WoHP7Fm5k0BOCgu0vXo0c8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-sYD0cT-3OCyMlKqlzfx0ag-1; Wed, 01 Mar 2023 06:00:40 -0500
X-MC-Unique: sYD0cT-3OCyMlKqlzfx0ag-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EB513C0E209;
 Wed,  1 Mar 2023 11:00:40 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 528102026D4B;
 Wed,  1 Mar 2023 11:00:38 +0000 (UTC)
Date: Wed, 1 Mar 2023 11:00:35 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, alxndr@bu.edu,
 pbonzini@redhat.com, bsd@redhat.com, stefanha@redhat.com,
 darren.kenny@oracle.com, Qiuhao.Li@outlook.com, fam@euphon.net,
 lvivier@redhat.com
Subject: Re: [PATCH] tests: Ensure TAP version is printed before other messages
Message-ID: <Y/8wU+w+dvIHlu+U@redhat.com>
References: <20230227174019.1164205-1-rjones@redhat.com>
 <6e28af8e-3e71-9888-8832-786550b81983@redhat.com>
 <20230301105214.GZ7636@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230301105214.GZ7636@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

On Wed, Mar 01, 2023 at 10:52:14AM +0000, Richard W.M. Jones wrote:
> On Tue, Feb 28, 2023 at 09:30:56PM +0100, Thomas Huth wrote:
> > On 27/02/2023 18.40, Richard W.M. Jones wrote:
> > >These two tests were failing with this error:
> > >
> > >   stderr:
> > >   TAP parsing error: version number must be on the first line
> > >   [...]
> > >   Unknown TAP version. The first line MUST be `TAP version <int>`. Assuming version 12.
> > >
> > >This can be fixed by ensuring we always call g_test_init first in the
> > >body of main.
> > >
> > >Thanks: Daniel Berrange, for diagnosing the problem
> > >Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> > >---
> > >  tests/qtest/fuzz-lsi53c895a-test.c | 4 ++--
> > >  tests/qtest/rtl8139-test.c         | 5 +++--
> > >  2 files changed, 5 insertions(+), 4 deletions(-)
> > >
> > >diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
> > >index a9254b455d..2012bd54b7 100644
> > >--- a/tests/qtest/fuzz-lsi53c895a-test.c
> > >+++ b/tests/qtest/fuzz-lsi53c895a-test.c
> > >@@ -112,12 +112,12 @@ static void test_lsi_do_dma_empty_queue(void)
> > >  int main(int argc, char **argv)
> > >  {
> > >+    g_test_init(&argc, &argv, NULL);
> > >+
> > >      if (!qtest_has_device("lsi53c895a")) {
> > >          return 0;
> > 
> > Could you please double-check that the !lsi53c895a case works fine,
> > too? (just temporarily change it into a "if (1) { ..." statement)
> > ... I'm a little bit afraid that the TAP protocol might be
> > incomplete without the g_test_run() at the end otherwise. If so, you
> > might now need a "goto out" instead of the "return 0" here...
> 
> Applying ...
> 
> diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
> index 2012bd54b7..e0c902aac4 100644
> --- a/tests/qtest/fuzz-lsi53c895a-test.c
> +++ b/tests/qtest/fuzz-lsi53c895a-test.c
> @@ -114,7 +114,7 @@ int main(int argc, char **argv)
>  {
>      g_test_init(&argc, &argv, NULL);
>  
> -    if (!qtest_has_device("lsi53c895a")) {
> +    if (1) {
>          return 0;
>      }
>  
> ... and rerunning the tests, everything still passes.
> 
> The stdout of the test after this change is:
> 
> TAP version 13
> # random seed: R02S1c1f371a09fbfdf0dd747f898d55fe97
> 
> but apparently this version of TAP doesn't care (perhaps because the
> number of tests "1..2" is never printed?)

Right, the number of tests cannot be printed by g_test_init as the
tests haven't been registered yet. This will only get run in thue
g_test_run.

I recall sometime in the past I believe we've seen problems with
tests that exit without printing anything, but if that's a problem
it would be pre-existing with this test case as written.

The TAP spec:

   https://testanything.org/tap-version-13-specification.html

says the test plan (aka the '1..2' bit) is optional:

  "The plan is optional but if there is a plan before the
   test points it must be the first non-diagnostic line
   output by the test file."

So having merely the "TAP version 13" should be sufficient,
but then earlier glib doesn't print this at all. As I say
though, the existing test would already suffer from the
problem if it mattered.

> Anyway it doesn't appear to be a problem.

Yep, I think we are probably ok.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


