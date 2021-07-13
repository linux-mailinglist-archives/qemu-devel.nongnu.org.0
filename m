Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5447D3C755C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:56:36 +0200 (CEST)
Received: from localhost ([::1]:38450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Lhz-0002RF-1m
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1m3LgL-0000ba-9D
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:54:53 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:38448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1m3LgJ-0005Tl-Kk
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:54:53 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 42-20020a9d012d0000b02904b98d90c82cso1190065otu.5
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 09:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=uDNd4LT7wAgE6MDv9W5fCXbt8L4bS8bpDdztcF77H1E=;
 b=ULyrBmCLnq1W4LrhK+L5ekPhmor4KJus3Px5IkjCJa1JLFfsKXj3OAaRf+36ndUyPX
 srCBBMmWFOY3dsOB4XLp97d9ffoJ31BeaVT/5Wn1hVR6XRRfFYcOYyWwXk/z6LXm/mbG
 NcWa0wxmCKEHFx+J+uu6QILNAR/Iffh/lMLAzZjtKaA1PhFmHG5unWtr0PVCUYV/5LEb
 JtRUyV0YCEGbcu8bn24GKe5OM+cRg/+CHBPaK3l0ykR+jzDMFaEeZ6arNnqVfaLolb7w
 KJm0fY05AByNk3MEQhOrQ7T2UCj8jsFDAgUQePKkfrbdx1uzWDX91aOUSSibuL2Wn4c8
 RyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=uDNd4LT7wAgE6MDv9W5fCXbt8L4bS8bpDdztcF77H1E=;
 b=dwdpUBWgvaKt8s+BR4/usZP6Q/86JeUsVOAotWBAEyxptcvfs1nNonFstQGK/AxgRc
 dG19U7cxPs+DTBxLg3jS+dYhdXx537xitUBRf2DwJC6l6VccnT6ySLKqD1DoodKv4UYp
 HQPUgb7gQIi5iwjNiT97S1suL7sAClp/aRBBJV821UdHF132P7MN0HCGHMK1kQV+ZrZ1
 L9xdP8CnSbe07InW1ZVsfBRxQCsWDuoFRIYM3wuIA3Me/yx3Ak63kYvCMdR4NcKtwLWg
 H2LV4ZBPi3PFsTZhH7Hp8lj6gL3gImay64aKtpDsqx/DX5B4cyVSGVCBlPWI40nH0mBq
 Oz0w==
X-Gm-Message-State: AOAM533c3lpuq/wE69HEEkCY21pX1VKgjMCs8440J58VA6OO+xltqWC9
 aqZ9cMoeoaQZhEPmaGzu3r9GUTE+MthFiGmdlG+16LIQ4b0=
X-Google-Smtp-Source: ABdhPJzSzhmjwajuCHexEKqPjQyENKglUguq8ZmEUSPJ14T6XTpKmIIdD0NPchYUP7osa9CTIHIKbFod8Z36XWo7Ytk=
X-Received: by 2002:a05:6830:1bd8:: with SMTP id
 v24mr4383845ota.343.1626195289640; 
 Tue, 13 Jul 2021 09:54:49 -0700 (PDT)
MIME-Version: 1.0
From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Tue, 13 Jul 2021 11:54:38 -0500
Message-ID: <CAK7rcp_iXnmVTitXZ5d7SRCRTo5QtvQByDOEro8=dnQ_J1=K0g@mail.gmail.com>
Subject: meson difficulties?
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000093136705c70418dd"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=kennethadammiller@gmail.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--00000000000093136705c70418dd
Content-Type: text/plain; charset="UTF-8"

Hello,

I was wondering if the meson build system is symbolic when initializing
variables? For example, I have:

var1=ss.source_set()
var2=ss.source_set()

And in the body of the rest of meson.build there are mutually exclusive
additions to var1 and var2. When I go to configure and build, I configure
for one but not the other. I then call build, but variables for var1 get
built for the make target of var2. I don't understand; perhaps the system
targets that correspond to softmmu subsume the user source set implicitly?
Or perhaps the meson build system is symbolic, and what is added to var1
implicitly gets added to var2?

--00000000000093136705c70418dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I was wondering if the meson bui=
ld system is symbolic when initializing variables? For example, I have:<br>=
<br>var1=3Dss.source_set()</div><div>var2=3Dss.source_set()</div><div><br><=
/div><div>And in the body of the rest of meson.build there are mutually exc=
lusive additions to var1 and var2. When I go to configure and build, I conf=
igure for one but not the other. I then call build, but variables for var1 =
get built for the make target of var2. I don&#39;t understand; perhaps the =
system targets that correspond to softmmu subsume the user source set impli=
citly? Or perhaps the meson build system is symbolic, and what is added to =
var1 implicitly gets added to var2?</div></div>

--00000000000093136705c70418dd--

