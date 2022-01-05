Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BAF4856D4
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 17:47:25 +0100 (CET)
Received: from localhost ([::1]:34602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n59Rc-0008Jk-0z
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 11:47:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3D8vVYQcKChIDw5BC9wy66y3w.u648w4C-vwDw3565y5C.69y@flex--venture.bounces.google.com>)
 id 1n59Pk-0007bv-VS
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 11:45:32 -0500
Received: from [2607:f8b0:4864:20::b49] (port=39859
 helo=mail-yb1-xb49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3D8vVYQcKChIDw5BC9wy66y3w.u648w4C-vwDw3565y5C.69y@flex--venture.bounces.google.com>)
 id 1n59Ph-0002xb-N5
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 11:45:27 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 k130-20020a255688000000b0060c3dcae580so53300781ybb.6
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 08:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=VuBzE8dIuy1MwqUjC3TAArH5pVL/fBClNJZpGS4Jo1M=;
 b=kJ9m0oHuPSaHBZTczuXTuiV9ifwWPHsR1KfwqFy3L3xKirr2J3UqonkHHw5OmU/Znj
 YEq7LBl1tXka2NioblDvTGWibsZuCz9iBvP1ve8Qk/aK+Vv5Os4b1twJIMit+40hSuZK
 4bhjpoVmPvhGhxUIKikGqyHGzn2uiUqUdAowJy9af5heoOaZU9iif4YRuKfXpHOps2K3
 DPPl48haYHaUgMWX6Y/nKTLLcdOqncMfjTClLR/xkaZGvRmPQtQUTdk8ONsSqONa7deV
 Wf994fFZ/15kD11riyVLvgFAR680CIKD/Fq6RtIDh2oDZycSCaYGYLuPn5yFKxfEguLH
 xFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=VuBzE8dIuy1MwqUjC3TAArH5pVL/fBClNJZpGS4Jo1M=;
 b=lHlrCfoPFO7sjsQjKn8ZjESy5S0F6YDteoZnHZHK0MSUs4MqoiLgektGflhOUMpcB4
 /Bndhr7I2Le59qzKONV4y8Ei5NQo/lhsiJ2h3KBD/smJSM1numjUrlj60PJYfTPvqV/a
 gXcBc9QwnmkgYofofv6vEpQGghqcqzj38q3ChCN3/KuCijFGtC38e+dyu2Rfag0MWa49
 FRiSUNw5pRHdWv0ebBDT6a/hGRQ5EbVUGL51BPyHugmP1zoTX4Xwsyv+lc7Ik93j+hVd
 +w+ONDSje73fJZAZMTG0fuJ1pC4fMnXTBl4FKHZLI4D0TeuWsECL6VSZVz7llDP8WTuD
 HTVw==
X-Gm-Message-State: AOAM532TXpGodcbUNHccTIp3M9AAVNH39OJbR90Dw63Td++2V0REp1t4
 EP2/0CjQhzgTOeX80BuysGMff4d+ndrd
X-Google-Smtp-Source: ABdhPJwyg20JHn/7CwNbroWazfNBynzbONNKK9QbLgOfbpDi4rAqgQn0KR049qpLDhdEIpQ1zrve14El2syV
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:9017:ad23:15fc:8efc])
 (user=venture job=sendgmr) by 2002:a25:d711:: with SMTP id
 o17mr53459482ybg.689.1641401103620; Wed, 05 Jan 2022 08:45:03 -0800 (PST)
Date: Wed,  5 Jan 2022 08:45:00 -0800
Message-Id: <20220105164500.3381822-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH v2] net/tap: Set return code on failure
From: Patrick Venture <venture@google.com>
To: f4bug@amsat.org, jasowang@redhat.com, pefoley@google.com
Cc: qemu-devel@nongnu.org, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3D8vVYQcKChIDw5BC9wy66y3w.u648w4C-vwDw3565y5C.69y@flex--venture.bounces.google.com;
 helo=mail-yb1-xb49.google.com
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


