Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF68631AAA9
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 10:37:50 +0100 (CET)
Received: from localhost ([::1]:36566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lArN7-0004Gf-F2
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 04:37:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kdsanskar07@gmail.com>)
 id 1lArLS-0003dk-Kq
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 04:36:06 -0500
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:34517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kdsanskar07@gmail.com>)
 id 1lArLP-0006ai-0p
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 04:36:06 -0500
Received: by mail-io1-xd33.google.com with SMTP id e24so1781519ioc.1
 for <qemu-devel@nongnu.org>; Sat, 13 Feb 2021 01:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=CSU3oxhnTIYBScUjWqCT8Q6HmrNIhvpFzSHSvH3LHG4=;
 b=m6oReRY2kyyvXOawaowGEuyu5SNoq+v/MOJGSgrZOaZ+R/0YOeiXycYTtgICOYxKro
 Z9Od/ynmJWjXFZbnkVU3Ks4B3AHL3OUBP7yZrpCiVuJ2AnBJc2zKuflM86aCkuTVM/Hn
 7ZWY1fn4ZlHmSn5pq8zWls2EyTJx1hWYavdPW9gzTOgCnLBh02sTS8Q6QUkgdDeEXo0B
 3Aa4rR9GpG650Rhw/e/prY3Kx7EunLUk848hbTTN0+PY6KfUN4G6voKR9IWvk9Et0BA5
 rbn2gUl5WciijzV/DIEBXPiUduN1/kZUDu8kLCpcVuksLLhfKyjQqx6fDPRB++oDnPYX
 mA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=CSU3oxhnTIYBScUjWqCT8Q6HmrNIhvpFzSHSvH3LHG4=;
 b=q/jseCsbQG73NVf695UzOVS8eskM8QnapIs173ZFwE570AF9YdGB0yez72IyJOIAzH
 s75huXsTADkI9mL2VN0kcaXTfwsUpKiKgF2gt/6E0Ng+tZuWQ24cSdx1tH2Y5+nnDysV
 OvAS4V7E/oqfm0RIol7SNd7K9NiCJPXxh90870qsule0TURC69TutKh7BMVWZD4LntIq
 NpY5wnXglFXgUuQ1qmpPw+fUnYXY0ZMyGVCh+mpY8IaXV7NrMk6o58KLbuiRZBVoMxNR
 NtDVFrWIfAkkZ4oQme/OgQ0qRoKxE8wQJGeou1arN9S1L1oREtBGojtG+BdqOsks+1r9
 f9Tg==
X-Gm-Message-State: AOAM533Wcv/9m61Pu5f/iWwNnwFO7MwCRaIbV71WXQsWQ+4Yr1kubV2P
 /ixSCJQ8AGUQFGNaAioZ6Cq5fPz1OuiIV8OYIA8r/B9ovCynyQ==
X-Google-Smtp-Source: ABdhPJwVIaRg2rI0Z0XShBW5lOVdP0GK+QcIaZ6slJpzXfIXCUg7maLRrO/IwrifdffDD6oofDtk86yH93UbNzD8jyY=
X-Received: by 2002:a5d:968e:: with SMTP id m14mr5439415ion.26.1613208961008; 
 Sat, 13 Feb 2021 01:36:01 -0800 (PST)
MIME-Version: 1.0
From: Sanskar Khandelwal <kdsanskar07@gmail.com>
Date: Sat, 13 Feb 2021 15:05:42 +0530
Message-ID: <CACAZ_09KS6Z_8-fKAwGPaLwyfNVgA_aKoPNYwMcv2K_kAdO0oQ@mail.gmail.com>
Subject: hifive-unleashed board
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000011c58d05bb347b96"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=kdsanskar07@gmail.com; helo=mail-io1-xd33.google.com
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

--00000000000011c58d05bb347b96
Content-Type: text/plain; charset="UTF-8"

Hii there,

I want to know, what are the devices(e.g., networking, UART, flash, etc?)
qemu support for the platform sifive risc-v hifive unleashed board .Also if
you can share any document related to this will be a big help.

Actually I am new to embedded systems and this is for my project where I
have to add support for a few of these devices in the bsp.

Thanks in advance
--sanskar

--00000000000011c58d05bb347b96
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hii there,<div><br></div><div>I want to know, what are the=
 devices(e.g., networking, UART, flash, etc?) qemu support for the platform=
 sifive risc-v hifive unleashed board .Also if you can share any document r=
elated to this will be a big help.</div><div><br></div><div>Actually=C2=A0I=
 am new to embedded systems and this is for my project=C2=A0where=C2=A0I ha=
ve to=C2=A0add support for a few of these devices in the bsp.</div><div><br=
></div><div>Thanks in advance=C2=A0</div><div>--sanskar</div></div>

--00000000000011c58d05bb347b96--

