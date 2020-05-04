Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4481C360D
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 11:49:19 +0200 (CEST)
Received: from localhost ([::1]:38896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVXiw-00079m-AC
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 05:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVXgg-0004vr-OH
 for qemu-devel@nongnu.org; Mon, 04 May 2020 05:46:58 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:20283
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVXge-0004CY-SN
 for qemu-devel@nongnu.org; Mon, 04 May 2020 05:46:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588585616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2JQqRaa3lceQY2Cox9GrAmR4rq6Pv9q/z7ys+NUFBVQ=;
 b=Pk2ccTEw5vglIQX4FMDEaCj2Vpzn0D6a61XCJ61mTt/EZ/zMH9TyNmUpXoX1LPHcl1gyyb
 DaY7YwUAbOShA35CSigWuTsibJYiR3CFNH/o7tqm8Zv+7o22OyG+otfrH58/gdnCcuKGNS
 besZCVmWXkKpSWrAx01O8Rs0/wwbPnw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-W-TUwdPGMxKHv8v_6qHizw-1; Mon, 04 May 2020 05:46:54 -0400
X-MC-Unique: W-TUwdPGMxKHv8v_6qHizw-1
Received: by mail-wm1-f70.google.com with SMTP id l21so4600008wmh.2
 for <qemu-devel@nongnu.org>; Mon, 04 May 2020 02:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sohTl/XQVWV8gUG5aVpQRD87OojC6hP3gHhZB8wVux0=;
 b=Sbu4+UDJ9XglKa2pixdrI9EtMtVpQGV4C378ccdx0HyAsvXGdy0bt1KManiFgcqb5W
 JpKX83uoPCNL1Q7MPJQD1DLhVshdUblTpPe3HnAiJMhk36i/gdiJumEkSC1/XaunAqbJ
 T6slDnKMK5X9NXehjETN4cRdERx6M+5qmckwKtkUuxQLH/1Qsw7xd+7DsXeqVFW3f0Dm
 pub/MjSXymUbJ+b07fRJX+Qt9RmO2FXUC2MexZdXb/MwP3Hjp+LltLo4ykHqISbaUqFO
 4pcwqZ5fG0XYIzHTwFuE3ZVU1ZzEFqKixx+pOkbNdxHiriA1YKV28ZgQ8S/AoEy3HxXg
 hf2A==
X-Gm-Message-State: AGi0PuZ1ZfdsPd8F8Lf4DRE29fBHX/EkjAro81hrog//5XiMxGsxFanJ
 vZNFPgnJfPxrJEe7zo4o/7gH2rNZMwu3y3RNZyV+i9AArcYcannnLgqDA4wGyIYBGw03vTUqZi7
 szJik5g/GqMmfK8c=
X-Received: by 2002:adf:d091:: with SMTP id y17mr17521117wrh.418.1588585613141; 
 Mon, 04 May 2020 02:46:53 -0700 (PDT)
X-Google-Smtp-Source: APiQypJVL4aNUKKB/YhYWDA8wYUmMElDApF8Fu0tx/nu9Hq5Z1bMOWXo/YUJSWq09CfP89GA25ffiw==
X-Received: by 2002:adf:d091:: with SMTP id y17mr17521101wrh.418.1588585612938; 
 Mon, 04 May 2020 02:46:52 -0700 (PDT)
Received: from x1w.redhat.com (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id a13sm10529403wrv.67.2020.05.04.02.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 02:46:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] qemu/bitmap: Document bitmap_new() returned pointer
Date: Mon,  4 May 2020 11:46:37 +0200
Message-Id: <20200504094641.4963-3-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200504094641.4963-1-philmd@redhat.com>
References: <20200504094641.4963-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 01:14:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Keith Busch <keith.busch@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/qemu/bitmap.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/qemu/bitmap.h b/include/qemu/bitmap.h
index 82a1d2f41f..0b390ff576 100644
--- a/include/qemu/bitmap.h
+++ b/include/qemu/bitmap.h
@@ -90,12 +90,14 @@ int slow_bitmap_intersects(const unsigned long *bitmap1=
,
                            const unsigned long *bitmap2, long bits);
 long slow_bitmap_count_one(const unsigned long *bitmap, long nbits);
=20
+/* callers must free the returned pointer with g_free() */
 static inline unsigned long *bitmap_try_new(long nbits)
 {
     long len =3D BITS_TO_LONGS(nbits) * sizeof(unsigned long);
     return g_try_malloc0(len);
 }
=20
+/* callers must free the returned pointer with g_free() */
 static inline unsigned long *bitmap_new(long nbits)
 {
     unsigned long *ptr =3D bitmap_try_new(nbits);
--=20
2.21.3


