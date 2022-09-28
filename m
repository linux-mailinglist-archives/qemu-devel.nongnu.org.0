Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CF05ED482
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 08:12:49 +0200 (CEST)
Received: from localhost ([::1]:39096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odQJJ-0001II-CS
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 02:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1odQAZ-0006pv-Vy
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 02:03:47 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:43842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1odQAW-0005cg-UG
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 02:03:42 -0400
Received: by mail-qv1-xf29.google.com with SMTP id s13so7547943qvq.10
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 23:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=8SdOL+HUI8lZWKdsRYskzj+XrpgzohTRECQ3kaEWylo=;
 b=AV5GbQglCrWonjnSC/lL4cEpAfdv4OIWa/d90ZbnMojZUyejhvyAhNHUwFjFRcWAxS
 kUN4edTdG7YPyTOkTIOe9YkEW0r0rEJahXABsCYwLG4lEP5wr8gFUjFZ8h9kolBi4I3+
 7TUs3NUXGmtfw4Hvkq3vmzLJzMlcAHbklaHuab0debaJniXauiICr9JoNkm0hUpPkiuk
 wAirxZIBEXzrH4glrnByBiUBxULAkeue2yAWm60wuNnh3P+o245U7OSzXzFHDoWhIJ5l
 /jCPnVUEQ0Dsu5ddrVsEwxqn4w0m7wkPjEToZDmuGQNCi8iL5VQPBX26uD5Euwc4b9/Y
 vejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8SdOL+HUI8lZWKdsRYskzj+XrpgzohTRECQ3kaEWylo=;
 b=DCuEuEpGZAfFRq+fvorTthgkBZ7xrlKvC847bYf0aFN5wXzGvVdjQ7TpvR1kqMeFRv
 CdyjhN6e9HOefFhPNJG1Ur6BLlpIaoiyVmDaY6teJHh4lvA99Z9eXswuNlIup+Cv103k
 O7r8ovt3OFfEsDrW7kc/DIu3pQmDaEzPI6xfftHFLZXPwJCbPKZfKfWs1IpkEtuf/sXR
 lTOeIHmWTF//mcIgZ0KtwGdqdapLeu8yw03kAnTXhCqxa+B5t6IFS/n3EHXTgrTKu0cG
 eTwWADnsQZaPnC/IvqiClghUJmna9QIO82RFFfDBK/8dmIE97jR7S0JUOy5s5kpOLU9q
 0AzQ==
X-Gm-Message-State: ACrzQf0A57S6yVIlzd8cAIG16Zjaj94XR+iMcohPZhLgRnErz9Mzk8hy
 Bjnk99SM+Kp+MJunCmJUFjpEb56NKDHMTCR+k/FXXAzsywI=
X-Google-Smtp-Source: AMsMyM5jZaYPFDQ0WFN2es6I7wAIoKDyqfFvPB17o4F39q9LWdLbW2POKmoxpi1HH4w7N29eojhRmM6dp1UXaOrRk+Q=
X-Received: by 2002:ad4:5763:0:b0:4ad:6f51:2aff with SMTP id
 r3-20020ad45763000000b004ad6f512affmr24658399qvx.122.1664345019507; Tue, 27
 Sep 2022 23:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-36-bmeng.cn@gmail.com>
 <YytBFdDoLVgkgqIX@work-vm> <YytIkiMEC/KHL/9p@redhat.com>
 <CAEUhbmVSBhD5tS_Y4E9CrhxHQd43Lnwbwg5K07SKMm0gmsLxnw@mail.gmail.com>
 <Yyw7dFEWACkGCoNP@redhat.com>
 <CAEUhbmVB6qgfoxUwDJTvoMgBgH0CwMiNyUj8Ye716JCYowTq7g@mail.gmail.com>
 <YzMZUGrE6SCfMeyb@redhat.com>
In-Reply-To: <YzMZUGrE6SCfMeyb@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 28 Sep 2022 14:03:28 +0800
Message-ID: <CAEUhbmVHYN4MM3XqTb_4i_5Wm-xa7ZrH6CysnqukVfVC5gLFUQ@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf29.google.com
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

Hi Daniel,

On Tue, Sep 27, 2022 at 11:40 PM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> On Thu, Sep 22, 2022 at 07:54:05PM +0800, Bin Meng wrote:
> > On Thu, Sep 22, 2022 at 6:39 PM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com> wrote:
> > >
> > > On Thu, Sep 22, 2022 at 10:47:26AM +0800, Bin Meng wrote:
> > > > On Thu, Sep 22, 2022 at 1:23 AM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
> > > > >
> > > > > On Wed, Sep 21, 2022 at 05:51:33PM +0100, Dr. David Alan Gilbert =
wrote:
> > > > > > * Bin Meng (bmeng.cn@gmail.com) wrote:
> > > > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > > > >
> > > > > > > Some migration test cases use TLS to communicate, but they fa=
il on
> > > > > > > Windows with the following error messages:
> > > > > > >
> > > > > > >   qemu-system-x86_64: TLS handshake failed: Insufficient cred=
entials for that request.
> > > > > > >   qemu-system-x86_64: TLS handshake failed: Error in the pull=
 function.
> > > > > > >   query-migrate shows failed migration: TLS handshake failed:=
 Error in the pull function.
> > > > > > >
> > > > > > > Disable them temporarily.
> > > > > > >
> > > > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > > > > ---
> > > > > > > I am not familar with the gnutls and simply enabling the gnut=
ls debug
> > > > > > > output does not give me an immedidate hint on why it's failin=
g on
> > > > > > > Windows. Disable these cases for now until someone or maintai=
ners
> > > > > > > who may want to test this on Windows.
> > > > > >
> > > > > > Copying in Dan Berrange, he's our expert on weird TLS failures.
> > > > >
> > > > > Seems to match this:
> > > > >
> > > > >    https://gnutls.org/faq.html#key-usage-violation2
> > > > >
> > > > > which suggests we have a configuration mis-match.
> > > > >
> > > > > I'm surprised to see you are only needing to disable the TLS PSK =
tests,
> > > > > not the TLS x509 tests.
> > > >
> > > > The TLS x509 qtests all passed.
> > > >
> > > > >
> > > > > I'd like to know if tests/unit/test-crypto-tlssession passes.
> > > >
> > > > These unit tests currently are not built on Windows as they simply
> > > > don't build due to usage of socketpair().
> > >
> > > Doh, yes, that's rather annoying, as debugging this problem in the
> > > unit tests would be easier than in qtests.
> > >
> > > > > If so, it might suggest we are missing 'priority: NORMAL' propert=
y
> > > > > when configuring TLS creds for the migration test.
> > > >
> > > > I did the following changes but the error is still the same:
> > >
> > > >
> > > > diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-t=
est.c
> > > > index dbee9b528a..c1e3f11873 100644
> > > > --- a/tests/qtest/migration-test.c
> > > > +++ b/tests/qtest/migration-test.c
> > > > @@ -788,7 +788,8 @@ test_migrate_tls_psk_start_common(QTestState *f=
rom,
> > > > " 'id': 'tlscredspsk0',"
> > > > " 'endpoint': 'client',"
> > > > " 'dir': %s,"
> > > > - " 'username': 'qemu'} }",
> > > > + " 'username': 'qemu',"
> > > > + " 'priority': 'NORMAL'} }",
> > > > data->workdir);
> > > > qobject_unref(rsp);
> > > > @@ -797,7 +798,8 @@ test_migrate_tls_psk_start_common(QTestState *f=
rom,
> > > > " 'arguments': { 'qom-type': 'tls-creds-psk',"
> > > > " 'id': 'tlscredspsk0',"
> > > > " 'endpoint': 'server',"
> > > > - " 'dir': %s } }",
> > > > + " 'dir': %s,"
> > > > + " 'priority': 'NORMAL'} }",
> > > > mismatch ? data->workdiralt : data->workdir);
> > > > qobject_unref(rsp);
> > > >
> > > > I am not sure whether I did the right changes.
> > >
> > >
> > > That ought to have been sufficient, if priority strings were the
> > > problem.
> > >
> > >
> > > I think we'd need the debug output from gnutls - could you edit crypt=
o/init.c
> > > and uncomment the '#define DEBUG_GNUTLS' line near the top.
> > >
> > > If you can post the output you get from a single migration-test test =
case
> > > involving PSK, it might be enough to diagnose why gnutls is failing.
> > >
> >
> > Here is the output:
> >
> > # Start of tls tests
> > # starting QEMU: ./qemu-system-x86_64 -qtest
> > unix:D:\msys64\tmp/qtest-18480.sock -qtest-log nul -chardev
> > socket,path=3DD:\msys64\tmp/qtest-18480.qmp,id=3Dchar0 -mon
> > chardev=3Dchar0,mode=3Dcontrol -display none -accel kvm -accel t
> > cg -name source,debug-threads=3Don -m 150M -serial
> > file:D:\msys64\tmp\migration-test-A5WJS1/src_serial -drive
> > file=3DD:\msys64\tmp\migration-test-A5WJS1/bootsect,format=3Draw -accel
> > qtest
> > qemu: thread naming not supported on this host
> > # starting QEMU: ./qemu-system-x86_64 -qtest
> > unix:D:\msys64\tmp/qtest-18480.sock -qtest-log nul -chardev
> > socket,path=3DD:\msys64\tmp/qtest-18480.qmp,id=3Dchar0 -mon
> > chardev=3Dchar0,mode=3Dcontrol -display none -accel kvm -accel t
> > cg -name target,debug-threads=3Don -m 150M -serial
> > file:D:\msys64\tmp\migration-test-A5WJS1/dest_serial -incoming
> > unix:D:\msys64\tmp\migration-test-A5WJS1/migsocket -drive
> > file=3DD:\msys64\tmp\migration-test-A5WJS1/bootsect,f
> > ormat=3Draw -accel qtest
>
> Comparing to running the same test on my machine.....
>
> > 4: EXT[0000015bb1dd2c50]: Sending extension Supported Versions/43 (9 by=
tes)
> > 4: EXT[0000015bb1dd2c50]: Preparing extension (Post Handshake Auth/49)
> > for 'client hello'
> > 4: EXT[0000015bb1dd2c50]: Preparing extension (Safe
> > Renegotiation/65281) for 'client hello'
> > 4: EXT[0000015bb1dd2c50]: Sending extension Safe Renegotiation/65281 (1=
 bytes)
> > 4: EXT[0000015bb1dd2c50]: Preparing extension (Server Name
> > Indication/0) for 'client hello'
> > 4: EXT[0000015bb1dd2c50]: Preparing extension (Cookie/44) for 'client h=
ello'
> > 4: EXT[0000015bb1dd2c50]: Preparing extension (Early Data/42) for 'clie=
nt hello'
> > 4: EXT[0000015bb1dd2c50]: Preparing extension (PSK Key Exchange
> > Modes/45) for 'client hello'
> > 4: EXT[0000015bb1dd2c50]: Sending extension PSK Key Exchange Modes/45 (=
3 bytes)
> > 4: EXT[0000015bb1dd2c50]: Preparing extension (Record Size Limit/28)
> > for 'client hello'
> > 4: EXT[0000015bb1dd2c50]: Sending extension Record Size Limit/28 (2 byt=
es)
> > 4: EXT[0000015bb1dd2c50]: Preparing extension (Maximum Record Size/1)
> > for 'client hello'
> > 4: EXT[0000015bb1dd2c50]: Preparing extension (Compress
> > Certificate/27) for 'client hello'
> > 4: EXT[0000015bb1dd2c50]: Preparing extension (ClientHello Padding/21)
> > for 'client hello'
> > 4: EXT[0000015bb1dd2c50]: Preparing extension (Pre Shared Key/41) for
> > 'client hello'
>
> Right here is missing two items:
>
>   4: EXT[0x55bd0c660d30]: sent PSK identity 'qemu' (0)
>   4: EXT[0x55bd0c660d30]: Sending extension Pre Shared Key/41 (47 bytes)
>
> So it appears the client is not sendnig the PSK credentials
>
> > 4: HSK[0000015bb1dd2c50]: CLIENT HELLO was queued [343 bytes]
> > 5: REC[0000015bb1dd2c50]: Preparing Packet Handshake(22) with length:
> > 343 and min pad: 0
> > 9: ENC[0000015bb1dd2c50]: cipher: NULL, MAC: MAC-NULL, Epoch: 0
> > 5: REC[0000015bb1dd2c50]: Sent Packet[1] Handshake(22) in epoch 0 and
> > length: 348
>
> I believe there are probably two issues - first we're igonring the
> return value of gnutls_psk_set_client_credentials() and I have a feeling
> that is reporting an error.

Indeed gnutls_psk_set_client_credentials() fails with "Error in
parsing." message.

> Second, when we write the PSK credentials out
> to disk, we're not using binary mode, so I think UNIX line endings are
> getting turned into  DOS line endings, and when we later load the PSK
> credentials there's a stray \r present  that probably breaks
> gnutls_psk_set_client_credentials.

I think that's what happened.

>
> Could you try this patch and see if it makes the PSK tests work for
> migration-test:

Yes, this patch fixed the TLS test cases in the migration-test on Windows!

Thank you very much for the help!

Would you mind sending the patches on your own, or you want me to
include them in the next version of this series?

>
> diff --git a/crypto/tlscredspsk.c b/crypto/tlscredspsk.c
> index a4f9891274..546cad1c5a 100644
> --- a/crypto/tlscredspsk.c
> +++ b/crypto/tlscredspsk.c
> @@ -109,7 +109,12 @@ qcrypto_tls_creds_psk_load(QCryptoTLSCredsPSK *creds=
,
>              goto cleanup;
>          }
>
> -        gnutls_psk_set_server_credentials_file(creds->data.server, pskfi=
le);
> +        ret =3D gnutls_psk_set_server_credentials_file(creds->data.serve=
r, pskfile);
> +        if (ret < 0) {
> +            error_setg(errp, "Cannot set PSK server credentials: %s",
> +                       gnutls_strerror(ret));
> +            goto cleanup;
> +        }
>          gnutls_psk_set_server_dh_params(creds->data.server,
>                                          creds->parent_obj.dh_params);
>      } else {
> @@ -135,8 +140,13 @@ qcrypto_tls_creds_psk_load(QCryptoTLSCredsPSK *creds=
,
>              goto cleanup;
>          }
>
> -        gnutls_psk_set_client_credentials(creds->data.client,
> -                                          username, &key, GNUTLS_PSK_KEY=
_HEX);
> +        ret =3D gnutls_psk_set_client_credentials(creds->data.client,
> +                                                username, &key, GNUTLS_P=
SK_KEY_HEX);
> +        if (ret < 0) {
> +            error_setg(errp, "Cannot set PSK client credentials: %s",
> +                       gnutls_strerror(ret));
> +            goto cleanup;
> +        }
>      }
>
>      rv =3D 0;
> diff --git a/tests/unit/crypto-tls-psk-helpers.c b/tests/unit/crypto-tls-=
psk-helpers.c
> index 511e08cc9c..c6cc740772 100644
> --- a/tests/unit/crypto-tls-psk-helpers.c
> +++ b/tests/unit/crypto-tls-psk-helpers.c
> @@ -27,15 +27,14 @@
>  static void
>  test_tls_psk_init_common(const char *pskfile, const char *user, const ch=
ar *key)
>  {
> -    FILE *fp;
> +    g_autoptr(GError) gerr =3D NULL;
> +    g_autofree char *line =3D g_strdup_printf("%s:%s\n", user, key);
>
> -    fp =3D fopen(pskfile, "w");
> -    if (fp =3D=3D NULL) {
> -        g_critical("Failed to create pskfile %s: %s", pskfile, strerror(=
errno));
> +    g_file_set_contents(pskfile, line, strlen(line), &gerr);
> +    if (gerr !=3D NULL) {
> +        g_critical("Failed to create pskfile %s: %s", pskfile, gerr->mes=
sage);
>          abort();
>      }
> -    fprintf(fp, "%s:%s\n", user, key);
> -    fclose(fp);
>  }
>
>  void test_tls_psk_init(const char *pskfile)
>

Regards,
Bin

