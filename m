Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B7A29A982
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 11:24:53 +0100 (CET)
Received: from localhost ([::1]:54176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXM9s-0004KL-Q4
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 06:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1kXM7t-0002cO-R8
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 06:22:49 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:3844
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1kXM7r-0000C5-Sn
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 06:22:49 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4CL79C0xFcz8PbN;
 Tue, 27 Oct 2020 06:24:15 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=date:from
 :to:cc:subject:message-id:references:mime-version:content-type
 :in-reply-to:content-transfer-encoding; s=default; bh=sxsgxfrY/2
 2BIUonF8tWGJP6oYo=; b=kqTTBhfG/zpUDFi5MZmfny8+9uln7ni7ObQe1NIqDu
 55fcmoEChDYRMCQkS5YodkHHriQfv4W9PEkzLM727bX+jR0S/fqnB9WEYv5xXLoh
 LmYeqk3zhGqKTdS+ddFe03XWKEBYO3THPEMwKjdikvBQT3se/03FKfXUCu//FO7D
 E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=date:from:to
 :cc:subject:message-id:references:mime-version:content-type
 :in-reply-to:content-transfer-encoding; q=dns; s=default; b=dJRN
 bSu/Ap6vhhwVU8j3ihKkjSEAtb8k63hORF5euzG8QebDv57czkP9q4uqorI+8Lzi
 bWGZaMlMQ2YlwyWEcQBZ0h+IS6gGKkUXXt1rTD4xw9R5fc1yUYttB68DJ7hueHTJ
 /Jq6PeLtCGIaYl8jl9WvmUDIBceUUheFY0HkAGU=
Received: from humpty.home.comstyle.com (unknown [142.114.120.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4CL79B5NwGz8PbK;
 Tue, 27 Oct 2020 06:24:14 -0400 (EDT)
Date: Tue, 27 Oct 2020 06:22:45 -0400
From: Brad Smith <brad@comstyle.com>
To: Philippe Mathieu-Daud?? <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] tests/vm: update openbsd to release 6.8
Message-ID: <20201027102245.GC64546@humpty.home.comstyle.com>
References: <20201027053048.GB64546@humpty.home.comstyle.com>
 <cbae54c3-fa97-19e6-512c-7ac570f56b12@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
In-Reply-To: <cbae54c3-fa97-19e6-512c-7ac570f56b12@redhat.com>
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 27, 2020 at 11:05:20AM +0100, Philippe Mathieu-Daud?? wrote:
> On 10/27/20 6:30 AM, Brad Smith wrote:
> > tests/vm: update openbsd to release 6.8
> >=20
> > A double dash at the end of a package name removes ambiguity
> > when the intent is to install a non-FLAVORed package.
> >=20
> > Signed-off-by: Brad Smith <brad@comstyle.com>
> > Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
> > Tested-by: Gerd Hoffmann <kraxel@redhat.com>
> > Reviewed-by: Philippe Mathieu-Daud?? <philmd@redhat.com>
>=20
> I confirm Brad sent us this patch off-list, and
> - our review comments are addressed,
> - the tags are correct.
>=20
> The patch format itself seems broken... Like a copy/paste
> into an email client...

Well, git diff vs a format-patch.


Subject: [PATCH] tests/vm: update openbsd to release 6.8

A double dash at the end of a package name removes ambiguity
when the intent is to install a non-FLAVORed package.

Signed-off-by: Brad Smith <brad@comstyle.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Tested-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/vm/openbsd | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index 8356646f21..5ffa4f1b37 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -22,8 +22,8 @@ class OpenBSDVM(basevm.BaseVM):
     name =3D "openbsd"
     arch =3D "x86_64"
=20
-    link =3D "https://cdn.openbsd.org/pub/OpenBSD/6.6/amd64/install66.is=
o"
-    csum =3D "b22e63df56e6266de6bbeed8e9be0fbe9ee2291551c5bc03f3cc2e4ab9=
436ee3"
+    link =3D "https://cdn.openbsd.org/pub/OpenBSD/6.8/amd64/install68.is=
o"
+    csum =3D "47e291fcc2d0c1a8ae0b66329f040b33af755b6adbd21739e20bb5ad56=
f62b6c"
     size =3D "20G"
     pkgs =3D [
         # tools
@@ -36,10 +36,10 @@ class OpenBSDVM(basevm.BaseVM):
         "bash",
         "gmake",
         "gsed",
-        "gettext",
+        "gettext-tools",
=20
         # libs: usb
-        "libusb1",
+        "libusb1--",
=20
         # libs: crypto
         "gnutls",
--=20
2.28.0


