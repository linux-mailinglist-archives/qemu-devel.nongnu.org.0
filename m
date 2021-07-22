Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCD63D1E30
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 08:23:25 +0200 (CEST)
Received: from localhost ([::1]:35656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6S7A-0004wH-KA
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 02:23:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hopefirst@gmail.com>)
 id 1m6Oz6-0007kG-L9
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 23:02:52 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:41788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hopefirst@gmail.com>)
 id 1m6Oz5-0001Lz-4D
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 23:02:52 -0400
Received: by mail-qk1-x735.google.com with SMTP id q15so4153081qkm.8
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 20:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Jukcmu7QC5gru0B677MkxGuLZt6ExrfxHwCNvZVacY0=;
 b=XMXak8OIZE7QtqlAktm7vqMbG3XtLYiBtoHNfOyDHki8XXDNmuXFupE3Bed+6mT59Z
 8fRnT8JqFPWl3lxFm+mUL3AEKVpgcgVl5R25YJG7+PdA/0e99UKPJKEEyyJS3lZEqFM5
 sVDdkquJbCnbK9G82dymGEfoi4vzFB6pTrhjFE5r08xbcTuGXfz1uorGhD9E7/MAJ5aN
 3XeXEcdCN2r6RROCrugVA68vHcOS5JK/0JohE8FmO1SIyioffVs32Z1wmqqnEDiIEp/c
 3Teo70pPeFjIoPnRwraPLbLH9FMPrhm/4nbQJbmkeb5/MU6kndIYYZG7X7BxBQhF31ZB
 fmjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Jukcmu7QC5gru0B677MkxGuLZt6ExrfxHwCNvZVacY0=;
 b=X5dj/oWt6EoOJclmbUWDrsYM2WWW6auU0GpKtDg7l7t9Hz0yLVFiFiRIGq3zh3WzQZ
 aLhnMY4WTWHM1IWvATReNyedMPNPHd8yhCEMDk5EQE2MM8R9CFjcZlhNTmmO/r77GIn9
 UXZi0SwFpSRh6X/j+bZSBL3lh9XEwe8XRZ4RVNPbyBreQe7LP69foNPtVeQ6ciMXGN/V
 0EHTAky9Kkb+Bw4fqZcvPMF0UyWqKzBTUHJH3pNCC/ANKGF06T7agLWw9fg1Ziqswu9Q
 i3RhKdyezOLm7a9+R7r0vJFNGIAmbR3djrbrJ1HtiMeeJIskbs8xsMd81dL3SvE9J323
 3tfA==
X-Gm-Message-State: AOAM531TO8tBSqMWsj75zW/QtzGZMotFxnArVqXdATloON5/iz3oww+E
 qhv1DP4lHk9Z2PrzQYa4UJANW84wzw5PdvGpmJHsgyzxEZU=
X-Google-Smtp-Source: ABdhPJzCX8ZxdXSpFcpS3CuypFvOOawGcCmFFW8eAveiQdNlZraCPYiAB0Y7XcUYfk+sS9XIK0ai/rieGdEXBQCViDQ=
X-Received: by 2002:a37:2e83:: with SMTP id
 u125mr38556409qkh.168.1626922969682; 
 Wed, 21 Jul 2021 20:02:49 -0700 (PDT)
MIME-Version: 1.0
From: Nicholas Kyanda <hopefirst@gmail.com>
Date: Thu, 22 Jul 2021 06:02:36 +0300
Message-ID: <CACtFGYPsB-Wy+qfkX172FxjtMzu7mxgjk1eeYSCpV3HBf95wmg@mail.gmail.com>
Subject: Installation challenges
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000af55b205c7ad85a9"
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=hopefirst@gmail.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 22 Jul 2021 02:21:01 -0400
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

--000000000000af55b205c7ad85a9
Content-Type: text/plain; charset="UTF-8"

Hello,

Thank you for your software. I just installed the 64 bit windows exe
unfortunately, I cannot find it on my desktop. How do I start using it?
Sincerely,
Nicholas Kyanda

--000000000000af55b205c7ad85a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello,<div dir=3D"auto"><br></div><div dir=3D"auto">Thank=
 you for your software. I just installed the 64 bit windows exe unfortunate=
ly, I cannot find it on my desktop. How do I start using it?</div><div dir=
=3D"auto">Sincerely,</div><div dir=3D"auto">Nicholas Kyanda</div></div>

--000000000000af55b205c7ad85a9--

