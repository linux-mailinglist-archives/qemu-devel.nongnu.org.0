Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4676F0DA7
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 23:12:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps8tA-0005rz-2k; Thu, 27 Apr 2023 17:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ps8t2-0005rD-CE
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 17:10:45 -0400
Received: from esa1.hc2706-39.iphmx.com ([68.232.153.39])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ps8sz-0005K9-U4
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 17:10:44 -0400
X-IronPort-RemoteIP: 209.85.160.197
X-IronPort-MID: 277415118
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:35Ve8ayA21Jr2pJmi/p6t+eJxCrEfRIJ4+MujC+fZmUNrF6WrkUGm
 DAcDW+Ea/eLNGOhfdtzYYi3p0gA656BmNAySwBuqi00HyNBpPSeOdnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9j8kk/nTHNIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzN8B56r8ks156yu4mxA5TTSWNgQ1LPgvyhNZH4gDfzpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZGBiuFIPM0SRqkEqShgJ70oOHKF0hXG7Ktm+t4sZJ
 N1l7fRcQOqyV0HGsL11vxJwSkmSMUDakVNuzLfWXcG7liX7n3XQL/pGXWdqfq859r1OImxF7
 cMIdA8SfEyyvrfjqF67YrEEasULKcDqOMYGpiglw2iIUrApRpfMR6iM7thdtNsyrpoWTLCOO
 oxAN2IpNUWfC/FMEg5/5JYWleO4gHXlWzdF7l+ZuMLb5kCJk1MtieW0aYq9ltqidZpthQWmg
 Tj69F/gJzcrGPyElgWb/Sf57gPItWahMG4IL5Wh+/t3xVGe2GEXIBsRU1S9vL++kEHWZj5EA
 0kd+y5rtLRrsULyH4a7UBq/r3qJ+BUbXrK8DtEH1e1E8YKMiy7xO4TOZmIphAAO3CPueQEX6
 w==
IronPort-HdrOrdr: A9a23:ALQeOK925eQl/Y3Xz0Ruk+DhI+orL9Y04lQ7vn2ZKCYlC/Bw8v
 rFoB1173/JYVoqKRYdcPq7Scq9qArnhPxICOoqU4tKPjOW3VdARbsKheDfKlbbaknDH4BmpM
 FdmmtFZOEYz2IWsS832maF+h8boeW6zA==
X-Talos-CUID: 9a23:hvnOzGMHCGvNgO5DCQ87t2w1FpscUXDW1EjAf3CnGzpYcejA
X-Talos-MUID: 9a23:+DPFWQb6a0dIl+BTh2DUn3JcE51U6J+3LWY8vbUd5PaaOnkl
Received: from mail-qt1-f197.google.com ([209.85.160.197])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2023 17:10:36 -0400
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-3ef30a89abbso59844571cf.2
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 14:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682629835; x=1685221835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y81jYrFdHFI0h2IHDmqZGbfVAz90Pdxvxksgm9ZaytQ=;
 b=k+E5MGszO4U/Q+93DhK0WRb5KBoOox2CxKEZ3J6PtwAWqEa32MGSUkLfoW7iNU3xlY
 45jnKJYg12pD7LSh1I0gRW+sfyYJ/M9TaUAWQET98X7645AZ03jy5lu2Smk13sg4w7kn
 S7rjM8xeB+Et56mdc7777OpVyx+kJkNiQnz+orJdaq86++HDD6bL3cbfV515lFX9+KBM
 j28OoHZk2nhLkEr4yQOCpSdAQCSG0jacSZwST4FmQ/ZlDxJSqpqa9VNdc3ysQwKQ5uCY
 AS3u+Ezpa3gP8ZF8o6A0Ah0fAE91uGbv2OpKAZxImPRoMzBxHk3hepRt6uVGqmDRkG4v
 2VgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682629835; x=1685221835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y81jYrFdHFI0h2IHDmqZGbfVAz90Pdxvxksgm9ZaytQ=;
 b=TAB/dJGKvwaAwB33jTzVynrHPQ9jB4FrGCR7D4yfrasamIuWKDa7N8fGEytDnZG9PH
 yoV4vvkv/EB4fv/sDfqMBxGgQiXX1usoI696wusXxl946OQCzSM4fqTlZch33egtBtDI
 z+2s3Tnn/x97A0xKS1i3McoVoPxrOm2GL/hqu7eGdi2D45HBO+xDFRnq0wR68khDkI5v
 +GIn3cXo8+tn6Cm3mGTlZPWVp2V+pXBVxxGbIUu69JqzuwPwyIEyzT0wbxW7gad+jaKo
 DjG6esIl6jd08TnGLjQlELzq44bDh6oBj8thdyQult3gw5ePtQWC/WKe2v+zZqjtyZ2i
 /l4w==
X-Gm-Message-State: AC+VfDwSRyUxBcEZBYBpl+pgZPert734/taFyuNGyJwZcBf4+/UR0miB
 baU4tIg0IXormU8uoonKUyi67ond1deQTalRq/HOD9FIAkgkplq1ejLM3Xk0xPG3wejznq0kRAm
 MbQ98VA4FHcondJgmGewNCR1qtavvu0IW4qCRcaV/DXg=
X-Received: by 2002:a05:622a:5ca:b0:3ef:64d9:f0b3 with SMTP id
 d10-20020a05622a05ca00b003ef64d9f0b3mr4001819qtb.14.1682629835153; 
 Thu, 27 Apr 2023 14:10:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7mZNJ6S1IzpkXugvfanukXvQFph5x3I2LaxWduCjgTu22B/iObV7QHaOcQc7iKsAQz+1cuHw==
X-Received: by 2002:a05:622a:5ca:b0:3ef:64d9:f0b3 with SMTP id
 d10-20020a05622a05ca00b003ef64d9f0b3mr4001773qtb.14.1682629834780; 
 Thu, 27 Apr 2023 14:10:34 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a05620a240900b0074e24692929sm6228207qkn.106.2023.04.27.14.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 14:10:34 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH v10 3/8] checkpatch: add qemu_bh_new/aio_bh_new checks
Date: Thu, 27 Apr 2023 17:10:08 -0400
Message-Id: <20230427211013.2994127-4-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230427211013.2994127-1-alxndr@bu.edu>
References: <20230427211013.2994127-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=68.232.153.39; envelope-from=alxndr@bu.edu;
 helo=esa1.hc2706-39.iphmx.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.266, HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Advise authors to use the _guarded versions of the APIs, instead.

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 scripts/checkpatch.pl | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index d768171dcf..eeaec436eb 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2865,6 +2865,14 @@ sub process {
 		if ($line =~ /\bsignal\s*\(/ && !($line =~ /SIG_(?:IGN|DFL)/)) {
 			ERROR("use sigaction to establish signal handlers; signal is not portable\n" . $herecurr);
 		}
+# recommend qemu_bh_new_guarded instead of qemu_bh_new
+        if ($realfile =~ /.*\/hw\/.*/ && $line =~ /\bqemu_bh_new\s*\(/) {
+			ERROR("use qemu_bh_new_guarded() instead of qemu_bh_new() to avoid reentrancy problems\n" . $herecurr);
+		}
+# recommend aio_bh_new_guarded instead of aio_bh_new
+        if ($realfile =~ /.*\/hw\/.*/ && $line =~ /\baio_bh_new\s*\(/) {
+			ERROR("use aio_bh_new_guarded() instead of aio_bh_new() to avoid reentrancy problems\n" . $herecurr);
+		}
 # check for module_init(), use category-specific init macros explicitly please
 		if ($line =~ /^module_init\s*\(/) {
 			ERROR("please use block_init(), type_init() etc. instead of module_init()\n" . $herecurr);
-- 
2.39.0


