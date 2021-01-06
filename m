Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5102EBC09
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 11:02:14 +0100 (CET)
Received: from localhost ([::1]:44618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx5ds-0006Td-6y
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 05:02:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1kx5cZ-000618-NA
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 05:00:51 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:33072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1kx5cW-00025a-Kp
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 05:00:51 -0500
Received: by mail-pf1-x430.google.com with SMTP id h186so1442962pfe.0
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 02:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=rxvtuXlj2wcFUZebRB81xWfaS2OSgf8k5J9g1qqiFCI=;
 b=AhOtfqeOab/ST1b4Ta5ylMC06IpWO7yXWzsWtMW6xLSL3JVeRl2iC6ClnxBYUYZWtx
 y34ellfsDahBDekq8HwUoQZDECctZSaWMwwkNdpA0U8v9h4SMHv56vlvaibsRBR8lgUA
 1peTb+4fG62qlhZuZ/jzi7WACFMlFCGx0L/rPX6JWdSuuftXjHlFrbHpK3JDHcVnWNw9
 2yrRFaAkiOdTTAmyvXLGM+yhtPZW98zowmuWnbQ+ykbxUpgzrk3VkqfTbHEBF2ZDe6eW
 r5e53wrs1HfiV/KY9I0Rvamb/LGYitGJsj5OA7FqiC7BPPsVqgNfQghT6zRpEXr06SPS
 qkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=rxvtuXlj2wcFUZebRB81xWfaS2OSgf8k5J9g1qqiFCI=;
 b=s/oIcBTdkIT1ehwhkdUkIUZDIy9ozoVr89eaIC4azSm2KWFtan1zyrY9fe3CqOoXKq
 RkQIk3mPjMCjuPyGdZMMP/ETqqbksrcMUBB916dUF78KwseNP/9V6Eix+Gcs4jr9G7AQ
 eCJAkRzTEhTtfWx3XqW1pfbKDchnnhQaIGFZ7Du4gsqH3UhkOMahXh0ro6uQregLU4+L
 6cXHPo5GCH6L9uUYjRN1sYGWVx767RU4xN9wVnRfqRdE6gAaCHCZdFMrGb+Gd2CSvTAM
 6NUM7jv7UtfBlMG8v806Uan85/IM76YyQmENp71lHbIuUxUjy9fh21fXqMDz45Nzt/Lf
 8N0w==
X-Gm-Message-State: AOAM531SefGXpNMgdmSZ+w0Q6jpTIdkU+9KDlJ43sbkUtl2GngWMyvEp
 6bJdkST5hndvvnfe6HgIdkOlZL7QNshbFs3ds4cYT+SVNDyqKA==
X-Google-Smtp-Source: ABdhPJyHSTo1dIemZtLUOcAbTUQY99xz8uLbCaczKhM4jyHxw10wJnk6dTssXoR5mPqHE3UcYfNoClfjdG3JQu9gUB8=
X-Received: by 2002:aa7:82cc:0:b029:19e:1328:d039 with SMTP id
 f12-20020aa782cc0000b029019e1328d039mr3194109pfn.70.1609927246080; Wed, 06
 Jan 2021 02:00:46 -0800 (PST)
MIME-Version: 1.0
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Date: Wed, 6 Jan 2021 15:30:35 +0530
Message-ID: <CAAQ-SiP8G28ade0jHbhTcv0jtGQb4OSgL5p3mAr0MU_FH8vZ3w@mail.gmail.com>
Subject: VirtioSound device emulation implementation
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000009dedeb05b8386552"
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pf1-x430.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009dedeb05b8386552
Content-Type: text/plain; charset="UTF-8"

Hey everyone!

I want to work on implementing the emulation for the VritioSound device. I
contacted the mentor for the project, (Greg), who said it's fine and that I
should declare it on the mailing list in order to find out if someone else
is already working on this project. That is what this mail is for. I tried
searching for "Virtio", "Sound", and "VirtioSound" in the qemu-devel
mailing archives but couldn't find anything. If someone is already working
on it, please let me know, and if not then I'll start working on it right
away.

Shreyansh

--0000000000009dedeb05b8386552
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hey everyone!<br><br></div><div>I want to work on imp=
lementing the emulation for the VritioSound device. I contacted the mentor =
for the project, (Greg), who said it&#39;s fine and that I should declare i=
t on the mailing list in order to find out if someone else is already worki=
ng on this project.  That is what this mail is for. I tried searching for &=
quot;Virtio&quot;, &quot;Sound&quot;, and &quot;VirtioSound&quot; in the qe=
mu-devel mailing archives but couldn&#39;t find anything. If someone is alr=
eady working on it, please let me know, and if not then I&#39;ll start work=
ing on it right away.<br></div><div><br></div><div>Shreyansh<br></div></div=
>

--0000000000009dedeb05b8386552--

