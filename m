Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 082CE2EBD8E
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 13:17:49 +0100 (CET)
Received: from localhost ([::1]:35574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx7l5-00055K-Vz
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 07:17:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yunextus@gmail.com>)
 id 1kx4ND-0001Ng-8h
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 03:40:55 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:39168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yunextus@gmail.com>)
 id 1kx4N9-0006DB-VM
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 03:40:54 -0500
Received: by mail-ej1-x62b.google.com with SMTP id n26so4012811eju.6
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 00:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=qOIlONhJgGm6BcLwngMuuAp4Lv/EL8TMy5JjHqBftQs=;
 b=SqbHFz5qWGmrugrE4wqJ+nIOqrbIwtquKdHozU+Y2N46Hpg5vL/Av6VIvAJ8UZEv5g
 CaS6schObyxK76U/2DopwJgbuiZaFwK70y+Js0B6WEszRsWKdVnv3f4pgMnCMXawln5N
 UkQsNfgSqPMmYHZED53oq9sW9WrA7HKrXj7j2XxmALqalgsGiwfUWbE/CHx0ttiunM8D
 ix+n57SGRXSUCERHuLRK9zDAszNa0grQhRz++5xxUczr8ExAMYRbybmD6ldpx5oooF3d
 frOTmxe7idi9HnkWbf19zvdbXLdZ3pcio0nteKAAH39uWrU4LCoLTU4WCiox30dULLVi
 bMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=qOIlONhJgGm6BcLwngMuuAp4Lv/EL8TMy5JjHqBftQs=;
 b=jYaHS2JHuztzIK6Ljcbj9SMPwbAQLlgSSypG/xX9zC0MCr5QPiHqlMqSidOrDkB1yQ
 bJ9J+7XU1CqsVCz+DGfVKgEUt7PDjFq3B6qW8orx9Jy1wMsbf9RDq+4s8/xL7c65sqHp
 KvW3OD9CggT6SCQYD0/YhMB8Hc3HaDzuzsI4hhl9nc5sJDZq/raN591K/5y7v3BzgtFA
 IIyC1438OvMlnX5OLQ7FzB2P8O8OeTZcAm7HRKOeTfOP9wPqjVpErVOO63bvrQm/zzk0
 6N9O5vEKWV74OSSL+Nw4iswNKDbOe2tBxQ24Rnu6jH0adykrzNCPvpfsVyChYIyzxfn2
 XW8g==
X-Gm-Message-State: AOAM533a+qG0GVPbkhMoWqLvfOK1pdvGBpa4kB5hLEqMiPt50h8+zLZZ
 qHksrcjzozqwP/sZ2uXyjWSPxqPqIwm3NAsSWM10mQLfffHl/A==
X-Google-Smtp-Source: ABdhPJyGd9OXizsVfqrjSQltxAo49izoaunhpiMIeIGpOfDcTBaSuJ7/TS/ybs7TzU5Ng78l43Ih3kh5cVrdTOg60xU=
X-Received: by 2002:a17:906:b106:: with SMTP id
 u6mr1258405ejy.313.1609922448781; 
 Wed, 06 Jan 2021 00:40:48 -0800 (PST)
MIME-Version: 1.0
From: Yu Nexus <yunextus@gmail.com>
Date: Wed, 6 Jan 2021 09:40:38 +0100
Message-ID: <CABUrspJpXkNeT0=n10Vkd1xDUgE1QAUyBbLfcGv9QdnYg6DqTQ@mail.gmail.com>
Subject: MTE support inside QEMU?
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000acf62105b8374755"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=yunextus@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 06 Jan 2021 07:14:24 -0500
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

--000000000000acf62105b8374755
Content-Type: text/plain; charset="UTF-8"

Is there full support for ARMv8.5 Memory Tagging Extensions (MTE) inside
QEMU?
So is this MTE example code supposed to work inside QEMU?
https://www.kernel.org/doc/html/latest/arm64/memory-tagging-extension.html

--000000000000acf62105b8374755
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Is there full support fo=
r ARMv8.5 Memory Tagging Extensions (MTE) inside QEMU?<br></div><div dir=3D=
"ltr">So is this MTE example code supposed to work inside QEMU? <a href=3D"=
https://www.kernel.org/doc/html/latest/arm64/memory-tagging-extension.html"=
>https://www.kernel.org/doc/html/latest/arm64/memory-tagging-extension.html=
</a><br></div></div></div>

--000000000000acf62105b8374755--

