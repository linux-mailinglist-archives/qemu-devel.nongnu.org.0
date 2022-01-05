Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFCD4856DE
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 17:52:04 +0100 (CET)
Received: from localhost ([::1]:40158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n59W6-00042M-S7
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 11:52:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3asrVYQcKCmseNWcdaNPXXPUN.LXVZNVd-MNeNUWXWPWd.XaP@flex--venture.bounces.google.com>)
 id 1n59Uo-0003Kg-5k
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 11:50:42 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=45630
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3asrVYQcKCmseNWcdaNPXXPUN.LXVZNVd-MNeNUWXWPWd.XaP@flex--venture.bounces.google.com>)
 id 1n59Um-0005rk-PJ
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 11:50:41 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 c132-20020a251c8a000000b0060c39ab7d36so54628539ybc.12
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 08:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=VuBzE8dIuy1MwqUjC3TAArH5pVL/fBClNJZpGS4Jo1M=;
 b=AdEoPLmIuK6S3CksQdhqpdcUcF4y0+BTtrvyKtD+nzjFPZMHkRLY2HyOplTfojJ3lP
 9vl+M6zKad9mdKf59PvzFL94pecTzH+z5Rak/1AC+pnZHDzrcMfUQmuX4iEGtDZzpYlF
 4Ee2E/ZR+Syon4LlHwoZ3UCT7OjYX80oYsRKBP+3gvNtPCU8nLJksxqLx4NyeSKFX1Ai
 Noc+wM/l2bHam3OZj/kOlYBzteBIvlH1QRFNj05iTJm8P8xjSOylJMkQW7t5O22/4wYe
 +CdUPugh4j0fn5hdaCwRlBx6Q/q8H9AQEMw2GuNeQgGpSJqjrzkcgQn0K4/8mWpWVf52
 ilLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=VuBzE8dIuy1MwqUjC3TAArH5pVL/fBClNJZpGS4Jo1M=;
 b=Nz6RJqqozuCsaBSQDSoHXdMQIIaqySDH3o/c2AJ/S7kMchbqx2HSWbQZDG8ki6gqQo
 1jM+/7YM7yaVjf5XrU34/BegoOZtS19+FEdrgETssCHfr28p2pByXtVuYIqY501dVvKu
 OjQFViyqo2gOX/1cpTe+iGFTAg/rId4yrKOqg2eankNGOaSUzib1SlJLobWyFUY+ORH8
 /XvMYajeO64yidXV7x3eU03vLNF1rKv0lNEBOTi3SQUgK+oxiQgIPl9kecXBeCDqyY19
 Chup/jrUqRqA1nxL+BtxP0DW4GxD1DkX+Cv7phD/QoplsLDuCh7zFBNob+E7yTAwVwBM
 tDJA==
X-Gm-Message-State: AOAM5334wHATlnQrfvS0+8N8e4xHv3NW25i3eyDZgSoTPczLiFEqrr3h
 d019XfBRXS/jIGElafUikeZgHfGEBxIr
X-Google-Smtp-Source: ABdhPJxwQMgDdoK6Z/GFdIns9VNIhlSrGMS5FXRwXsJ3lRSBHxH0kZXuVptODUKQ6gcE/L38PPgkJevtpd7V
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:9017:ad23:15fc:8efc])
 (user=venture job=sendgmr) by 2002:a25:bb07:: with SMTP id
 z7mr32198883ybg.509.1641400938394; Wed, 05 Jan 2022 08:42:18 -0800 (PST)
Date: Wed,  5 Jan 2022 08:42:14 -0800
Message-Id: <20220105164214.3381151-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH v2] net/tap: Set return code on failure
From: Patrick Venture <venture@google.com>
To: f4bug@amsat.org, jasowang@redhat.com, pefoley@google.com
Cc: qemu-devel@nongnu.org, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3asrVYQcKCmseNWcdaNPXXPUN.LXVZNVd-MNeNUWXWPWd.XaP@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

From: Peter Foley <pefoley@google.com>

Match the other error handling in this function.

Fixes: e7b347d0bf6 ("net: detect errors from probing vnet hdr flag for TAP =
devices")

Reviewed-by: Patrick Venture <venture@google.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Peter Foley <pefoley@google.com>
---
v2: Fixed commit titlewq and updated description.
---
 net/tap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/tap.c b/net/tap.c
index f716be3e3f..c5cbeaa7a2 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -900,6 +900,7 @@ int net_init_tap(const Netdev *netdev, const char *name=
,
             if (i =3D=3D 0) {
                 vnet_hdr =3D tap_probe_vnet_hdr(fd, errp);
                 if (vnet_hdr < 0) {
+                    ret =3D -1;
                     goto free_fail;
                 }
             } else if (vnet_hdr !=3D tap_probe_vnet_hdr(fd, NULL)) {
--=20
2.34.1.448.ga2b2bfdf31-goog


