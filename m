Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC2ED6377
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 15:11:26 +0200 (CEST)
Received: from localhost ([::1]:49558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iK08C-0000tG-RE
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 09:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35281)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iK06m-0008TL-FC
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 09:09:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iK06h-0000K5-9p
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 09:09:56 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40392)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iK06h-0000JG-3V
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 09:09:51 -0400
Received: by mail-wm1-x336.google.com with SMTP id b24so16695714wmj.5
 for <qemu-devel@nongnu.org>; Mon, 14 Oct 2019 06:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UEXCjAhdu0FKHjjtnW1230km7QIS6Nvx34ZHiSKDVCA=;
 b=hxuXuR4g2shL08WUvxaxnshWH4ZEC/LUpYo0ZYhUGKU2xOfwImBSabs2JJe4Rr1awE
 T6YpA6M4ywmZV5YIDRwxoj3p7SNgb40U4YINadi8jG7pvb9SSmmbKIz8jn58jY3Fw9iI
 ixg9iRXfIC14WrGE/y+lZB8hcb4nySgQtAoUzIt2nM+t0JwM4M8MRLCyqKsZs6Wv/af/
 AzURbapq/IfeIs4A+/u+kzPaZLmigwtlX6egOu2/XEiEs7eGZMBB+AouiK+ypqpn5+bX
 7LMLbwnhBtS2wi3jRpEZT+Q0U37fLIwjoqRl2SBKBnov5gVGNx2dN3foecpPjD6OR560
 44ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UEXCjAhdu0FKHjjtnW1230km7QIS6Nvx34ZHiSKDVCA=;
 b=op1buO3nXfVnRx4vrP7zmdAqU9JqMDotLf42BWB4CnSr6Kp/fVB8i5MMUPFRJ/1dYw
 C3JYKKhX+AtrhnQBfQMokzmske9UjfvgIfSMWsWB48+oCU6FSEHDGVk74q9UPaT2nd9+
 eDEI0ms5nrUwkcQUVMkVLnCvJCHLvT54BJe3AYaInyLkquJrFB4J55Brh8Wldw8c8fzU
 XZRLxGgn8q6mZgRuZobgtVgXx5WsScocKi5w4Zb/jLubMp4iMqFJtnv5ewiyV26IciEL
 An7CfISba4+rPWRcE/+/hFj+ZnIeBl+k8hHE+FRnP1jCUnCaS0DaRDZ3v3etUMljScNQ
 eU3w==
X-Gm-Message-State: APjAAAV6vMtFYZkQONz5PbwA1v0rBfKFpfmje4MxsrioQ4dupaB5fIQM
 a0hQqclMgKJs0SEPKSIzlpwrrA==
X-Google-Smtp-Source: APXvYqyiyzYxFv/UvSllsB1S7FbUYAvnWQ2rTy2WR+F3oilmLcaIaczT+zjpdZjI767+oetrB2iAHw==
X-Received: by 2002:a1c:cc18:: with SMTP id h24mr15744271wmb.40.1571058589683; 
 Mon, 14 Oct 2019 06:09:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u68sm32105274wmu.12.2019.10.14.06.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 06:09:48 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 243091FF87;
 Mon, 14 Oct 2019 14:09:48 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for 4.2 v1 0/5] gitdm updates
Date: Mon, 14 Oct 2019 14:09:43 +0100
Message-Id: <20191014130948.18400-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::336
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

With these changes I get a reasonably clean set of stats going back
two years and to the top 20. However most of the individuals are pure
guess work so I won't submit them in a PR without positive feedback to
it being correct. If you want the numbers to be correct by the time of
the KVM Forum QEMU keynote now is the time to let me know ;-)


Alex Bennée (5):
  contrib/gitdm: add more entries individuals and academics
  contrib/gitdm: add MontaVista to the domain map
  contrib/gitdm: add Andrey to the individual group
  contrib/gitdm: add Bin Meng to the individual group
  contrib/gitdm: add China Mobile to the domain map

 contrib/gitdm/domain-map            | 2 ++
 contrib/gitdm/group-map-academics   | 3 +++
 contrib/gitdm/group-map-individuals | 6 ++++++
 3 files changed, 11 insertions(+)

-- 
2.20.1


