Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C966B588E31
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 16:04:19 +0200 (CEST)
Received: from localhost ([::1]:47338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJEyw-0006Ym-O5
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 10:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sheindy33@gmail.com>)
 id 1oJ94j-0003Uj-IR
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 03:45:54 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:38630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sheindy33@gmail.com>)
 id 1oJ94h-0002ii-W7
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 03:45:53 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-31f41584236so163196837b3.5
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 00:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=Rkm9nhg6OX6fNTau+4UKQ41fzc5b8P/fOqWikqVEAPA=;
 b=W2uKclCnva2ppVqEWk00pVKz76WuDAbqIET8dQa8umqpyOUcZZtMksOp34CdSZM2tF
 Kddm2MWEbDhzc9dqZh2LGfkRDyVU/4Uy1hhvR2idpWA14QrQwfjBSKbaeOv/oXu8fJm3
 HvnKO7Q4ULYgUcvuXKOJg0YGYG0BqBs7jqyzuOr90wi+dbavbLYs38bq7ErGCHoy72Qw
 Hk/isNZY12AEayEDB1msiqF07WsOLDdFl4V4mfCpwLZGzrxqV/n6upL1x15Q29uikdiA
 E8H2VByFp2QlsuZONeGTShf6jbfneAqeAIjXlDpql4syeMy01r0gS7AIkpWCEj6bFuP1
 yRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=Rkm9nhg6OX6fNTau+4UKQ41fzc5b8P/fOqWikqVEAPA=;
 b=qu4gZrg9TL7PP/fTDidwQHmVIzWJpX+wW25zIJRN8TrQe6eyfNebmTopiB4jR4Tju3
 2G+X1YFtjiP6z+A5X/D4Dnlji94kFAc+rdgEr4XAi1nJC4sHKAsx7g+QDpq0IZb4Cpbq
 gXt+mA6Q2f/lVIKE+3rLpg0mAA1sVykRzCZjtOoLqoRH1710kDJxQ33VpaShoUvWO75s
 9/ksrjqEud4/bpqch/hKVAGTlKNlTm1UcBhIbdji4bI5GuVcrh37FgBAcj/p7KSGulKd
 vpfaelqiAAe+dw70jTZmJ6+CrmCgu30rdE9Mps5eTe5CF7BTD2S5pZPGdEbuqYP4FxmM
 2w3A==
X-Gm-Message-State: ACgBeo33SLJ1hRLp1vf+89v1U3CR7d+rKsBlTDuO7aoL44MREyJ8PFuW
 3AQgCmJr7ndi0VfFH2i9zAqqxoU3IfsJ+ic2XWaU2o5v0ybF6g==
X-Google-Smtp-Source: AA6agR5jVgCzyQhhSB4L6ooGYSx91/zyfllBzBW2jwLftQOPGeC/Tca8FT+ETEJnvNTlUDhCQhjrnWzYdlPGCsB/rnc=
X-Received: by 2002:a81:178c:0:b0:322:9f88:7da1 with SMTP id
 134-20020a81178c000000b003229f887da1mr21556813ywx.362.1659512750642; Wed, 03
 Aug 2022 00:45:50 -0700 (PDT)
MIME-Version: 1.0
From: Sheindy Frenkel <sheindy33@gmail.com>
Date: Wed, 3 Aug 2022 10:45:34 +0300
Message-ID: <CADg8gwx_=ChtumRmyLnBGsHKEar--RaEtriT0CzXAANZ0UqnZQ@mail.gmail.com>
Subject: qtest/libqos: Finding the free PCI slots in a qtest instance
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000000097e805e5516c9b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=sheindy33@gmail.com; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 03 Aug 2022 09:41:51 -0400
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

--0000000000000097e805e5516c9b
Content-Type: text/plain; charset="UTF-8"

Hi,
I'm trying to find out how I can get the free PCI slots in a qtest code.
I want to assign a PCI device to a qtest-mode VM. If I assign this device
to an unavailable address in the qemu process, I get this assertion: *PCI: slot
x function y not available for z.*
However, I couldn't find a function in the qtest API that maintains the
free slots list, it seems this error is coming from the qemu process, and
qtest can't control it.

Could qtest API expose a function to access the free PCI slots in the
guest? is there any existing function that can help maintain this list?

Thanks,
Sheindy

--0000000000000097e805e5516c9b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"rtl"><div class=3D"gmail_default" style=3D"font-family:arial,sa=
ns-serif" dir=3D"ltr"><table width=3D"100%" style=3D"color:rgb(0,0,0);font-=
family:&quot;Times New Roman&quot;;font-size:medium"><tbody><tr><td><div cl=
ass=3D"elementToProof" style=3D"font-family:Calibri,Arial,Helvetica,sans-se=
rif;font-size:11pt">Hi,</div><div class=3D"elementToProof" style=3D"font-fa=
mily:Calibri,Arial,Helvetica,sans-serif;font-size:11pt">I&#39;m trying to f=
ind out how I can get the free PCI slots in a qtest code.<br></div><div cla=
ss=3D"elementToProof" style=3D"font-family:Calibri,Arial,Helvetica,sans-ser=
if;font-size:11pt"><span style=3D"font-size:14.6667px">I want to assign a P=
CI device to a qtest-mode VM.=C2=A0</span><span style=3D"font-size:11pt">If=
 I assign this device to an unavailable address in the qemu process, I get =
this assertion:=C2=A0</span><i style=3D"font-size:11pt;font-variant-ligatur=
es:inherit;font-variant-caps:inherit;font-weight:inherit">PCI:=C2=A0slot x =
function y not available for z.</i><br></div><div class=3D"elementToProof" =
style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:11pt">How=
ever, I couldn&#39;t find a function in the qtest API that=C2=A0maintains t=
he free slots list,=C2=A0it seems this error is coming from the qemu proces=
s, and qtest can&#39;t control it.</div><div class=3D"elementToProof" style=
=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:11pt"><br></di=
v><div class=3D"elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif;font-size:11pt">Could qtest API expose a=C2=A0function to acce=
ss the free PCI slots in the guest? is there any existing function that can=
 help maintain this list?</div><div class=3D"elementToProof" style=3D"font-=
family:Calibri,Arial,Helvetica,sans-serif;font-size:11pt"><br></div><div cl=
ass=3D"elementToProof" style=3D"font-family:Calibri,Arial,Helvetica,sans-se=
rif;font-size:11pt">Thanks,</div><div class=3D"elementToProof" style=3D"fon=
t-family:Calibri,Arial,Helvetica,sans-serif;font-size:11pt">Sheindy</div></=
td></tr></tbody></table></div></div>

--0000000000000097e805e5516c9b--

