Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1A4650D13
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 15:12:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Gqi-0001Ze-Ve; Mon, 19 Dec 2022 09:10:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <koushik.rupesh07@gmail.com>)
 id 1p7Bjk-0004PX-6F
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 03:43:04 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <koushik.rupesh07@gmail.com>)
 id 1p7Bjh-0007Dp-0D
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 03:43:02 -0500
Received: by mail-ej1-x634.google.com with SMTP id vv4so19792845ejc.2
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 00:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=eP8c8Evbc9vjJiSo5avYhgBSwviOiupLaExmcaMuw7Q=;
 b=OZKx+pTVlahG/qJq2EPWan7l+Tk4gTbBMpSHtQR/yQCkAHlGUgMSuxPDRJOy2aL4QV
 4XhHIHf8iPeneE2DMBv7Fd9BcqtV4Y1GJJ6L5/BYFo7EUGbqO+p4QS9e3dojiAOuRTZX
 fqWLAVK8A4lDUzHnUtEH+yRbAQixed4npRKE8PyjBjBEvdpwDKTVoveTDYsHooOhtxWK
 XFA+3MJhsSZSkeKNgOIkCJI9d/4OqmX2nJxVmt+s68IV/n2Ljlm0n3+6uYK3eRIDswJX
 k9koE8o+g+VtGMBbkh84cHBWPBTfe/f8JhEBG++FK+s96+VpfD5VpoAEboFHcDjuS97a
 I4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eP8c8Evbc9vjJiSo5avYhgBSwviOiupLaExmcaMuw7Q=;
 b=T9oLZepMQ/yWtS05TDzyTfkNUvoAN2LH/iReh1wzOc3X9l+gHndMLxF/SxQiGbKYbL
 z5KmnagVgzl+rNxlv9uK6HUPmYiLz2V7s9xpsJuf5NhFlXtDY0Br2GlA0GDyVchpyGsN
 fOEg7P/yOXfKthL/05xABMEPz1Z6hGzZxMENLvG0ef0RAgRd/EjqIBu1LQImLsxKud7D
 W/hiXwZzIq2C7/x49ldczKf4W6hIt/ck/G0QGjOEK+S86Qg0y812kpR7Nd5sm8jI9X8c
 zZtSnT58GWud+rNF64dD0qUpsObHESBELRTWoI3o+GUJLxBE3n2MtNwkhj62PoY6TzJ9
 PUUQ==
X-Gm-Message-State: ANoB5plxkMSJyBvyHdme4xxUsb9K+KwQ05a3IeQ4oGxBzaHJ75YHgfuo
 H88ZLOJWMbM+H8KP9xSKUW86+blGlyIOpVVdf7qX2BYyDHDdtQ==
X-Google-Smtp-Source: AA0mqf6gEljBBfLeLgMxEBekhNCaOKDWRcrNA4xdXu5eXVrQC7DX26UjayyJneBwsXMwZEKVB4M/Hwhz6nx7dUK4PpM=
X-Received: by 2002:a17:906:4309:b0:78d:36d7:92ae with SMTP id
 j9-20020a170906430900b0078d36d792aemr67697668ejm.113.1671439378580; Mon, 19
 Dec 2022 00:42:58 -0800 (PST)
MIME-Version: 1.0
From: Rupesh Koushik <koushik.rupesh07@gmail.com>
Date: Mon, 19 Dec 2022 14:12:46 +0530
Message-ID: <CAODDWUUYi5bMPNsPomR66bJD6U1cXKLRtj5xwdRJP3+Uu-gp2Q@mail.gmail.com>
Subject: Error is setting up KVM
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000006c88ce05f02a4e41"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=koushik.rupesh07@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 19 Dec 2022 09:10:35 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000006c88ce05f02a4e41
Content-Type: text/plain; charset="UTF-8"

Hi,
I have tried to set up Ubuntu using qemu on MacOS, but while setting up the
x86 virtual machine, (
https://github.com/ssrg-vt/popcorn-kernel/wiki/VM-Setup) I am getting
errors of failing to initialise KVM. The reason was qemu virtual machine
doesn't support KVM as "egrep -c '(vmx|svm)' /proc/cpuinfo" will give an
output of 0.

Is there any way to fix this problem?

Thanks & Regards,
Rupesh

--0000000000006c88ce05f02a4e41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font face=3D"arial, sans-serif"><br></font><div></div><di=
v><span style=3D"font-size:16px;color:rgb(0,0,0)"><font face=3D"arial, sans=
-serif">Hi,</font></span></div><div><font face=3D"arial, sans-serif"><span =
style=3D"font-size:16px;color:rgb(0,0,0)">I have tried to set up Ubuntu usi=
ng qemu on MacOS, but while setting up the x86 virtual machine, (</span><a =
href=3D"https://github.com/ssrg-vt/popcorn-kernel/wiki/VM-Setup">https://gi=
thub.com/ssrg-vt/popcorn-kernel/wiki/VM-Setup</a>)=C2=A0<span style=3D"colo=
r:rgb(0,0,0);font-size:16px">I am getting errors of failing to initialise K=
VM. The reason was qemu virtual machine doesn&#39;t support KVM as &quot;eg=
rep -c &#39;(vmx|svm)&#39; /proc/cpuinfo&quot; will give an output of 0.=C2=
=A0</span></font></div><div><span style=3D"font-size:16px;color:rgb(0,0,0)"=
><font face=3D"arial, sans-serif"><br></font></span></div><div><span style=
=3D"font-size:16px;color:rgb(0,0,0)"><font face=3D"arial, sans-serif">Is th=
ere any way to fix this problem?</font></span></div><div><span style=3D"fon=
t-size:16px;color:rgb(0,0,0)"><font face=3D"arial, sans-serif"><br></font><=
/span></div><div><span style=3D"font-size:16px;color:rgb(0,0,0)"><font face=
=3D"arial, sans-serif">Thanks &amp;=C2=A0Regards,</font></span></div><div><=
span style=3D"font-size:16px;color:rgb(0,0,0)"><font face=3D"arial, sans-se=
rif">Rupesh</font></span></div></div>

--0000000000006c88ce05f02a4e41--

