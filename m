Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D5A3BA146
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:33:35 +0200 (CEST)
Received: from localhost ([::1]:55278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzJIU-0006Df-NE
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lonnie@outstep.com>)
 id 1lzJHP-0005TP-F3
 for Qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:32:27 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:40532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lonnie@outstep.com>)
 id 1lzJHM-0002a0-Rk
 for Qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:32:27 -0400
Received: by mail-io1-xd2b.google.com with SMTP id l5so11632921iok.7
 for <Qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outstep-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=LethLMRuYLTZ8CHja1erQhPDmSvDqgg2cegA31DVK9M=;
 b=YIcTDrgn6LHr+Ha9BjjCPVUSbWB9yIrARlzMYDBNDXvMT8FJIZTBUy+MHg4lsr4Lyx
 hhqDCwygjvTZ99xZu7EN2i0T4eyU4+PET2GaCgdydAOM8rCExomrHyQRkaT5E6UH4r/y
 hCVnbWqfsKJIHqbhThXX8WYpOA4EUssDZ9lceSOnRcyV7ekT9FhCbjfI5zItRRJ5AqaJ
 qIi/EzXTDztYP0KAx9HPgnJfIZxUKmFTndKM2/lIdjAGIaWGS1ehpBv3J653kNdZKa+n
 Hp5ME9UoSQeBPzGNlAUvJmS2/YyGJbaLBhh1UJe9em/dcqxyZeFjRtlFxj0pRl/8FS17
 kVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=LethLMRuYLTZ8CHja1erQhPDmSvDqgg2cegA31DVK9M=;
 b=iY1YuaSp6abkivrnbtn3UkgK2tpODcYv6cu7LVpgltpYVXnDWBPWssE5LS1k+7mXRm
 Q+xx1TUrYtEuhS33b8M42/fefyfGqTxB1hQ929BfXZg5Qetntfg47ibn+RroF0cw8+4M
 CS68SYUYWpVogcc3UOTc0/JGuFVmLJHVD8tfYu/RoZX780y7N6mRjNTEFSe1U1+GMsmc
 cAMN4vkDxc9MUl0SpCUWfw2jDcMe9eeV6a9lj3rAHxRO77W/uYxZnjLcJaoVhQSEzvUW
 C8BZlKq8iVSgzAje5nkzoXBlZsZBK6eGf6pFru+wF2hjfnDcbmhl8HJ0rmGlzDFTD1CC
 SDNw==
X-Gm-Message-State: AOAM530mwkKyEmsxGTG30awG/EOYC4nSyT17sc+y8GUHisfqgS1eBkaN
 NBepQMeVau1Mn9XjY1L2E5S9fUYVx/7Gqe/tU60utfPci1p3HA==
X-Google-Smtp-Source: ABdhPJwd+pg76UF/4iPRZipIno3jIBHLiuAUR6rMDyld+zOhs7FC4ibMeMurWQVGAu8UDeEHjSMEn/5HnvWlgwAPeDs=
X-Received: by 2002:a6b:cf12:: with SMTP id o18mr65220ioa.86.1625232742224;
 Fri, 02 Jul 2021 06:32:22 -0700 (PDT)
MIME-Version: 1.0
From: Lonnie Cumberland <lonnie@outstep.com>
Date: Fri, 2 Jul 2021 09:32:12 -0400
Message-ID: <CAPmsJLCSnfkoB9Hk_gT2qJspeadxN3AM=TDbxZ4vpHL_M9X9Cw@mail.gmail.com>
Subject: Porting QEMU to new hardware challenge?
To: Qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000004728d905c623fc04"
Received-SPF: softfail client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=lonnie@outstep.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

--0000000000004728d905c623fc04
Content-Type: text/plain; charset="UTF-8"

Hello All,

I hope that everyone is doing well today.

Currently, I am working on a project that needs a good and stable VMM to
run a single VM at a time within a new hypervisor being designed  that
will run on x86_64 hardware. (at least initially)

For this effort, I have been looking at various possible VMMs like QEMU,
TinyEMU, Bhyve, and even VirtualBox but think that either QEMU or TinyEMU
might be the best solution and I am wondering how hard it might be to port
QEMU over to the new system?

I would like to get your opinion, and suggestions on the best way to
proceed and also what difficulties you may have had in the past, if you
ported QEMU.

Any help or information would be truly appreciated.

Best Regards and have a great weekend,
Lonnie

--0000000000004728d905c623fc04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello All,<div><br></div><div>I hope that everyone is doin=
g well today.</div><div><br></div><div>Currently, I am working on a project=
 that needs a good and stable VMM to run a single VM at a time within a new=
 hypervisor being designed=C2=A0 that will=C2=A0run on x86_64 hardware. (at=
 least initially)</div><div><br></div><div>For this effort, I have been loo=
king=C2=A0at various possible VMMs like QEMU, TinyEMU, Bhyve, and even Virt=
ualBox but think that either QEMU or TinyEMU might be the best solution and=
 I am wondering how hard it might be to port QEMU over to the new system?</=
div><div><br></div><div>I would like to get your opinion, and suggestions o=
n the best way to proceed and also what difficulties you may have had in th=
e past, if you ported QEMU.</div><div><br></div><div>Any help or informatio=
n would be truly appreciated.</div><div><br></div><div>Best Regards and hav=
e a great weekend,</div><div>Lonnie</div><div><br></div><div><br></div></di=
v>

--0000000000004728d905c623fc04--

