Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B342231A436
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 19:08:46 +0100 (CET)
Received: from localhost ([::1]:47752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAcs1-0004oa-Mr
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 13:08:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAcqJ-0003Vw-Li
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:06:59 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAcqH-0006nN-8K
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:06:59 -0500
Received: by mail-wr1-x432.google.com with SMTP id v1so234480wrd.6
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9fcYfzpIgVf92S+Beu9YKetXhQPAxpUaNOhSTe1S430=;
 b=hRvafwyjZo+haE2PCIWx/dlEUxQXY+ZLGk3MujWq+gQpRhnwy5EOJHNcyQgfqpj703
 LU7Aowe06zevao4JLBRJd7LjuU6ucOL4cSHuzhUB7TbOfnYyEZJT1kWWEVnkmQGkHjOS
 DQ/XgHPqp4YQntJ0Wvi6C5kBSA1Qnx54U7huflD8SYyzeAhCnv9nGYMSHpeA/WPZn/1O
 hcL5etwtaUnCfHz1/Dq1sBlForuJs/EoCXVvOGYmjWjvoHzRIYvRqDcqXHC3P7m1Sa+c
 AGycCj3zQc1nammfF4SKt6ygOhZyyxWRrW74WoM27wG9wnqxD1mv+e/FUPjWGUCEZC97
 DgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9fcYfzpIgVf92S+Beu9YKetXhQPAxpUaNOhSTe1S430=;
 b=hFKXTAOT42eDev5RUJT9MIHscKuqzZyA0H57HduQLEvQomm4CUJLoYGAmKphdivUpP
 a9l1b30vBgls8tUHdNzuS/nO5bwQyrhCUpLXhDpgsqKPudiISOP4Zex4LIhuZTk691aC
 Yyan5EGMvpmg3z1V28wSWlZA9yvEcyvmhvVDvf/NiNZqMvYfqCApH5FYRSWIjMZ56iwU
 bx7cpXH60QSsxZW1IlOtl6oWY2wwvsQ4Zs1iin82Ov9GlYb4SL0JEjzbIIrHU7xLMx0k
 i1g77zk8YkTG+IDpyQttzN2M/rzzQN294Y8e3pm7HPn6T4XW9IVsMLsRdLQtPgzAQF/G
 L8eQ==
X-Gm-Message-State: AOAM533+pz+eRpUYKqKZCc3J1xe6tFeBrO6yFAlPL/eHhe4iJXRvVtom
 1clNT/S8JpDaqS3eKEYANzZ6477OrfiAYA==
X-Google-Smtp-Source: ABdhPJyYGguVa2ABWkRO3StQoUk+a1tJtJAaruiH0x5zT69xzmYwdC0MpMTd55U4w4RkEYhqg2IPjg==
X-Received: by 2002:a5d:554a:: with SMTP id g10mr4746020wrw.383.1613153215392; 
 Fri, 12 Feb 2021 10:06:55 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f6sm14022372wmq.33.2021.02.12.10.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:06:55 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] hw/display/sm501: Tidy up template header
Date: Fri, 12 Feb 2021 18:06:50 +0000
Message-Id: <20210212180653.27588-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For a long time now the UI layer has guaranteed that the console
surface is always 32 bits per pixel RGB, but some older display device
models still have the code to handle other formats. This patchset
cleans up that dead code for the sm501 device, which allows us
to remove the multiply-included sm501_template.h header entirely.

There have been a few attempts at doing this cleanup on this
device in the past by various people; rather than trying to
resurrect those old patchsets and get them to apply to the current
code in master, I just started from scratch.

Tested with AROS ISO image on sam460ex.

thanks
-- PMM

Peter Maydell (3):
  hw/display/sm501: Remove dead code for non-32-bit RGB surfaces
  hw/display/sm501: Expand out macros in template header
  hw/display/sm501: Inline template header into C file

 hw/display/sm501_template.h | 131 ----------------------------
 hw/display/sm501.c          | 166 ++++++++++++++++++------------------
 2 files changed, 83 insertions(+), 214 deletions(-)
 delete mode 100644 hw/display/sm501_template.h

-- 
2.20.1


