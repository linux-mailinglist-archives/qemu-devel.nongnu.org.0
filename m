Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D630366B991
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 09:59:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHLLJ-0000W7-0h; Mon, 16 Jan 2023 03:59:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yu.zhang@ionos.com>)
 id 1pHLLF-0000R5-PS
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 03:59:45 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yu.zhang@ionos.com>)
 id 1pHLLE-00084w-2G
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 03:59:45 -0500
Received: by mail-ed1-x52c.google.com with SMTP id v13so5670045eda.11
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 00:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=y1AtRax3/OGwYdloKAxzHVoAtafZdoLdwCwtFdTgAFg=;
 b=Z9PDHhrD4S6rJITkgCy69XSgBTJ6owaepHmBA9meLeSg8KUZSt1wTzFfBJKgGjfGFH
 rMOsXkqC0hZCpIhWQACTJu1uIHWGSkggAPhVMn8ADdpSMI7pUj+GngCa21aFCinETkr3
 UgqBkl3iU+oDVdRrLmUj/CGikCdC1nTaP2LGt4mtXQXiv4QSLdZKJwjyXancNZq6omMK
 PzB1a8Cc6irrGqs1M2FcHwN2ndJp8jLef/eokdx/VNeUaCaWVJ2piZ2/UBofbBhxOgA4
 HnE1tphUXvt6jjLAuKKZuEtXwmm/xSm3q/zc2nPLopXXMlSuv3V72QPyhv4BcTlkR2V2
 ZhYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y1AtRax3/OGwYdloKAxzHVoAtafZdoLdwCwtFdTgAFg=;
 b=fYS05/zH1LnSelHRpoI359QRutPUMGPAxUIHJPoD2nl+oEaPsU35Q2Tez5DP6dYG1R
 15FoKlYv+mVaPzjNT2uYZ5PrsA84diga+IeogtfyCkZXMIkyiMk9sZi6PC+2JHl7BScF
 pNLS3AemDQ0xxUTZQJwD4mvjcMxxW2/JdBIdhB7KlfRvNe7vKxNp7KA7Zr6W1tH8+POP
 j6vaoZfMF6O2LSbuBt67PvnTIdgRZBo0p4XhQZfDDSb0H8KJ5uDyLoeWkJpTNYD2lIxW
 oCG6o4q6NIw5ZfsnRDtofN7CCNq7Xay5YEwrPwY7iIsDsJ+ZL6KoO+KLrIpj3FLiansu
 iqzQ==
X-Gm-Message-State: AFqh2kqTBtyxQcQXGekIwU1ZMVYS37HpaNgl2AQz5FrmPuYModdzd1DQ
 ARZ8pm1wDfx5Kqzu3M2F6ByIdw51miGB8ipbr1ku1IuIP8jqUmz8
X-Google-Smtp-Source: AMrXdXuWyo6txHaqaBtfysMe8HjT4uVMu2GcBfD1etiPgvpahHKyyfPXYLDKfDHan6U8+IEAa5LsPsMFM0v1QP2FMB0=
X-Received: by 2002:a05:6402:6cb:b0:493:77c5:6851 with SMTP id
 n11-20020a05640206cb00b0049377c56851mr3837419edy.328.1673859581281; Mon, 16
 Jan 2023 00:59:41 -0800 (PST)
MIME-Version: 1.0
From: Yu Zhang <yu.zhang@ionos.com>
Date: Mon, 16 Jan 2023 09:59:30 +0100
Message-ID: <CAHEcVy56ZTmPEiEn5yHVyrNWK8nBtRZF5gK=sRb4x6RMnOu+gQ@mail.gmail.com>
Subject: regarding qapi and qapi-rs
To: qemu-devel <qemu-devel@nongnu.org>, Jinpu Wang <jinpu.wang@ionos.com>, 
 Alexei Pastuchov <alexei.pastuchov@ionos.com>,
 Elmar Gerdes <elmar.gerdes@ionos.com>
Content-Type: multipart/alternative; boundary="000000000000bf285005f25dcdf0"
Received-SPF: permerror client-ip=2a00:1450:4864:20::52c;
 envelope-from=yu.zhang@ionos.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000bf285005f25dcdf0
Content-Type: text/plain; charset="UTF-8"

Hi all,

I noticed that with each qemu release, the qapi (C version) may introduce
some changes, and the qapi-rs (Rust version) also changes correspondingly.
However, recently there is no qapi-rs release yet for qemu-7.2. I'd like to
know, is the release of the qapi-rs synchronized with the release of qemu,
or independent from the release of qemu?

Thank you very much for your reply.

Best regards,
Yu Zhang @ Compute Platform, IONOS
16.01.2023

--000000000000bf285005f25dcdf0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<br><br>I noticed that with each qemu release, the =
qapi (C version) may introduce some changes, and the qapi-rs (Rust version)=
 also changes correspondingly. However, recently there is no qapi-rs releas=
e yet for qemu-7.2. I&#39;d like to know, is the release of the qapi-rs syn=
chronized with the release of qemu, or independent from the release of qemu=
?<br><br>Thank you very much for your reply.<div><br>Best regards,<br>Yu Zh=
ang @ Compute Platform, IONOS<br>16.01.2023<br></div></div>

--000000000000bf285005f25dcdf0--

