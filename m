Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E463CA1C6
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 17:58:53 +0200 (CEST)
Received: from localhost ([::1]:51096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m43lE-0007rS-51
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 11:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1m43jn-0006Nh-Ux
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 11:57:23 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:35796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1m43jm-00061D-5J
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 11:57:23 -0400
Received: by mail-oi1-x230.google.com with SMTP id p67so7195068oig.2
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 08:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=LhJNAoXZo/fmD5mjJMikc7YEh1j1e/z/2tRm1AYIukQ=;
 b=kQ7FWVAlpVEYJPUN5ePnYpYBESxgFbdJ57JBldPuUQe77lEC2WHTZ5k1EvYgAfVJrr
 sHE8F6G9BunUGjy5QkFtZD3n7o3ozV947SjrBImUqtHGeY8GK87bU3sq6EdUn/sotYPX
 9aOOwTFWrir/rx5CMH0HRd9qPx/fsDgN/gPz1OKs7KyrBA2XtxQv0BAEN0AW1MimyuHK
 MhS+PP/eHfwhRG7DTn6ODi23kBMCfG2CrmvNkFCLaAucmeIs3HSciCAL+RmbxcPZ2AN2
 V8PL/ofW88d0FqlOmgzMnKdrTvU0XWWhAc4Wfy5b/GQP5OJ6zhbHhajE80nrZMaJET5W
 gZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=LhJNAoXZo/fmD5mjJMikc7YEh1j1e/z/2tRm1AYIukQ=;
 b=nWf3nGdO9eG3pY4ApB5bwwmNRyR7/4zGZY+HX0/ult464SC1W50C5nx0xO5SeSh2LB
 u4SnILvFrJ4A1aPdfGa7rR2LSnE2GKxKzXg+3al7PVLr9/VUpfyCVQWT6Gs7zVPE8rUh
 3af+7iKGFLzQ+Xx0Ep7ZKoKoxt3BzQ7dnslmtQwTJTMBlKAAFLRZRYA7BTcgxAci58CC
 U6ECxdUzqp9fgsCgLtixmsadMEFBjM/pIwReCFawZaKtXLSUWkFYeMOKD6Inxk4Dm2u+
 7EF5Gr+SFHmLyDz4G1l+A02VmDhjld8fRlEVkWPda/MfPdJAyMwdMfQhp/RIlRp9vkj6
 hf6A==
X-Gm-Message-State: AOAM531D8ChJPtbX58kqX/AQGve3JlHin3esS4eDYh4HVwhrAgbGRHpK
 rT24HSdTbhXLug9e/h4N469fPLHSKBMFvqw1q3/gb280Bgo=
X-Google-Smtp-Source: ABdhPJxLf8AYtZpLcVddaEank7uMGVCsBM9NiTURLnPs3417cHexa36MvbX2zaJcDMRn7jutcczjFyJ8UvQsKFYQLAg=
X-Received: by 2002:aca:4042:: with SMTP id n63mr4090817oia.111.1626364639981; 
 Thu, 15 Jul 2021 08:57:19 -0700 (PDT)
MIME-Version: 1.0
From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Thu, 15 Jul 2021 10:57:09 -0500
Message-ID: <CAK7rcp_5vmoL1xFr6rVUzbyb2LyxyndOrxKMsyvgkqq_EX=hOg@mail.gmail.com>
Subject: QEMU System and User targets
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000a4332f05c72b864d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=kennethadammiller@gmail.com; helo=mail-oi1-x230.google.com
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

--000000000000a4332f05c72b864d
Content-Type: text/plain; charset="UTF-8"

If I am right, the softmmu/system build target for each
architecture subsumes the source of the user target. It's what I see in the
build of i386. But then, I think the user targets have some dedicated user
layer which allow a foreign architecture user binary to be relayed through
in order to map to the host. What I was wondering is, if the user layer of
qemu is used by the user target, and by user layer I mean the using
contents of linux-user, then how does the system target receive the user
programs instead of the qemu user emulation layer even within a guest that
is an entire OS?

--000000000000a4332f05c72b864d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">If I am right, the softmmu/system build target for each ar=
chitecture=C2=A0subsumes the source of the user target. It&#39;s what I see=
 in the build of i386. But then, I think the user targets have some dedicat=
ed user layer which allow a foreign architecture user binary to be relayed =
through in order to map to the host. What I was wondering is, if the user l=
ayer of qemu is used by the user target, and by user layer I mean the using=
 contents of linux-user, then how does the system target receive the user p=
rograms instead of the qemu user emulation layer even=C2=A0within a guest t=
hat is an entire OS?<br></div>

--000000000000a4332f05c72b864d--

