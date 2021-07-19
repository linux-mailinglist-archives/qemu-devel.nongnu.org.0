Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC933CEF00
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 00:20:36 +0200 (CEST)
Received: from localhost ([::1]:36152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5bcp-0004iw-5q
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 18:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1m5bbS-000433-L6
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 18:19:10 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:41880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1m5bbQ-0003un-W3
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 18:19:10 -0400
Received: by mail-oi1-x233.google.com with SMTP id t143so22437562oie.8
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 15:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=SZLfdO48UV3Cv3KvezCUfONOFVOr+gSoOraNW4xAHyo=;
 b=cmrw4mQcfHL52yF3C+97h3uGe4mqU/rF+L5zqxBYgWLi3DLeWsvwOWjfxKdHroQa8z
 /TMKD2fkTvKl/bR9qXtrCsbcJlVR7ULIuagC8QxSDvsv0JIyyjnJzh4KsTrKfmH3uQf9
 aJpNNIIZXyq0QDB/OvcNEwAm1yugSuF6WNCRN3uqWoaTq2jgsyK2Dolxi4WpdYwxA7gM
 HJw7w/E8/0QspjvXEXZANMvw/uHR7G55zDsQvrmNEOyvp9RpbYXkPLBxS4lyfwgvO5tz
 7AQzKj7UAEptAo0+87g2fymJ3hIYvWiDWH3oonayeW9TS34sPno4Tdl1JatfCUWoo5K/
 vNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=SZLfdO48UV3Cv3KvezCUfONOFVOr+gSoOraNW4xAHyo=;
 b=IU1KlFXUO6TVjwd24R1dxzNgHlV42OV8PPKPsOIy8wu+owJ6+Wq41KyyRhUqZ2Qeib
 o9JOSrFD7fe12dIrndChzBwZ5/ib2Dijd9we1LEhBHiu+vFKGIER8LvNpP8jeAGFeFB1
 EVY8bqUzlsW5TJvf+2jpgV/wf5PEoZe7xTHsF9IHw29K+yj9AdNlkiabaqKNrK+Ax4EN
 7fhR3M1ll+F0JX1ASb78qvb8DulGPxrUMKKWg8uRLJDhX/zrjcAZ42tg5xqwY2sCqp9j
 d0F9W4ih83f7DZa6HqqqzuZwMHu34szV8HXQvApvGIa64vopwnSJAxv4+VKoAVvcVePc
 1aoA==
X-Gm-Message-State: AOAM5326Qaakt5znZMDiX5bvsq9+PBLek/krNAfYrvdwxxta583Ogp31
 gVb5SWSlgHWU0WZPQNP2EjmF47Yi78UB9kWEBvvyczgzifw=
X-Google-Smtp-Source: ABdhPJxyZXielNPHsTsXKGUIW9NHtlHyQDYZbfuBjOQj4SLrwRQgxXTTqjniWv29BT42RgBhEzTU1gPeQ1RRsaXhsgU=
X-Received: by 2002:aca:d805:: with SMTP id p5mr19113069oig.60.1626733146966; 
 Mon, 19 Jul 2021 15:19:06 -0700 (PDT)
MIME-Version: 1.0
From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Mon, 19 Jul 2021 18:18:53 -0400
Message-ID: <CAK7rcp8VU3DM3CTmM3upO9NxUBum3MLA3pLNk+yiNMuMqwKMDA@mail.gmail.com>
Subject: Error in accel/tcg?
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000005e905b05c781534a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=kennethadammiller@gmail.com; helo=mail-oi1-x233.google.com
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

--0000000000005e905b05c781534a
Content-Type: text/plain; charset="UTF-8"

Hello,

I get the following error:

<long cmd here> -c ../accel/tcg/cputlb.c
../qemu/accel/tcg/cputlb.c: In function 'tlb_flush_page_by_mmuidx':
../qemu/accel/tcg/cputlb.c:602:23: error: comparison is always true due to
limited range of data type [-Werror=type-limits]
    } else if (idxmap < TARGET_PAGE_SIZE) {

I don't know why that suddenly shows up. The variable idxmap is a uint16_t
and I haven't changed that at all. Also, the TARGET_PAGE_SIZE is indicated
set by cscope/global tags in a specific header, and there's no reason to
believe that the value it takes happens to be larger than a uint16_t, so I
suppose that the static tags are lacking where the compiler evaluation
would indicate correctly.

In other parts of the code, I think somehow the meson build system is
triggering errors for warnings, so things like uninitialized variables that
have their address passed so that a called function can edit them are
making. But I didn't specifically turn on any of these warnings to error
settings. So my other thought is, perhaps because a version of gcc has some
implicit initialization for variables declared without initialization. I
checked that and resolved those. But I've been stumped for a while on the
idxmap problem.

--0000000000005e905b05c781534a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br>I get the following error:<br><br>&lt;long c=
md here&gt; -c ../accel/tcg/cputlb.c<div>../qemu/accel/tcg/cputlb.c: In fun=
ction &#39;tlb_flush_page_by_mmuidx&#39;:<br>../qemu/accel/tcg/cputlb.c:602=
:23: error: comparison is always true due to limited range of data type [-W=
error=3Dtype-limits]</div><div>=C2=A0 =C2=A0 } else if (idxmap &lt; TARGET_=
PAGE_SIZE) {<br><br>I don&#39;t know why that suddenly shows up. The variab=
le idxmap is a uint16_t and I haven&#39;t changed that at all. Also, the TA=
RGET_PAGE_SIZE is indicated set by cscope/global tags in a specific header,=
 and there&#39;s no reason to believe that the value it takes happens to be=
 larger than a uint16_t, so I suppose that the static tags are lacking wher=
e the compiler evaluation would indicate correctly.=C2=A0<br><br>In other p=
arts of the code, I think somehow the meson build system is triggering erro=
rs for warnings, so things like uninitialized variables that have their add=
ress passed so that a called function can edit them are making. But I didn&=
#39;t specifically turn on any of these warnings to error settings. So my o=
ther thought is, perhaps because a version of gcc has some implicit initial=
ization for variables declared without initialization. I checked that and r=
esolved those. But I&#39;ve been stumped for a while on the idxmap problem.=
</div></div>

--0000000000005e905b05c781534a--

