Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63716159B04
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 22:16:35 +0100 (CET)
Received: from localhost ([::1]:57436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1ctV-0001Ex-VE
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 16:16:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42889)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <programmingkidx@gmail.com>) id 1j1csE-0000hW-H7
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 16:15:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <programmingkidx@gmail.com>) id 1j1csD-0002XF-4d
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 16:15:14 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35167)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <programmingkidx@gmail.com>)
 id 1j1csC-0002Ui-R4
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 16:15:13 -0500
Received: by mail-wr1-x42f.google.com with SMTP id w12so14369650wrt.2
 for <qemu-devel@nongnu.org>; Tue, 11 Feb 2020 13:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=bpKyLA5fimsrg7Uo8eHREnDLX2haNbOqb5ph8sbjv/c=;
 b=YivCCYTvjqcls/f8ItoKjjQdlHXIxLne2ji7dDbJjU92Vuynyv+ef9EvLc4Wh1TVW9
 G61/2ko5lWnsP9BthyAlaWGv+PxR4MmWq+0eh2a0qqCjKE37RSCfCHeNRlxdrdT7toA4
 hJuslUgBbzjd8tWpfJD9FvYAvnLNncSY7LaQII7bvTILPN3b367KoMTsY/E1VcBzNtJy
 49y7r9cFnUNE5VBhoqEJkE96IfduLn9MPCxS9TYv0qNol2GApXVurAgYGD/6E1vDZow0
 bTu8bJe1CoLBx2PVsjubXIXChkIEj1Vm9fuP/JNBqLJVb+z4MtvkBhethBGyeM6qqVxU
 /Inw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=bpKyLA5fimsrg7Uo8eHREnDLX2haNbOqb5ph8sbjv/c=;
 b=OLdXpSLvHk8y7MXzfxw3xoIDGaday71xMir+qXs4/5NURhkEVhdADDKNlr548v8Vfq
 oWknrP0WiqRxZAUcGKBFfjTgqMAsVvQDeQZG8JtP6aftryjgUOL+i9PcfYyywn/ZbwWV
 EKBYGUs2rl/wrqQK2toTqRwQftoDKW0dT0NfKMWHke6jqBg0o1dVu9Bofg3pIgMgYZ3L
 ekdAH7W8wKEADXoLXcotkh2U/+7+9orNonD1mcSGYWxJ5JpH3A8vuP8Ipq8eOMAYJslH
 bDh2qnvt3a0kLnVUFF2IAcXjevr4Tk2FLALBh64U91EZsv0e1tsMhz7pwmmulweM9H0F
 tkDg==
X-Gm-Message-State: APjAAAUb61XfgMmPd7rDcOCeh8eKbtBcoVh1McvKGYi2PmHsN1+c45te
 ADX8yhlITR5fS1UXBaAScrZ5miKEMlHCe88Io+g=
X-Google-Smtp-Source: APXvYqwUtHN3yw9xHrpnBbxtbFlxCVYJ+vawrO2rC+wBDJKbbVtmDw4S0Kj4vg1k1QYwf9im2CdL6XHE4uhL98lo4rM=
X-Received: by 2002:adf:db84:: with SMTP id u4mr10814876wri.317.1581455711354; 
 Tue, 11 Feb 2020 13:15:11 -0800 (PST)
MIME-Version: 1.0
From: G 3 <programmingkidx@gmail.com>
Date: Tue, 11 Feb 2020 16:15:00 -0500
Message-ID: <CAKyx-3O2OdNCYP6S_UpsyNMu_-Cjp46fdtfdd5zMgw-2aTcDrg@mail.gmail.com>
Subject: Re: should we have a new 'tools' manual?
To: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000e7430b059e535931"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42f
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

--000000000000e7430b059e535931
Content-Type: text/plain; charset="UTF-8"

So far we've been converting docs to Sphinx and assigning them
to manuals according to the division originally set out by
Paolo on the wiki: https://wiki.qemu.org/Features/Documentation

 * QEMU User-mode Emulation User's Guide (docs/user)
 * QEMU System Emulation User's Guide (docs/system)
 * QEMU System Emulation Management and Interoperability Guide
(docs/interop)
 * QEMU System Emulation Guest Hardware Specifications (docs/specs)
 * QEMU Developer's Guide (docs/devel, not shipped to end-users)

but some of our documentation has always been a bit of an awkward
fit into this classification:
 * qemu-img
 * qemu-nbd
 * virtfs-proxy-helper
etc. I've tended to put these things into interop/.

The proposal from Dan and David was that we should add a sixth
top-level manual
 * QEMU Tools Guide (docs/tools)

which would be a more coherent place for these to live.

This seems like a good idea to me -- do people agree? What's
our definition of a "tool", or do we just know one when we see it?
What in particular should go in tools/ ?

thanks
-- PMM

I think adding a tool section is a good idea and a more natural fit for
something like qemu-img. I think a tool is a program that is not QEMU but
comes with QEMU.

--000000000000e7430b059e535931
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">
<br><blockquote>
So far we&#39;ve been converting docs to Sphinx and assigning them<br>
to manuals according to the division originally set out by<br>
Paolo on the wiki: <a href=3D"https://wiki.qemu.org/Features/Documentation"=
 rel=3D"noreferrer" target=3D"_blank">https://wiki.qemu.org/Features/Docume=
ntation</a><br><br>
=C2=A0* QEMU User-mode Emulation User&#39;s Guide (docs/user)<br>
=C2=A0* QEMU System Emulation User&#39;s Guide (docs/system)<br>
=C2=A0* QEMU System Emulation Management and Interoperability Guide (docs/i=
nterop)<br>
=C2=A0* QEMU System Emulation Guest Hardware Specifications (docs/specs)<br=
>
=C2=A0* QEMU Developer&#39;s Guide (docs/devel, not shipped to end-users)<b=
r><br>
but some of our documentation has always been a bit of an awkward<br>
fit into this classification:<br>
=C2=A0* qemu-img<br>
=C2=A0* qemu-nbd<br>
=C2=A0* virtfs-proxy-helper<br>
etc. I&#39;ve tended to put these things into interop/.<br><br>
The proposal from Dan and David was that we should add a sixth<br>
top-level manual<br>
=C2=A0* QEMU Tools Guide (docs/tools)<br><br>
which would be a more coherent place for these to live.<br><br>
This seems like a good idea to me -- do people agree? What&#39;s<br>
our definition of a &quot;tool&quot;, or do we just know one when we see it=
?<br>
What in particular should go in tools/ ?<br><br>
thanks<br>
-- PMM<br><br></blockquote>I think adding a tool section is a good idea and=
 a more natural fit for something like qemu-img. I think a tool is a progra=
m that is not QEMU but comes with QEMU. <br>





</div>

--000000000000e7430b059e535931--

