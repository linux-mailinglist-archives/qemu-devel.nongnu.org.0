Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DC64A5074
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:46:40 +0100 (CET)
Received: from localhost ([::1]:42234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdZP-0004VT-Ft
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:46:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnh-0004zq-D6
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:21 -0500
Received: from [2607:f8b0:4864:20::131] (port=38416
 helo=mail-il1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnb-0002gJ-KB
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:21 -0500
Received: by mail-il1-x131.google.com with SMTP id i1so12413163ils.5
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pumpyPycN9DoXDBuQYFrkloUl4gD+5Jdk6jBPn6GXxc=;
 b=j0/CiE4tcf15Nb4xd8wEQlb60L9L1J00nDwSIFGy9C+caia55BmywHaNLAmb6471CV
 1D+rMkUu1RkQ5qLZTPQivl+kkPDIE8FUfePHGqBejAcXc2kd7C8ZdGyd3sMvTOVoVrDs
 kp6CtyeSDA/vscM8ymxXtwffkRV6JGIlPE2VogXA9p3If5sIbc7gEsaXIMrFanvclT+P
 ojZSPm1cr/t1umaCwjzuv69o2yDKK1f9vcHwpgdAFKS3yuylXInx0QlIx7pKP3F5w7Xd
 kV26W9fRZiI/n4miPiBSvdpOgt3uu+f2d96s1db/q3TC9ucIfXOu/XFRVRP00Je6nvza
 zqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pumpyPycN9DoXDBuQYFrkloUl4gD+5Jdk6jBPn6GXxc=;
 b=XEh7X0O6TGOHs6KR5lpOWcHpaWMG6D5yjXXQMzxqlua3iprg58tLqZh5U/QEhXq3p9
 TcnZVojHhan6YSo1V2TbPFsaXuCsPmX9GMWQpBRiouit0EMoNh2IJ18Gv+IUSyCt4wHj
 kl5k7KdmcTiOWVBHAL5nDsvm/S9n1w/vEFvFn+yC58Tov9DxYXG/jIIGbtIlQQvNXxvI
 x1tdUpqMuYOlxX/v3jKREJGd9jEqySnDUk0Tc1+Z1CYbq0ftu7aQzcTkfOR9Z8wb/qiw
 IvCMgAWYWn9hALp1/znE7n9lRgda2omhP86uLgPuhuIDeniKwnGsjXhqugWtNsBjLLmA
 nAmA==
X-Gm-Message-State: AOAM531EziRaos+J7TEWOfeZ2ly99qWGyyPoJknlBmEeb2Sagfk7dJRI
 Gb/UvqTNsB1wXeUEtZPARtn7bduab4m5uQ==
X-Google-Smtp-Source: ABdhPJzTLBb43fggvGuWuYlTTU2mLpNpB5wbqlwnFy18F5b79lHILcQv7loGAKwocEZ+EBUE6FgxmA==
X-Received: by 2002:a92:d84c:: with SMTP id h12mr4699489ilq.168.1643659029029; 
 Mon, 31 Jan 2022 11:57:09 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:57:08 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 38/40] MAINTAINERS: Add tests/vm/*bsd to the list to get
 reviews on
Date: Mon, 31 Jan 2022 12:56:34 -0700
Message-Id: <20220131195636.31991-39-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::131
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::131;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x131.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

tests/vm/*bsd (especailly tests/vm/freebsd) are adjacent to the bsd-user
stuff and we're keen on keeping them working as well.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e4b3a4bcdf4..b7487f9b54b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3181,6 +3181,7 @@ R: Kyle Evans <kevans@freebsd.org>
 S: Maintained
 F: bsd-user/
 F: configs/targets/*-bsd-user.mak
+F: tests/vm/*bsd
 T: git https://github.com/qemu-bsd-user/qemu-bsd-user bsd-user-rebase-3.1
 
 Linux user
-- 
2.33.1


