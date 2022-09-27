Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A635EC951
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 18:22:23 +0200 (CEST)
Received: from localhost ([::1]:41808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odDLh-0005Lp-3e
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 12:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1odCgv-0005nR-B4
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 11:40:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1odCgq-0006mY-Ll
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 11:40:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664293206;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+16UNYAKtcZ2z7A4+b69PNZnJxlhef1VpJVBD0DCQ6w=;
 b=Oh7H1i6IwSi+P5ZFDZjYwrs9OoPx3cqm+ei80IOwK8ycmo7frNSIX/fmz2xV0fikM8m5Tz
 Sr5aNVwnn+eLHEWqqLj+fk5v7pWfvCffTxfb/LYO6+dB3UYxoNFK0VVAUC6tAdgJDjhCm6
 mVB5a0auaDG5eRZTN30Fdd2Fvx00GyQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-NU72TcBWMJ-SqgKlBObV8A-1; Tue, 27 Sep 2022 11:40:05 -0400
X-MC-Unique: NU72TcBWMJ-SqgKlBObV8A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D815B80A0BF;
 Tue, 27 Sep 2022 15:40:04 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.77])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 41B3C40C6EC3;
 Tue, 27 Sep 2022 15:40:03 +0000 (UTC)
Date: Tue, 27 Sep 2022 16:40:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Juan Quintela <quintela@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 35/39] tests/qtest: migration-test: Skip running some
 TLS cases for win32
Message-ID: <YzMZUGrE6SCfMeyb@redhat.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-36-bmeng.cn@gmail.com>
 <YytBFdDoLVgkgqIX@work-vm> <YytIkiMEC/KHL/9p@redhat.com>
 <CAEUhbmVSBhD5tS_Y4E9CrhxHQd43Lnwbwg5K07SKMm0gmsLxnw@mail.gmail.com>
 <Yyw7dFEWACkGCoNP@redhat.com>
 <CAEUhbmVB6qgfoxUwDJTvoMgBgH0CwMiNyUj8Ye716JCYowTq7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEUhbmVB6qgfoxUwDJTvoMgBgH0CwMiNyUj8Ye716JCYowTq7g@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 22, 2022 at 07:54:05PM +0800, Bin Meng wrote:
> On Thu, Sep 22, 2022 at 6:39 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Thu, Sep 22, 2022 at 10:47:26AM +0800, Bin Meng wrote:
> > > On Thu, Sep 22, 2022 at 1:23 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > >
> > > > On Wed, Sep 21, 2022 at 05:51:33PM +0100, Dr. David Alan Gilbert wrote:
> > > > > * Bin Meng (bmeng.cn@gmail.com) wrote:
> > > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > > >
> > > > > > Some migration test cases use TLS to communicate, but they fail on
> > > > > > Windows with the following error messages:
> > > > > >
> > > > > >   qemu-system-x86_64: TLS handshake failed: Insufficient credentials for that request.
> > > > > >   qemu-system-x86_64: TLS handshake failed: Error in the pull function.
> > > > > >   query-migrate shows failed migration: TLS handshake failed: Error in the pull function.
> > > > > >
> > > > > > Disable them temporarily.
> > > > > >
> > > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > > > ---
> > > > > > I am not familar with the gnutls and simply enabling the gnutls debug
> > > > > > output does not give me an immedidate hint on why it's failing on
> > > > > > Windows. Disable these cases for now until someone or maintainers
> > > > > > who may want to test this on Windows.
> > > > >
> > > > > Copying in Dan Berrange, he's our expert on weird TLS failures.
> > > >
> > > > Seems to match this:
> > > >
> > > >    https://gnutls.org/faq.html#key-usage-violation2
> > > >
> > > > which suggests we have a configuration mis-match.
> > > >
> > > > I'm surprised to see you are only needing to disable the TLS PSK tests,
> > > > not the TLS x509 tests.
> > >
> > > The TLS x509 qtests all passed.
> > >
> > > >
> > > > I'd like to know if tests/unit/test-crypto-tlssession passes.
> > >
> > > These unit tests currently are not built on Windows as they simply
> > > don't build due to usage of socketpair().
> >
> > Doh, yes, that's rather annoying, as debugging this problem in the
> > unit tests would be easier than in qtests.
> >
> > > > If so, it might suggest we are missing 'priority: NORMAL' property
> > > > when configuring TLS creds for the migration test.
> > >
> > > I did the following changes but the error is still the same:
> >
> > >
> > > diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> > > index dbee9b528a..c1e3f11873 100644
> > > --- a/tests/qtest/migration-test.c
> > > +++ b/tests/qtest/migration-test.c
> > > @@ -788,7 +788,8 @@ test_migrate_tls_psk_start_common(QTestState *from,
> > > " 'id': 'tlscredspsk0',"
> > > " 'endpoint': 'client',"
> > > " 'dir': %s,"
> > > - " 'username': 'qemu'} }",
> > > + " 'username': 'qemu',"
> > > + " 'priority': 'NORMAL'} }",
> > > data->workdir);
> > > qobject_unref(rsp);
> > > @@ -797,7 +798,8 @@ test_migrate_tls_psk_start_common(QTestState *from,
> > > " 'arguments': { 'qom-type': 'tls-creds-psk',"
> > > " 'id': 'tlscredspsk0',"
> > > " 'endpoint': 'server',"
> > > - " 'dir': %s } }",
> > > + " 'dir': %s,"
> > > + " 'priority': 'NORMAL'} }",
> > > mismatch ? data->workdiralt : data->workdir);
> > > qobject_unref(rsp);
> > >
> > > I am not sure whether I did the right changes.
> >
> >
> > That ought to have been sufficient, if priority strings were the
> > problem.
> >
> >
> > I think we'd need the debug output from gnutls - could you edit crypto/init.c
> > and uncomment the '#define DEBUG_GNUTLS' line near the top.
> >
> > If you can post the output you get from a single migration-test test case
> > involving PSK, it might be enough to diagnose why gnutls is failing.
> >
> 
> Here is the output:
> 
> # Start of tls tests
> # starting QEMU: ./qemu-system-x86_64 -qtest
> unix:D:\msys64\tmp/qtest-18480.sock -qtest-log nul -chardev
> socket,path=D:\msys64\tmp/qtest-18480.qmp,id=char0 -mon
> chardev=char0,mode=control -display none -accel kvm -accel t
> cg -name source,debug-threads=on -m 150M -serial
> file:D:\msys64\tmp\migration-test-A5WJS1/src_serial -drive
> file=D:\msys64\tmp\migration-test-A5WJS1/bootsect,format=raw -accel
> qtest
> qemu: thread naming not supported on this host
> # starting QEMU: ./qemu-system-x86_64 -qtest
> unix:D:\msys64\tmp/qtest-18480.sock -qtest-log nul -chardev
> socket,path=D:\msys64\tmp/qtest-18480.qmp,id=char0 -mon
> chardev=char0,mode=control -display none -accel kvm -accel t
> cg -name target,debug-threads=on -m 150M -serial
> file:D:\msys64\tmp\migration-test-A5WJS1/dest_serial -incoming
> unix:D:\msys64\tmp\migration-test-A5WJS1/migsocket -drive
> file=D:\msys64\tmp\migration-test-A5WJS1/bootsect,f
> ormat=raw -accel qtest

Comparing to running the same test on my machine.....

> 4: EXT[0000015bb1dd2c50]: Sending extension Supported Versions/43 (9 bytes)
> 4: EXT[0000015bb1dd2c50]: Preparing extension (Post Handshake Auth/49)
> for 'client hello'
> 4: EXT[0000015bb1dd2c50]: Preparing extension (Safe
> Renegotiation/65281) for 'client hello'
> 4: EXT[0000015bb1dd2c50]: Sending extension Safe Renegotiation/65281 (1 bytes)
> 4: EXT[0000015bb1dd2c50]: Preparing extension (Server Name
> Indication/0) for 'client hello'
> 4: EXT[0000015bb1dd2c50]: Preparing extension (Cookie/44) for 'client hello'
> 4: EXT[0000015bb1dd2c50]: Preparing extension (Early Data/42) for 'client hello'
> 4: EXT[0000015bb1dd2c50]: Preparing extension (PSK Key Exchange
> Modes/45) for 'client hello'
> 4: EXT[0000015bb1dd2c50]: Sending extension PSK Key Exchange Modes/45 (3 bytes)
> 4: EXT[0000015bb1dd2c50]: Preparing extension (Record Size Limit/28)
> for 'client hello'
> 4: EXT[0000015bb1dd2c50]: Sending extension Record Size Limit/28 (2 bytes)
> 4: EXT[0000015bb1dd2c50]: Preparing extension (Maximum Record Size/1)
> for 'client hello'
> 4: EXT[0000015bb1dd2c50]: Preparing extension (Compress
> Certificate/27) for 'client hello'
> 4: EXT[0000015bb1dd2c50]: Preparing extension (ClientHello Padding/21)
> for 'client hello'
> 4: EXT[0000015bb1dd2c50]: Preparing extension (Pre Shared Key/41) for
> 'client hello'

Right here is missing two items:

  4: EXT[0x55bd0c660d30]: sent PSK identity 'qemu' (0)
  4: EXT[0x55bd0c660d30]: Sending extension Pre Shared Key/41 (47 bytes)

So it appears the client is not sendnig the PSK credentials

> 4: HSK[0000015bb1dd2c50]: CLIENT HELLO was queued [343 bytes]
> 5: REC[0000015bb1dd2c50]: Preparing Packet Handshake(22) with length:
> 343 and min pad: 0
> 9: ENC[0000015bb1dd2c50]: cipher: NULL, MAC: MAC-NULL, Epoch: 0
> 5: REC[0000015bb1dd2c50]: Sent Packet[1] Handshake(22) in epoch 0 and
> length: 348

I believe there are probably two issues - first we're igonring the
return value of gnutls_psk_set_client_credentials() and I have a feeling
that is reporting an error. Second, when we write the PSK credentials out
to disk, we're not using binary mode, so I think UNIX line endings are
getting turned into  DOS line endings, and when we later load the PSK
credentials there's a stray \r present  that probably breaks
gnutls_psk_set_client_credentials.

Could you try this patch and see if it makes the PSK tests work for
migration-test:

diff --git a/crypto/tlscredspsk.c b/crypto/tlscredspsk.c
index a4f9891274..546cad1c5a 100644
--- a/crypto/tlscredspsk.c
+++ b/crypto/tlscredspsk.c
@@ -109,7 +109,12 @@ qcrypto_tls_creds_psk_load(QCryptoTLSCredsPSK *creds,
             goto cleanup;
         }
 
-        gnutls_psk_set_server_credentials_file(creds->data.server, pskfile);
+        ret = gnutls_psk_set_server_credentials_file(creds->data.server, pskfile);
+        if (ret < 0) {
+            error_setg(errp, "Cannot set PSK server credentials: %s",
+                       gnutls_strerror(ret));
+            goto cleanup;
+        }
         gnutls_psk_set_server_dh_params(creds->data.server,
                                         creds->parent_obj.dh_params);
     } else {
@@ -135,8 +140,13 @@ qcrypto_tls_creds_psk_load(QCryptoTLSCredsPSK *creds,
             goto cleanup;
         }
 
-        gnutls_psk_set_client_credentials(creds->data.client,
-                                          username, &key, GNUTLS_PSK_KEY_HEX);
+        ret = gnutls_psk_set_client_credentials(creds->data.client,
+                                                username, &key, GNUTLS_PSK_KEY_HEX);
+        if (ret < 0) {
+            error_setg(errp, "Cannot set PSK client credentials: %s",
+                       gnutls_strerror(ret));
+            goto cleanup;
+        }
     }
 
     rv = 0;
diff --git a/tests/unit/crypto-tls-psk-helpers.c b/tests/unit/crypto-tls-psk-helpers.c
index 511e08cc9c..c6cc740772 100644
--- a/tests/unit/crypto-tls-psk-helpers.c
+++ b/tests/unit/crypto-tls-psk-helpers.c
@@ -27,15 +27,14 @@
 static void
 test_tls_psk_init_common(const char *pskfile, const char *user, const char *key)
 {
-    FILE *fp;
+    g_autoptr(GError) gerr = NULL;
+    g_autofree char *line = g_strdup_printf("%s:%s\n", user, key);
 
-    fp = fopen(pskfile, "w");
-    if (fp == NULL) {
-        g_critical("Failed to create pskfile %s: %s", pskfile, strerror(errno));
+    g_file_set_contents(pskfile, line, strlen(line), &gerr);
+    if (gerr != NULL) {
+        g_critical("Failed to create pskfile %s: %s", pskfile, gerr->message);
         abort();
     }
-    fprintf(fp, "%s:%s\n", user, key);
-    fclose(fp);
 }
 
 void test_tls_psk_init(const char *pskfile)



With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


