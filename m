Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCF64EDF67
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 19:10:47 +0200 (CEST)
Received: from localhost ([::1]:44890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZyJq-0002rk-Dq
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 13:10:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZyHC-0008Pm-6S
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 13:08:02 -0400
Received: from [2001:4860:4864:20::2c] (port=35326
 helo=mail-oa1-x2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZyHA-0002q9-Ee
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 13:08:01 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-de48295467so26051767fac.2
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 10:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hdptR0C2d8rwsceEiPj8I1mjYidqbFEoTkZG6jtDavc=;
 b=vl9U00IC0C89dGUBPcogSX5RmydSM1fQynRNWiyGsTt3Bz3wvHOiqFeXtxVavBjvXd
 sNMddpW8FPrbMp+yFIJXKIPRY5aaauzj0YjGKdwSrMqyJH8yED0acL9A3ksTVxd8409s
 WUHj6SxJiyoBu5ih64qBAtmoY6B+5CHnLJzM0TfaRfiuw5MnA9sKmNkN8TSuplGrqIjZ
 LqfetitNJ8nSWzvwfhD6gk7/+b4jR/uBcmj5ZxewyXUGmCqzWJc0KvU7FoT8hOTCB9fC
 U9CUEnO6YtNRBpt8TUH/WIzNzOPrz1VMm4RcSfiv6t3T4gS1hWH4PH3WOJPL4eRJYMli
 T/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hdptR0C2d8rwsceEiPj8I1mjYidqbFEoTkZG6jtDavc=;
 b=FEtk5sCZ7ANDLg/8PfmuJOml2L5u/WVgTAhOsZHOWx45bvAd+x4vss2EnbfJFOBoyh
 1r0P57QJwiDei6JCnAqG2TQSC9hjakH1drDE6FJux/9Z+degGI3w5DhiV9aaSXqyoHCk
 qjwf9iHwCuqWyWBEqYFky+Clg9fR41U0hHi42wW6aR86vg5kAFHvh/xMfuvBFQU9o1Yt
 7dVjE9O1CF5vS6S3g46S+MTLubFMpYh3sKItToDSHMWgpVUADkhatUVeqGxkLeNtoxxq
 XjPZhTe2lMYMswGdqliIioF74GB8A+kJswCv+AxiLw03sG7kVyB7591cKb4oSpB6Av23
 zhgw==
X-Gm-Message-State: AOAM533/fjFH6bv+Abr/DsGAB4ppT1xRwnMaOFuYvnXq2tsKKSepC60+
 60bsu+84v0upnK4+8ZEGRPVe2jjuB+ObY/W8DOc=
X-Google-Smtp-Source: ABdhPJyfp/AsQ4k1VEJjhiDKGqFzRiNt6cXyzmD1MMIb9Iwh6Q6dCbKsTp/OZ6xhv27sbhCYrS6flQ==
X-Received: by 2002:a05:6870:4412:b0:dd:a03a:75af with SMTP id
 u18-20020a056870441200b000dda03a75afmr3282021oah.266.1648746478545; 
 Thu, 31 Mar 2022 10:07:58 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 bg39-20020a056820082700b00324c8eba341sm3160oob.18.2022.03.31.10.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 10:07:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] Last minute tcg/aarch64 fix for 7.0
Date: Thu, 31 Mar 2022 11:07:53 -0600
Message-Id: <20220331170754.398913-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2c
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit cace6c6f3aca7b88afc42995f90bbefb37a0ed57:

  Merge tag 'pull-qapi-2022-03-31' of git://repo.or.cz/qemu/armbru into staging (2022-03-31 11:56:52 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20220331

for you to fetch changes up to 7ceee3a19b31818e6f7c8e429e25b219aefa8dd6:

  tcg/aarch64: Use 'ull' suffix to force 64-bit constant (2022-03-31 11:03:59 -0600)

----------------------------------------------------------------
Fix tcg/aarch64 buglet for Windows on ARM host (#947).

----------------------------------------------------------------
Richard Henderson (1):
      tcg/aarch64: Use 'ull' suffix to force 64-bit constant

 tcg/aarch64/tcg-target.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

