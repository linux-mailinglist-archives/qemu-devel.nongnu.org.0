Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D664606F9
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Nov 2021 15:47:23 +0100 (CET)
Received: from localhost ([::1]:35284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrLSb-0005I5-7f
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 09:47:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olivier.heriveaux@ledger.fr>)
 id 1mrIyF-0007Ha-GW
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 07:07:52 -0500
Received: from [2a00:1450:4864:20::32b] (port=55038
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <olivier.heriveaux@ledger.fr>)
 id 1mrIyC-0004rt-R7
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 07:07:51 -0500
Received: by mail-wm1-x32b.google.com with SMTP id i12so12244534wmq.4
 for <qemu-devel@nongnu.org>; Sun, 28 Nov 2021 04:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ledger.fr; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jQoro6MoOyYUvAaYJa4JACu0dwvVZreQOV6JS13Ptk8=;
 b=O8oFiQ9hBBzTUG3fwHvqRw/rehQB6sfWHINy/iPzv+bnE2OAPQl6iK106Sp9ALyeb9
 lLORORU2R/exVSlwLONfqfpWwL+Kk9HB6E18RgKzpX49tb3qd9H2zW2oDEvPfDLdfw7E
 UHwSaj5eSJp0kQzs8msP/GaTdTsvvxM461KTiQOnJQ/chgfbcY5vj9M9EjyU6k6+QHta
 85RjVXRiGyyiGRU06vhtLyTtwidaubv8MAxx8ajMg8AXzDX/pKYsh8q/8GrOYaEmfiEl
 d94AuQgWVJzwgrn9iV5KTtElto1R0U3aCVl0Ef5adFI8Q+1EkdDAeLbL3RRUfCBEOBmC
 Psqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jQoro6MoOyYUvAaYJa4JACu0dwvVZreQOV6JS13Ptk8=;
 b=MJv5C8dp+lluelEAqWLYMIzSl6q7chU5oszbp0PtzVpwZAOhQJ/43nbqOURqbjSZU+
 lzjOysOAu53kqweob7A9SPbtH+SqLq3dvHvF9C9X7spMf3yEjV1Dv6yu85e/7/xsRh9/
 vwAJw1f+6MvgCdj2wBIvfy4uNvCtT9/mP6NWI9x6fawJ4CP4qXtmttnUQaAgpgU5G9cy
 9XPdt9yDYBQA+0+a0gtT2h5ap443PdQVxLAVuE/8QQG+jZPDF2jK9HZysMBjITAeAmTM
 m81FLBJZlvLa1Z2R8T03d1xCuSxwPg71ZDRTf5snA9Kp67MWoYyRN4VbCLl5IRLZHQsg
 y36Q==
X-Gm-Message-State: AOAM532USYJ7K9MEEQBz9gbNv4gfnfKjSV+wZKF8G7XAVlgmXn3vcJTz
 hhD7uhG5OzyNe80MqJrN1pVTYGWkylnAkNFM7VUK9NVGFhsPOPw10bHNzfTTXLgMVzicy2D3oda
 rkETpA3CmVKFC/D2I04Q=
X-Google-Smtp-Source: ABdhPJzUiz1it6NzEKL5qyf1c/cyMCSWnpK8b3/lpkvKdeQmiFxAey8i60PE6/9BU8c1KeYnKGjy8A==
X-Received: by 2002:a7b:c194:: with SMTP id y20mr29579780wmi.61.1638101265614; 
 Sun, 28 Nov 2021 04:07:45 -0800 (PST)
Received: from LPPS0075.home
 (2a01cb08019bba004d97cdf5dfbba74f.ipv6.abo.wanadoo.fr.
 [2a01:cb08:19b:ba00:4d97:cdf5:dfbb:a74f])
 by smtp.gmail.com with ESMTPSA id m20sm19183537wmq.11.2021.11.28.04.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 04:07:45 -0800 (PST)
From: =?UTF-8?q?Olivier=20H=C3=A9riveaux?= <olivier.heriveaux@ledger.fr>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, alistair@alistair23.me, peter.maydell@linaro.org,
 =?UTF-8?q?Olivier=20H=C3=A9riveaux?= <olivier.heriveaux@ledger.fr>
Subject: [PATCH] Fix STM32F2XX USART data register readout
Date: Sun, 28 Nov 2021 13:07:23 +0100
Message-Id: <20211128120723.4053-1-olivier.heriveaux@ledger.fr>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: permerror client-ip=2a00:1450:4864:20::32b;
 envelope-from=olivier.heriveaux@ledger.fr; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 28 Nov 2021 09:45:39 -0500
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

Fix issue where the data register may be overwritten by next character
reception before being read and returned.

Signed-off-by: Olivier H=C3=A9riveaux <olivier.heriveaux@ledger.fr>
---
 hw/char/stm32f2xx_usart.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/char/stm32f2xx_usart.c b/hw/char/stm32f2xx_usart.c
index 8df0832424..fde67f4f03 100644
--- a/hw/char/stm32f2xx_usart.c
+++ b/hw/char/stm32f2xx_usart.c
@@ -103,10 +103,11 @@ static uint64_t stm32f2xx_usart_read(void *opaque, hw=
addr addr,
         return retvalue;
     case USART_DR:
         DB_PRINT("Value: 0x%" PRIx32 ", %c\n", s->usart_dr, (char) s->usar=
t_dr);
+        retvalue =3D s->usart_dr & 0x3FF;
         s->usart_sr &=3D ~USART_SR_RXNE;
         qemu_chr_fe_accept_input(&s->chr);
         qemu_set_irq(s->irq, 0);
-        return s->usart_dr & 0x3FF;
+        return retvalue;
     case USART_BRR:
         return s->usart_brr;
     case USART_CR1:
--=20
2.17.1


--=20

Les informations contenues dans ce message =C3=A9lectronique ainsi que cell=
es=20
contenues dans les documents attach=C3=A9s sont strictement confidentielles=
 et=20
sont destin=C3=A9es =C3=A0 l'usage exclusif du (des) destinataire(s) nomm=
=C3=A9(s).
Toute=20
divulgation, distribution ou reproduction, m=C3=AAme partielle, en est=20
strictement interdite sauf autorisation =C3=A9crite et expresse de l=E2=80=
=99=C3=A9metteur.
Si vous recevez ce message par erreur, veuillez le notifier imm=C3=A9diatem=
ent =C3=A0=20
son =C3=A9metteur par retour, et le d=C3=A9truire ainsi que tous les docume=
nts qui y=20
sont attach=C3=A9s.


The information contained in this email and in any=20
document enclosed is strictly confidential and is intended solely for the=
=20
use of the individual or entity to which it is addressed.
Partial or total=20
disclosure, distribution or reproduction of its contents is strictly=20
prohibited unless expressly approved in writing by the sender.
If you have=20
received this communication in error, please notify us immediately by=20
responding to this email, and then delete the message and its attached=20
files from your system.


