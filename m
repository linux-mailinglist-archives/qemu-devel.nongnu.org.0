Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 094345E61DD
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 13:59:25 +0200 (CEST)
Received: from localhost ([::1]:33780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obKrU-0006WG-3S
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 07:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1obKmb-000262-LZ
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 07:54:21 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:46856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1obKmX-0004QZ-LC
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 07:54:21 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id j8so6559326qvt.13
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 04:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=qjeO0uv709s9E8TvKtEiu0/d/YZeMRmrVhHzj6Blkkg=;
 b=DpivUFbUkbPvlNXYSKsOrhwO1n3IJYyRfI6LZ7o82r/N+CvVhPqzK6xcAeP8mQxMPc
 rouQl69mDJGt2LE/SVnuRQNXyYIW/UmzYms4cOydMe36ZCXOjPsBJEXQUEAywoauZx6X
 n7TAK+iH1ye4/nuZ2Tg0LRPclTP/xx6QyIw0QwjYYD8aMYT0UWtTpRkTSotIr/OwnR58
 0KcECBhyuoq3df4xnfaHvnfRtg0o6iMJYvlZ9rLn6A9brulYrXX908HeVWVSzgSWEzZb
 TttKUYHFpKinCZIubv+pJkZ6EBiEUqkJo2th4+s32gKC+eu2Rm9ZzBsjr7m5WJRkRAV6
 ZK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qjeO0uv709s9E8TvKtEiu0/d/YZeMRmrVhHzj6Blkkg=;
 b=R2TvMKvJNeNa+HaRr8Puiij4HCmXoLQG4Sgx26JW48OK9WFqg8ABuwZu7ZrcyDRXC2
 SKwmY2zKnkpzVJnUHBmGZX68gtiaRv3jiPZsjvhZy2z9oBVXUNXHwlxPeQ3lYXLjm3A4
 rVTzIteqPWNWFKN2YCWe4pDWkYxCt7ryDJTrZd/qcsfULDM7gNxmdASQAkUmrG2RxLcb
 3twfWeyo+ayUy/Fm+n2dfDSu2ifZCrmYegYiU7Jl8xn7BdkYwk5adBwyk4FbG640BW6T
 L6/glvg6Xnu9RUMGcNynO2LmFdXYIqms8kyR8jrUkBq2qcWlttl0NRqavKhFPMZCvesc
 Z+rw==
X-Gm-Message-State: ACrzQf0ANlJcy+um7Ke+XEgqO4ITK0eVk0500pz3V024BJhimw+JxydN
 qo/gz4cjHmCAOL/D1InR9SNx1gHRJPrDYEXIclk=
X-Google-Smtp-Source: AMsMyM7J5iDUwQJUXUPdfiIDTfU25tT/jtaAlJc93i4mqGhpVkb5VFDa/dU53TEFDb41OvMvh8aT9OoxsipRIibnjB4=
X-Received: by 2002:a05:6214:1947:b0:4aa:9e87:d032 with SMTP id
 q7-20020a056214194700b004aa9e87d032mr2058981qvk.114.1663847656258; Thu, 22
 Sep 2022 04:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-36-bmeng.cn@gmail.com>
 <YytBFdDoLVgkgqIX@work-vm> <YytIkiMEC/KHL/9p@redhat.com>
 <CAEUhbmVSBhD5tS_Y4E9CrhxHQd43Lnwbwg5K07SKMm0gmsLxnw@mail.gmail.com>
 <Yyw7dFEWACkGCoNP@redhat.com>
In-Reply-To: <Yyw7dFEWACkGCoNP@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 22 Sep 2022 19:54:05 +0800
Message-ID: <CAEUhbmVB6qgfoxUwDJTvoMgBgH0CwMiNyUj8Ye716JCYowTq7g@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf2e.google.com
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

On Thu, Sep 22, 2022 at 6:39 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Thu, Sep 22, 2022 at 10:47:26AM +0800, Bin Meng wrote:
> > On Thu, Sep 22, 2022 at 1:23 AM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com> wrote:
> > >
> > > On Wed, Sep 21, 2022 at 05:51:33PM +0100, Dr. David Alan Gilbert wrot=
e:
> > > > * Bin Meng (bmeng.cn@gmail.com) wrote:
> > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > >
> > > > > Some migration test cases use TLS to communicate, but they fail o=
n
> > > > > Windows with the following error messages:
> > > > >
> > > > >   qemu-system-x86_64: TLS handshake failed: Insufficient credenti=
als for that request.
> > > > >   qemu-system-x86_64: TLS handshake failed: Error in the pull fun=
ction.
> > > > >   query-migrate shows failed migration: TLS handshake failed: Err=
or in the pull function.
> > > > >
> > > > > Disable them temporarily.
> > > > >
> > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > > ---
> > > > > I am not familar with the gnutls and simply enabling the gnutls d=
ebug
> > > > > output does not give me an immedidate hint on why it's failing on
> > > > > Windows. Disable these cases for now until someone or maintainers
> > > > > who may want to test this on Windows.
> > > >
> > > > Copying in Dan Berrange, he's our expert on weird TLS failures.
> > >
> > > Seems to match this:
> > >
> > >    https://gnutls.org/faq.html#key-usage-violation2
> > >
> > > which suggests we have a configuration mis-match.
> > >
> > > I'm surprised to see you are only needing to disable the TLS PSK test=
s,
> > > not the TLS x509 tests.
> >
> > The TLS x509 qtests all passed.
> >
> > >
> > > I'd like to know if tests/unit/test-crypto-tlssession passes.
> >
> > These unit tests currently are not built on Windows as they simply
> > don't build due to usage of socketpair().
>
> Doh, yes, that's rather annoying, as debugging this problem in the
> unit tests would be easier than in qtests.
>
> > > If so, it might suggest we are missing 'priority: NORMAL' property
> > > when configuring TLS creds for the migration test.
> >
> > I did the following changes but the error is still the same:
>
> >
> > diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.=
c
> > index dbee9b528a..c1e3f11873 100644
> > --- a/tests/qtest/migration-test.c
> > +++ b/tests/qtest/migration-test.c
> > @@ -788,7 +788,8 @@ test_migrate_tls_psk_start_common(QTestState *from,
> > " 'id': 'tlscredspsk0',"
> > " 'endpoint': 'client',"
> > " 'dir': %s,"
> > - " 'username': 'qemu'} }",
> > + " 'username': 'qemu',"
> > + " 'priority': 'NORMAL'} }",
> > data->workdir);
> > qobject_unref(rsp);
> > @@ -797,7 +798,8 @@ test_migrate_tls_psk_start_common(QTestState *from,
> > " 'arguments': { 'qom-type': 'tls-creds-psk',"
> > " 'id': 'tlscredspsk0',"
> > " 'endpoint': 'server',"
> > - " 'dir': %s } }",
> > + " 'dir': %s,"
> > + " 'priority': 'NORMAL'} }",
> > mismatch ? data->workdiralt : data->workdir);
> > qobject_unref(rsp);
> >
> > I am not sure whether I did the right changes.
>
>
> That ought to have been sufficient, if priority strings were the
> problem.
>
>
> I think we'd need the debug output from gnutls - could you edit crypto/in=
it.c
> and uncomment the '#define DEBUG_GNUTLS' line near the top.
>
> If you can post the output you get from a single migration-test test case
> involving PSK, it might be enough to diagnose why gnutls is failing.
>

Here is the output:

# Start of tls tests
# starting QEMU: ./qemu-system-x86_64 -qtest
unix:D:\msys64\tmp/qtest-18480.sock -qtest-log nul -chardev
socket,path=3DD:\msys64\tmp/qtest-18480.qmp,id=3Dchar0 -mon
chardev=3Dchar0,mode=3Dcontrol -display none -accel kvm -accel t
cg -name source,debug-threads=3Don -m 150M -serial
file:D:\msys64\tmp\migration-test-A5WJS1/src_serial -drive
file=3DD:\msys64\tmp\migration-test-A5WJS1/bootsect,format=3Draw -accel
qtest
qemu: thread naming not supported on this host
# starting QEMU: ./qemu-system-x86_64 -qtest
unix:D:\msys64\tmp/qtest-18480.sock -qtest-log nul -chardev
socket,path=3DD:\msys64\tmp/qtest-18480.qmp,id=3Dchar0 -mon
chardev=3Dchar0,mode=3Dcontrol -display none -accel kvm -accel t
cg -name target,debug-threads=3Don -m 150M -serial
file:D:\msys64\tmp\migration-test-A5WJS1/dest_serial -incoming
unix:D:\msys64\tmp\migration-test-A5WJS1/migsocket -drive
file=3DD:\msys64\tmp\migration-test-A5WJS1/bootsect,f
ormat=3Draw -accel qtest
qemu: thread naming not supported on this host
3: ASSERT: ../../gnutls-3.7.7/lib/str.c[gnutls_hex_decode]:605
3: ASSERT: ../../gnutls-3.7.7/lib/psk.c[gnutls_psk_set_client_credentials2]=
:164
55:: RREECC[[000000000011651b6bd15dfd420c2500]]:: AAllllooccaattiinngg
eeppoocchh ##00
2: a2d:de da d6d epdr o6t opcrooltso,c o4l6s ,c i4p6h
ecrispuhietressu,i t1e9s ,s i1g9 asliggo sa lagnods 1a0 ngdr o1u0ps i
ngtroo upprsi oirnitto yp rliiosrti
ty5 :l iRsEtC
[50:0 0REC0[0010601060d155fb4b012d0d]2:c 5A0l]l:o cAalltocatiinngg
eeppoocchh ##11
3:4: AHSSSKE[R0T0:0 0.0.1/5.b.b/1gdndu2tcl5s0-]3:. 7A.d7v/.l
ivbe/rbsuifofne:r s3..c3[
ge2t:_ lKaesetp_ipnagc kceitp]h:e1r1s8u5i
t10: eR E1A3D.:0 2- 1( GrNeUtTuLrSn_eAdE Sf_r2o5m6 _0G0C0M0_0S1H6A1368349)b
d21:7 0K,e ererpnion=3Dg1 1c igpehrerrnsou=3Di0t
e3 :1 3A.S0S3E R(TG:N
U.T.L/S._.C/HgAnCuHtAl2s0-_3P.O7L.Y71/3l0i5b_/SbHuAf2f5e6r)s
.2c:[ _Kgeneuptilnsg_ icoi_prheeards_ubiutfef e1r3e.d0]1: 5(8G9N
UTLS_AES_128_GCM_SHA256)
2: Keeping ciphersuite 13.04 (GNUTLS_AES_128_CCM_SHA256)
2: Keeping ciphersuite cc.ac (GNUTLS_ECDHE_PSK_CHACHA20_POLY1305)
2: Keeping ciphersuite c0.36 (GNUTLS_ECDHE_PSK_AES_256_CBC_SHA1)
2: Keeping ciphersuite c0.35 (GNUTLS_ECDHE_PSK_AES_128_CBC_SHA1)
2: Keeping ciphersuite 00.ab (GNUTLS_DHE_PSK_AES_256_GCM_SHA384)
2: Keeping ciphersuite cc.ad (GNUTLS_DHE_PSK_CHACHA20_POLY1305)
2: Keeping ciphersuite c0.a7 (GNUTLS_DHE_PSK_AES_256_CCM)
2: Keeping ciphersuite 00.91 (GNUTLS_DHE_PSK_AES_256_CBC_SHA1)
2: Keeping ciphersuite 00.aa (GNUTLS_DHE_PSK_AES_128_GCM_SHA256)
2: Keeping ciphersuite c0.a6 (GNUTLS_DHE_PSK_AES_128_CCM)
2: Keeping ciphersuite 00.90 (GNUTLS_DHE_PSK_AES_128_CBC_SHA1)
2: Keeping ciphersuite 00.a9 (GNUTLS_PSK_AES_256_GCM_SHA384)
2: Keeping ciphersuite cc.ab (GNUTLS_PSK_CHACHA20_POLY1305)
2: Keeping ciphersuite c0.a5 (GNUTLS_PSK_AES_256_CCM)
2: Keeping ciphersuite 00.8d (GNUTLS_PSK_AES_256_CBC_SHA1)
2: Keeping ciphersuite 00.a8 (GNUTLS_PSK_AES_128_GCM_SHA256)
2: Keeping ciphersuite c0.a4 (GNUTLS_PSK_AES_128_CCM)
2: Keeping ciphersuite 00.8c (GNUTLS_PSK_AES_128_CBC_SHA1)
4: EXT[0000015bb1dd2c50]: Preparing extension (OCSP Status Request/5)
for 'client hello'
4: EXT[0000015bb1dd2c50]: Preparing extension (Client Certificate
Type/19) for 'client hello'
4: EXT[0000015bb1dd2c50]: Preparing extension (Server Certificate
Type/20) for 'client hello'
4: EXT[0000015bb1dd2c50]: Preparing extension (Supported Groups/10)
for 'client hello'
4: EXT[0000015bb1dd2c50]: Sent group SECP256R1 (0x17)
4: EXT[0000015bb1dd2c50]: Sent group SECP384R1 (0x18)
4: EXT[0000015bb1dd2c50]: Sent group SECP521R1 (0x19)
4: EXT[0000015bb1dd2c50]: Sent group X25519 (0x1d)
4: EXT[0000015bb1dd2c50]: Sent group X448 (0x1e)
4: EXT[0000015bb1dd2c50]: Sent group FFDHE2048 (0x100)
4: EXT[0000015bb1dd2c50]: Sent group FFDHE3072 (0x101)
4: EXT[0000015bb1dd2c50]: Sent group FFDHE4096 (0x102)
4: EXT[0000015bb1dd2c50]: Sent group FFDHE6144 (0x103)
4: EXT[0000015bb1dd2c50]: Sent group FFDHE8192 (0x104)
4: EXT[0000015bb1dd2c50]: Sending extension Supported Groups/10 (22 bytes)
4: EXT[0000015bb1dd2c50]: Preparing extension (Supported EC Point
Formats/11) for 'client hello'
4: EXT[0000015bb1dd2c50]: Sending extension Supported EC Point
Formats/11 (2 bytes)
4: EXT[0000015bb1dd2c50]: Preparing extension (SRP/12) for 'client hello'
4: EXT[0000015bb1dd2c50]: Preparing extension (Signature
Algorithms/13) for 'client hello'
4: EXT[0000015bb1dd2c50]: sent signature algo (4.1) RSA-SHA256
4: EXT[0000015bb1dd2c50]: sent signature algo (8.9) RSA-PSS-SHA256
4: EXT[0000015bb1dd2c50]: sent signature algo (8.4) RSA-PSS-RSAE-SHA256
4: EXT[0000015bb1dd2c50]: sent signature algo (4.3) ECDSA-SHA256
4: EXT[0000015bb1dd2c50]: sent signature algo (8.7) EdDSA-Ed25519
4: EXT[0000015bb1dd2c50]: sent signature algo (5.1) RSA-SHA384
4: EXT[0000015bb1dd2c50]: sent signature algo (8.10) RSA-PSS-SHA384
4: EXT[0000015bb1dd2c50]: sent signature algo (8.5) RSA-PSS-RSAE-SHA384
4: EXT[0000015bb1dd2c50]: sent signature algo (5.3) ECDSA-SHA384
4: EXT[0000015bb1dd2c50]: sent signature algo (8.8) EdDSA-Ed448
4: EXT[0000015bb1dd2c50]: sent signature algo (6.1) RSA-SHA512
4: EXT[0000015bb1dd2c50]: sent signature algo (8.11) RSA-PSS-SHA512
4: EXT[0000015bb1dd2c50]: sent signature algo (8.6) RSA-PSS-RSAE-SHA512
4: EXT[0000015bb1dd2c50]: sent signature algo (6.3) ECDSA-SHA512
4: EXT[0000015bb1dd2c50]: sent signature algo (2.1) RSA-SHA1
4: EXT[0000015bb1dd2c50]: sent signature algo (2.3) ECDSA-SHA1
4: EXT[0000015bb1dd2c50]: Sending extension Signature Algorithms/13 (34 byt=
es)
4: EXT[0000015bb1dd2c50]: Preparing extension (SRTP/14) for 'client hello'
4: EXT[0000015bb1dd2c50]: Preparing extension (Heartbeat/15) for 'client he=
llo'
4: EXT[0000015bb1dd2c50]: Preparing extension (ALPN/16) for 'client hello'
4: EXT[0000015bb1dd2c50]: Preparing extension (Encrypt-then-MAC/22)
for 'client hello'
4: EXT[0000015bb1dd2c50]: Sending extension Encrypt-then-MAC/22 (0 bytes)
4: EXT[0000015bb1dd2c50]: Preparing extension (Extended Master
Secret/23) for 'client hello'
4: EXT[0000015bb1dd2c50]: Sending extension Extended Master Secret/23 (0 by=
tes)
4: EXT[0000015bb1dd2c50]: Preparing extension (Session Ticket/35) for
'client hello'
4: EXT[0000015bb1dd2c50]: Sending extension Session Ticket/35 (0 bytes)
4: EXT[0000015bb1dd2c50]: Preparing extension (Key Share/51) for 'client he=
llo'
4: EXT[0000015bb1dd2c50]: sending key share for SECP256R1
4: EXT[0000015bb1dd2c50]: sending key share for X25519
4: EXT[0000015bb1dd2c50]: Sending extension Key Share/51 (107 bytes)
4: EXT[0000015bb1dd2c50]: Preparing extension (Supported Versions/43)
for 'client hello'
2: Advertizing version 3.4
2: Advertizing version 3.3
2: Advertizing version 3.2
2: Advertizing version 3.1
4: EXT[0000015bb1dd2c50]: Sending extension Supported Versions/43 (9 bytes)
4: EXT[0000015bb1dd2c50]: Preparing extension (Post Handshake Auth/49)
for 'client hello'
4: EXT[0000015bb1dd2c50]: Preparing extension (Safe
Renegotiation/65281) for 'client hello'
4: EXT[0000015bb1dd2c50]: Sending extension Safe Renegotiation/65281 (1 byt=
es)
4: EXT[0000015bb1dd2c50]: Preparing extension (Server Name
Indication/0) for 'client hello'
4: EXT[0000015bb1dd2c50]: Preparing extension (Cookie/44) for 'client hello=
'
4: EXT[0000015bb1dd2c50]: Preparing extension (Early Data/42) for 'client h=
ello'
4: EXT[0000015bb1dd2c50]: Preparing extension (PSK Key Exchange
Modes/45) for 'client hello'
4: EXT[0000015bb1dd2c50]: Sending extension PSK Key Exchange Modes/45 (3 by=
tes)
4: EXT[0000015bb1dd2c50]: Preparing extension (Record Size Limit/28)
for 'client hello'
4: EXT[0000015bb1dd2c50]: Sending extension Record Size Limit/28 (2 bytes)
4: EXT[0000015bb1dd2c50]: Preparing extension (Maximum Record Size/1)
for 'client hello'
4: EXT[0000015bb1dd2c50]: Preparing extension (Compress
Certificate/27) for 'client hello'
4: EXT[0000015bb1dd2c50]: Preparing extension (ClientHello Padding/21)
for 'client hello'
4: EXT[0000015bb1dd2c50]: Preparing extension (Pre Shared Key/41) for
'client hello'
4: HSK[0000015bb1dd2c50]: CLIENT HELLO was queued [343 bytes]
5: REC[0000015bb1dd2c50]: Preparing Packet Handshake(22) with length:
343 and min pad: 0
9: ENC[0000015bb1dd2c50]: cipher: NULL, MAC: MAC-NULL, Epoch: 0
5: REC[0000015bb1dd2c50]: Sent Packet[1] Handshake(22) in epoch 0 and
length: 348
3: A3S:S EARSTS:E R.T.:/
....//g.n.u/tglnsu-t3l.s7-.37./7l.i7b//lbiubf/fbeurfsf.ecr[sg.ect[_gleats_t=
l_apsatc_kpeatc]k:e1t1]8:51
185
10: READ: Got 5 bytes from 00000161639bd170
10: READ: read 5 bytes from 00000161639bd170
10: RB: Have 0 bytes into buffer. Adding 5 bytes.
10: RB: Requested 5 bytes
5: REC[000001616d5f4020]: SSL 3.1 Handshake packet received. Epoch 0,
length: 343
5: REC[000001616d5f4020]: Expected Packet Handshake(22)
5: REC[000001616d5f4020]: Received Packet Handshake(22) with length: 343
10: READ: Got 343 bytes from 00000161639bd170
10: READ: read 343 bytes from 00000161639bd170
10: RB: Have 5 bytes into buffer. Adding 343 bytes.
10: RB: Requested 348 bytes
5: REC[000001616d5f4020]: Decrypted Packet[0] Handshake(22) with length: 34=
3
4: HSK[000001616d5f4020]: CLIENT HELLO (1) was received. Length
339[339], frag offset 0, frag length: 339, sequence: 0
4: HSK[000001616d5f4020]: Client's version: 3.3
4: EXT[000001616d5f4020]: Parsing extension 'Supported Versions/43' (9 byte=
s)
4: EXT[000001616d5f4020]: Found version: 3.4
4: EXT[000001616d5f4020]: Found version: 3.3
4: EXT[000001616d5f4020]: Found version: 3.2
4: EXT[000001616d5f4020]: Found version: 3.1
4: EXT[000001616d5f4020]: Negotiated version: 3.4
4: EXT[000001616d5f4020]: Parsing extension 'Encrypt-then-MAC/22' (0 bytes)
4: EXT[000001616d5f4020]: Parsing extension 'Extended Master
Secret/23' (0 bytes)
4: EXT[000001616d5f4020]: Parsing extension 'Safe Renegotiation/65281' (1 b=
ytes)
4: EXT[000001616d5f4020]: Parsing extension 'Record Size Limit/28' (2 bytes=
)
4: EXT[000001616d5f4020]: record_size_limit 16385 negotiated
4: EXT[000001616d5f4020]: Parsing extension 'Supported Groups/10' (22 bytes=
)
4: EXT[000001616d5f4020]: Received group SECP256R1 (0x17)
4: EXT[000001616d5f4020]: Received group SECP384R1 (0x18)
4: EXT[000001616d5f4020]: Received group SECP521R1 (0x19)
4: EXT[000001616d5f4020]: Received group X25519 (0x1d)
4: EXT[000001616d5f4020]: Received group X448 (0x1e)
4: EXT[000001616d5f4020]: Received group FFDHE2048 (0x100)
4: EXT[000001616d5f4020]: Received group FFDHE3072 (0x101)
4: EXT[000001616d5f4020]: Received group FFDHE4096 (0x102)
4: EXT[000001616d5f4020]: Received group FFDHE6144 (0x103)
4: EXT[000001616d5f4020]: Received group FFDHE8192 (0x104)
4: EXT[000001616d5f4020]: Selected group SECP256R1
4: EXT[000001616d5f4020]: Parsing extension 'Supported EC Point
Formats/11' (2 bytes)
4: EXT[000001616d5f4020]: Parsing extension 'Signature Algorithms/13' (34 b=
ytes)
4: EXT[000001616d5f4020]: rcvd signature algo (4.1) RSA-SHA256
4: EXT[000001616d5f4020]: rcvd signature algo (8.9) RSA-PSS-SHA256
4: EXT[000001616d5f4020]: rcvd signature algo (8.4) RSA-PSS-RSAE-SHA256
4: EXT[000001616d5f4020]: rcvd signature algo (4.3) ECDSA-SECP256R1-SHA256
4: EXT[000001616d5f4020]: rcvd signature algo (8.7) EdDSA-Ed25519
4: EXT[000001616d5f4020]: rcvd signature algo (5.1) RSA-SHA384
4: EXT[000001616d5f4020]: rcvd signature algo (8.10) RSA-PSS-SHA384
4: EXT[000001616d5f4020]: rcvd signature algo (8.5) RSA-PSS-RSAE-SHA384
4: EXT[000001616d5f4020]: rcvd signature algo (5.3) ECDSA-SECP384R1-SHA384
4: EXT[000001616d5f4020]: rcvd signature algo (8.8) EdDSA-Ed448
4: EXT[000001616d5f4020]: rcvd signature algo (6.1) RSA-SHA512
4: EXT[000001616d5f4020]: rcvd signature algo (8.11) RSA-PSS-SHA512
4: EXT[000001616d5f4020]: rcvd signature algo (8.6) RSA-PSS-RSAE-SHA512
4: EXT[000001616d5f4020]: rcvd signature algo (6.3) ECDSA-SECP521R1-SHA512
4: EXT[000001616d5f4020]: rcvd signature algo (2.1) RSA-SHA1
4: EXT[000001616d5f4020]: rcvd signature algo (2.3) ECDSA-SHA1
4: EXT[000001616d5f4020]: Parsing extension 'Session Ticket/35' (0 bytes)
4: EXT[000001616d5f4020]: Parsing extension 'PSK Key Exchange
Modes/45' (3 bytes)
4: EXT[000001616d5f4020]: PSK KE mode 01 received
4: EXT[000001616d5f4020]: PSK KE mode 00 received
2: checking 13.02 (GNUTLS_AES_256_GCM_SHA384) for compatibility
3: ASSERT: ../../../gnutls-3.7.7/lib/auth/cert.c[_gnutls_select_server_cert=
]:1622
4: HSK[000001616d5f4020]: Selected cipher suite: GNUTLS_AES_256_GCM_SHA384
4: HSK[000001616d5f4020]: Selected version TLS1.3
4: EXT[000001616d5f4020]: Parsing extension 'Key Share/51' (107 bytes)
4: EXT[000001616d5f4020]: Received key share for SECP256R1
4: HSK[000001616d5f4020]: Selected group SECP256R1 (2)
2: EXT[000001616d5f4020]: server generated SECP256R1 shared key
4: HSK[000001616d5f4020]: Safe renegotiation succeeded
4: HSK[000001616d5f4020]: SessionID:
746d784844566d638ffa314a9b00c72d2d0ad0cfdd83ae6623c36fa21e3dfc94
4: EXT[000001616d5f4020]: Not sending extension (OCSP Status
Request/5) for 'TLS 1.3 server hello'
4: EXT[000001616d5f4020]: Not sending extension (Client Certificate
Type/19) for 'TLS 1.3 server hello'
4: EXT[000001616d5f4020]: Not sending extension (Server Certificate
Type/20) for 'TLS 1.3 server hello'
4: EXT[000001616d5f4020]: Not sending extension (Supported Groups/10)
for 'TLS 1.3 server hello'
4: EXT[000001616d5f4020]: Not sending extension (Supported EC Point
Formats/11) for 'TLS 1.3 server hello'
4: EXT[000001616d5f4020]: Not sending extension (SRP/12) for 'TLS 1.3
server hello'
4: EXT[000001616d5f4020]: Not sending extension (Signature
Algorithms/13) for 'TLS 1.3 server hello'
4: EXT[000001616d5f4020]: Not sending extension (SRTP/14) for 'TLS 1.3
server hello'
4: EXT[000001616d5f4020]: Not sending extension (Heartbeat/15) for
'TLS 1.3 server hello'
4: EXT[000001616d5f4020]: Not sending extension (ALPN/16) for 'TLS 1.3
server hello'
4: EXT[000001616d5f4020]: Not sending extension (Encrypt-then-MAC/22)
for 'TLS 1.3 server hello'
4: EXT[000001616d5f4020]: Not sending extension (Extended Master
Secret/23) for 'TLS 1.3 server hello'
4: EXT[000001616d5f4020]: Not sending extension (Session Ticket/35)
for 'TLS 1.3 server hello'
4: EXT[000001616d5f4020]: Preparing extension (Key Share/51) for 'TLS
1.3 server hello'
4: EXT[000001616d5f4020]: sending key share for SECP256R1
4: EXT[000001616d5f4020]: Sending extension Key Share/51 (69 bytes)
4: EXT[000001616d5f4020]: Preparing extension (Supported Versions/43)
for 'TLS 1.3 server hello'
4: EXT[000001616d5f4020]: Sending extension Supported Versions/43 (2 bytes)
4: EXT[000001616d5f4020]: Not sending extension (Post Handshake
Auth/49) for 'TLS 1.3 server hello'
4: EXT[000001616d5f4020]: Not sending extension (Safe
Renegotiation/65281) for 'TLS 1.3 server hello'
4: EXT[000001616d5f4020]: Not sending extension (Server Name
Indication/0) for 'TLS 1.3 server hello'
4: EXT[000001616d5f4020]: Not sending extension (Cookie/44) for 'TLS
1.3 server hello'
4: EXT[000001616d5f4020]: Not sending extension (Early Data/42) for
'TLS 1.3 server hello'
4: EXT[000001616d5f4020]: Preparing extension (PSK Key Exchange
Modes/45) for 'TLS 1.3 server hello'
4: EXT[000001616d5f4020]: Not sending extension (Record Size Limit/28)
for 'TLS 1.3 server hello'
4: EXT[000001616d5f4020]: Not sending extension (Maximum Record
Size/1) for 'TLS 1.3 server hello'
4: EXT[000001616d5f4020]: Preparing extension (Compress
Certificate/27) for 'TLS 1.3 server hello'
4: EXT[000001616d5f4020]: Not sending extension (ClientHello
Padding/21) for 'TLS 1.3 server hello'
4: EXT[000001616d5f4020]: Preparing extension (Pre Shared Key/41) for
'TLS 1.3 server hello'
4: HSK[000001616d5f4020]: SERVER HELLO was queued [155 bytes]
5: REC[000001616d5f4020]: Preparing Packet Handshake(22) with length:
155 and min pad: 0
9: ENC[000001616d5f4020]: cipher: NULL, MAC: MAC-NULL, Epoch: 0
5: REC[000001616d5f4020]: Sent Packet[1] Handshake(22) in epoch 0 and
length: 160
5: REC[000001616d5f4020]: Preparing Packet ChangeCipherSpec(20) with
length: 1 and min pad: 0
9: ENC[000001616d5f4020]: cipher: NULL, MAC: MAC-NULL, Epoch: 0
5: REC[000001616d5f4020]: Sent Packet[2] ChangeCipherSpec(20) in epoch
0 and length: 6
41:0 :R ERCE[A0D00:0 0G1o6t1 65d 5bfy4t0e2s0 ]f:r oSme n0t0
0C0h0a1n5gbefCdi2pah3eeraS0p
e1c0
: RE5:A DR:E Cr[e0a0d0 050 1b6y1t6eds5 ff4r0o2m0 ]0:0
0I0n0i1t5ibafldi2zai3nega 0e
p10o:c hR B#:1
Have 09 :b yItNeTs: iCnLtIoE NbTu fWfReIrT.E AKdEdYi n[g3 25] :b y7tbe4s4.8
d1b05:0 R3Be:4 5Rbedq7u7ebsbt6e4d0 053 8b7y1t1e1s0
df51:0 6R2EcC0[50a010c050e1959b6b211dfdd20c2520d]3:8 5S2S0L7 232.c3
9H:a nIdNsTh:a kSeE RpVaEcRk eWtR IrTeEc eKiEvYe d[.3 2E]p:o cdh7
d0c,b7 0lce7ncgft1hb:2 7165e52
ef50:d cR8E9C8[a0e06040a061e53bfb510d2d225c15402]8:7 7E3x1pbeec5tbefd0
dP1a5c7kee9t5 5H9aan
d9:s hIaNkTe:( 2C2L)I
EN5T: WRREICT[E0 0I0V0 0[1152b]b:1 d6dd2fc55004]6:7 cR0e5c9edi0v3e1d3
5Pca7cck8eft4
H9a:n dIsNhTa:k eS(E2R2V)E Rw iWtRhI TlEe nIgVt h[:1 21]5:5
e8d1e0a:7 8R1E0A9De:d 6Geobt4 a135c58 0b7yat1e
s 5f:r oRm E0C0[0000001050b1f6d126ad35efa400
2100]:: REEpAoDc:h r#e1a dr e1a5d5y
byt4e:s HfSrKo[m0 000000001061156bdf5df24a032e0a]0:
1T0L:S R1B.:3 Hraev-ek e5y bwyittehs ciinpthoe rb usfufietre.:
AGdNdUiTnLgS _1A5E5S _b2y5t6e_GsC.M
_1S0H:A 3R8B4:
R4e:q uEeXsTt[e0d0 0106001 6b1y6tde5sf
4052:0 ]R:E CN[o0t0 0s0e0n1d5ibnbg1 dedx2tce5n0s]i:o nD e(cOrCySpPt
eSdt aPtaucsk eRte[q0u]e sHta/n5d)s hfaokre ('2e2n)c rwyiptthe dl
eenxgttehn:s i1o5n5s
'
44:: HESXKT[[00000000001156b1b61dd5df24c05200]]:: SPErReVpEaRr iHnEgL
LeOx t(e2n)s iwoans (rCelcieeinvte dC.e rLteinfgitcha t1e5
1T[y1p5e1/]1,9 )f rfaogr o'fefnscerty p0t,e df reaxgt elnesnigotnhs:'
145:1 ,E XsTe[q0u0e0n0c0e1:6 106
d35:f 4A0S2S0E]R:T :P r.e.p/a.r.i/nggn uetxltse-n3s.i7o.n7
/(lSiebr/vbeurf fCeerrst.icf[igceatt_el aTsytp_ep/a2c0k)e tf]o:r
1'1e7n6c
r3y:p tAeSdS EeRxTt:e n.s.i/o.n.s/'g
nu4t:l sE-X3T.[70.070/0l0i1b6/1b6udf5ffe4r0s2.0c][:_
gPnruetplasr_ihnagn desxhtaeknes_iioon_ r(eScuvp_pionrtt]e:d1 4G2r8o
u4p:s /H1S0K)[ 0f0o0r0 0'1e5nbcbr1ydpdt2ecd5 0e]x:t eSnesrivoenrs''s
4v:e rEsXiTo[n0:0 030.031
6146:d 5EfX4T0[2000]0:0 0N1o5tb bs1edndd2icn5g0 ]e:x tPeanrssiionng
(eSxutpepnosritoend 'ESCu pPpooirntte dF oVremrastiso/n1s1/)4 3f'o r(
2' ebnyctreysp)t
e4d: eExXtTe[n0s0i0o0n0s1'5
bb41:d dE2XcT5[00]0:0 0N0e1g6o1t6ida5tfe4d0 2v0e]r:s iNoont: s3e.n4d
i4:n gH SeKx[t0e0n0s0i0o1n5 b(bS1RdPd/21c25)0 ]f:o rS e'leencctreydp
tceidp heexrt esnusiitoen:s 'G
N4U:T LESX_TA[E0S0_0205061_6G1C6Md_5SfH4A032804]
:4 :No tE XsTe[n0d0i0n0g0 1e5xbtbe1ndsdi2ocn5 0(]S:i gPnaartsuirneg
Aelxgtoernistihomns /'1K3e)y fSohra r'ee/n5c1r'y p(t6e9d beyxtteesn)s
i4o:n sH'S
K4[:0 0E0X0T0[1050b0b010d1d621c65d05]f:4 0S2e0l]e:c tPerd egpraoruipn
gS EeCxPt2e5n6sRi1o n( 2()S
RTP/14)2 :f oErX T'[e0n0c0r0y0p1t5ebdb 1edxdt2ecn5s0i]o:n sc'l
i4e:n tE XgTe[n0e0r0a0t0e1d6 1S6EdC5Pf245062R01] :s hParreepda rkienyg
ext5e:n sRiEoCn[ 0(0H0e0a0r1t5bbeba1td/d125c)5 0f]o:r
P'reenpcarryipntge dP aecxkteetn sCihoannsg'e
Ci4p:h eErXSTp[e0c0(02000)1 6w1i6tdh5 fl4e0n2g0t]h:: P1r eapnadr
imnign epxatde:n s0i
on 9(:A LEPNNC/[1060)0 0f0o1r5 b'be1ndcdr2ycp5t0e]d: ecxitpehnesri:o nNsU'L
L4,: MEAXTC[:0 0M0A0C0-1N6U1L6Ld,5 fE4p0o2c0h]:: 0N
ot5 :s eRnEdCi[n0g0 0e0x0t1e5nbsbi1odnd 2(cE5n0c]r:y pSte-ntth
ePna-cMkAeCt/[222]) Cfhoarn g'eeCnicprhyeprtSepde ce(x2t0e)n siino
nesp'o
ch4 :0 EaXnTd[ 0l0e0n0g0t1h6:1 66d
5f4042:0 ]R:E CN[o0t0 0s0e0n1d5ibnbg1 dedx2tce5n0s]i:o nS e(nEtx
tCehnadnegde CMiapshteerrS pSeecc
ret/52:3 )R EfCo[r0 0'0e0n0c1r5ybpbt1eddd 2ecx5t0e]n:s iIonnist'i
a4l:i zEiXnTg[ 0e0p0o0c0h1 6#116
d59f:4 0I2N0T]:: CNLoItE NsTe nWdRiInTgE eKxEtYe n[s3i2o]n:
(7Sbe4s4s8idobn5 0T3iec4k5ebd7t7/b3b56)4 0f0o3r8 7'1e1n1c0rdyfp1t0e6d2
ce0x5tae1ncs5ieo9n9s6'2
1fd40:2 2EdX3T8[502000702021c6
169d:5f 4I0N2T0:] :S ENRoVtE Rs eWnRdIiTnEg KeExYt e[n3s2i]o:n
d(7Kdecyb 7S0hca7rcef/15b12)7 6feo2re f'0edncc8r9y8patee6d4
ae6xet3efn5s0i2o2n5s1'4
248:7 7E3X1Tb[e050b0f000d115671e69d555f94a0
209:] :I Not NsTe:n dCiLnIgE NeTx tWeRnIsTiEo nI V( S[u1p2p]o:r t6eddf
5V0e4r6s7ico0n5s9/d4033)1 3f5ocr7 c'8efn4c
ry9p:t eIdN Te:x tSeEnsioRnVsE'R
W4R:I TEEX TI[V0 0[01020]1:6 1e68dd5efa47082100]9:e dN6oetb 4sae3ncd8i0n7ga=
 1e
x5t:e nRsEiCo[n0 0(0P0o0s1t5 bHba1nddds2hca5k0e] :A uEtpho/c4h9 )# 1f
orre a'deyn
c4r:y pHtSeKd[ 0e0x0t0e0n1s5ibobn1sd'd
24c:5 0]E:X TT[L0S0 010.031 6r1e6-dk5efy4 0w2i0t]h: cNiopth esre
nsduiintge :e xGtNeUnTsLiSo_nA E(SS_a2f5e6 _RGeCnMe_gSoHtAi3a8t4i
o3n:/ 6A5S2S8E1R)T :f o.r. /'.e.n/cgrnyupttlesd- 3e.x7t.e7n/sliiobn/sb'u
f4f:e rEsX.Tc[[0g0e0t0_0l1a6s1t6_pda5cfk4e0t2]0:]1:1 8P5r
ep1a0r:i nRgE AeDx:t eGnosti o5n b(ySteersv efrr oNma m0e0
0I0n0d1i5cbaftdi2oan3/e0a)0
f1o0r: 'ReEnAcDr:y prteeadd e5x tbeyntseiso nfsr'o
m4 :0 0E0X0T0[1050b0f0d021a631e6ad05
f1400:2 0R]B:: NHoatv es e0n dbiyntge se xitnetnos ibounf f(eCro.o
kAided/i4n4g) 5f obry t'eesn.c
r1y0p:t eRdB :e xRteeqnuseisotnesd'
54 :b yEtXeTs[
050:0 0R0E1C6[1060d050f041052b0]b:1 dPdr2ecp5a0r]i:n gS SeLx t3e.n3s
iCohna n(gEeaCrilpyh eDraStpae/c4 2p)a cfkoert 'reencceriyvpetde.d
Eepxotcehn s1i,o nlse'n
g4t:h :E X1T
[50:0 0R0E0C1[601060d050f1450b2b01]d:d 2Nco5t0 ]s:e nEdxipnegc teexdt
ePnascikoent (HPaSnKd sKheayk eE(x2c2h)a
n5g:e RMEoCd[e0s0/04050)1 5fbobr1 d'de2ncc5r0y]p:t eRde ceexitveends iPoanc=
sk'e
t4 :C hEaXnTg[e0C0i0p0h0e1r6S1p6edc5(f2400)2 0w]i:t hP rleepnagrtihn:g 1e
xt1e0n:s iRoEnA D(:R eGcootr d1 Sbiyztee sL ifmriotm/ 2080)0 0f0o1r5
b'fedn2car3yepat0e
d1 0e:x tReEnAsDi:o nrse'a
d4 :1 EbXyTt[e0s0 0f0r0o1m6 1060d050f041052b0f]d:2 aS3eenad0i
n1g0 :e xRtBe:n sHiaovne R5e cboyrtde sS iiznet oL ibmuiftf/e2r8. (A2d
dbiyntge s1)
byt4e:s .E
XT1[00:0 0R0B0:1 6R1e6qdu5efs4t0e2d0 ]6: bPyrteepsa
ri1n0g: edxitsecnasridoinn g( Mcahxainmguem cRiepchoerrd sSpiezce
/i1n) TfLoSr1 .'3e
ncrypted extensions'
4: EXT[000001616d5f4020]: Not sending extension (Compress
Certificate/27) for 'encrypted extensions'
4: EXT[000001616d5f4020]: Not sending extension (ClientHello
Padding/21) for 'encrypted extensions'
4: EXT[000001616d5f4020]: Not sending extension (Pre Shared Key/41)
for 'encrypted extensions'
4: HSK[000001616d5f4020]: ENCRYPTED EXTENSIONS was queued [12 bytes]
3: ASSERT: ../../gnutls-3.7.7/lib/tls13/certificate.c[_gnutls13_send_certif=
icate]:250
3: ASSERT: ../../gnutls-3.7.7/lib/handshake-tls13.c[_gnutls13_handshake_ser=
ver]:440
qemu-system-x86_64: TLS handshake failed: Insufficient credentials for
that request.
5: REC[000001616d5f4020]: Start of epoch cleanup
5: REC[000001616d5f4020]: Epoch #0 freed
5: REC[000001616d5f4020]: End of epoch cleanup
5: REC[000001616d5f4020]: Epoch #1 freed
10: READ: -1 returned from 0000015bfd2a3ea0, errno=3D5 gerrno=3D0
3: ASSERT: ../../gnutls-3.7.7/lib/buffers.c[_gnutls_stream_read]:369
3: ASSERT: ../../gnutls-3.7.7/lib/buffers.c[_gnutls_io_read_buffered]:589
3: ASSERT: ../../gnutls-3.7.7/lib/record.c[recv_headers]:1195
3: ASSERT: ../../gnutls-3.7.7/lib/record.c[_gnutls_recv_in_buffers]:1321
3: ASSERT: ../../gnutls-3.7.7/lib/buffers.c[_gnutls_handshake_io_recv_int]:=
1467
3: ASSERT: ../../gnutls-3.7.7/lib/handshake.c[_gnutls_recv_handshake]:1600
3: ASSERT: ../../gnutls-3.7.7/lib/tls13/encrypted_extensions.c[_gnutls13_re=
cv_encrypted_extensions]:37
3: ASSERT: ../../gnutls-3.7.7/lib/handshake-tls13.c[_gnutls13_handshake_cli=
ent]:114
qemu-system-x86_64: TLS handshake failed: Error in the pull function.
5: REC[0000015bb1dd2c50]: Start of epoch cleanup
5: REC[0000015bb1dd2c50]: Epoch #0 freed
5: REC[0000015bb1dd2c50]: End of epoch cleanup
5: REC[0000015bb1dd2c50]: Epoch #1 freed
query-migrate shows failed migration: TLS handshake failed: Error in
the pull function.
**
ERROR:../tests/qtest/migration-helpers.c:151:migrate_query_not_failed:
assertion failed: (!g_str_equal(status, "failed"))
Bail out! ERROR:../tests/qtest/migration-helpers.c:151:migrate_query_not_fa=
iled:
assertion failed: (!g_str_equal(status, "failed"))

Regards,
Bin

