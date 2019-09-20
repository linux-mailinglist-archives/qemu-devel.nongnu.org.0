Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8A7B8EAE
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 12:54:26 +0200 (CEST)
Received: from localhost ([::1]:57668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBGYT-0008Af-FK
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 06:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33569)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iBGXA-0007hI-K4
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 06:53:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iBGX8-0007Ka-Og
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 06:53:04 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:45883)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iBGX8-0007JV-E9
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 06:53:02 -0400
Received: by mail-oi1-x242.google.com with SMTP id o205so1343041oib.12
 for <qemu-devel@nongnu.org>; Fri, 20 Sep 2019 03:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BobJpisjb20mjN4pwoFo6Q6LBXmgZD0vD1a0ngvlKuI=;
 b=l05pBFS8mmLm0p6GCqoO0J1TW+gyxQiQMvHznYZJJcRnaNUW1k+a5qoDTMeHvWsBIO
 1y4YX/ZuKVOr/nhtM111cPxq8yIoEmgxvhUV2XyqgfAdKtrA6sIKSYUIY7IlmN3ZSQ4j
 s5hIcy4SErfR4lph8aGOhWfCyV0j1sSTVT9hTltnAOe9HYrh2uuPwen2i7jGCJvan6mi
 IXvzFABfmo/xo1bL7KM8JZQ2k8ds0FHOXc9emz/rKi76iPTw3ow5EYY1KTE5NFp249gh
 6Kzs2Qy9l+Agist93ux68LZafVHMfyDTuHN7FRQkPpTwt+oou3oJh/hQ+BfdwL47QKd5
 dyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BobJpisjb20mjN4pwoFo6Q6LBXmgZD0vD1a0ngvlKuI=;
 b=td1fmgsMhIVlMkM2LISoabVqI3NDEh25eywiG0swm2OnXetczRwtvZvTfnUtdAojqR
 tFBfkIeQ1rT+Pn6Ez6XK0l03MVPHtdnflnxu4Nc4il9l6GJjeDUZ9vVpx4ua5Cs8kam8
 iohlo/uzlgSbs+HeJ6v2sn0QSXfxYPqNVauQIHzICC1OlB8SCHAclVS3O45cxD3/nYlF
 eX/BLp0FZWoZPSP3q/KQtkiJo1NzGXOx2JXm8nlsIJlz6zOn7tiUegQjxMDhp5HrcrvI
 Qkfa3of1c0GGZI8RU9jKUy7RtGS+PirOZv5SytkpSI7aTDleA8LrjSdPsRPeCwHS0kB7
 Hadg==
X-Gm-Message-State: APjAAAX6eKWsGdQqVp2JAGq5RgaD++6xso+FR8yJMkuA/rmz3d0XysyS
 FpS58XaL4Cwhv78QRZ3bzrgOuKYUwc2Pm6PY2+Wovw==
X-Google-Smtp-Source: APXvYqzhzFRY5Xbq4Y8tvurpX1ho58AQs3tJeg3EE0CKHExebqZpfHkBDfzFrCa/XTCgWhV55QDIu0dR/CkOX8UhRjI=
X-Received: by 2002:aca:b646:: with SMTP id g67mr2324024oif.163.1568976781305; 
 Fri, 20 Sep 2019 03:53:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190905131040.8350-1-peter.maydell@linaro.org>
 <20190920085756.luzas76jivztgxzb@lws.brq.redhat.com>
In-Reply-To: <20190920085756.luzas76jivztgxzb@lws.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Sep 2019 11:52:49 +0100
Message-ID: <CAFEAcA862jNiTSZRgdugo6GEKG2GUmQg25Y0e9rME277-WXNvg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v3] qemu-ga: Convert invocation documentation
 to rST
To: Miroslav Rezanina <mrezanin@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 Sep 2019 at 09:57, Miroslav Rezanina <mrezanin@redhat.com> wrote=
:
>
> On Thu, Sep 05, 2019 at 02:10:40PM +0100, Peter Maydell wrote:
> > The qemu-ga documentation is currently in qemu-ga.texi in
> > Texinfo format, which we present to the user as:
> >  * a qemu-ga manpage
> >  * a section of the main qemu-doc HTML documentation
> >
> > Convert the documentation to rST format, and present it to
> > the user as:
> >  * a qemu-ga manpage
> >  * part of the interop/ Sphinx manual
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > Reviewed-by: Michael Roth <mdroth@linux.vnet.ibm.com>
> > Tested-by: Michael Roth <mdroth@linux.vnet.ibm.com


> This patch is breaking build for me. It fails on:
>
>     perl -Ww -- /builddir/build/BUILD/qemu-4.1.0/scripts/texi2pod.pl -I d=
ocs -I scripts -I docs/interop -DVERSION=3D"4.1.50" -DCONFDIR=3D"/etc/qemu-=
kvm" scripts/texi2pod.pl docs/interop/qemu-ga.8.pod && pod2man --utf8 --sec=
tion=3D8 --center=3D" " --release=3D" " docs/interop/qemu-ga.8.pod > docs/i=
nterop/qemu-ga.8
>
> with:
>
>    No filename or title
>
> Not sure why this is happening.

Yes, it's a bug in the handling of in-tree builds (out-of-tree
builds work fine and we generally recommend those as better anyway).
I have a patch on list which should fix the in-tree build case:

https://patchew.org/QEMU/20190919155957.12618-1-peter.maydell@linaro.org/

thanks
-- PMM

