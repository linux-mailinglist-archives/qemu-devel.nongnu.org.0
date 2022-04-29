Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F313B514FCF
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:45:25 +0200 (CEST)
Received: from localhost ([::1]:48994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkSo8-0001En-IR
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSk-0001f2-Lt
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:18 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:45915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSj-00067S-0h
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:18 -0400
Received: by mail-ed1-x52f.google.com with SMTP id be20so9445738edb.12
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 08:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l0pmPnSw2fP9XE09cQAi1jZrvdds1H+19fdhpbcfKJ8=;
 b=adqgN0dN+lLLsmpoEbJkeMAJftV1Yc6eiu6iSkgcPReC75tBI/KktZhBuKJfOmCTrp
 g6WT0dCOPu30r6ARItL/dPE7vamNWrDtboaAh1OV9NJOYZfVP8ntFXDlDv8pVYP4J29j
 4EpiaYVgM3l3gFdCCpS0ajTFWb/m0FUe5Sxp8uY4/I1PMmCna6RT6n4Q9AME/rEtBHY4
 K0ZWOrTmKWvf4jkD+uLIr6F6wuJ2Mzb116E6ybRFI5qhcsR5m9LWykRC2UftEqwX7Ed3
 5UVS66fQdabrlPmhB6UJ5eIG9DsOBaXJIx5hbB4ugDa62exHcv1dSPpYxc8AFhwTEHDc
 QHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=l0pmPnSw2fP9XE09cQAi1jZrvdds1H+19fdhpbcfKJ8=;
 b=j5Fm7vjZmspJjqrJ7h4m6QJsHY11Wvr83iQjv18S7OSHpWHaf2iuf7sdiNjZ4htZeY
 /ZBypJOKotjSgIHBejzuBNaflRa22Oe0KTB8d27EAWegSahIGoxdubKpc8DUWDjJ7fRH
 3jpl/F/+Dz90abXQJihcV0sWkqx16N/FbO3kIRyVjl6yomjYOy0h36xX4eL/ihz7sfyR
 KiTMKRAgPVTFrxWHgIXtUekNFmhW29esNdMe/mXEYTPijyNpvxCGsfM3s1OF7Z70fy1v
 U8wmV/Cx54MHpt1pO0Kbqgo0B0ELDPtP0XpejO2CFL9oxnzQVF9afBhTiqSS3rg0LdF1
 ikhg==
X-Gm-Message-State: AOAM531/4jjuxlIHlnZ2pXfcgQy9c64yYALOcDbIFARnagCsgY/WZ5Uv
 EtcNCproYrmM4R3pipue5dIaU8VbuUkxeg==
X-Google-Smtp-Source: ABdhPJyXsZxcXcyTIRXrJeHFTCgGSox/Be5j8lPQfW18hDAdPw1t2P2t1m1phuBkg7NbSG0bMSBbhQ==
X-Received: by 2002:a05:6402:190c:b0:426:1e86:8f1b with SMTP id
 e12-20020a056402190c00b004261e868f1bmr12238905edz.82.1651245795266; 
 Fri, 29 Apr 2022 08:23:15 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 w25-20020a170907271900b006f3ef214dd6sm736395ejk.60.2022.04.29.08.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 08:23:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/25] configure: Add cross prefix for widl tool
Date: Fri, 29 Apr 2022 17:22:49 +0200
Message-Id: <20220429152312.335715-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429152312.335715-1-pbonzini@redhat.com>
References: <20220429152312.335715-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Konstantin Kostiuk <kkostiuk@redhat.com>

The mingw-w64-tool package in Fedora provides widl tool with a
cross prefix, so adds it automatically for cross builds.

WIDL env can be used to redefine the path to tool.
The same behavior as with windres.

Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Message-Id: <20220428181525.300521-1-kkostiuk@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configure b/configure
index 59c43bea05..8b775492d0 100755
--- a/configure
+++ b/configure
@@ -415,6 +415,7 @@ ranlib="${RANLIB-${cross_prefix}ranlib}"
 nm="${NM-${cross_prefix}nm}"
 smbd="$SMBD"
 strip="${STRIP-${cross_prefix}strip}"
+widl="${WIDL-${cross_prefix}widl}"
 windres="${WINDRES-${cross_prefix}windres}"
 pkg_config_exe="${PKG_CONFIG-${cross_prefix}pkg-config}"
 query_pkg_config() {
@@ -2786,6 +2787,7 @@ if test "$skip_meson" = no; then
     echo "sdl2-config = [$(meson_quote $sdl2_config)]" >> $cross
   fi
   echo "strip = [$(meson_quote $strip)]" >> $cross
+  echo "widl = [$(meson_quote $widl)]" >> $cross
   echo "windres = [$(meson_quote $windres)]" >> $cross
   if test "$cross_compile" = "yes"; then
     cross_arg="--cross-file config-meson.cross"
@@ -2907,6 +2909,7 @@ preserve_env PYTHON
 preserve_env SDL2_CONFIG
 preserve_env SMBD
 preserve_env STRIP
+preserve_env WIDL
 preserve_env WINDRES
 
 printf "exec" >>config.status
-- 
2.35.1



