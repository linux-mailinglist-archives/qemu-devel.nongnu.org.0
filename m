Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E734B6D9A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 14:35:24 +0100 (CET)
Received: from localhost ([::1]:47768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJxzG-0004zN-9N
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 08:35:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJxkG-0005og-VP
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:19:52 -0500
Received: from [2607:f8b0:4864:20::c2a] (port=37580
 helo=mail-oo1-xc2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJxkD-0004SB-MT
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:19:52 -0500
Received: by mail-oo1-xc2a.google.com with SMTP id
 x6-20020a4a4106000000b003193022319cso586661ooa.4
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 05:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zH8bEzAMCbpF2jDeAsuMttoXUXBTHyGzeG4U3ecCy6M=;
 b=pfnHq5bKM5dQkbD3bYEk+f2Egdf4/W5RikFPufnzpagDPaqtQXNgYVJscDKYvGo69C
 mDOYxFhVlYI616wQxYgSeFuC8mVkPaMoltmFlfqtdHhSnSC8FnqM2GDJP0zBWZ5elzAM
 KxGX/mfhPMuHWJwnwGoXvkk/x4TRqAEHdO6LIXHYcO/Nh69A9lKC7JsfyK/okaaJI/Pd
 2U3HEC7kCPp1jULCOGgcs9L60RfqYRMjJc3uIdhUPLIKbaEKhYp4j9Roe5h6WbIW3/ca
 V0FS8N1Tojts1tdKCy4qxSeWiIO0u6zTcMpbZ8hmbKFNrj1KS99hBhF987i1o/1pwz+W
 w+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zH8bEzAMCbpF2jDeAsuMttoXUXBTHyGzeG4U3ecCy6M=;
 b=l7PbrTXxdQHHoLaFU3enZaD07Es16rSbPdDfH5EcyCoERUxjFS5C5pu3FDxFNAC6Iv
 1q5Mfam16X9mEtThZA6qLZOoaNurn4Uzm8cpbC4guM1qxA/XBRZiRUY/Dc4J6L1eupgd
 KxJgiO8uateEnEcQS5ubFf7psk77txLkXB5dZayQpjFMqneFDTqD7TsslgsEJgzygeYM
 yq0AsgUhX/wCmsiMy5pEPz8y+xDQzn9wBJhNQi9RWDpWRDeg8mlJ1KeP4SUxyN3hYuT4
 DqfaLfI5pLrLdMqoWWAzo2YnEEObY8SJj6Ec0UPPXKt1f+1JYyMd7lDzS1LkeLSOG+Yk
 hrBw==
X-Gm-Message-State: AOAM530FMHdRCQ3b/e4NQSAA2kxThr2X4t8yoKQXP3iGyhF/bpJfxUvH
 tYBwYFD6fmvxNpjRAHJD4kMwenNjDiFZxl6GplE=
X-Google-Smtp-Source: ABdhPJw4ekkOnBd2HsVuWg6tsx6WPhvDyea5nFrM0KF65IshI4saguGky3PZXuB6xWFTGeG/ns1tEkm3V1nGO7GGSOw=
X-Received: by 2002:a05:6870:5a83:: with SMTP id
 dt3mr1242835oab.193.1644931184815; 
 Tue, 15 Feb 2022 05:19:44 -0800 (PST)
MIME-Version: 1.0
References: <20220215120625.64711-1-f4bug@amsat.org>
 <20220215120625.64711-5-f4bug@amsat.org>
 <CAFEAcA_Mp5=iAh=LE+w7Ky+nSHZRA0JSjfwom5JWYxKn0s8HXQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_Mp5=iAh=LE+w7Ky+nSHZRA0JSjfwom5JWYxKn0s8HXQ@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Tue, 15 Feb 2022 22:19:33 +0900
Message-ID: <CAMVc7JWRjZouOeicu6D_WGw4-vR8z9zmrDEhH94SyJd=zQb90Q@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] ui/cocoa: Ignore 'initializer overrides' warnings
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oo1-xc2a.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 9:35 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Tue, 15 Feb 2022 at 12:13, Philippe Mathieu-Daud=C3=A9 via
> <qemu-devel@nongnu.org> wrote:
> >
> > We globally ignore the 'initializer overrides' warnings in C code
> > since commit c1556a812a ("configure: Disable (clang)
> > initializer-overrides warnings"). Unfortunately the ${gcc_flags}
> > variable is not propagated to Objective-C flags ($OBJCFLAGS).
> > Instead of reworking the configure script to test all supported
> > C flags in Objective-C and sanitize them, ignore the warning
> > locally with the GCC diagnostic #pragma (Clang ignores it).
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> I'm not really a fan of #pragma GCC diagnostic directives in
> specific source files, unless there's no alternative or
> the issue really is specific to one file.
>
> thanks
> -- PMM

What about fixing then? Something like this should do:

--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -652,9 +652,7 @@ - (void) handleMonitorInput:(NSEvent *)event

     /* translates Macintosh keycodes to QEMU's keysym */

-    int without_control_translation[] =3D {
-        [0 ... 0xff] =3D 0,   // invalid key
-
+    int without_control_translation[256] =3D {
         [kVK_UpArrow]       =3D QEMU_KEY_UP,
         [kVK_DownArrow]     =3D QEMU_KEY_DOWN,
         [kVK_RightArrow]    =3D QEMU_KEY_RIGHT,
@@ -667,9 +665,7 @@ - (void) handleMonitorInput:(NSEvent *)event
         [kVK_Delete]        =3D QEMU_KEY_BACKSPACE,
     };

-    int with_control_translation[] =3D {
-        [0 ... 0xff] =3D 0,   // invalid key
-
+    int with_control_translation[256] =3D {
         [kVK_UpArrow]       =3D QEMU_KEY_CTRL_UP,
         [kVK_DownArrow]     =3D QEMU_KEY_CTRL_DOWN,
         [kVK_RightArrow]    =3D QEMU_KEY_CTRL_RIGHT,

