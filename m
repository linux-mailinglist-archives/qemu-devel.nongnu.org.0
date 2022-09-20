Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B75685BE294
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 12:01:19 +0200 (CEST)
Received: from localhost ([::1]:39276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaa46-0005tZ-O2
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 06:01:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <281773481@qq.com>) id 1oaTLR-0005nF-Ud
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 22:50:46 -0400
Received: from out162-62-57-210.mail.qq.com ([162.62.57.210]:37477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <281773481@qq.com>) id 1oaTLM-0000Ou-0f
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 22:50:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1663642229; bh=xqAwLa180Ij1wndiihUjuYRbcbY2p1sj1PYq+aDlnkk=;
 h=From:To:Cc:Subject:Date;
 b=cpZQmgl2MzxrS7qxSJIAKIMANQ8cufqhHRRP9w9JKoxSfMOvyQJqUs3X8cBZzpVJJ
 Q8rD0l+UPm2lXg4csXgflIxWMpVsm8+/Kb29+JIHnHgdi+yIBj9sQ5+m5r7h6xUy4n
 pZm0OIOtVUyzkJUnUDsQ5eMRr6Hn6fVBqFfE8V9c=
Received: from lihonglei0300.home.langchao.com ([117.160.246.157])
 by newxmesmtplogicsvrsza7.qq.com (NewEsmtp) with SMTP
 id BCD8CCAD; Tue, 20 Sep 2022 10:47:13 +0800
X-QQ-mid: xmsmtpt1663642033tmgywmdbv
Message-ID: <tencent_647D077359960B50AA4B806516042ABCC508@qq.com>
X-QQ-XMAILINFO: Mdc3TkmnJyI/AwcHEzLZZ1mdkOBxhBvi39bbUIA3HrswSWw6SxOdAWQYEJuZcj
 YYPIRTNItUMWDmSoz2RW5L4LjPUTvM72PBQBJMvW529dOk2fbZTK5iYHxf3fTzlc9GKCqBlDhR4p
 RG8i1B8X05j2VwCpPJoOv8YYsITRw75kuRZHhkK3X/N9AAjM9fXxUtbSfnbKee6K2NCCOHPS1ae5
 vgrK8IZrH/qEbXkmyf7g74+Ww5EI/JLp/sliwvmkhoyL9r2fI4V2rwWmqFCh703J/pO8fYxy7V+n
 yqG+T7X5SnJBHGRl/SMrRzufD48wOiWKMrwnrAkVGYLeZEpDp541mAK2+yOK5oeH09kkkDG5kiJv
 ylZvtfXTK3ElQEgII7cnc4q52XhYQzseOEDYP+CAg/8vdqBIy9EX0DqlKYw3b2xVSO4VHFMRvC3j
 +BuMPtWf2P0spYNf3xZclY3ZNTDt0LzAs8nXS4O88fRVvCoKdTdudLM2S7cPKZ3jyJH860b4o4V9
 E3Kb+Oa8ts7OgLkvXwXg22989MCSFAfv7uo68FjC4yg19Ni0UEsK5YLX72YcLglAdGqqErRpGzza
 hJpKAjFp5SYUeYPlvSzCKtf+lUmWMps6xc2TkSGyUgq0QnAKsc6Z1lU6Fxgzloi3yRq9U+9pmsEj
 rHqAovTlo2QTKzwcDssgbhXIeTkaWeXUIbyHVNj//SvyJE7ljYVvkay9mPi+vaP1ofVI8w8uwEFu
 bYTyMY9Ia806frUPIt8Aqp8exhp86wftOufYrF1MGTnmJWyNIbP9qpZWgA+bbhMZXQdt5ZmSNJbl
 CvEmLkMoIY2zURKIl+x8ERGvuMLSsMnWgqDrs8FGg4Y2Fr9E4PVFYqTIi4x5yzxk3tj3VHZOvwGL
 StiWbILsR84STjH58bCLLa0rc/x06ELKqz5NZIjRfZanYM+dzpLU4YSMzMQLvjwA==
From: Hongleilee <281773481@qq.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com, eesposit@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com, laurent@vivier.eu,
 =?UTF-8?q?Hongleili=20Li=20=28=E6=9D=8E=E7=BA=A2=E7=A3=8A=29-?=
 =?UTF-8?q?=E4=BA=91=E6=95=B0=E6=8D=AE=E4=B8=AD=E5=BF=83=E9=9B=86=E5=9B=A2?=
 <lihonglei03@inspur.com>
Subject: [PATCH] This patch is to solve the problem that the bitmap file in
 memory is lost after creating a snapshot
Date: Tue, 20 Sep 2022 10:47:06 +0800
X-OQ-MSGID: <20220920024706.702-1-281773481@qq.com>
X-Mailer: git-send-email 2.37.3.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=162.62.57.210; envelope-from=281773481@qq.com;
 helo=out162-62-57-210.mail.qq.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, HELO_DYNAMIC_IPADDR=1.951, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, RDNS_DYNAMIC=0.982, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 20 Sep 2022 04:42:25 -0400
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

From: Hongleili Li (李红磊)-云数据中心集团 <lihonglei03@inspur.com>

Signed-off-by: Hongleili Li (李红磊)-云数据中心集团 <lihonglei03@inspur.com>
---
 blockdev.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/blockdev.c b/blockdev.c
index 9230888e34..a6b85d06b7 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1534,6 +1534,10 @@ static void external_snapshot_prepare(BlkActionState *common,
 
     state->new_bs = bdrv_open(new_image_file, snapshot_ref, options, flags,
                               errp);
+
+    state->new_bs->dirty_bitmaps = state->old_bs->dirty_bitmaps;
+    QLIST_INIT(&state->old_bs->dirty_bitmaps);
+
     /* We will manually add the backing_hd field to the bs later */
     if (!state->new_bs) {
         goto out;
-- 
2.37.3.windows.1


