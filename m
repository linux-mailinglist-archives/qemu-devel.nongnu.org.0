Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 212F74BFE44
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:15:47 +0100 (CET)
Received: from localhost ([::1]:57678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMXpJ-0005G7-Nt
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:15:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMX17-0002LL-ES
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 10:23:53 -0500
Received: from [2a00:1450:4864:20::434] (port=33321
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMX10-0004kk-ID
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 10:23:52 -0500
Received: by mail-wr1-x434.google.com with SMTP id j17so7291171wrc.0
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 07:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qfyRPgQZqNWOmMmZUBNoG+a8v7OPabSQK1leZNajt2g=;
 b=V0FcYyAAR35Fd+dGdVJB10nQMdBS+EeAMBxL29zeSJvPxAun/3ZHEBlN3YPScUwmEI
 lMvKIXt7x1a4b0GvmXY+R+HIu4cKnKzwowBUAXj4xfiQUm2uoVAZGtfuHJwgf6iyET1u
 OvATZvFrXeYi/oP+k0O5/ioj2Xys0jaFNwxH6w6VHSdCw1tuvfzjCGZeBh3ArTJZmud0
 ny26BkwhiOWN+p+bwe3MpnzLlgxFBsKBvsGJLVvgBmKWWcf4u1t4kOG17yIVcMS/cfsW
 KCkt57WnINx3phnZq0V4XEvgVyeaC+cwj5dJDIV3ic6hhSfBe5/ZNSXDDJjCNUwMaVkE
 PKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qfyRPgQZqNWOmMmZUBNoG+a8v7OPabSQK1leZNajt2g=;
 b=ufvDT2BXz3S56CtpJp3cVPVJLpzCOGT2xj4YytOGWWKYpSVLRUwQyWWlY/LOPFEIhG
 iIDMXvfI5VnFU1EYj/+3OqzruemphTv8Apl/QuXpd6cAvOJQUNdPR+0flZd7G5M6rz+Q
 udgF6FitSJhIg8NG5lwphkeqCbIhiMA3Gv88CvjsnuMLMWn0+xorI6qfsQQXqpvUbfP9
 4dd2+3mdxXyULbjXFXxsCQYx0OrnUhfxlyaKErAuMuwTNgDRgaBvYN7AKGjZ+IBtw7mY
 t6tB4v0zmhVTJWBo6wSHVf9k48c94C3ArQN200h34KWuHSkb8Ts0tbWOYF2S/Pda25BG
 dShg==
X-Gm-Message-State: AOAM5315ZOGZOfElgB58Obqx9ZFLQr7ephrAao/mOrbTa2JUUGq2wxWn
 6NnjP2Jwz0F24GINqMWA9kn7uWdz3u2vCQ==
X-Google-Smtp-Source: ABdhPJzLkxPdttnjoqCDgvkQN0aPCGFu5zeBCe7NLRBIL9bkJYWlHsdwP88sk3d/wB5zRK5gpoxQpw==
X-Received: by 2002:adf:e804:0:b0:1ea:9c3b:8f41 with SMTP id
 o4-20020adfe804000000b001ea9c3b8f41mr1759262wrm.53.1645543423398; 
 Tue, 22 Feb 2022 07:23:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a7bc4d0000000b0037bbe255339sm2687403wmk.15.2022.02.22.07.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 07:23:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] block/curl: check error return from curl_easy_setopt()
Date: Tue, 22 Feb 2022 15:23:39 +0000
Message-Id: <20220222152341.850419-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity points out that we aren't checking the return value
from curl_easy_setopt() for any of the calls to it we make
in block/curl.c.

Tested with 'make check' and with some basic smoke test command lines
suggested by Dan:

 qemu-img info https://cloud.debian.org/images/cloud/buster/daily/latest/debian-10-nocloud-amd64-daily.qcow2
 qemu-img info --image-opts driver=qcow2,file.driver=https,file.url=https://cloud.debian.org/images/cloud/buster/daily/latest/debian-10-nocloud-amd64-daily.qcow2

Changes v1->v2:
 * new patch 1 which fixes a missing "set the error string" for
   when curl_init_state() returns failure, since we're about to
   add more cases when that function can fail
 * set the error string in the failure path for the direct setopt
   calls in curl_open()
 * fix the failure path in curl_setup_preadv() by putting
   the curl_easy_setopt() call in the same if() condition
   as the existing curl_multi_add_handle()

thanks
-- PMM

Peter Maydell (2):
  block/curl.c: Set error message string if curl_init_state() fails
  block/curl.c: Check error return from curl_easy_setopt()

 block/curl.c | 94 +++++++++++++++++++++++++++++++++-------------------
 1 file changed, 60 insertions(+), 34 deletions(-)

-- 
2.25.1


