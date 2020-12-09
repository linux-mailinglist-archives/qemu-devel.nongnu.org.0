Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6802D39E5
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 05:50:31 +0100 (CET)
Received: from localhost ([::1]:53272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmrQs-0000pc-Mg
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 23:50:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aj.shirvani@gmail.com>)
 id 1kmrQ1-0000PM-95
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 23:49:37 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:56131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aj.shirvani@gmail.com>)
 id 1kmrPz-00083C-Jf
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 23:49:37 -0500
Received: by mail-wm1-x32a.google.com with SMTP id x22so273215wmc.5
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 20:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=aQUJCWp8/KcysXJEOocqrbVqvVNzDQdB+MVvYjVs8+U=;
 b=DuZeLcyohdhRRP9xaZ2oSJw08Kz8GaFhSeazZ7H5jsh4LwXLibRIs9wtZ/qg2GQKPP
 Z9y3LDXXXi2C8BLq49GiZW8YDTpTG6746pXiEepZKuEgzvInh54ODR2t9h6mJ0dPba67
 A+4N9CMIPHlsPTlbxRhwCJlzeFv+SBYalGY4bmfSkC9R3QMxArEWwES0rJzH5AANI76i
 ASl1l2xi8fewHvlslkZwndiyK7u+DmPEhmC1Zo0H0HdBeaSKJwKC5TO9Sk8EsMI+1MTV
 uJoexYVB/4zSAyjgl5NULoIOPUNUWUHGQxu4phupYnAtAjHcvKoqOl5O7Gg28AG7VPCc
 eCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=aQUJCWp8/KcysXJEOocqrbVqvVNzDQdB+MVvYjVs8+U=;
 b=ssE8fcuj6drr4FJUv6NvEFAzpQD+h/ML4gGD7a/ceo1Q+O8mb68VSmk5rxDhZjhcGg
 P1q0Fj3uMCA3oSOrexHXAVcq1zUXwsHZoi4ue3xemNEsFg4xgfkX5rfpPHV0y3GOFA5W
 BetddzM2OmcsqAaqhKleZZiuyP2f92JjuoLuGgKwH2Dg9UBWE5HyXnJWY/6DIMmLo3Bq
 qLtWRaCvNysSr+0vGn1XSvuhSVDE9/KwD6l0O03lcP+/e2WT2/xIJ6iVv1ue2R5sYXQv
 O6+C0ITU0hcoEPS9Uh9zlr3X0jI9cvZgzInwSQath8AZB5cdlyemOjsg/XgdmCwgar+5
 +G7A==
X-Gm-Message-State: AOAM533U7aDhXQ178bgfeh1QV24MjyZeRZPBALRkYUtVQRz85AcM6W8v
 opqgqACWjR5TLegV3ZqsOVbU10+Ic1E7WSJR8dfIxNRcWW5Sow==
X-Google-Smtp-Source: ABdhPJypvC72cD9j9KrKVz7dS7nGIKtns/4GAgvPbRQ/VBZED8b4wwcdXLe5ZM3ui7wb4qNL1XdGaqoHE2uBOqDFe/c=
X-Received: by 2002:a1c:6a0e:: with SMTP id f14mr654658wmc.102.1607489373613; 
 Tue, 08 Dec 2020 20:49:33 -0800 (PST)
MIME-Version: 1.0
From: Ali Shirvani <aj.shirvani@gmail.com>
Date: Wed, 9 Dec 2020 08:19:22 +0330
Message-ID: <CAFQ97XGUDg7P4MkhDnCD7TTJL=fyJaL19YiJUeL6P7QwaKWsig@mail.gmail.com>
Subject: Implementing Custom USB HID Device
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000001830da05b600c9fe"
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=aj.shirvani@gmail.com; helo=mail-wm1-x32a.google.com
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

--0000000000001830da05b600c9fe
Content-Type: text/plain; charset="UTF-8"

Hi all,

I want to implement a new USB HID device in QEMU. I found that there exists
`hw/usb/dev-hid.c` on the source tree, but I did not find any further
documentation.

Would you please guide me how I should proceed?

Regards,
Ali

--0000000000001830da05b600c9fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div><br></div><div>I want to implement =
a new USB HID device in QEMU. I found that there exists `hw/usb/dev-hid.c` =
on the source tree, but I did not find any further documentation.</div><div=
><br></div><div>Would you please guide me how I should proceed?</div><div><=
br></div><div>Regards,</div><div>Ali<br></div></div>

--0000000000001830da05b600c9fe--

