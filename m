Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1C7551504
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 11:57:56 +0200 (CEST)
Received: from localhost ([::1]:48984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3EAM-0006bj-Sb
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 05:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o3DxF-0000lA-JJ
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 05:44:21 -0400
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:43703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o3DxC-0001kn-Uw
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 05:44:21 -0400
Received: by mail-lj1-x22a.google.com with SMTP id d19so11247407lji.10
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 02:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=rs0c9i3UImGAAd7rmyC+XeiBTpLbZDaop4zJfheZvmw=;
 b=jM4nU10gX+WrgPK9jxpuo+MVVIIw/z2uKNiSMyfkT9cF9BdKV8dpnLkMG6KL8Yjb5/
 TNo0cErjAk74L+JPKQm7p7OyrTD1uwrs6f2sCJDuqFL8qqBPO1Wi5mrYoeewfbQIYsKI
 T9hx0W/ZVYqYje/vq9RWSreWNuQ9pQ1/fhCmB5WUevzJIltUO/wWHS1YBhe6ZC4MaPr5
 nS/RzXMJO9pXUNke0EjIcCR1ua/RCS1Ws000OAcrSR/EpAYL1V3+wAeJvoVX1KZv/NIS
 QL9c9cNu8ebibTWY17KY97KjbHvqpS7Jxpg26XhtuXenjWVaG5OgLZ/ux0HHSkbZ9nsI
 ZTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=rs0c9i3UImGAAd7rmyC+XeiBTpLbZDaop4zJfheZvmw=;
 b=MsKI9tVMObho1LRXCIGqoXU/DZs63F2QkV3V7uFQmcAX4p7+SaR8IuNsiSduK9hWpG
 lvg6js9YE3POraREMQAREURAj9nESVKysROVM390GC7CCps4DXu0fMPrReFTY7VsF/M0
 lka91+WR2Jhj8Utm9XOm6Q/quO5d2RvMY1RDmA/1x7vGofizdTQZkYcqxcy+i/rKlrMP
 RL5+G42cVtF07TlRdJjhO+e0Wk7MMvwWBieNo6AOWCi41UnSKlZmMOtTdNw+54G+/8yC
 7HytGK1QH8Iwou8743qhUp+SA9r1zrDBeN3NByiozE9bS7FC34Y5zepRsed8ulK+Zxd9
 0s7w==
X-Gm-Message-State: AJIora92qjVl3mM8/5TfQMaqe6cvBZOrcT6FJNfCZvbgTjVoRUXER6Hs
 eFh0x2pAwLzIRvoFHzKOkPUqieI8//C6iNPNoyk=
X-Google-Smtp-Source: AGRyM1thzrY8nRmOLId0cSW4/wId9ZmASozB9+XkGCifmKPOwyyKthycW0SDfqMJJrvGwuJ578w87GdhFqPSQeaIIrk=
X-Received: by 2002:a2e:a374:0:b0:25a:666c:d02e with SMTP id
 i20-20020a2ea374000000b0025a666cd02emr4310319ljn.67.1655718256820; Mon, 20
 Jun 2022 02:44:16 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 20 Jun 2022 13:44:05 +0400
Message-ID: <CAJ+F1C+8y2yNjf4GHirtHSxGASPHy9n7u++39WDhcgDn2p_M8Q@mail.gmail.com>
Subject: qemu-ga guest-exec & SELinux
To: selinux@lists.fedoraproject.org
Cc: rmetrich@redhat.com, QEMU <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000008bc91705e1ddf274"
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000008bc91705e1ddf274
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

https://bugzilla.redhat.com/show_bug.cgi?id=3D2093355 ("AVCs when trying to
execute a command through qemu-ga ("guest-exec" command)") describes an
issue with fedora/rhel SELinux rules, where some program executions are
denied.

qemu-ga has "virt_qemu_ga_t" context, and is not allowed to execute
binaries that are not "bin_t", iiuc. The suggestion from Renaud M=C3=A9tric=
h is
for qemu-ga exec command to launch the user program through an helper
program that would have the virt_qemu_ga_unconfined_exec_t context, and
appropriate rules in selinux (similar to fsfreeze-hook rules), so any
program can be executed. qemu-ga would thus ship and use that helper, in
all OS, to avoid varying code paths.

Does that sound reasonable or should we try to find a solution with SELinux
rules instead?

thanks

--=20
Marc-Andr=C3=A9 Lureau

--0000000000008bc91705e1ddf274
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi!</div><div><br></div><div><a href=3D"https://bugzi=
lla.redhat.com/show_bug.cgi?id=3D2093355" target=3D"_blank">https://bugzill=
a.redhat.com/show_bug.cgi?id=3D2093355</a> (&quot;<span id=3D"m_30645456975=
57310552gmail-summary_container"><span id=3D"m_3064545697557310552gmail-sho=
rt_desc_nonedit_display">AVCs when trying to execute a command through qemu=
-ga (&quot;guest-exec&quot; command)</span>&quot;) describes an issue with =
fedora/rhel SELinux rules, where some program executions are denied.<br></s=
pan></div><div><br></div><div>qemu-ga has &quot;virt_qemu_ga_t&quot; contex=
t, and is not allowed to execute binaries that are not &quot;bin_t&quot;, i=
iuc. The suggestion from Renaud M=C3=A9trich is for qemu-ga exec command to=
 launch the user program through an helper program that would have the virt=
_qemu_ga_unconfined_exec_t context, and appropriate rules in selinux (simil=
ar to fsfreeze-hook rules), so any program can be executed. qemu-ga would t=
hus ship and use that helper, in all OS, to avoid varying code paths.<br></=
div><div><br></div><div>Does that sound reasonable or should we try to find=
 a solution with SELinux rules instead?<br></div><div><br></div><div>thanks=
</div><div><br></div><div>-- <br><div dir=3D"ltr" data-smartmail=3D"gmail_s=
ignature">Marc-Andr=C3=A9 Lureau<br></div></div></div>

--0000000000008bc91705e1ddf274--

