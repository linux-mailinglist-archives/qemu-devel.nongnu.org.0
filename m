Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFC463D7FA
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 15:21:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Nvz-0007rF-2u; Wed, 30 Nov 2022 09:19:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p0Nvx-0007nk-BK
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 09:19:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p0Nvv-0000ZQ-HM
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 09:19:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669817965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xlPGUiLodkPI9Sx/Va3Z7m4XH+LQd3NyGBCFD4FZa+A=;
 b=TOt5CwZskGb/GOF9K5iLIvIqr4i24blGsBZp+KRwsIlX3q42XD2aUrIkpMkFbetkCuyfqZ
 5ihXxA9gRQdrQMB/+rqwqVQqFdpFTJVqMDDzkZ9d7D84PcgJej/3q/sn6HoEooxifL2BrI
 5gQ7zTlul/sCfZ6KQ1TgRmOhmwYOHqg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-394-vAwHy6RkOqCzi3Tt_yyXzg-1; Wed, 30 Nov 2022 09:19:24 -0500
X-MC-Unique: vAwHy6RkOqCzi3Tt_yyXzg-1
Received: by mail-ed1-f70.google.com with SMTP id
 c9-20020a05640227c900b00463de74bc15so9932205ede.13
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 06:19:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xlPGUiLodkPI9Sx/Va3Z7m4XH+LQd3NyGBCFD4FZa+A=;
 b=7m/xdyRGzdNENJ27s6Pfigiyku/5YD1NDqeaubyRCeukZp9+agsvh4ls3vd2A0XY/6
 VGt1Khv/QACbZsaOnQKNQCN30Y0JDaLqbRutk8jLwVygylpNMBA9jUfDgptTCuwCx4pd
 t9DQPMiI0Y9E+TWXJZVF/x9MN/AWobM+NFysDfttcbAbDWnnrX22SHq8C35CpZTvWtnF
 Ij1PiDIMaoGrxlWmLkDw5YbBQ+HyNVi7DxV1HdYJspt/UeQMBWPXKD6twcGkyEsEE5NQ
 jP+xvIkTSHZnAxbpryy1XlajwyMWWh1kaHJyBzdt1xAJstD0drPkJdCBEfubOA8vfwFa
 KRgw==
X-Gm-Message-State: ANoB5pn3rk8Ye3UNWDHjH8uSp6EUFY/w+yM96TgTOHMyegtiNClNJ12l
 iOBGh+a39bUSdJwMomQbp8iR8m+FdmUfwkK2vixiK3EuLe/ottRZDSZRRQV3HlB4oWgOpTCOrrA
 iqwigeDshmqFe6VepW0UdkF6MBGHucX8Do+pEYbvDnhACT2S/EJ2gzrDECv/kMpoba/0=
X-Received: by 2002:a05:6402:143:b0:463:f8aa:d2bf with SMTP id
 s3-20020a056402014300b00463f8aad2bfmr56557667edu.358.1669817962349; 
 Wed, 30 Nov 2022 06:19:22 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4rmsJeeh9NsawSpb1MVGTLgoYKdDg1ZwRBKh+IcJoLC0WmrBIodNi2DcZhgFAL+faXRdnLKA==
X-Received: by 2002:a05:6402:143:b0:463:f8aa:d2bf with SMTP id
 s3-20020a056402014300b00463f8aad2bfmr56557641edu.358.1669817961948; 
 Wed, 30 Nov 2022 06:19:21 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
 by smtp.gmail.com with ESMTPSA id
 vf6-20020a170907238600b007bebfc97f44sm690818ejb.75.2022.11.30.06.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 06:19:20 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com
Subject: [PATCH] target/i386: allow MMX instructions with CR4.OSFXSR=0
Date: Wed, 30 Nov 2022 15:19:17 +0100
Message-Id: <20221130141917.29667-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
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

MMX state is saved/restored by FSAVE/FRSTOR so the instructions are
not illegal opcodes even if CR4.OSFXSR=0.  Make sure that validate_vex
takes into account the prefix and only checks HF_OSFXSR_MASK in the
presence of an SSE instruction.

Fixes: 20581aadec5e ("target/i386: validate VEX prefixes via the instructions' exception classes", 2022-10-18)
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1350
Reported-by: Helge Konetzka (@hejko on gitlab.com)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index e4878b967f0e..80c579164ff2 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -1488,7 +1488,8 @@ static bool validate_vex(DisasContext *s, X86DecodedInsn *decode)
             if (!(s->flags & HF_AVX_EN_MASK)) {
                 goto illegal;
             }
-        } else {
+        } else if (e->special != X86_SPECIAL_MMX ||
+                   (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ | PREFIX_DATA))) {
             if (!(s->flags & HF_OSFXSR_MASK)) {
                 goto illegal;
             }
-- 
2.38.1


