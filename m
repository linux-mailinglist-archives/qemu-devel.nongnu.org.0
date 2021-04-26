Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C8636B0C4
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 11:38:47 +0200 (CEST)
Received: from localhost ([::1]:54514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laxhW-0001sA-Oi
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 05:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgenfv@gmail.com>) id 1laxgG-0000cp-PF
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 05:37:28 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:40790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgenfv@gmail.com>) id 1laxgF-0003ZE-9N
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 05:37:28 -0400
Received: by mail-lj1-x230.google.com with SMTP id u25so24961293ljg.7
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 02:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=yKD1HwFMI5185ocTES+LlPQZAEaCj7TbV5VWRKRqcFc=;
 b=cjOdVwNuf54weCqMEdrm2WAY/Zcf8caPc3Dw7yy1lVysKuhX80XhPaojiyRESwiXVG
 5nxY09xDqDCVaYmG3jo7339QxHSsHXnAjbdrTbsD8euDtVRKVevwr7VrL1S6pcLeWmgf
 mviWCfP2byhp4siVwJiVONqAnyNDmznpK9BXZvntztHqBg1MdRygHp8eFCfNYsWHQUbs
 Ir1brbA7xByQszpwgybYQvK8mjw4/QLspe/Ox6D4umMKtwcQBUMffPrPKg6SosVjQMyb
 uXtlabr8xinsHvJC+QuQG5sYmXYxafyKxwnhHG9GJIFG2UJ5yA1U4TN83PxxvHzcxJua
 Xp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=yKD1HwFMI5185ocTES+LlPQZAEaCj7TbV5VWRKRqcFc=;
 b=A9qWzu077EBuMy2GoImHTipm55a9MVkFUYX5b3dARz257bz2ezXeSdXEDW7NpUgDOI
 vBZycYRj3bKFIwut8e3+U0N9soZ0TNEWjjCTKhWk85GJ6KLIRDaJoNB7oVyl6gghqBXz
 aRQzWvuLBTYwqVV0M9OosJ5eGrL7ZawSRR/N5NB5Uw+ngPtMQrsmerZvezybqfjMv/9w
 Tk4v8colYSao0vvHeZVDBQYG+H39Io7aju4czsKtiS6C4hzz9UAG1r76V5SriCfAZ2yi
 tOjg//agUIX1UaiQThUxlnwv7IVd67pjnxNgRYEA0hGfntDFdNrNbkNly0aYQn2ILW/R
 f/rQ==
X-Gm-Message-State: AOAM533qVJjvt8M8MFt4u1O5CXlK+U41zs6+wioogZEJSIODu7rW2MHE
 EvTLga53VCBt4lPW1anwsXSu02zh7Y4U9YwpeqMbH00ZcPPkXcp+
X-Google-Smtp-Source: ABdhPJy6gm7Xa+b82VHGn/hg4IKPN3l5ide070Rp0gEA02B7nZKvYVkI0B6jwYIax81lNAcblO/TgyM4YhIgLk1h4oU=
X-Received: by 2002:a2e:b6c7:: with SMTP id m7mr11983045ljo.241.1619429845149; 
 Mon, 26 Apr 2021 02:37:25 -0700 (PDT)
MIME-Version: 1.0
From: Edge NFV <edgenfv@gmail.com>
Date: Mon, 26 Apr 2021 10:36:39 +0100
Message-ID: <CAED3YRq2yq+FOr5gGjHjrD8Ak=YiHMfvj1rReVefuw9-=9FR7Q@mail.gmail.com>
Subject: First time patch not reflected in the mailing list
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000a8abd605c0dce4c1"
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=edgenfv@gmail.com; helo=mail-lj1-x230.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
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

--000000000000a8abd605c0dce4c1
Content-Type: text/plain; charset="UTF-8"

Hi

I sent a patch around four hours back but I doesn't seem to be reflected on
to the mailing list. That patch was my first mail to this mail list. I
understand that this a moderated list and the first message needs to be
white listed by the moderator. Please let me know how long it will take to
white list my patch message.

E

--000000000000a8abd605c0dce4c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi</div><div><br></div><div>I sent a patch around fou=
r hours back but I doesn&#39;t seem to be reflected on to the mailing list.=
 That patch was my first mail to this mail list. I understand that this a m=
oderated list and the first message needs to be white listed by the moderat=
or. Please let me know how long it will take to white list my patch message=
.</div><div><br></div><div>E<br></div><div><br></div><br></div>

--000000000000a8abd605c0dce4c1--

