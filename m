Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3A66B8B59
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 07:39:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbyIt-0004RZ-8w; Tue, 14 Mar 2023 02:38:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4300ac6ef=alistair.francis@opensource.wdc.com>)
 id 1pbyIq-0004Qs-0c
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 02:38:32 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4300ac6ef=alistair.francis@opensource.wdc.com>)
 id 1pbyIm-000208-N7
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 02:38:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1678775908; x=1710311908;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nej2fT+Gv89AaGPzZtoJCphzX030ni7No0S+4d/qB80=;
 b=eas8To3m8aXaJI9sK+vz9hKHmw5tchhN1dhjwFkqKuD/GDsC8OZZiVcj
 xxwW71LAPjt/Qjzuu59A5SUMESwVsSlJMmcQQdD/0wTpvECllL6smSepq
 WqU48GGJKMEobPXIuLeYihpyFzSUWN4dfFx7yiXnGxKNMw1f9vDrmC6IX
 j0e6S3uhkA/2tjb5huzQXIJf1F/FUoqlz6gUF4sclb6/nqXBKkH75xnhs
 kwsq2wJBzYYEXDGKrm2dyqg8mqmni7luwOjffyP+SBwzlsdNdSa5Kimp0
 N/ZbCqAUlGELxPTS4pQ5hs/jXHltAHp/AqXxaM0yu7GTpUL1S9xswWf8E w==;
X-IronPort-AV: E=Sophos;i="5.98,259,1673884800"; d="scan'208";a="225576399"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Mar 2023 14:38:24 +0800
IronPort-SDR: kjr7iOguy6hN5sYfDw5QlgwBwYtxjqADKcK318IiWwdfgqc5ckFWEtiIk/ZRC+DeVErSxgxm9r
 78nb5pxPcICo52yUzvFsNxX+P7KDCJ0aVeskxtR5zAUypxmQUwmUA0rwZ77+Geb4H10QSD/45r
 h1YRMkjvlQFW42MfvM+IQz7JiZDndzPK/39hVqj5z2LrTrgK20/cNWjjmK26tIFRKBUZthFVJ9
 fbUHWdmM1MvtJY02ZesLgil4xVVomdtUarUdsx6rokYIHZ/X4DYF1HudHn6CJxIW/V5dhV48q6
 qKs=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 22:54:52 -0700
IronPort-SDR: ucFsj9M5Was/M3i+IIvwD1U5Fd9d2F4VBTQECDhftIXeXDGlVUaqFaNqREgOgQsRYUyTF84q5S
 GAfWrhvqpCo4KufRv1PujtJ5DWYL65SrIIJuguyVWTBsnpo16lQxPxRDw3INSP9EBbnZLm+ROA
 IY1AXr9N0BzptZmdEgQ8h09kBGAmDIX1C9YFIwnvcV09Z9m6d+/OuMVt99POC2ow8bqZxKwYpp
 5HA231nKqawWO6BaUiRQ4bhSYDtDMjgg8JSZJMdhXVZseeIMZzMZ8CQzbMCFZoOnoG/mE9Klff
 /gM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 23:38:24 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PbP402nZdz1RtVv
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 23:38:24 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1678775903; x=1681367904; bh=Nej2fT+Gv89AaGPzZt
 oJCphzX030ni7No0S+4d/qB80=; b=kQDsIGATSTsxog+6zLx/IEr9fuBl8s6luX
 SxHsEmreZ8+AlRhx1hieZ/fL5Kh4HjZSzphmG4WlfTTbttbzD5FRpcUyqIeaurWa
 +VeJAjAU8XgFSJhTcKLEjv8JRIYX+/OXMSQ/8pdJ/swIz7usmJyiPyWzPXf6NdX+
 HZg98H9+/r0YIdLNUHh3cGDZ2Q0GVLa104MJYWXYlEuTKtvZKR9pOzk5iEWrmJYt
 TGx3xLTxCYZ/BnaDMGRSQVhSW125QFtVvD8sEWLBJiXIZgPoWAqeZkO1AZnypCbm
 14+Tkjp+NzRC7QCd3iq8LZOSd/KwtjUlV5hW1B1AIZ3jmjD2LHFA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id JvNltWAF9P9d for <qemu-devel@nongnu.org>;
 Mon, 13 Mar 2023 23:38:23 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.75])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PbP3y3JL9z1RtVn;
 Mon, 13 Mar 2023 23:38:22 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Ivan Klokov <ivan.klokov@syntacore.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 1/2] disas/riscv: Fix slli_uw decoding
Date: Tue, 14 Mar 2023 16:38:11 +1000
Message-Id: <20230314063812.30450-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314063812.30450-1-alistair.francis@opensource.wdc.com>
References: <20230314063812.30450-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=4300ac6ef=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Ivan Klokov <ivan.klokov@syntacore.com>

The decoding of the slli_uw currently contains decoding
error: shamt part of opcode has six bits, not five.

Fixes 3de1fb71("target/riscv: update disas.c for xnor/orn/andn and slli.u=
w")

Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
Reviewed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230227090228.17117-1-ivan.klokov@syntacore.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 disas/riscv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 54455aaaa8..2aca11b90e 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -1647,7 +1647,7 @@ const rv_opcode_data opcode_data[] =3D {
     { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "ctzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "cpopw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
-    { "slli.uw", rv_codec_i_sh5, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
+    { "slli.uw", rv_codec_i_sh6, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
     { "add.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
     { "rolw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
     { "rorw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
@@ -2617,10 +2617,10 @@ static void decode_inst_opcode(rv_decode *dec, rv=
_isa isa)
             switch (((inst >> 12) & 0b111)) {
             case 0: op =3D rv_op_addiw; break;
             case 1:
-                switch (((inst >> 25) & 0b1111111)) {
+                switch (((inst >> 26) & 0b111111)) {
                 case 0: op =3D rv_op_slliw; break;
-                case 4: op =3D rv_op_slli_uw; break;
-                case 48:
+                case 2: op =3D rv_op_slli_uw; break;
+                case 24:
                     switch ((inst >> 20) & 0b11111) {
                     case 0b00000: op =3D rv_op_clzw; break;
                     case 0b00001: op =3D rv_op_ctzw; break;
--=20
2.39.2


