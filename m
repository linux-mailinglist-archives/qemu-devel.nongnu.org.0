Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4816EACE3
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 16:29:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pprki-0005H5-JI; Fri, 21 Apr 2023 10:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pprkd-0005EP-A3
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 10:28:39 -0400
Received: from esa7.hc2706-39.iphmx.com ([216.71.137.80])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pprka-00088r-R1
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 10:28:38 -0400
X-IronPort-RemoteIP: 209.85.219.70
X-IronPort-MID: 275073141
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1qCQ9KNMOWT173vvrR0YlcFynXyQoLVcMsEvi/4bfWQNrUol1jEOz
 mIXCGrUPauCMTejLdB/Oorg804G7cXUmIBnSwZtpSBmQkwRlceUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraf656yEnj8lkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjim8c3l48sfrZ80sz5q2q4Vv0g3RlDRx1lA6G/5UqJM9HTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiG9Y+DyDX4pZlc/HKbix5m8AH+v1T2MzwyKtgo27hc9hZk
 L2hvHErIOsjFvSkdO81CnG0H8ziVEHvFXCuzXWX6KSuI0P6n3TE8dVzIGcqE7Uipft4EUofz
 /IzAh8/R0XW7w626OrTpuhEg80iKIzyItpatC44iz7eCvkiTNbIRKCiCd1whm9hwJATW6yHN
 oxGMVKDbzyZC/FLEl4TGJQyhs+imz/yfyAwRFe9//VquzeIlVAouFTrGOrOX4WwW9wMpWHCu
 iHa80D6CBUKLdPKnFJp9Vrp3IcjhxjTQY8XCfi0++BnhHWVwWocDgBQUkG0ycRVkWa7UtNbb
 lUKo28g8vB0+0usQd3wGRa/pRZooyIhZjaZKMVigCnl90Yey13x6rQsJtKZVOEbiQ==
IronPort-HdrOrdr: A9a23:SerW9qj/F5qwBND9/r60opFKdXBQXgwji2hC6mlwRA09TyVXrb
 HLoB19726JtN91YhsdcL+7Sc+9qB/nhPxICMwqTMyftWrdyRaVxf9ZnPLfKlTbckWUh41gPO
 VbAtJD4bXLbWSS5vyKhzVQfexQpeWvweSDqd2b4U1QbTxHXYld0iYRMHflLqS0fmV77FgCea
 Z0KvAom9PZQwVuUi1zPBZlY9T+
X-Talos-CUID: 9a23:3N9YM2z4IV9LzJcmKct5BgUmOt0JVGHz9E2PPkCoIjdTRpa/Zm25rfY=
X-Talos-MUID: 9a23:391SWwX3dOQV6Bfq/A/3oWhYKt4x2IP0FAMRnbEFsc2ULCMlbg==
Received: from mail-qv1-f70.google.com ([209.85.219.70])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2023 10:28:33 -0400
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-5ee8e5e93d7so11530796d6.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 07:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682087312; x=1684679312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y81jYrFdHFI0h2IHDmqZGbfVAz90Pdxvxksgm9ZaytQ=;
 b=mbxCyV5JTsRUIZ4cfuFCymI+2gwUDgVRm4OAfPy+Lxqr8woRgAotc08WgosIhvEaZI
 WCNWnCtkUpPhy2M9JeJlhGEzjLRA+u/vlLKgiyj11/1qw9G4RHk7GltOFf+Y4BVsMv2g
 x+V+aBhNlKklkCjzU9pKTV3GwR9iA+f8zk84N9TVrt1Tp7fTWyqzluZqF3u6Dfy8FS2/
 /0K5mq8CtEuJ2XYLUya2eM0lbKdkGPr9h1S3tZG5hWUus2GIRQETXGAzTSDZPsXiB0/+
 GukvM3pqdFYsBVPMZWUyQL29vweBeaK/9F+D50FqTGJ0ExD0gV6c1JRMdCg2Zl3397LV
 1l3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682087312; x=1684679312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y81jYrFdHFI0h2IHDmqZGbfVAz90Pdxvxksgm9ZaytQ=;
 b=WPbHlPO1KAX4xFdc3leNCJkzHh9rD7UQx3u7IMuHZ0DxB7vjhtZoCAPIrsCeysaw1E
 l/Lxihhb0uvptlZMaUWU7BvGri0vuIjckMfCtug9fICP0CUnhKDlCG49M5wsvgWBYXq9
 CSkPK6QclHWQtnoBGoa1XKt9dcKwkJzwKV4YsjJ2aGnMP3hfB6mOElvVr1z2OEpW06rh
 RUcE4OxjGyQOl+UVtsCSZ1ZVXTMQI3Ppus4zxpr4sZqn7MngideRz2xwVC7ddKRocmMm
 SuVVaPBD6zuoVzzK4nrmoOzsvBynrLAre//77rVku+Mm+xask0EMdA90//LGJycLt+SR
 5JbQ==
X-Gm-Message-State: AAQBX9dgbAVLfXKCOOLDa5sQp3H4RCrvb3STvrnzxQ/+8Pup/qVbu25E
 G9liSHj5h8TVP+w7spA6ST41EKiN/NBoWIKxl/7vpGVwZBevAoT4ON7cSxZ+bbO9JLb9RXgSvua
 GrafutFzWrwSJZMVvCCHL4T370D/czgZnhpsrNu8ra94=
X-Received: by 2002:a05:6214:21ca:b0:5ef:60c3:57af with SMTP id
 d10-20020a05621421ca00b005ef60c357afmr9502183qvh.4.1682087312696; 
 Fri, 21 Apr 2023 07:28:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZbQ9hcUQNfTS4hxR1hoIw0Np9AiK4VtPiWoBwzZ3Q4iQMV+Pky87KYauID7FP1g5KooFVfpQ==
X-Received: by 2002:a05:6214:21ca:b0:5ef:60c3:57af with SMTP id
 d10-20020a05621421ca00b005ef60c357afmr9502155qvh.4.1682087312474; 
 Fri, 21 Apr 2023 07:28:32 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a0cedca000000b005dd8b9345b4sm1198062qvr.76.2023.04.21.07.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 07:28:32 -0700 (PDT)
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
Subject: [PATCH v8 3/8] checkpatch: add qemu_bh_new/aio_bh_new checks
Date: Fri, 21 Apr 2023 10:27:31 -0400
Message-Id: <20230421142736.2817601-4-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230421142736.2817601-1-alxndr@bu.edu>
References: <20230421142736.2817601-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.80; envelope-from=alxndr@bu.edu;
 helo=esa7.hc2706-39.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


