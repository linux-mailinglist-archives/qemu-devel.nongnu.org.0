Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E825E58E0
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 04:50:55 +0200 (CEST)
Received: from localhost ([::1]:49898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obCIf-0001Qu-Tj
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 22:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1obCFX-00078W-OE
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 22:47:39 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:39832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1obCFV-0006HF-O1
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 22:47:39 -0400
Received: by mail-qk1-x736.google.com with SMTP id x18so5337619qkn.6
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 19:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=7eyxAj74xK+tGHG4UKU4Ah+T7Y7rpS5m+cwG5ZrnfKw=;
 b=i/eVZbYBLt0nAVmPhd+/Wzk2F8vR3de34RQmaa6f/fdVBmOqeUsrMcgtc9BvlR/CqJ
 SiV8cziEk82VXf8XEi9vbpvbHD6RfXFZ/LRPR2cz4Lf5inGEsmbu7kEixRPUkJPxdir6
 fxqtaPx61xdMyCX7jjSJ6BtBlqyDzuiryrzHb551t6wez6OG4Fy5O70145oy7UsvcErh
 U9wFLb5VSdDanbBT0eZ0kG5iv/3qQsz/Zn9ZmdLwX/zD2JpfEnjrfTIHG0UsOG9IukCs
 MiAYQOq+SLX0dm8MN/wshfbhwWeruwe+3S5F/ZQ0kDSPmHGl0pPMzwScsyJ8XrIA3v3a
 Or6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=7eyxAj74xK+tGHG4UKU4Ah+T7Y7rpS5m+cwG5ZrnfKw=;
 b=hN5XX/l4YHmUHK93QXw/k97Wa0f3LpAIk0hr71jRERN7Ldmd50Fsv7HmOcjZ5yuzMD
 wl9cxVOThaThyltyrkancijBc7EqBg6Kxy+hnUD52LWRFxW7XgEg0eFdJj44qF43i0yI
 ZL0jXQ86lRudoi1bYPCq0hMWVQ6wAnmIVJbloVcTVa41wji9RfMpNzONgd89puIfHc0S
 PJyNNeq3Ivsi2MKQRnMzAPTFxjaNLuRzwGFLYBOM2RHfJiyVT9ylRnYJLrl9pArTWTGh
 DCvelLf1solhEYqYyw0BuYib9LQtbannjrrtiOlKrlTxTcOugQUmwYYLOAby5Hovqon+
 LImw==
X-Gm-Message-State: ACrzQf2XZl0T436DUNd6wwaRwPX/XfVp1GzJ2gacqCEoLbSBD2X60R2d
 BoqnEkJNUmb52a14JTK8D93PlHaOwbpqW9X1HaU=
X-Google-Smtp-Source: AMsMyM6wL2NyyN41o13ncbd+WLo6Ri0w8PtmsDIbnYXnzHqEKAtQR07LUT06G1muZ4oXa91X4oct7T2ShwjYNU0IGFo=
X-Received: by 2002:a05:620a:430d:b0:6be:7846:2169 with SMTP id
 u13-20020a05620a430d00b006be78462169mr743172qko.389.1663814856711; Wed, 21
 Sep 2022 19:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-36-bmeng.cn@gmail.com>
 <YytBFdDoLVgkgqIX@work-vm> <YytIkiMEC/KHL/9p@redhat.com>
In-Reply-To: <YytIkiMEC/KHL/9p@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 22 Sep 2022 10:47:26 +0800
Message-ID: <CAEUhbmVSBhD5tS_Y4E9CrhxHQd43Lnwbwg5K07SKMm0gmsLxnw@mail.gmail.com>
Subject: Re: [PATCH v2 35/39] tests/qtest: migration-test: Skip running some
 TLS cases for win32
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x736.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 22, 2022 at 1:23 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Wed, Sep 21, 2022 at 05:51:33PM +0100, Dr. David Alan Gilbert wrote:
> > * Bin Meng (bmeng.cn@gmail.com) wrote:
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > Some migration test cases use TLS to communicate, but they fail on
> > > Windows with the following error messages:
> > >
> > >   qemu-system-x86_64: TLS handshake failed: Insufficient credentials =
for that request.
> > >   qemu-system-x86_64: TLS handshake failed: Error in the pull functio=
n.
> > >   query-migrate shows failed migration: TLS handshake failed: Error i=
n the pull function.
> > >
> > > Disable them temporarily.
> > >
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > ---
> > > I am not familar with the gnutls and simply enabling the gnutls debug
> > > output does not give me an immedidate hint on why it's failing on
> > > Windows. Disable these cases for now until someone or maintainers
> > > who may want to test this on Windows.
> >
> > Copying in Dan Berrange, he's our expert on weird TLS failures.
>
> Seems to match this:
>
>    https://gnutls.org/faq.html#key-usage-violation2
>
> which suggests we have a configuration mis-match.
>
> I'm surprised to see you are only needing to disable the TLS PSK tests,
> not the TLS x509 tests.

The TLS x509 qtests all passed.

>
> I'd like to know if tests/unit/test-crypto-tlssession passes.

These unit tests currently are not built on Windows as they simply
don't build due to usage of socketpair().

>
> If so, it might suggest we are missing 'priority: NORMAL' property
> when configuring TLS creds for the migration test.

I did the following changes but the error is still the same:

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index dbee9b528a..c1e3f11873 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -788,7 +788,8 @@ test_migrate_tls_psk_start_common(QTestState *from,
" 'id': 'tlscredspsk0',"
" 'endpoint': 'client',"
" 'dir': %s,"
- " 'username': 'qemu'} }",
+ " 'username': 'qemu',"
+ " 'priority': 'NORMAL'} }",
data->workdir);
qobject_unref(rsp);
@@ -797,7 +798,8 @@ test_migrate_tls_psk_start_common(QTestState *from,
" 'arguments': { 'qom-type': 'tls-creds-psk',"
" 'id': 'tlscredspsk0',"
" 'endpoint': 'server',"
- " 'dir': %s } }",
+ " 'dir': %s,"
+ " 'priority': 'NORMAL'} }",
mismatch ? data->workdiralt : data->workdir);
qobject_unref(rsp);

I am not sure whether I did the right changes.

>
> > > (no changes since v1)
> > >
> > >  tests/qtest/migration-test.c | 14 ++++++++++++++
> > >  1 file changed, 14 insertions(+)
> > >
> > > diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-tes=
t.c
> > > index aedd9ddb72..dbee9b528a 100644
> > > --- a/tests/qtest/migration-test.c
> > > +++ b/tests/qtest/migration-test.c
> > > @@ -1403,6 +1403,7 @@ static void test_precopy_unix_dirty_ring(void)
> > >  }
> > >
> > >  #ifdef CONFIG_GNUTLS
> > > +#ifndef _WIN32
> > >  static void test_precopy_unix_tls_psk(void)
> > >  {
> > >      g_autofree char *uri =3D g_strdup_printf("unix:%s/migsocket", tm=
pfs);
> > > @@ -1415,6 +1416,7 @@ static void test_precopy_unix_tls_psk(void)
> > >
> > >      test_precopy_common(&args);
> > >  }
> > > +#endif /* _WIN32 */
> > >
> > >  #ifdef CONFIG_TASN1
> > >  static void test_precopy_unix_tls_x509_default_host(void)
> > > @@ -1523,6 +1525,7 @@ static void test_precopy_tcp_plain(void)
> > >  }
> > >
> > >  #ifdef CONFIG_GNUTLS
> > > +#ifndef _WIN32
> > >  static void test_precopy_tcp_tls_psk_match(void)
> > >  {
> > >      MigrateCommon args =3D {
> > > @@ -1533,6 +1536,7 @@ static void test_precopy_tcp_tls_psk_match(void=
)
> > >
> > >      test_precopy_common(&args);
> > >  }
> > > +#endif /* _WIN32 */
> > >
> > >  static void test_precopy_tcp_tls_psk_mismatch(void)
> > >  {
> > > @@ -1930,6 +1934,7 @@ static void test_multifd_tcp_zstd(void)
> > >  #endif
> > >
> > >  #ifdef CONFIG_GNUTLS
> > > +#ifndef _WIN32
> > >  static void *
> > >  test_migrate_multifd_tcp_tls_psk_start_match(QTestState *from,
> > >                                               QTestState *to)
> > > @@ -1937,6 +1942,7 @@ test_migrate_multifd_tcp_tls_psk_start_match(QT=
estState *from,
> > >      test_migrate_precopy_tcp_multifd_start_common(from, to, "none");
> > >      return test_migrate_tls_psk_start_match(from, to);
> > >  }
> > > +#endif /* _WIN32 */
> > >
> > >  static void *
> > >  test_migrate_multifd_tcp_tls_psk_start_mismatch(QTestState *from,
> > > @@ -1988,6 +1994,7 @@ test_migrate_multifd_tls_x509_start_reject_anon=
_client(QTestState *from,
> > >  }
> > >  #endif /* CONFIG_TASN1 */
> > >
> > > +#ifndef _WIN32
> > >  static void test_multifd_tcp_tls_psk_match(void)
> > >  {
> > >      MigrateCommon args =3D {
> > > @@ -1997,6 +2004,7 @@ static void test_multifd_tcp_tls_psk_match(void=
)
> > >      };
> > >      test_precopy_common(&args);
> > >  }
> > > +#endif /* _WIN32 */
> > >
> > >  static void test_multifd_tcp_tls_psk_mismatch(void)
> > >  {
> > > @@ -2497,8 +2505,10 @@ int main(int argc, char **argv)
> > >      qtest_add_func("/migration/precopy/unix/plain", test_precopy_uni=
x_plain);
> > >      qtest_add_func("/migration/precopy/unix/xbzrle", test_precopy_un=
ix_xbzrle);
> > >  #ifdef CONFIG_GNUTLS
> > > +#ifndef _WIN32
> > >      qtest_add_func("/migration/precopy/unix/tls/psk",
> > >                     test_precopy_unix_tls_psk);
> > > +#endif
> > >
> > >      if (has_uffd) {
> > >          /*
> > > @@ -2524,8 +2534,10 @@ int main(int argc, char **argv)
> > >
> > >      qtest_add_func("/migration/precopy/tcp/plain", test_precopy_tcp_=
plain);
> > >  #ifdef CONFIG_GNUTLS
> > > +#ifndef _WIN32
> > >      qtest_add_func("/migration/precopy/tcp/tls/psk/match",
> > >                     test_precopy_tcp_tls_psk_match);
> > > +#endif
> > >      qtest_add_func("/migration/precopy/tcp/tls/psk/mismatch",
> > >                     test_precopy_tcp_tls_psk_mismatch);
> > >  #ifdef CONFIG_TASN1
> > > @@ -2569,8 +2581,10 @@ int main(int argc, char **argv)
> > >                     test_multifd_tcp_zstd);
> > >  #endif
> > >  #ifdef CONFIG_GNUTLS
> > > +#ifndef _WIN32
> > >      qtest_add_func("/migration/multifd/tcp/tls/psk/match",
> > >                     test_multifd_tcp_tls_psk_match);
> > > +#endif
> > >      qtest_add_func("/migration/multifd/tcp/tls/psk/mismatch",
> > >                     test_multifd_tcp_tls_psk_mismatch);
> > >  #ifdef CONFIG_TASN1
> > > --
> > > 2.34.1
> > >

Regards,
Bin

