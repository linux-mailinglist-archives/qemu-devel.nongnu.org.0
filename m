Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AADB334A0A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 22:47:43 +0100 (CET)
Received: from localhost ([::1]:51438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK6gA-0005I6-KT
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 16:47:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6dt-00034a-5X; Wed, 10 Mar 2021 16:45:21 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:52493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6do-0004K4-LT; Wed, 10 Mar 2021 16:45:20 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M2ON6-1lJXsO2DrK-003sHO; Wed, 10 Mar 2021 22:45:10 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 02/22] scsi: Silence gcc warning
Date: Wed, 10 Mar 2021 22:44:44 +0100
Message-Id: <20210310214504.1183162-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310214504.1183162-1-laurent@vivier.eu>
References: <20210310214504.1183162-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:j0OO5MDcVpq8axh+nn2BTPGKAWe0+9NM9lxKyWMAudwcOS60I4h
 Xlmy1yLfDIRwJyWVp7xFLkc+reDMgjadXZqqv2hX4vjBvoUK88laPv636KwQFqzxvEyuj3j
 8V+Wd+J9pTkptAcxQMPLkRgXx4JE8tghKA17nOWRwVy6aHqpp8W5NSsFDK1ZsQQH1NWCFjn
 I/Ckep1YBBsUC9W+r2B8A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yjP3yKyM5ho=:Hmq1W6r40TJcTvpwHxdbSf
 10xMD8ykidQGhVoN0dwUydYyACziaeq4qqVI6ehMQKOyB2StULe0y1sjCq/lGo/CcbjbH3xHo
 Zxfei/4zQogCQF8iFcFdy/KLwSMfjMD2JAvPMzgZGJ+ejI5ebGH3P18s2AHOFb4hsYEYtr1ga
 crLixjwHr0bfPFucncVkk1oFAz3i6MPy0smTxdQhVF4PIosCGaidwPLMtc79jSNQn+Q6JCWEg
 /XRmPE0iDfb7naU2Vd/OIroOMCG/rHEyKsksRcyU6uGBvARyf5JESKynGRH6//NM6G1/Td3Se
 geGouqmaJiuZJvrDXI/SBqu56V/34539bvgiglZUcPISNtV0VeSYf9hs8VB+AbDaPFDiu8vbO
 jwBrbWZ/ZCbyiai/Gy04MBDlfyNy3gbPmDOQYGHK16VsoyfQayW6kyhSEQ7snbNYp5WTyyiQx
 5MNs0B1D6Q==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Blake <eblake@redhat.com>

On Fedora 33, gcc 10.2.1 notes that scsi_cdb_length(buf) can set
len==-1, which in turn overflows g_malloc():

[5/5] Linking target qemu-system-x86_64
In function ‘scsi_disk_new_request_dump’,
    inlined from ‘scsi_new_request’ at ../hw/scsi/scsi-disk.c:2608:9:
../hw/scsi/scsi-disk.c:2582:19: warning: argument 1 value ‘18446744073709551612’ exceeds maximum object size 9223372036854775807 [-Walloc-size-larger-than=]
 2582 |     line_buffer = g_malloc(len * 5 + 1);
      |                   ^

Silence it with a decent assertion, since we only convert a buffer to
bytes when we have a valid cdb length.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210209152350.207958-1-eblake@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/scsi/scsi-disk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index bd7103cd0e8a..2eaea7e637d8 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2565,6 +2565,7 @@ static void scsi_disk_new_request_dump(uint32_t lun, uint32_t tag, uint8_t *buf)
     int len = scsi_cdb_length(buf);
     char *line_buffer, *p;
 
+    assert(len > 0 && len <= 16);
     line_buffer = g_malloc(len * 5 + 1);
 
     for (i = 0, p = line_buffer; i < len; i++) {
-- 
2.29.2


