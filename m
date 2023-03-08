Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 960966B13D9
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 22:30:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa1LB-0001Nj-SJ; Wed, 08 Mar 2023 16:28:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dikidera@gmail.com>)
 id 1pa00C-0007yT-CC
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 15:03:09 -0500
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dikidera@gmail.com>)
 id 1pa008-0006Vw-Dx
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 15:03:06 -0500
Received: by mail-lj1-x22d.google.com with SMTP id g18so17818317ljl.3
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 12:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678305780;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=vULi+08RwlN6a9noI7N1oR3owr7Kj38lTD5DB4EyC8k=;
 b=G8iUg4zs0gPqAYa/NaC5L3rnVghwIyWzUlpQjhp51bsoMCgtKpM4Pm3mRAFlDFxAxx
 QmURhmeiM3a+8yI3KNhI8JX3RlI+HeEPhmq7t+fVvaPzki5OhDwJREpzvHKzF0YwQRfD
 vpX8SMewXNeLYPhtspkuXSgZYyYpf/5Pi+JPTjQ65yO7pJc8aQSDwel/fHIpvx2EcEks
 YzDqfuhuv6nG6YvfC9NamWJLHgJLzdWDidf2p8SYFz0Pz9m7RGKYsrknGOgYADxff3tF
 L6+4In0Bqxfet+vlJ7YtF9whBcR1DY2KI5JEwvXe83eFcSG1ND/GsjNdrxWIoC2GHx+8
 3pYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678305780;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vULi+08RwlN6a9noI7N1oR3owr7Kj38lTD5DB4EyC8k=;
 b=cH5FgpiVt0NY5SvMTfBo94fXHe38k9PB07eF/9qVPlo1LevZHcBQKRU4jjGIlQbcSL
 OulXrS7KWXUB7hSVvWc8xs4c5Gn7RQyJQwQoqHpFtCXr1qI9A40FaN5a1OB/9J9l0dzq
 FGBckBLmakUNjLL+F1lzT/wHKVh/VXKnRTkkoDv197UfJnvj/5J1kVqDhGW45ykSgfqy
 LNgH6KqQ03nxuOzQSLhDk8WZnv/Ftf45R83XC2CswFnLFbd+r1+2w4fXnWJZ7JreoQbg
 JWFzqBr5L2oPUmpVn9Jf7iazp2j1nGAHxrCEV+sfsu7/AR5TC5K7TeA+x7VGlQ/A2WD5
 touw==
X-Gm-Message-State: AO0yUKUI2E4zL8D4ps2ieYpLiJv3RThYQ5/gildSHmNmjrcpqRolAWl+
 6gQ8YTV/hV6Nq8gEW2GZ37/5Fm1K0RdpAEuvSLqpAgLu
X-Google-Smtp-Source: AK7set9F6k3zFbOykMof9OVyIvU9o+ZiaA2tcYsoS5R2NKVzEqfTVT61RYgxASTOn4b/V6UFV2Qiif4tuUlgo1KWut4=
X-Received: by 2002:a2e:a60b:0:b0:295:b026:8c34 with SMTP id
 v11-20020a2ea60b000000b00295b0268c34mr5997332ljp.4.1678305780354; Wed, 08 Mar
 2023 12:03:00 -0800 (PST)
MIME-Version: 1.0
From: Diki Dera <dikidera@gmail.com>
Date: Wed, 8 Mar 2023 22:02:48 +0200
Message-ID: <CAOQbWYCojtyh-1yvBc123OwLVb+Odc71dFF1DG_BbjjjG18xQw@mail.gmail.com>
Subject: Emulating a SH2 board?
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000dcd58e05f66903e5"
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=dikidera@gmail.com; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 08 Mar 2023 16:28:53 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000dcd58e05f66903e5
Content-Type: text/plain; charset="UTF-8"

I am looking to emulate a SH2 board, specifically SH7055. I see that there
is already an implementation for SH4, although in places, incomplete from
the comment I saw. Especially interrupts.

Compared to SH4, SH2 is simpler in that it has no MMU, so address 0x1000 is
exactly that. And since SH4 is backwards compatible with SH2, I already
have the necessary translation layer.
My question is probably too broad for which I apologize, but what would it
take to patch out the software MMU and focus more on emulating my board's
devices such as SRAM and CMOS Flash chips as well the functionality
specific to SH7055?

--000000000000dcd58e05f66903e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I am looking to emulate a SH2 board, specifically SH7=
055. I see that there is already an implementation for SH4, although in pla=
ces, incomplete from the comment I saw. Especially interrupts.<br></div><di=
v><br></div><div>Compared to SH4, SH2 is simpler in that it has no MMU, so =
address 0x1000 is exactly that. And since SH4 is backwards compatible with =
SH2, I already have the necessary translation layer.<br></div><div>My quest=
ion is probably too broad for which I apologize, but what would it take to =
patch out the software MMU and focus more on emulating my board&#39;s devic=
es such as SRAM and CMOS Flash chips as well the functionality specific to =
SH7055?<br></div></div>

--000000000000dcd58e05f66903e5--

