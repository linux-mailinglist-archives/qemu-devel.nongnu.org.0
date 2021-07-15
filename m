Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D095D3CAE29
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 22:54:38 +0200 (CEST)
Received: from localhost ([::1]:55602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m48NR-000112-UB
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 16:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m48MG-00084y-Qd
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 16:53:24 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:37693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m48MF-00061T-4D
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 16:53:24 -0400
Received: by mail-qt1-x834.google.com with SMTP id d1so5560216qto.4
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 13:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=+KTo9ybhUvJYiV2RIdLb/5dePYDG9hYl4nuJVpMZA2c=;
 b=ObWJfWb1sZljoKxuRggFIZiwFOxtWLbwtzwwYGvTVmQdiA756tCPojnbZbI3yMMO/n
 BDYb/0l0Ok9LA/A3jYIj3GUmbQMApoKXhS4BtLI/LRK0/xv6nCWC0vcK7n/Y0RujL9mm
 BgGbKuFYL6lGGmiyV7ebIt3f9BTK8QQZ+wfRF/hr0YH9Pn0HRrSRB2srk2hL9hJqlV/S
 cm2M6e09hKnLwXnSNhQM0plNOlCRco8UWlyWD9XUKPujKHaOd3dBJ1Vj9VsFAi9njAEe
 6nw8z6rDAPGBgfoaJwzwL9aEHh/dLDh1i5hhNask8ViUZkYGpt1s1MzBoZerqCiBibLm
 P5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=+KTo9ybhUvJYiV2RIdLb/5dePYDG9hYl4nuJVpMZA2c=;
 b=UXezyHrDqpewQDebXVCxYh/tMaS8MquZXQzGUX/zPwdb9K/8Bz9H1tkzNcNal5HE+7
 qQLLrFPsQeTBY6kqrz56D2LE0E5XBzubKpCRBEGkiyseSnSt8atL1HWggNd+DsHN+JAJ
 z+2cXYMRfEvHpV9/2e7phNxLYIgyavnb9+3Z4ifdCu8gJtNVR36Ibva57UmBo7QpNWEi
 PQlt7C2W+s31NJkn+L43VGNJSz5LsZ6sbpm9JHLM7QuDHFEGijd/umjiHpBoARVzp4rH
 AkNzSgpkHdSd3E6m75AwQqP5SFCJwKC1ryLtaAkZdEVXvwr71IbdEhUY4ZhErVgiFJQZ
 M4lg==
X-Gm-Message-State: AOAM531qjKbQATkzi6s7+aIjSAb7kaK4lERqULwoykw2eJS9VSJ+ZpLq
 ZF+5EYFpOLo0hLTNkaxKjgA=
X-Google-Smtp-Source: ABdhPJywpxud97zzAHEfG+8DvgbXCAlaeN6wn8ctq1Hu/3NIi7OhipBXXISq36Est9sR2yKaaFv/5Q==
X-Received: by 2002:ac8:7691:: with SMTP id g17mr5781918qtr.287.1626382401842; 
 Thu, 15 Jul 2021 13:53:21 -0700 (PDT)
Received: from [192.168.0.6] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id d200sm2993117qke.95.2021.07.15.13.53.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Jul 2021 13:53:21 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH v5 0/2] cocoa: keyboard quality of life
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <mailman.16196.1626230271.10239.qemu-devel@nongnu.org>
Date: Thu, 15 Jul 2021 16:53:20 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <B91DA33E-8345-43F3-8905-6533D6042271@gmail.com>
References: <mailman.16196.1626230271.10239.qemu-devel@nongnu.org>
To: Gustavo Noronha Silva <gustavo@noronha.dev.br>,
 QEMU devel list <qemu-devel@nongnu.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=programmingkidx@gmail.com; helo=mail-qt1-x834.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, armbru@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> From: Gustavo Noronha Silva <gustavo@noronha.dev.br>
>=20
> v5 addresses the casting issue pointed out by Akihiko Odaki.
> Sorry it took me so long to update the patches, but here
> they are! Hopefully we can get them in now ;D
>=20
> Btw I also changed my email address slightly (.dev.br
> instead of .eti.br).
>=20
> -----
>=20
> This series adds two new options to the cocoa display:
>=20
> - full-grab causes it to use a global tap to steal system combos
>   away from Mac OS X, so they can be handled by the VM
>=20
> - swap-option-command does what it says on the tin; while that is
>   something you can do at the Mac OS X level or even supported by
>   some keyboards, it is much more convenient to have qemu put
>   Meta/Super and Alt where they belong if you are running a
>   non-Mac VM
>=20
> Both are off by default. For full-grab in particular, it is off also
> because unfortunately it needs accessibility permissions for input
> grabbing, so it requires more deliberate action by the user anyway.
>=20
> Gustavo Noronha Silva (2):
>  ui/cocoa: capture all keys and combos when mouse is grabbed
>  ui/cocoa: add option to swap Option and Command
>=20
> qapi/ui.json    |  22 +++++++++
> qemu-options.hx |   4 ++
> ui/cocoa.m      | 129 ++++++++++++++++++++++++++++++++++++++++++++----
> 3 files changed, 146 insertions(+), 9 deletions(-)
>=20
> --=20
> 2.30.1 (Apple Git-130)

I could not make the full-grab feature work. I tried this:
./build/qemu-system-ppc -display cocoa,full_grab=3Don

This is the error message I saw:
qemu-system-ppc: -display cocoa,full_grab=3Don: Parameter 'full_grab' is =
unexpected

The command and option key swapping feature does work. This should be a =
very useful feature to those with a PC keyboard.

I totally suggest that a new menu called Options be made with these =
features added.=20

This is how it could look like:

Options
- Full Keyboard Grab
- Swap Command and Option Keys

Right now the user has to restart QEMU if he or she wants to swap the =
command and options keys to initiate a full keyboard grab. This is not =
fun. With a menu the user could change these options while QEMU remains =
running.

This code can be used to add the Options menu:

 ui/cocoa.m | 137 +++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 128 insertions(+), 9 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 9f72844b07..de85305c7a 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m

@@ -1655,6 +1755,14 @@ static void create_initial_menus(void)
     [menuItem setSubmenu:menu];
     [[NSApp mainMenu] addItem:menuItem];
=20
+    // Options menu
+    menu =3D [[NSMenu alloc] initWithTitle:@"Options"];
+    [menu addItem: [[[NSMenuItem alloc] initWithTitle:@"Full Keyboard =
Grab" action:@selector(setFullGrab:) keyEquivalent:@""] autorelease]];
+    [menu addItem: [[[NSMenuItem alloc] initWithTitle:@"Swap Command =
and Option Keys" action:@selector(setSwapOptionCommand:) =
keyEquivalent:@""] autorelease]];
+    menuItem =3D [[[NSMenuItem alloc] initWithTitle:@"Options" =
action:nil keyEquivalent:@""] autorelease];
+    [menuItem setSubmenu:menu];
+    [[NSApp mainMenu] addItem:menuItem];
+
     // Window menu
     menu =3D [[NSMenu alloc] initWithTitle:@"Window"];
     [menu addItem: [[[NSMenuItem alloc] initWithTitle:@"Minimize" =
action:@selector(performMiniaturize:) keyEquivalent:@"m"] autorelease]]; =
// Miniaturize


To be able to check and uncheck menu items you could see the method =
(void)adjustSpeed:(id)sender.

Please let me know if there is anything else I could do to help.

Thank you.


