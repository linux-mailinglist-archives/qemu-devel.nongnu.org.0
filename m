Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 277324B694E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 11:30:20 +0100 (CET)
Received: from localhost ([::1]:34944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJv6B-0006WE-0U
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 05:30:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vysakhpillai@gmail.com>)
 id 1nJuzx-0000iC-QC
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 05:23:53 -0500
Received: from [2607:f8b0:4864:20::831] (port=34815
 helo=mail-qt1-x831.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vysakhpillai@gmail.com>)
 id 1nJuzv-0008Ej-Kk
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 05:23:53 -0500
Received: by mail-qt1-x831.google.com with SMTP id r9so6907900qta.1
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 02:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=pq66D9WB2qTHxfm4fksD+6n7eVfCeMWuspZTSmfRbls=;
 b=pmzZfuzTiqGH2nIwyxyPozFeP/M2GKPHBstYrYPCswZwVajNUTZmfhCMF5t48SlIRM
 F380YvwdIGaMsuUlGc7oXoN/SSIdr/ww4w/tWfEBS0ssu7RR4VCnD5i30xnmSSKhlD9f
 lGo4i3K/HlUoG4NfnLG5yERzujyqgdxP9FU8qgTL7cu9p34t4UKhlP96t6yBBbTgNupq
 EzJcfVrkCSLB1qfAoErPBRVdFiYYQYirtVkuxgDhKqEtaxnN1QI+CwYHQlD/DafeMnAJ
 FX79lTAE5v/gSs5VNmuq8tdClLo2vBJblAG7mbrouaJiPabC5t9Uv4fK9Zx829xfHfLR
 9QYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=pq66D9WB2qTHxfm4fksD+6n7eVfCeMWuspZTSmfRbls=;
 b=1716bqXMVNtgYBvzReCdQ98df7u2FiN4N8A4Rh4yrUvvjQZfuFyHczuvZzb2tXKXjw
 x2HMJWMmVcEjZZW92FbKsPnxEiHnekpMsK9JxLqeFXaMBJt00LYfImvTYI8iKWCvaJiA
 UmL8euzlPA4R5WVfiSXS/Pui52tJmkJyXPGHDeYeejKXS/VhBAaIsD181pGCgXVVS3GZ
 58VqUCABeQnylnlsc0QI3a59w1wSxE7i256aIKANT0zRMUgGgY1AYoaaddpN7k17mQjs
 qZyhnusvyycBFIrr1dpCwX6WHLpJ+l3DLUvYwaQMWvVVqvexP4bsPoVnKeey4o5+gKoN
 uGqw==
X-Gm-Message-State: AOAM533ShfAiL4RGoQjIGYENDYlgIj1sZcO7ktK5MonVfZPlG6P8JzM+
 sxajnV02d6WrfTwKD3pxgg7KeMnB1ZBrhK4VdrnUOW09/Ig=
X-Google-Smtp-Source: ABdhPJy+o9YWXm9d8FdRSeGEDdGpGg4xv24GFcaAmZaJWwLr+b5aQ8Fd8CK9oF+bGo35Sxt5AxH/deXBDNhbw4/GS38=
X-Received: by 2002:a05:622a:1189:: with SMTP id
 m9mr2078332qtk.573.1644920630233; 
 Tue, 15 Feb 2022 02:23:50 -0800 (PST)
MIME-Version: 1.0
From: vysakh pillai <vysakhpillai@gmail.com>
Date: Tue, 15 Feb 2022 15:53:39 +0530
Message-ID: <CAAFEQFF9tjKEt1fL5=kiVpRxXX=Ti9HKW-YE1rnFXx0dPB9VQA@mail.gmail.com>
Subject: Holding RISCV CPUs in reset
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000d94da205d80beda2"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::831
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=vysakhpillai@gmail.com; helo=mail-qt1-x831.google.com
X-Spam_score_int: 35
X-Spam_score: 3.5
X-Spam_bar: +++
X-Spam_report: (3.5 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.904, PDS_OTHER_BAD_TLD=1.999,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

--000000000000d94da205d80beda2
Content-Type: text/plain; charset="UTF-8"

Hi,
 In an SMP system like the sifive_u machine which has a RISCV  e_cpu as
hart0 and a set of u_cpus as hart 1-N, is there a way to start just the
hart0 and hold the other CPUs in reset until explicitly released by hart0
SW?

 I am working on a machine similar to the sifive_u machine that has a set
of control registers which are accessible by hart0 to release the
other cores from reset once the SoC level initialization is completed by
the hart0 SW. Currently, the CPUs spin if they have a non-zero mhartid,
executing code from resetvec.

Vysakh P Pillai
http://embeddedinn.xyz

--000000000000d94da205d80beda2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>=C2=A0In an SMP system like the sifive_u machine w=
hich has a RISCV=C2=A0 e_cpu as hart0 and a set of u_cpus as hart 1-N, is t=
here a way to start just the hart0 and hold the other CPUs in reset until e=
xplicitly released by hart0 SW?</div><div><br></div><div>=C2=A0I am working=
 on a machine similar to the sifive_u machine that has a set of control reg=
isters which are accessible by hart0 to release the other=C2=A0cores from r=
eset once the SoC level initialization is completed by the hart0 SW. Curren=
tly, the CPUs spin if they have a non-zero mhartid, executing code from res=
etvec.</div><div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div><div dir=3D"ltr">Vysakh P Pillai<div><a href=3D"http://embedd=
edinn.xyz" target=3D"_blank">http://embeddedinn.xyz</a><br></div></div></di=
v></div></div></div></div></div></div></div>

--000000000000d94da205d80beda2--

