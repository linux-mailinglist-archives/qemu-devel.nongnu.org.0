Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8F06B7119
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 09:26:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbdUg-0000y2-0o; Mon, 13 Mar 2023 04:25:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pbdUb-0000xr-UW
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:25:17 -0400
Received: from esa3.hc2706-39.iphmx.com ([68.232.154.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pbdUa-0000SG-5x
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:25:17 -0400
X-IronPort-RemoteIP: 209.85.219.72
X-IronPort-MID: 264206802
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:aJcsMaq7dYVqBuJrkbMq3/RIP0ReBmKlZxIvgKrLsJaIsI4StFCzt
 garIBnUOPncZDDzc4pxbI62808Du5XRz9VgGgFlqH0wEXxD9pacVYWSI3mrAy7DdceroGCLT
 ik9hnssCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRlPKsT5jcyqlFOZH4hDfDpR5fHatQMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+AsBOsDAbzsAB+v9T2M4nVKtio27hc+ada
 Tl6ncfYpQ8BZsUgkQmGOvVSO3gW0aZuodcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw2ut0IGJN0
 NYjFw9RfDqivfO83Ym4Vbw57igjBJGD0II3v3hhyXTAE69jT8+ZBarN4tBc0XE7gcUm8fT2P
 ZJIL2oyKk6ZMlsQYD/7C7pn9AusrnD7YztUsnqfuOw673W7IAlZiuaxaoKLKoTQLSlTtnTA9
 kXr03WgOBMfDcei8zOg/liQu9aayEsXX6pXTtVU7MVCmVCW2ykfBQMbUXO9pv+2jFP4XMhQQ
 3H44QIrpKk2sVW1F5zzAEf+r3mDsRoRHdFXFoXW9T2w90Yd2C7BbkBsc9KLQIVOWBMeLdDy6
 mK0og==
IronPort-HdrOrdr: A9a23:OAwdRKCelx0AKf3lHel655DYdb4zR+YMi2TDGXoBLSC9Ffbo6/
 xG+c5w6faaskd2ZJhNo6HjBEDEewKmyXcX2/htAV7dZniehILAFugLhvqA/9SjIVyFygc078
 ddmsNFebrN5DZB/KPHyTj9OfobhPe8zICUqdH380pNJDsaFJ2ILD0UNu9YKCBLrcV9a6bRbK
 DsnvavbgDOGEgqUg==
Received: from mail-qv1-f72.google.com ([209.85.219.72])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 04:25:09 -0400
Received: by mail-qv1-f72.google.com with SMTP id
 ge13-20020a05621427cd00b005739f5f9d7cso6629243qvb.22
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 01:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1678695908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y81jYrFdHFI0h2IHDmqZGbfVAz90Pdxvxksgm9ZaytQ=;
 b=DjCwQ5h5p57oYNsyK/utfPbfsosQ+FOw95CEEL7d7UsWOFBIJt6P0WrnyiRWRde4sl
 VLwhy4fZtpZYmadyIEEyRTjNc3GU9o2ZSsOIjAUnmXyPryW5rwkFKJOdm1LWsZvwPau+
 /zSHnG98mxKvWJGPq3GvlQFZilDahk7OHZAb6o8Xwb8/H3FitfqS0sMu7BeSOZx0yNXb
 zY/HrsE9zzftWImA55EveRc+sfufDRH4aTs2LhiiKxsL5+O2e/ZTw6vM6IGGq2Z2/MlU
 yBVc+IBQMfbkORBzYS/BRvYTcoY+/mlRmUmgOOfJpAB2rswbqXECrylYlOX1IbCMfKO+
 Yhlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678695908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y81jYrFdHFI0h2IHDmqZGbfVAz90Pdxvxksgm9ZaytQ=;
 b=hsOovoutUTRnccyijfg/BZHGZBYx3FicyBlkjVh+aGzh1JrunXyl8MbOj7ez+Sp0EG
 sk4Gqyli0QFUwsnIGkP0RmboTmgYeThdEqRc6ezGEygBj8cgbUlBq2Rv4EQwoPTMb9nQ
 BBUhvlDEIy1tnVYM4BdI0vuRFLoWspYblhU5bl8ZRiRIIayRtDDb5cuL8HwnJUXh4UJe
 tDX73Fh7pLGPip4zVvgIRWXNQBBRKOYQI0adPgCtbvKGhuEhsAHOrb4a87wbVxmh1dey
 zhETyXnvGkkbBrfGSkXcTNVzYmPUHbGVK/Wut7cw5TA9lL/Pe10aQ9yoeVAJAfGO5UH9
 EKtw==
X-Gm-Message-State: AO0yUKUFbiT7aZWuYT6sf+8Ld9u7JqkxhhKBliuZxxwL8tOtWSzAVBu5
 55hZaWAfR2T+MeyXUcHHeXUM1gC77dpA59idZZ4I5xPzW8Y7HzJu91FdQzx9I4gfyjhFSH7D7IH
 fEovVEeHU1kak/sZoLnCIivJnH7THUAgeLkWVYURt06M=
X-Received: by 2002:ac8:7dc3:0:b0:3c0:14ec:bfc2 with SMTP id
 c3-20020ac87dc3000000b003c014ecbfc2mr54914745qte.28.1678695907955; 
 Mon, 13 Mar 2023 01:25:07 -0700 (PDT)
X-Google-Smtp-Source: AK7set+KGwEKXKmj2t/0ntOh2Lv6SBYA0JBDwgb+2jXuc6e660XoR86iot+SaqIiudemP5jK7XLSmw==
X-Received: by 2002:ac8:7dc3:0:b0:3c0:14ec:bfc2 with SMTP id
 c3-20020ac87dc3000000b003c014ecbfc2mr54914716qte.28.1678695907663; 
 Mon, 13 Mar 2023 01:25:07 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a37430d000000b0074382b756c2sm4853969qka.14.2023.03.13.01.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 01:25:07 -0700 (PDT)
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
 Siqi Chen <coc.cyqh@gmail.com>
Subject: [PATCH v7 3/6] checkpatch: add qemu_bh_new/aio_bh_new checks
Date: Mon, 13 Mar 2023 04:24:14 -0400
Message-Id: <20230313082417.827484-4-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230313082417.827484-1-alxndr@bu.edu>
References: <20230313082417.827484-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=68.232.154.118; envelope-from=alxndr@bu.edu;
 helo=esa3.hc2706-39.iphmx.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


