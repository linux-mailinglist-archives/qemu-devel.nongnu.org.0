Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A620E514192
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 06:51:21 +0200 (CEST)
Received: from localhost ([::1]:40948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkIbA-0008DF-MK
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 00:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIJC-0008Ks-ET
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:32:46 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:13536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIJ9-0002Wc-Qi
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:32:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651206763; x=1682742763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QdXbN33yRfQnUooiux91yowqwo/6KGT7NOi+NgkEh9A=;
 b=Y+R8WPt23Bv7d/uu8Aiqe0U1VvIqrv/4rngFVBo/8dgoeRfDQ2ZSr8+E
 c0aQ7uf1+U/8SHS6tqAdmZR7Kn/qemgyD3/xDVECebgt+PYZqyNhd4McE
 BIz1GZsCxWsLlbPKFo7CtWDkS8GArRyX+HJ+ZIppRaLtZQh6kFyP49qVe
 Ps/TOlJTR1IK5WCHzL54aZ+eRGRa9LGgoRo3orDGX7pMaWv36xRJDaJRK
 +SVgkfmiBF6ihsI0DMA6jsUcaXtbt59yUXJ9EXF3GO+DAg/XEi8UnjNQ4
 Y1Th7SMvosDgsXmaUnWCEeIGtJ1gtevhwHWddOJ5YJ+pbFB9xxv0u77lb w==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647273600"; d="scan'208";a="203995974"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Apr 2022 12:32:30 +0800
IronPort-SDR: gzr+m5brjs6R8B2SXIvYV9OEbbsjT7LF3s6PtXdZVAijTY3PluTsq+nkwbuKYVNQJleGQpMhat
 v0hGgaquT+hVvejIdmknSb6kv3mCAUeXXVa9Ov4qPP4grHQBystvBGLugkzXcVTAfAALrPA6sP
 9moomeV/Dxt5J+YUyUSiNYFVqC55iBmj4vJmqQg/q4QqWwzZSqVzbM7e8MBjXHZqW5J+e8fPoW
 M5nFtNdTfe+wvUVAggdb3BOLpfZ0HwmhY7LUkiliFozi5XsNq/EZDULA0C6hqJBpMyjxM2In2w
 aYOZVKxWTTxRPn1QLUX4ZCzC
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:02:40 -0700
IronPort-SDR: yHGpYQ38cbndO7dNT8gdI9d5WPCDXgJMaFgsdYZHA5dSTNo7eJQvRo5cCW9XkIABNUgqkXDzDi
 LC53EWWcgQ2CRAZKuEOfVvgYHJqwxkrt2c2ZdBBd8pORkiexh2OscBGy2L5Ii5lsqwotaPmRlu
 fJe9wsoAigLAWvrA5CeQU+lb8CVCGtde8YYtssV/aaNoQ0GT0kxTEC4/WWkThssYf3tfRVj6dM
 mp7wpWVxppcC8jqNDg/Ovo4JHKaRPTPpDNLToOFfXvyRrJDTZslpAiEtHBcPbN9d3tcWA54ed7
 mCM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:32:32 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KqKMz51PBz1SVp2
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 21:32:31 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651206750; x=1653798751; bh=QdXbN33yRfQnUooiux
 91yowqwo/6KGT7NOi+NgkEh9A=; b=DgP/3OWRVp4QfGo7qqAvJIl1Rua8V8xeUY
 usOspUgPDlkZaWcCyN2bSz6VmgHDzoZZ1XEyKRy+KqKtb3gUopssiDoxwIEhNN70
 TDjtexaps1ax9ii8t2dr5PQTUXXlrYg6By6C0yBTuHdNNWE3l7vwhrSDGBgKDrUv
 YtEVUiXKen305hWeIvnkI2ow+HTaXhbRdnd4NvT8y1N/AjrktgWMnAMTjM/hOmhz
 C2MRZv+/t5xm8LtpIwJTqyUFn6Zm7fpGEd/N92UgTlnW8T9QRd3eE4+FUV9zjR8A
 u+cYfxk6x69TXH+K6qzgbzVm3YV3hwmXF1cU/UvQlaSWIIWZpK0A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id hJPiScWH1ge4 for <qemu-devel@nongnu.org>;
 Thu, 28 Apr 2022 21:32:30 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KqKMv3YSzz1Rvlc;
 Thu, 28 Apr 2022 21:32:27 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Ruibo Lu <luruibo2000@163.com>, Zewen Ye <lustrew@foxmail.com>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 16/25] disas/riscv.c: rvk: add disas support for Zbk* and Zk*
 instructions
Date: Fri, 29 Apr 2022 14:31:10 +1000
Message-Id: <20220429043119.1478881-17-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
References: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=111bf31fc=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

Co-authored-by: Ruibo Lu <luruibo2000@163.com>
Co-authored-by: Zewen Ye <lustrew@foxmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220423023510.30794-14-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 disas/riscv.c | 173 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 172 insertions(+), 1 deletion(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 03c8dc9961..7af6afc8fa 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -156,6 +156,8 @@ typedef enum {
     rv_codec_css_swsp,
     rv_codec_css_sdsp,
     rv_codec_css_sqsp,
+    rv_codec_k_bs,
+    rv_codec_k_rnum,
 } rv_codec;
=20
 typedef enum {
@@ -521,6 +523,43 @@ typedef enum {
     rv_op_bclr =3D 359,
     rv_op_binv =3D 360,
     rv_op_bext =3D 361,
+    rv_op_aes32esmi =3D 362,
+    rv_op_aes32esi =3D 363,
+    rv_op_aes32dsmi =3D 364,
+    rv_op_aes32dsi =3D 365,
+    rv_op_aes64ks1i =3D 366,
+    rv_op_aes64ks2 =3D 367,
+    rv_op_aes64im =3D 368,
+    rv_op_aes64esm =3D 369,
+    rv_op_aes64es =3D 370,
+    rv_op_aes64dsm =3D 371,
+    rv_op_aes64ds =3D 372,
+    rv_op_sha256sig0 =3D 373,
+    rv_op_sha256sig1 =3D 374,
+    rv_op_sha256sum0 =3D 375,
+    rv_op_sha256sum1 =3D 376,
+    rv_op_sha512sig0 =3D 377,
+    rv_op_sha512sig1 =3D 378,
+    rv_op_sha512sum0 =3D 379,
+    rv_op_sha512sum1 =3D 380,
+    rv_op_sha512sum0r =3D 381,
+    rv_op_sha512sum1r =3D 382,
+    rv_op_sha512sig0l =3D 383,
+    rv_op_sha512sig0h =3D 384,
+    rv_op_sha512sig1l =3D 385,
+    rv_op_sha512sig1h =3D 386,
+    rv_op_sm3p0 =3D 387,
+    rv_op_sm3p1 =3D 388,
+    rv_op_sm4ed =3D 389,
+    rv_op_sm4ks =3D 390,
+    rv_op_brev8 =3D 391,
+    rv_op_pack =3D 392,
+    rv_op_packh =3D 393,
+    rv_op_packw =3D 394,
+    rv_op_unzip =3D 395,
+    rv_op_zip =3D 396,
+    rv_op_xperm4 =3D 397,
+    rv_op_xperm8 =3D 398,
 } rv_op;
=20
 /* structures */
@@ -540,6 +579,8 @@ typedef struct {
     uint8_t   succ;
     uint8_t   aq;
     uint8_t   rl;
+    uint8_t   bs;
+    uint8_t   rnum;
 } rv_decode;
=20
 typedef struct {
@@ -615,6 +656,8 @@ static const char rv_freg_name_sym[32][5] =3D {
 #define rv_fmt_rd_rs2                 "O\t0,2"
 #define rv_fmt_rs1_offset             "O\t1,o"
 #define rv_fmt_rs2_offset             "O\t2,o"
+#define rv_fmt_rs1_rs2_bs             "O\t1,2,b"
+#define rv_fmt_rd_rs1_rnum            "O\t0,1,n"
=20
 /* pseudo-instruction constraints */
=20
@@ -766,6 +809,7 @@ static const rv_comp_data rvcp_csrrw[] =3D {
     { rv_op_illegal, NULL }
 };
=20
+
 static const rv_comp_data rvcp_csrrs[] =3D {
     { rv_op_rdcycle, rvcc_rdcycle },
     { rv_op_rdtime, rvcc_rdtime },
@@ -1203,6 +1247,43 @@ const rv_opcode_data opcode_data[] =3D {
     { "bclr", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
     { "binv", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
     { "bext", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "aes32esmi", rv_codec_k_bs, rv_fmt_rs1_rs2_bs, NULL, 0, 0, 0 },
+    { "aes32esi", rv_codec_k_bs, rv_fmt_rs1_rs2_bs, NULL, 0, 0, 0 },
+    { "aes32dsmi", rv_codec_k_bs, rv_fmt_rs1_rs2_bs, NULL, 0, 0, 0 },
+    { "aes32dsi", rv_codec_k_bs, rv_fmt_rs1_rs2_bs, NULL, 0, 0, 0 },
+    { "aes64ks1i", rv_codec_k_rnum,  rv_fmt_rd_rs1_rnum, NULL, 0, 0, 0 }=
,
+    { "aes64ks2", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "aes64im", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0 },
+    { "aes64esm", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "aes64es", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "aes64dsm", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "aes64ds", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sha256sig0", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0 },
+    { "sha256sig1", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0 },
+    { "sha256sum0", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0 },
+    { "sha256sum1", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0 },
+    { "sha512sig0", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sha512sig1", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sha512sum0", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sha512sum1", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sha512sum0r", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sha512sum1r", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sha512sig0l", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sha512sig0h", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sha512sig1l", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sha512sig1h", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sm3p0", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0 },
+    { "sm3p1", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0 },
+    { "sm4ed", rv_codec_k_bs, rv_fmt_rs1_rs2_bs, NULL, 0, 0, 0 },
+    { "sm4ks", rv_codec_k_bs, rv_fmt_rs1_rs2_bs, NULL, 0, 0, 0 },
+    { "brev8", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "pack", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "packh", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "packw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "unzip", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "zip", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "xperm4", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "xperm8", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 }
 };
=20
 /* CSR names */
@@ -1216,6 +1297,7 @@ static const char *csr_name(int csrno)
     case 0x0003: return "fcsr";
     case 0x0004: return "uie";
     case 0x0005: return "utvec";
+    case 0x0015: return "seed";
     case 0x0040: return "uscratch";
     case 0x0041: return "uepc";
     case 0x0042: return "ucause";
@@ -1594,7 +1676,36 @@ static void decode_inst_opcode(rv_decode *dec, rv_=
isa isa)
             case 1:
                 switch (((inst >> 27) & 0b11111)) {
                 case 0b00000: op =3D rv_op_slli; break;
+                case 0b00001:
+                    switch (((inst >> 20) & 0b1111111)) {
+                    case 0b0001111: op =3D rv_op_zip; break;
+                    }
+                    break;
+                case 0b00010:
+                    switch (((inst >> 20) & 0b1111111)) {
+                    case 0b0000000: op =3D rv_op_sha256sum0; break;
+                    case 0b0000001: op =3D rv_op_sha256sum1; break;
+                    case 0b0000010: op =3D rv_op_sha256sig0; break;
+                    case 0b0000011: op =3D rv_op_sha256sig1; break;
+                    case 0b0000100: op =3D rv_op_sha512sum0; break;
+                    case 0b0000101: op =3D rv_op_sha512sum1; break;
+                    case 0b0000110: op =3D rv_op_sha512sig0; break;
+                    case 0b0000111: op =3D rv_op_sha512sig1; break;
+                    case 0b0001000: op =3D rv_op_sm3p0; break;
+                    case 0b0001001: op =3D rv_op_sm3p1; break;
+                    }
+                    break;
                 case 0b00101: op =3D rv_op_bseti; break;
+                case 0b00110:
+                    switch (((inst >> 20) & 0b1111111)) {
+                    case 0b0000000: op =3D rv_op_aes64im; break;
+                    default:
+                        if (((inst >> 24) & 0b0111) =3D=3D 0b001) {
+                            op =3D rv_op_aes64ks1i;
+                        }
+                        break;
+                     }
+                     break;
                 case 0b01001: op =3D rv_op_bclri; break;
                 case 0b01101: op =3D rv_op_binvi; break;
                 case 0b01100:
@@ -1615,13 +1726,20 @@ static void decode_inst_opcode(rv_decode *dec, rv=
_isa isa)
             case 5:
                 switch (((inst >> 27) & 0b11111)) {
                 case 0b00000: op =3D rv_op_srli; break;
+                case 0b00001:
+                    switch (((inst >> 20) & 0b1111111)) {
+                    case 0b0001111: op =3D rv_op_unzip; break;
+                    }
+                    break;
                 case 0b00101: op =3D rv_op_orc_b; break;
                 case 0b01000: op =3D rv_op_srai; break;
                 case 0b01001: op =3D rv_op_bexti; break;
                 case 0b01100: op =3D rv_op_rori; break;
                 case 0b01101:
                     switch ((inst >> 20) & 0b1111111) {
+                    case 0b0011000: op =3D rv_op_rev8; break;
                     case 0b0111000: op =3D rv_op_rev8; break;
+                    case 0b0000111: op =3D rv_op_brev8; break;
                     }
                     break;
                 }
@@ -1742,8 +1860,11 @@ static void decode_inst_opcode(rv_decode *dec, rv_=
isa isa)
             case 36:
                 switch ((inst >> 20) & 0b11111) {
                 case 0: op =3D rv_op_zext_h; break;
+                default: op =3D rv_op_pack; break;
                 }
                 break;
+            case 39: op =3D rv_op_packh; break;
+
             case 41: op =3D rv_op_clmul; break;
             case 42: op =3D rv_op_clmulr; break;
             case 43: op =3D rv_op_clmulh; break;
@@ -1755,6 +1876,12 @@ static void decode_inst_opcode(rv_decode *dec, rv_=
isa isa)
             case 132: op =3D rv_op_sh2add; break;
             case 134: op =3D rv_op_sh3add; break;
             case 161: op =3D rv_op_bset; break;
+            case 162: op =3D rv_op_xperm4; break;
+            case 164: op =3D rv_op_xperm8; break;
+            case 200: op =3D rv_op_aes64es; break;
+            case 216: op =3D rv_op_aes64esm; break;
+            case 232: op =3D rv_op_aes64ds; break;
+            case 248: op =3D rv_op_aes64dsm; break;
             case 256: op =3D rv_op_sub; break;
             case 260: op =3D rv_op_xnor; break;
             case 261: op =3D rv_op_sra; break;
@@ -1762,9 +1889,24 @@ static void decode_inst_opcode(rv_decode *dec, rv_=
isa isa)
             case 263: op =3D rv_op_andn; break;
             case 289: op =3D rv_op_bclr; break;
             case 293: op =3D rv_op_bext; break;
+            case 320: op =3D rv_op_sha512sum0r; break;
+            case 328: op =3D rv_op_sha512sum1r; break;
+            case 336: op =3D rv_op_sha512sig0l; break;
+            case 344: op =3D rv_op_sha512sig1l; break;
+            case 368: op =3D rv_op_sha512sig0h; break;
+            case 376: op =3D rv_op_sha512sig1h; break;
             case 385: op =3D rv_op_rol; break;
-            case 386: op =3D rv_op_ror; break;
+            case 389: op =3D rv_op_ror; break;
             case 417: op =3D rv_op_binv; break;
+            case 504: op =3D rv_op_aes64ks2; break;
+            }
+            switch ((inst >> 25) & 0b0011111) {
+            case 17: op =3D rv_op_aes32esi; break;
+            case 19: op =3D rv_op_aes32esmi; break;
+            case 21: op =3D rv_op_aes32dsi; break;
+            case 23: op =3D rv_op_aes32dsmi; break;
+            case 24: op =3D rv_op_sm4ed; break;
+            case 26: op =3D rv_op_sm4ks; break;
             }
             break;
         case 13: op =3D rv_op_lui; break;
@@ -1782,6 +1924,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
sa isa)
             case 36:
                 switch ((inst >> 20) & 0b11111) {
                 case 0: op =3D rv_op_zext_h; break;
+                default: op =3D rv_op_packw; break;
                 }
                 break;
             case 130: op =3D rv_op_sh1add_uw; break;
@@ -2374,6 +2517,16 @@ static uint32_t operand_cimmq(rv_inst inst)
         ((inst << 57) >> 62) << 6;
 }
=20
+static uint32_t operand_bs(rv_inst inst)
+{
+    return (inst << 32) >> 62;
+}
+
+static uint32_t operand_rnum(rv_inst inst)
+{
+    return (inst << 40) >> 60;
+}
+
 /* decode operands */
=20
 static void decode_inst_operands(rv_decode *dec)
@@ -2653,6 +2806,16 @@ static void decode_inst_operands(rv_decode *dec)
         dec->rs2 =3D operand_crs2(inst);
         dec->imm =3D operand_cimmsqsp(inst);
         break;
+    case rv_codec_k_bs:
+        dec->rs1 =3D operand_rs1(inst);
+        dec->rs2 =3D operand_rs2(inst);
+        dec->bs =3D operand_bs(inst);
+        break;
+    case rv_codec_k_rnum:
+        dec->rd =3D operand_rd(inst);
+        dec->rs1 =3D operand_rs1(inst);
+        dec->rnum =3D operand_rnum(inst);
+        break;
     };
 }
=20
@@ -2812,6 +2975,14 @@ static void format_inst(char *buf, size_t buflen, =
size_t tab, rv_decode *dec)
         case ')':
             append(buf, ")", buflen);
             break;
+        case 'b':
+            snprintf(tmp, sizeof(tmp), "%d", dec->bs);
+            append(buf, tmp, buflen);
+            break;
+        case 'n':
+            snprintf(tmp, sizeof(tmp), "%d", dec->rnum);
+            append(buf, tmp, buflen);
+            break;
         case '0':
             append(buf, rv_ireg_name_sym[dec->rd], buflen);
             break;
--=20
2.35.1


