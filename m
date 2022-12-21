Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3316535E7
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:10:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83Q2-0000bD-MJ; Wed, 21 Dec 2022 13:02:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83Py-0000UH-Qk
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83Pw-0004Hp-LX
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671645730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TjIqmIDz3cwBtIFP4+iRCGiKOecOxAf7+zbIUuPQ+rg=;
 b=JwTRVTPfqklZ3S1PRd7QaaqniLIXF1WDSn2iMdHnViMp8XYjtWeueAi/zS540VyV09Rz6B
 HpHYQbiQac+h6K9oGW1ig7CbBWqVagKuO6Cu1aDgmYiZvybiy79B3u0kz7+klJSu5fL93l
 hlfPLMVwSYg/1eaUJwDalKqvaCq1BGU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-378-zXeq0gzgPQyGdXGwBOGiZQ-1; Wed, 21 Dec 2022 13:02:05 -0500
X-MC-Unique: zXeq0gzgPQyGdXGwBOGiZQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 qf33-20020a1709077f2100b007c155ab74e9so11111958ejc.18
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:02:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TjIqmIDz3cwBtIFP4+iRCGiKOecOxAf7+zbIUuPQ+rg=;
 b=lU5IE2Y5HiNBjd7+1NhwQIr423oBa1i9l+358ZLSf3ywAJW9CwXU54hZL5efBdLQT0
 ub1vX4LcxQvIIsZdev99bSBrTuR9RL+DLjk1ICa3B776f0SeE07OysEDGzVdNJ7Lx75g
 qIHDxZuiWi94I2lcw/ae8XY+wcBgCezwEm6XuCJCv6lVnsIm04rvahJ+b9FVFTf9o4jf
 bGJ2QL1+POCqx1A2pbNmT1XoauJz8XljAcMqiRC2V3tnEqS3wqMpNXB+vN2n3KY7oTO4
 X6+AtY2Pdc/8oXL/tqIhYDgVL66KIQDforwHIaCg5F9aInokh3Mmw7e+N0ok0Bq7rVH3
 T9kA==
X-Gm-Message-State: AFqh2kppqaVCYemlRCKVYl5kTA7xCWHBsPQmQlsDJd8uCyh5+Tl88gh8
 GGIArtVgJDFpQKBSIFdeSZJ8phDf+/5UACyrbfY1UuxZQ8v2BsFhz3NRIQUxfCz2XQYSwXJXThZ
 FuFKPGtraRjhlS7PpEdHpp7PNhBQ6j6XyQ+mYXxgghaXqBh20Lwc81n4aSEGgTaH2B5s=
X-Received: by 2002:a17:907:ca0a:b0:7c0:eb35:b3f9 with SMTP id
 uk10-20020a170907ca0a00b007c0eb35b3f9mr2003733ejc.30.1671645724117; 
 Wed, 21 Dec 2022 10:02:04 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsy9Jv+0k257fSw1UJLoXLA0K39CWBYh0/tKTTsvQp/cq+xW4GUBpYGL2bAsAF02YqU0OvxLA==
X-Received: by 2002:a17:907:ca0a:b0:7c0:eb35:b3f9 with SMTP id
 uk10-20020a170907ca0a00b007c0eb35b3f9mr2003717ejc.30.1671645723937; 
 Wed, 21 Dec 2022 10:02:03 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a17090609d100b007c176597b55sm7398833eje.37.2022.12.21.10.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:02:03 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 07/24] configure: remove useless write_c_skeleton
Date: Wed, 21 Dec 2022 19:01:24 +0100
Message-Id: <20221221180141.839616-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221180141.839616-1-pbonzini@redhat.com>
References: <20221221180141.839616-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

This is not needed ever since QEMU stopped detecting -liberty; this
happened with the Meson switch but it is quite likely that the
library was not really necessary years before.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configure b/configure
index 26c7bc515468..e31d4522ea63 100755
--- a/configure
+++ b/configure
@@ -638,7 +638,6 @@ if test "$mingw32" = "yes" ; then
   EXESUF=".exe"
   # MinGW needs -mthreads for TLS and macro _MT.
   CONFIGURE_CFLAGS="-mthreads $CONFIGURE_CFLAGS"
-  write_c_skeleton;
   prefix="/qemu"
   bindir=""
   qemu_suffix=""
-- 
2.38.1


