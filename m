Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD3718E9A4
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Mar 2020 16:30:44 +0100 (CET)
Received: from localhost ([::1]:47356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jG2Yk-0005Ux-MN
	for lists+qemu-devel@lfdr.de; Sun, 22 Mar 2020 11:30:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39748)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1jG2XN-0004tv-1d
 for qemu-devel@nongnu.org; Sun, 22 Mar 2020 11:29:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1jG2XL-0004e7-JY
 for qemu-devel@nongnu.org; Sun, 22 Mar 2020 11:29:16 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:45479)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1jG2XL-0004dh-EL
 for qemu-devel@nongnu.org; Sun, 22 Mar 2020 11:29:15 -0400
Received: by mail-ot1-x32e.google.com with SMTP id c9so706692otl.12
 for <qemu-devel@nongnu.org>; Sun, 22 Mar 2020 08:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FjAwZgJxyyLaNTWKQSHb81pCA4RTXYwnLvZfpgKOShE=;
 b=hqDP8vrq09JuhkeVD+TVmCBe66Q6Ym6AWpmEkWkvOSUEkWykNidFgENntNYN+DlLG+
 lug8DJvP5lbxZW6zT5n+CSb+ulLoe6IBlgJKoEtdRlMTiGvi0Sn9gAXsXSgYYHtn8wJ8
 zCSqa89hOT7jdmGM81Hpwfk1nNF1k6Fb3hu0baWTPFGxTgTN64YVGd9DdogrXxDVns0T
 StlcbfqTT/ZK+0n/xdrBkB0ROA67F1Ot2DprIAnBmTvDaEN0KjUVl+Iux1eX/fnppsdY
 9Wjnq3GlDK8WiZ+a0xH8jzynzgoNZiDJZAQZ5TXv4mBWzyI8Q/R0X0vmdH+CpkweMmOy
 0vvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FjAwZgJxyyLaNTWKQSHb81pCA4RTXYwnLvZfpgKOShE=;
 b=SmISExWNpiEe3XirMISe7D1uXWPB3UtrJqpElIBgEi/CVhnCiqEOaetrj4M6+2tvyr
 sLzgydyq2JqZ1eW6nAx36Jawx3IeMx16+InW2JfIcWrCY5yh5Rh9bgHs/oQcxxroeLfQ
 cV75O8olm1kZutHazQ7OPslcQEgviffoLGoGoDryFHJqzJKGuNFrxJlyJ6kFtWpeFbs8
 kt4SOIg8ZislSlREr+WD6TZ2eOh3iuSx7s2K85Bh7vp+M9mwlXnZtHGmdn9SKlExhPuk
 wSo2WS+KMXfR46AeLyjhy1rCtNgeefVaoiDawoXIj4n+UVCHsvnfUm2EL2HFe7+we9Wc
 4BFg==
X-Gm-Message-State: ANhLgQ0o/dohZGcENlxpEFT0JElR2YmmnAZfr2v9840qrN4EnoN2dchh
 +fvmo2hK0g9xB+beHDyWAZDPPG1utZPdq/hfImQ=
X-Google-Smtp-Source: ADFU+vuyKFGuJNjnVRwqIPYgM2PHvDrtBbeiJsIPRFxCbRsExOko7gNbXoAY3bls/cGQvNLcofFbIUV0EAFs49MLirg=
X-Received: by 2002:a9d:7a47:: with SMTP id z7mr15178988otm.341.1584890953537; 
 Sun, 22 Mar 2020 08:29:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA8E6goDHb-7kKCTp=wSpBsuJcfjMmLP0EgymiEL348r4A@mail.gmail.com>
In-Reply-To: <CAFEAcA8E6goDHb-7kKCTp=wSpBsuJcfjMmLP0EgymiEL348r4A@mail.gmail.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Sat, 21 Mar 2020 23:45:12 +0100
Message-ID: <CAL1e-=gKB0qRxGntXrU0im2gjMh1tq_SLGTm+HsmgBRGXQ9+Bg@mail.gmail.com>
Subject: Re: deprecation of in-tree builds
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000004b1e4f05a1732e00"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32e
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004b1e4f05a1732e00
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

9:51 PM Sub, 21.03.2020. Peter Maydell <peter.maydell@linaro.org> =D1=98=D0=
=B5
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>
> AIUI from Paolo, the intention is to deprecate and eventually
> stop supporting "in-tree" builds, so that the only option is
> building in a separate build directory. I thought we should
> probably mention that in the 5.0 changelog, so I wrote up some
> text:
>
> https://wiki.qemu.org/ChangeLog/5.0#Build_Information
>
> Suggestions for changes/comments etc welcome.
>
> (One thing we will need to fix before we can do separate build
> tree is the Coverity Scan build process, which (a) does an
> in-tree build (b) can't be easily switched to a builddir because
> all the source paths get baked into the scan results and moving
> to a builddir changes them all...)
>
> We could also make configure actively warn if used in
> the source tree.
>

I don't intend to complain too much about removing in-tree builds, but
there may be some not-so-visible, but valuable features that right now work
in in-tree builds only, and I think we should make them work in out-of-tree
builds as well.

For example, I noticed that gcov builds have some problems finding
directories if built in out-of-tree, leading to no coverage report output
at all, if applied to some external test executables (for some strange
reasons, "make check" works for out-of-tree anf in-tree builds though). I
think we should fix that and similar problems before removing in-tree
builds.

In general, I also think we should not have overly lax treatment of
features that may be effectively removed with any particular deprecation.
Just because a feature is less-known or less-used is not a sufficient
reason IMHO to drop it just for the sake of "progress".

If the "progress" (in the form of deprecation) is so impotrant, than the
authors should devise it so that there is no dammage to existing features,
and no adverse effects.

In this light, perhaps in-tree builds deorecation is 5.0 is little
premature.

Regards,
Aleksandar

> thanks
> -- PMM
>

--0000000000004b1e4f05a1732e00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"></p>
<p dir=3D"ltr">9:51 PM Sub, 21.03.2020. Peter Maydell &lt;<a href=3D"mailto=
:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; =D1=98=D0=B5 =
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:<br>
&gt;<br>
&gt; AIUI from Paolo, the intention is to deprecate and eventually<br>
&gt; stop supporting &quot;in-tree&quot; builds, so that the only option is=
<br>
&gt; building in a separate build directory. I thought we should<br>
&gt; probably mention that in the 5.0 changelog, so I wrote up some<br>
&gt; text:<br>
&gt;<br>
&gt; <a href=3D"https://wiki.qemu.org/ChangeLog/5.0#Build_Information">http=
s://wiki.qemu.org/ChangeLog/5.0#Build_Information</a><br>
&gt;<br>
&gt; Suggestions for changes/comments etc welcome.<br>
&gt;<br>
&gt; (One thing we will need to fix before we can do separate build<br>
&gt; tree is the Coverity Scan build process, which (a) does an<br>
&gt; in-tree build (b) can&#39;t be easily switched to a builddir because<b=
r>
&gt; all the source paths get baked into the scan results and moving<br>
&gt; to a builddir changes them all...)<br>
&gt;<br>
&gt; We could also make configure actively warn if used in<br>
&gt; the source tree.<br>
&gt;</p>
<p dir=3D"ltr">I don&#39;t intend to complain too much about removing in-tr=
ee builds, but there may be some not-so-visible, but valuable features that=
 right now work in in-tree builds only, and I think we should make them wor=
k in out-of-tree builds as well.</p>
<p dir=3D"ltr">For example, I noticed that gcov builds have some problems f=
inding directories if built in out-of-tree, leading to no coverage report o=
utput at all, if applied to some external test executables (for some strang=
e reasons, &quot;make check&quot; works for out-of-tree anf in-tree builds =
though). I think we should fix that and similar problems before removing in=
-tree builds.</p>
<p dir=3D"ltr">In general, I also think we should not have overly lax treat=
ment of features that may be effectively removed with any particular deprec=
ation. Just because a feature is less-known or less-used is not a sufficien=
t<br>
reason IMHO to drop it just for the sake of &quot;progress&quot;.</p>
<p dir=3D"ltr">If the &quot;progress&quot; (in the form of deprecation) is =
so impotrant, than the authors should devise it so that there is no dammage=
 to existing features, and no adverse effects.</p>
<p dir=3D"ltr">In this light, perhaps in-tree builds deorecation is 5.0 is =
little premature.</p>
<p dir=3D"ltr">Regards,<br>
Aleksandar<br></p>
<p dir=3D"ltr">&gt; thanks<br>
&gt; -- PMM<br>
&gt;<br>
</p>

--0000000000004b1e4f05a1732e00--

