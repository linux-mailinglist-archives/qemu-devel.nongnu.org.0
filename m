Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D37A45F1F29
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 22:13:54 +0200 (CEST)
Received: from localhost ([::1]:39210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeirx-0007Kd-CH
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 16:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <commandspider12@gmail.com>)
 id 1oeioo-0005pe-8n
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 16:10:38 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:33428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <commandspider12@gmail.com>)
 id 1oeiom-0003OO-Pf
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 16:10:37 -0400
Received: by mail-qk1-x729.google.com with SMTP id h28so4744972qka.0
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 13:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=13tg9rgwTlkr9QDxJ457xbKPdnFCrIHgNnY+bjLrbRw=;
 b=m8BuXgcCguohaVoCk8uRvEZ5WRgEF+pDOzt17lt7zYg9tH8Hi4cG9/fDGZ0ZbQVHvF
 nSDebKfOo+B8x0FkOMMadb9F0sIWln1raeI3lnhgPACHzauFImLOMRkt81IJ6KhiozrJ
 vr5Hvx0jYUeA1DaTX6g/gj3/cbeXEG2KmTfxOBJJOxy2Ru78cG1tToy3k0dK2r7RkZyb
 84GL8kXoN8lmxRN88RxFpLO14iDg9sUnVCwXfY4jmDFKqGXI4uZG1Qurena1xrrlXgOZ
 jnO45NdpWcP8k5S+XiUzCGcEcacVv4wQqy162Yy6ojvWUdNCCEjL7+ExWIzlUA7+B3te
 YKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=13tg9rgwTlkr9QDxJ457xbKPdnFCrIHgNnY+bjLrbRw=;
 b=t55iEetMAG/ZmeEbv0QDfx5XFM+IqLuyhkNwzWpgTJoLs7zhppmxANnW9WD6Ys/18o
 PqNWzKkEGm/FrZd94JVVLjAXs8HlBYSkVT8ZwWRBWiJgVLraxNgSHznPQVkA9LMj5Me4
 kEz6f13tsad4x5AK8yqMBVXSdSr0zR09nPW2oZXhygqY6bdo2prbyfPlludDGq1hTtcu
 nl6mOpnvJB29gon297wNj5pVkB/5D+asS2gZJEUo5xW6nptPfOCHFU40cjsVCxWa+oUF
 Q2sTrMxQ8hidPhBbmsTSYdlSHuJdgu0oXbp6y3oSY6dSGZUFEAFIGKduP82/7yFEVCCG
 V6bQ==
X-Gm-Message-State: ACrzQf0RtSFbkTNQQd7j6sADJitGwQjqKB5jktOxXxiKGFoXhtDlrO/5
 c/foxTH4IY81KVWoBu5M64knCk6zYULX8myQ4HEcO41QkrU=
X-Google-Smtp-Source: AMsMyM50WLYLZcRYg8uCU5bxSmY0qzOiaMgeUhVz3GL11yxF95oCLZEnrtxOALrIRrdHfyJ1JRHlVp9cpvsTjN+FLUk=
X-Received: by 2002:ae9:f205:0:b0:6bc:2d40:2f3d with SMTP id
 m5-20020ae9f205000000b006bc2d402f3dmr9941695qkg.448.1664655035415; Sat, 01
 Oct 2022 13:10:35 -0700 (PDT)
MIME-Version: 1.0
From: BitFriends <commandspider12@gmail.com>
Date: Sat, 1 Oct 2022 22:10:24 +0200
Message-ID: <CABVhSWP7XjNvCXUvawXLcOkP4vXQ8wbMObKbxc+jN6gv0wzawQ@mail.gmail.com>
Subject: access guest address from within instruction
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000000f40a505e9feb485"
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=commandspider12@gmail.com; helo=mail-qk1-x729.google.com
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

--0000000000000f40a505e9feb485
Content-Type: text/plain; charset="UTF-8"

Hello,

I am trying to create a custom instruction that accesses guest memory
specified by an address in a register. I specifically want to read from
that address. So I tried to do that using "tcg_gen_qemu_ld_i64(&res,
env->regs[R_EDI], 0, MO_LEUQ);", but that doesn't save any result in res.
So either my call is wrong, or I need to translate that guest address to a
usable host address. I can't find much about this stuff in the docs. Could
anyone help me out with that?

Cheers

BitFriends

--0000000000000f40a505e9feb485
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>I am trying to create=
 a custom instruction that accesses guest memory specified by an address in=
 a register. I specifically want to read from that address. So I tried to d=
o that using &quot;tcg_gen_qemu_ld_i64(&amp;res, env-&gt;regs[R_EDI], 0, MO=
_LEUQ);&quot;, but that doesn&#39;t save any result in res. So either my ca=
ll is wrong, or I need to translate that guest address to a usable host add=
ress. I can&#39;t find much about this stuff in the docs. Could anyone help=
 me out with that?</div><div><br></div><div>Cheers</div><div><br></div><div=
>BitFriends<br></div></div>

--0000000000000f40a505e9feb485--

