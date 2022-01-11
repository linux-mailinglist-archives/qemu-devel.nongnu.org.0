Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 043E048B090
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 16:14:32 +0100 (CET)
Received: from localhost ([::1]:33724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Ir1-0000HS-1m
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 10:14:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khaled.muhammed97@gmail.com>)
 id 1n7I6z-0005i9-VN
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 09:26:58 -0500
Received: from [2a00:1450:4864:20::134] (port=37571
 helo=mail-lf1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <khaled.muhammed97@gmail.com>)
 id 1n7I6y-0004yF-IJ
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 09:26:57 -0500
Received: by mail-lf1-x134.google.com with SMTP id m1so23730767lfq.4
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 06:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=ucxjWTs0BlJ3V6uK4iEbUnkCzhkfzdsGexpSZ/reNFI=;
 b=oHPHkeMg6bW2KUanJSFQQZyPDPuCXSN+z2w97RgGGHDR/IyUaMmjNDZN/K37HLNuBp
 h3XIkot6fWq/z56fzhpHtotmY7FX0xakU+dyBinkweMEVdxs3hkDd5nw/arbnCT4sPE9
 p4PX0sj+TzLRWXBHB5p4DcATc6c1P6bRM8BnowZ1NEA8Lwpa96uezxJYs2uy3wxrMrey
 iZhnYCc2+8VfZxEA/zuWRmUhaOJBjfNTsiAzYDc+08FJS/eBNyK0Heqcb3X+tqrIqEpF
 pUN4UXGGQZGGF0R08O8mDI73PA4D4tw4hLfElv6mpZjNYu2T6Ru1Tu/0AQfdMA/mebhk
 sLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ucxjWTs0BlJ3V6uK4iEbUnkCzhkfzdsGexpSZ/reNFI=;
 b=u9UUM7FZzAgaGCYMPoI9KSPGJXAos7hcAxR6t4mnsWA42Pe+Lp6YHwJyrlxmFE1QYt
 93Qem+3ZQJsnmmWIeSjR+w9WiYXfz2OR3aSw+OURgjGJG+x8ct893yiQ+9wvyZA+TkuV
 yHXqeUXYwscgBvrcWnXiVLKAx+1n4Mv9gX/HSAhe3qlUWt3txYGLVaw2cihrV1GSLQl2
 9rBB2VF4mPa+VhgoRuEdpt51IRGMMTkMT6HviyIYYXFi+xATVoQuzAr2ztvZBPxwe5EG
 OsB752vtoGxJGfq6XLbU2gWjghyHK0uMianaoo8yK2aL+P59zwlqqKrAj26GHwSTyYJa
 BTgw==
X-Gm-Message-State: AOAM532v62+IvEBAQrueivjOhx1PytdB5Vzuo88Ga+0ZOQtMT9YWweXb
 8z/blcKfn5sy4wxNwdTu0fAazm5jfKWl3g2/iLXJQZXYxww=
X-Google-Smtp-Source: ABdhPJwP9C7QLSv1A51h+OjSOROGmQPoRUgOuBV6l/ZJ9eSOHEWSQBboQUhVi9LYwvmHKUxTb844OBtl0uu9VI24hE8=
X-Received: by 2002:a2e:b057:: with SMTP id d23mr3173821ljl.146.1641911212568; 
 Tue, 11 Jan 2022 06:26:52 -0800 (PST)
MIME-Version: 1.0
From: Khaled Mohammed <khaled.muhammed97@gmail.com>
Date: Tue, 11 Jan 2022 16:26:41 +0200
Message-ID: <CAPEREde2tzUp=NdOH25MRCMk2FhHO0tofg+e36HdvNzJf55nFA@mail.gmail.com>
Subject: qemu-efi-aarch64 package
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000093f4bb05d54f3ec3"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::134
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=khaled.muhammed97@gmail.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: 16
X-Spam_score: 1.6
X-Spam_bar: +
X-Spam_report: (1.6 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 11 Jan 2022 10:11:06 -0500
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

--00000000000093f4bb05d54f3ec3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dears,

Hope this mail finds you well, Currently I=E2=80=99m trying to install the
=E2=80=9Cqemu-efi-aarch64=E2=80=9D package for centos 7 but it is not avail=
able. Is there
any alternative or something I can do to make it work ?



Thanks in advance,

Khaled.

--00000000000093f4bb05d54f3ec3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;=
font-family:Calibri,sans-serif">Dears,<br>
<br>
</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">Hope this mail finds you well, Currently I=E2=80=99m trying =
to
install the =E2=80=9Cqemu-efi-aarch64=E2=80=9D package for centos 7 but it =
is not available. Is there any alternative or something I can do to make it=
 work ?</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">Thanks in advance,</p>

<p class=3D"MsoNormal" style=3D"margin:0in;font-size:11pt;font-family:Calib=
ri,sans-serif">Khaled.</p></div>

--00000000000093f4bb05d54f3ec3--

