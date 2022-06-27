Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 133FF55B57C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 05:02:26 +0200 (CEST)
Received: from localhost ([::1]:37878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5f17-0000Vk-5G
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 23:02:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1o5ezi-00087T-O1
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 23:00:59 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:41922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1o5ezh-0005iu-3U
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 23:00:58 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-101bb9275bcso11362866fac.8
 for <qemu-devel@nongnu.org>; Sun, 26 Jun 2022 20:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=JY0pmvB5pWK7yqVaoPH0jTymca8OjSUqYT8PnrI1X1E=;
 b=dBAoEI3xe0tmh5gTJuplUjs5tbckZPJxgEj+PlWWlAiY1emh4svfVODGykolwSs5Oh
 fFQ0bB52uF1gISQrbvEoH2hH249OrLAgM9mBJ8cJ8CoRyNV8ZVLpa502U8DTymEPYeTq
 IC4ZNYJEdHickwA15NQrk/Pm7Ehqa8fm+3PlJ94f4sI0BsVSxzV3UQZxmxaAWdqM5R0s
 rBHoi0yGzEGa4gcyZ3yoXcjM4ZXMAv0YB0IHe+ubHmDBplK15K7DYln2HOSjCR33LzlW
 wL52GTV9fXRHsiEEtTiwzo9cGZN0s1rU8kedFLMQ0hARk7dZGxB2j5ylHyXZy5zTgor6
 4zXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=JY0pmvB5pWK7yqVaoPH0jTymca8OjSUqYT8PnrI1X1E=;
 b=XSkltABiZS76eLQn6Giqnwj3QXanbwJbLxh2YIBubqWTRvKYQFaQrlYRF7e10+p0OH
 /0o/84w5Ndk+2Lvwcph0vutikofNB/ad45+k+vaVR/vDEp1KyxEkw0AOeNvJKO4EDZcH
 beftpGKKMSCUaazWVcCOMa0/UYlW/Kx310l8zd3/ZTDFtnp32zcF4cYAXLu4KFTBvlL3
 lTEvfXC4i4ndYI79bGPi6602ZtYP01fJI9GIRhKhcrho7AfJsu7BT58AMuvV/e3E7tQ/
 SImQpCGu6sluDBtJSd2QbBGA1RQqhktdc9SbJ3ilLFLKFCBDfZxp1BBOBaMRqhgKBW87
 fNRA==
X-Gm-Message-State: AJIora/na3KrYYVh49MYQ9zK/sLAiHOhjbGJwdfhRixNNDDfTtGIRrzB
 IAetCBCif2wsnFDQjCmi/lQYVLsTSyZ06I4y1UjUsmUx
X-Google-Smtp-Source: AGRyM1vyKufa0ilCQ0VusWhP8aunHwvFNfTABDaoDHgynyJbUhx3SfIb92xE81BytZ+7G2EoXphNVOR3yWHmRTqnh4w=
X-Received: by 2002:a05:6870:3d94:b0:106:9d09:2fa5 with SMTP id
 lm20-20020a0568703d9400b001069d092fa5mr6277035oab.82.1656298853994; Sun, 26
 Jun 2022 20:00:53 -0700 (PDT)
MIME-Version: 1.0
From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Sun, 26 Jun 2022 23:00:43 -0400
Message-ID: <CAK7rcp-2qVkc_G_OsfF=nCp2VfpOHjvRZR=tevN0fOSsgFpZYw@mail.gmail.com>
Subject: QEMU Disassembler
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000d5934405e26520b9"
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=kennethadammiller@gmail.com; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000d5934405e26520b9
Content-Type: text/plain; charset="UTF-8"

Hello all,

How can I call the QEMU disassembler to run on an argument set of bytes?

--000000000000d5934405e26520b9
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">Hello all,<br><br>How can I call the QEMU disassembler to run on an argument set of bytes?</div>

--000000000000d5934405e26520b9--

