Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCBB6A7C86
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:26:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeFk-00028R-0L; Thu, 02 Mar 2023 03:25:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeF7-00027A-QR
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:24:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeF6-0001xZ-2L
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:24:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jBP0wti6dxnPnGnJO6+cFlFJmnT0gtydblFYaomrsJw=;
 b=RzE9ceamVUl4iAdBFNiUPtTV+UV92kH//azXPccdYrBaDDd9B16/636xkWD7b5Cnu8TbWz
 0srKJuqAkQH9mfAeF6Fq0GNdnab7/K9Qx6oAVdkpgYKjOr4rGSVZ6OXpZN9o+KMm73VR18
 7GXnzJ9htfm6BzxvtL29g3AHUTWhKEc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-619-YjvDHT8xNoa6oQjfWH2-ew-1; Thu, 02 Mar 2023 03:24:42 -0500
X-MC-Unique: YjvDHT8xNoa6oQjfWH2-ew-1
Received: by mail-wm1-f72.google.com with SMTP id
 l23-20020a7bc457000000b003e206cbce8dso5461329wmi.7
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:24:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745480;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jBP0wti6dxnPnGnJO6+cFlFJmnT0gtydblFYaomrsJw=;
 b=M6fOvVwbz0jqjcDV7r+YjZZ1HRue9Ug/Wxxp54ZqywOdpdnH6U6rZEvnZMndcrXW8R
 EjIi1v0fybruO+gxqwSXhX5oztOwpevoJWrXSmdQd9mZQyWsFPQb1uuqFSYYPEOoPpIj
 9LkYIm+Pcwzv563yqbX4QCUz9bhcsgnEyY2jtf3tiMQX8b/2/8965JPx/PFfSyWlH8hJ
 pxKTyTttqm2542d2xqpPpH4uPPcVL3OHagiS9Aqy7mvQFSCXTtcrepIabgPR9KtHi+LU
 o4a9/QFk4/YER5u5gTWc9YnC/mz3MNKy6CwixYTAfQdqOb52nbSyydl6ogA6TMOZOEj6
 MBqA==
X-Gm-Message-State: AO0yUKVbnwPX5mpYfTnd8jCkhdFUyOi4zQBivR4dKZoi0/jfDubAxhKD
 UaKk43+y0cR3Lp9ZgMoZViSMOmv7WWVmqLLYsoT+gkuHfrTyKOZtetF2Uedd0VJBVqZJTrdar1v
 Ca/iNGdZ92KIZ7aZDfU2fQedrDJWAOMRR7Qwd61B57VN4eCtrc0xrKb4JYX3eTNbSDg==
X-Received: by 2002:a05:600c:4f13:b0:3eb:2b88:867e with SMTP id
 l19-20020a05600c4f1300b003eb2b88867emr7237313wmq.10.1677745480461; 
 Thu, 02 Mar 2023 00:24:40 -0800 (PST)
X-Google-Smtp-Source: AK7set+O1M3+ccqgKkcM3Ie5+sQqLvSIhXGgrL8tdyNrDBpphR9jhKKj+5M7MJYGuztLnUDcepw+Yg==
X-Received: by 2002:a05:600c:4f13:b0:3eb:2b88:867e with SMTP id
 l19-20020a05600c4f1300b003eb2b88867emr7237288wmq.10.1677745480191; 
 Thu, 02 Mar 2023 00:24:40 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c359000b003e209b45f6bsm2356022wmq.29.2023.03.02.00.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:24:39 -0800 (PST)
Date: Thu, 2 Mar 2023 03:24:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>, Dov Murik <dovmurik@linux.ibm.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 03/53] Revert "x86: do not re-randomize RNG seed on snapshot
 load"
Message-ID: <20230302082343.560446-4-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

This reverts commit 14b29fea742034186403914b4d013d0e83f19e78.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Fixes: 14b29fea74 ("x86: do not re-randomize RNG seed on snapshot load")
Tested-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Dov Murik <dovmurik@linux.ibm.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/i386/x86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 9b7476158c..7a128a2899 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1116,7 +1116,7 @@ void x86_load_linux(X86MachineState *x86ms,
         setup_data->type = cpu_to_le32(SETUP_RNG_SEED);
         setup_data->len = cpu_to_le32(RNG_SEED_LENGTH);
         qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
-        qemu_register_reset_nosnapshotload(reset_rng_seed, setup_data);
+        qemu_register_reset(reset_rng_seed, setup_data);
         fw_cfg_add_bytes_callback(fw_cfg, FW_CFG_KERNEL_DATA, reset_rng_seed, NULL,
                                   setup_data, kernel, kernel_size, true);
     } else {
-- 
MST


