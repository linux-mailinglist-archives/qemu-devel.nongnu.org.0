Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 517126D399C
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 19:59:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pj1wg-0006rq-SE; Sun, 02 Apr 2023 13:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1wc-0006p9-Lr
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:56:46 -0400
Received: from mout.web.de ([212.227.17.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1wa-00046U-0B
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:56:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1680458200; i=lukasstraub2@web.de;
 bh=gakdj9MuRP2kmr9tpcbl0VTtVwaDkY+EO+nYuW3YLiU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=wZ2EK//+zMH1zYWQeTcdkSwoRy5mf9Xrojkp6kIXhcLtwNtakCkKZT2+LSEY8EETE
 Nj6K8V/IOKNqjLprDFriAk0Lcw9NkdYdtVAYYFCGWJOrlr6nh08h71JnuKJ6eeJoGT
 IS/kv4u/jOienfRoM/VXsgeutHxrtVm+ic+rTAMK88kopDGbDmWBqSfRHyruLD+Icq
 Vxsnp2yNGMh9RJ1oi8Mc5u6yvKI6PFND96ZhzfbfY4ISnfDP3i9WMm8O9PMSf2J2NW
 aaiqdxOPKJ6T6yMWLHLCbGSUMU7XlfbvY2Src9vnDKyH2bCeDTWH58UTglz0qWUhyp
 WZwj9tB2fhgHw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.111]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MA4bA-1pYct80bAg-00By3I; Sun, 02
 Apr 2023 19:56:40 +0200
Date: Sun, 2 Apr 2023 17:56:39 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PATCH 11/14] ram compress: Assert that the file buffer matches the
 result
Message-ID: <929d6df4337b8a206cfbc201b5d350a324d66b02.1680457764.git.lukasstraub2@web.de>
In-Reply-To: <cover.1680457764.git.lukasstraub2@web.de>
References: <cover.1680457764.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ue_U6aUdgYxVII2sSJ3SJAm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:5gSpBR/4RVf4RiBuFq1kJjb403pqUxpInx8MPhGiHXPrlbSJj3/
 /TQ+TodjwiKKvklzd6xVKrKU2cB1/djRpqz0Nw2wkQS7OmHHDv7M3w40I4AjkPb8obwH4ao
 UzRQiV3E0bfD53w3RtGtuwGMrRUsHXJQwQrw5MP8oK+GeZ/aaiIFm7JDDouXsNaBZCTzh/m
 y+7NIECErIARoTxoD/qVg==
UI-OutboundReport: notjunk:1;M01:P0:DHDwzci6qds=;oN6s4vYFEsetkXpiGPmORZ+Ikmc
 w/l2j/XEj1WYyOsHPhKBO7sQhCqV6Zr7jo64TZ65T/Q+jS9niCNSiI+XWcQCWBZHl/q4PCscW
 9dMEjrnNTYhNd5tSFhPHPt02T2Lg5QFkub7/U1XCMcrzfpqifWIYQHYFDHQCgQYUtgqMA6rU6
 Mh3/zKm49Jax/C+3LZgJiKUfKBOFAc8L2AZNt/AQHOESHOuu3UnaaWOGXL69WehlRyPBbmejv
 3wBWyyXOpXh1f1CLSbSYhT+qPzHY0dsLCM0TOAYl21yWnmKDuXUm3qXBl9WdeqsHTZLMPqxWo
 AtuzWS2M1OP6Pr1VAS6WAFNOyXIppQ0aguqoitqqxyPk4+XQfef5W8cKX2ZkhaqaDFIRlhmGt
 79OmeotdSIgWGUo0M+cKWjYLAuS8fOlKOB+ph3Gd3Qapb48QI2pmwZG7j5AQOiIw0C+b01QPX
 bEzhlNHvMXYTzx7IfF15ihIgaAeB+6ZpK0dGOCdpOhTxHge0jkQrxlDSggEvPyPOPv9x8BBC+
 LUk0j+zuUMA27L8mqpZBpfSOD9i/v4zPPaj56kjTfg90ePOFOj039lYSGx05SIYos31TW8soe
 g3zcQRozJhtko/XLbS5/+FASM55VpxXKBnVSHrAEzlFpH5XK8zkkNWSs6erkYC4JG8sOk9Y0v
 fTtJkiMgH5ZXFg5fV5HTEhmN4HkBLm3/dlh/zs6Z8MWEW6S6Nf+YEVA7cwIgepaKW3S/PwwKX
 59d+jgTHJhAGxHRLkVZM7srMxaKkkbM9J6+IdiPH+xtoS3wTyDEH3GrqTSHrUPvRj34iKOFBB
 NTulDia63BczFY1TVv5NtdRiS7aYQ9BZ/vhExCdwa18i09rX5Th3Gpa5oSZs936de9XfxQnbd
 FuZFrVg5QJG3TP8eKhcXJ5FsJFgTKPNK5r4w1XDHzPJG0ooSTFMJVG3SOADrDs08HPjpCiIy3
 OEUp47T4MGLu33YInHm7FWRPGeI=
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

--Sig_/Ue_U6aUdgYxVII2sSJ3SJAm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Before this series, "nothing to send" was handled by the file buffer
being empty. Now it is tracked via param->result.

Assert that the file buffer state matches the result.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/qemu-file.c    | 11 +++++++++++
 migration/qemu-file.h    |  1 +
 migration/ram-compress.c |  5 +++++
 migration/ram.c          |  2 ++
 4 files changed, 19 insertions(+)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 102ab3b439..2b3f3f8549 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -887,6 +887,17 @@ int qemu_put_qemu_file(QEMUFile *f_des, QEMUFile *f_sr=
c)
     return len;
 }

+/*
+ * Check if the writable buffer is empty
+ */
+
+bool qemu_file_buffer_empty(QEMUFile *file)
+{
+    assert(qemu_file_is_writable(file));
+
+    return !file->iovcnt;
+}
+
 /*
  * Get a string whose length is determined by a single preceding byte
  * A preallocated 256 byte buffer must be passed in.
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index 9d0155a2a1..15e5f189f0 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -113,6 +113,7 @@ size_t qemu_get_buffer_in_place(QEMUFile *f, uint8_t **=
buf, size_t size);
 ssize_t qemu_put_compression_data(QEMUFile *f, z_stream *stream,
                                   const uint8_t *p, size_t size);
 int qemu_put_qemu_file(QEMUFile *f_des, QEMUFile *f_src);
+bool qemu_file_buffer_empty(QEMUFile *file);

 /*
  * Note that you can only peek continuous bytes from where the current poi=
nter
diff --git a/migration/ram-compress.c b/migration/ram-compress.c
index f75b8c3079..b75a9d2b9a 100644
--- a/migration/ram-compress.c
+++ b/migration/ram-compress.c
@@ -193,6 +193,8 @@ static CompressResult do_compress_ram_page(QEMUFile *f,=
 z_stream *stream,
     uint8_t *p =3D block->host + offset;
     int ret;

+    assert(qemu_file_buffer_empty(f));
+
     if (buffer_is_zero(p, TARGET_PAGE_SIZE)) {
         return RES_ZEROPAGE;
     }
@@ -207,6 +209,7 @@ static CompressResult do_compress_ram_page(QEMUFile *f,=
 z_stream *stream,
     if (ret < 0) {
         qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
         error_report("compressed data failed!");
+        qemu_fflush(f);
         return RES_NONE;
     }
     return RES_COMPRESS;
@@ -238,6 +241,7 @@ void flush_compressed_data(int (send_queued_data(Compre=
ssParam *)))
         if (!comp_param[idx].quit) {
             CompressParam *param =3D &comp_param[idx];
             send_queued_data(param);
+            assert(qemu_file_buffer_empty(param->file));
             compress_reset_result(param);
         }
         qemu_mutex_unlock(&comp_param[idx].mutex);
@@ -267,6 +271,7 @@ retry:
             qemu_mutex_lock(&param->mutex);
             param->done =3D false;
             send_queued_data(param);
+            assert(qemu_file_buffer_empty(param->file));
             compress_reset_result(param);
             set_compress_params(param, block, offset);

diff --git a/migration/ram.c b/migration/ram.c
index 5a2486bf89..7a8f540737 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1333,11 +1333,13 @@ static int send_queued_data(CompressParam *param)
     assert(block =3D=3D pss->last_sent_block);

     if (param->result =3D=3D RES_ZEROPAGE) {
+        assert(qemu_file_buffer_empty(param->file));
         len +=3D save_page_header(pss, file, block, offset | RAM_SAVE_FLAG=
_ZERO);
         qemu_put_byte(file, 0);
         len +=3D 1;
         ram_release_page(block->idstr, offset);
     } else if (param->result =3D=3D RES_COMPRESS) {
+        assert(!qemu_file_buffer_empty(param->file));
         len +=3D save_page_header(pss, file, block,
                                 offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
         len +=3D qemu_put_qemu_file(file, param->file);
--
2.30.2


--Sig_/Ue_U6aUdgYxVII2sSJ3SJAm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmQpwdcACgkQNasLKJxd
sliPpBAAka4G4s/gcW/BUFJEuk63gSwILUsdb6wDNoCEpbpGFO4AFvqk3l7MW8He
bauem+2LjknCEsA2nV3GQKPqFRaLz8KlQFcerljbOwrf2O+jwaObc+znG9FHJXfJ
fciKJqAzsJttU1cMcWVcbQ0v7Wde6QIlrT2RMCW2EvGrVCKL6o4r9eHtjP5SIHJl
/2f0OizfcDQofeO1lZlEfP4c5Te6i84b61p90kOjcwxuV+mRs8vWEJ9XuUKf+yAH
jZhyVe8Cnye0uraFzsjPSVOeVy6tdHs//3Djb1s4NMMR6s1Fyg/AwtRxEOGTbVHa
g1n+EuTVZYndXW0BVe0EHXcm7GWzAQwXpipHPufWBM3VvPNlG8wQ4FV4U/KwrpN0
lroKWjbZOoG8/Ns6kPCvkLdYI00d4ox28TpjCtk+duknuBvtSzKIABDS7uztRI0z
pLf8fInkKOzwhOVFEWlQSNzXkGxuz2XQ0q2SfUnw/GZSynKCWkB2Mxvq7Oe8YaJw
UL07l0YObgEWxax8rEQz9uoVjFlDwONBfM5jk5p68v3zR4gXA+oy7h/bQfxGxtid
8K8wCn7/5qxZ/NaXTSutSnp+SYC44l2qrMX5/PyNy+pc5PcR0EFDAw1zBZVqOQNc
pd8HwQvLF0a16bA1cjp86ZRsog7gjNobRWu6m0a6dym2/PE9Vas=
=j9gj
-----END PGP SIGNATURE-----

--Sig_/Ue_U6aUdgYxVII2sSJ3SJAm--

