Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 985753923E5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 02:52:07 +0200 (CEST)
Received: from localhost ([::1]:57272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm4Fq-0007oh-7R
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 20:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <face00@gmail.com>) id 1lm4Du-0006Qr-5Y
 for qemu-devel@nongnu.org; Wed, 26 May 2021 20:50:06 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:40834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <face00@gmail.com>) id 1lm4Dr-00075X-2d
 for qemu-devel@nongnu.org; Wed, 26 May 2021 20:50:05 -0400
Received: by mail-lj1-x234.google.com with SMTP id c15so4051413ljr.7
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 17:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=Hztje2Gf6ytFrSiZ1S0KzU6DcXi44taKmw+mHNKLlF8=;
 b=A1dfER92aM3XUK/A6y4e33/QmUSF3g6XuiiSPVi3bQMnPdwZRDrVHq3RnT5eKKbSme
 HYDPadryPscnIiQyJQiOAXZPvVv4VUP4QGkv/WWi/iQrsQ5PrHmcAtRuZEd+tMImwG/d
 vutVAbSXzH3hqRYUhr4mvnop2EStywr47M3iE5U8XCQefSJO1i3NLRVs3sdynCQFj1vY
 eqk3EQByFllyKoThY/EC0Q+W8VNsLt9U8cCFw/J2SiN1Et5KWK2V9SNf8Hr8URUcyz6o
 oLjfGIczGWdBBO7crD++4jsXCnnEMJMX5hM/oa2ktDXDn45MuRBSZgEqbyfVBfmHc9T3
 gaMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=Hztje2Gf6ytFrSiZ1S0KzU6DcXi44taKmw+mHNKLlF8=;
 b=ffi3pxTAm2d1nG0EMiq/S6EgSnSgxzFskN3GY/X006ZwH41awMpMq3io8fqI2bqcrs
 6RJuvxlMbdyse1IN9IsSnI15ETZfsOR9dwXLOaWDzzTCCPqEv73avVt9Vv9wGZ1xPGo7
 lks9esfK8kXKHNzkuOSBNwRc9ZTtq+QYLdIOXU5+jblK87f/XTcF6F29wefsTqDlVJ1m
 pH+XWT/5gqj6oiilXPSwAO6ACcfRHC6fnZz8WyNJAitkSW4kkkJLhfLgvKQ5hyFAvXSG
 DRFDh9vayyPJDD5rK7mbCEJe/NS7BXvLIJGtaVEpjwmQxRu/dRnWWDPPScm7yIUmApk+
 qoAg==
X-Gm-Message-State: AOAM531vUStlcfCRdOpQNMoyMOP2/SwrAUO1aUTd0U4daA9WOImSAoNx
 Mb4rLmgiVKXZCklZlduKTCuvt0SYDrdTPX4+migudsqzc1ULTK7Hkqo=
X-Google-Smtp-Source: ABdhPJwI+GajLcGcwjfh1cvJJ7TwwAD4v1SMIn2VRyQcp9od6ZR/Jy01iAcQLiqSIw7cX1I/hK6YIW/3WOMJipKf96M=
X-Received: by 2002:a2e:a586:: with SMTP id m6mr539539ljp.370.1622076595846;
 Wed, 26 May 2021 17:49:55 -0700 (PDT)
MIME-Version: 1.0
From: Rama McIntosh <face00@gmail.com>
Date: Wed, 26 May 2021 14:49:44 -1000
Message-ID: <CAPVWjyP0ERXO0RQ3ddu4rDQqTEsvawSTdWcDUK4-QA30z7OEsQ@mail.gmail.com>
Subject: Help adding multi vector msi support to hw/xen
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000004b427f05c345232c"
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=face00@gmail.com; helo=mail-lj1-x234.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
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
Reply-To: rama@myutil.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004b427f05c345232c
Content-Type: text/plain; charset="UTF-8"

Aloha qemu-devel,

I'm interested in coding support for multi-vector msi to hw/xen.
Although I have string c skills, I'm learning qemu, xen, and kernel pci in
my spare time to accomplish this.

If anyone can give me some pointers on what exactly needs to be
added/changed to qemu to accomplish this it would be appreciated.

Some more background information:

In 2012, Jiang Yunhong left a comment in hw/xen/xen_pt_config_init.c

           /* Currently no support for multi-vector */

I've been reading the code and it is still not obvious to me the changes I
need to add for multi vector msi support.   Any pointers would be
appreciated.

The pointers I was already given from the qubes-os list:

https://groups.google.com/g/qubes-devel/c/tt76XUtkQS0/m/AbE4dCYsBwAJ

Again, any help would be appreciated to speed up the development.

Thank you,
-Rama


-- 
Rama McIntosh
Senior Developer at Bitfinex
http://www.bitfinex.com
http://myutil.com

--0000000000004b427f05c345232c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Aloha qemu-devel,</div><div><br></div><div>I&#39;m in=
terested in coding support for multi-vector msi to hw/xen.=C2=A0=C2=A0=C2=
=A0 Although I have string c skills, I&#39;m learning qemu, xen, and kernel=
 pci in my spare time to accomplish this.</div><div><br></div><div>If anyon=
e can give me some pointers on what exactly needs to be added/changed to qe=
mu to accomplish this it would be appreciated.</div><div><br></div><div>Som=
e more background information:=C2=A0 <br></div><div><br></div><div>In 2012,=
 Jiang Yunhong left a comment in hw/xen/xen_pt_config_init.c</div><div><br>=
</div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* =
Currently no support for multi-vector */</div><div><br></div><div>I&#39;ve =
been reading the code and it is still not obvious to me the changes I need =
to add for multi vector msi support.=C2=A0=C2=A0 Any pointers would be appr=
eciated.</div><div><br></div><div>The pointers I was already given from the=
 qubes-os list:</div><div><br></div><div><a href=3D"https://groups.google.c=
om/g/qubes-devel/c/tt76XUtkQS0/m/AbE4dCYsBwAJ">https://groups.google.com/g/=
qubes-devel/c/tt76XUtkQS0/m/AbE4dCYsBwAJ</a></div><div><br></div><div>Again=
, any help would be appreciated to speed up the development.<br></div><div>=
<br></div><div>Thank you,</div><div>-Rama<br></div><div><br></div><div><br>=
-- <br></div><div>Rama McIntosh<br></div><div>Senior Developer at Bitfinex<=
/div><div><a href=3D"http://www.bitfinex.com">http://www.bitfinex.com</a><b=
r></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"g=
mail_signature"><a href=3D"http://myutil.com" target=3D"_blank">http://myut=
il.com</a></div></div></div>

--0000000000004b427f05c345232c--

