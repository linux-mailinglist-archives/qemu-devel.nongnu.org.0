Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3ADD2DCDE4
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 09:54:25 +0100 (CET)
Received: from localhost ([::1]:59268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpp3I-0008AL-Qo
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 03:54:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpozG-0004A6-1E
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 03:50:14 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:45402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpozA-0006zF-QY
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 03:50:13 -0500
Received: by mail-ed1-x534.google.com with SMTP id r5so27742903eda.12
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 00:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vQYEh+Y62q2dxFBEt0aUyj3TlwwrERjg9YZlE79W61A=;
 b=Z5uhmqjof/biq4+Kc+MNkwJPWDhaQutINLfsG1qIfiCIu20mYxQQpluYrxpL7dYJCv
 oYqAsmb0VX31l6JLE48sahTRgi9cCHm9xpT0qEf6G3iH/N4mcRX1WyZDNYqnwbGZGoli
 x2x2XVT6xYm5GzNRNQdgMsoIAr/mYV8fri7CTE4w+LTwxJGh5p8Wcse0s8B+SkWY+NA0
 299gqQT8pytZVR2AxFUNG0MZZDWP7aXytlaJn1mGGUYK6LZ7VD+V7AQUIQ4+S0xk6r9T
 Vwsc6wp7CIKY/eU8MZ+sT3X14Fc1paZwwRbPTl45zhblpj5m66IaQ8RcllDjYqG/rUTI
 IGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=vQYEh+Y62q2dxFBEt0aUyj3TlwwrERjg9YZlE79W61A=;
 b=ZKlW0ykWiZR+2I8uZDrYUX49jTfe+ZMg9A9EdsHS+mjRfM5s27pdBpJ2Zav5JWCBhB
 vLJ2pdVnTI7rXPT5O7TDjU6OQjAQ0O3F1NiBpfKVwaAqOpvmcL2mSXiExFcEdR19U9yK
 v782dazURDII71vZWO9Dm0VV7yjpcIFASso/GH3vwfYrmloW7OeYjBFVpC023WpsCL53
 WlNwWSp5+bs54O75hR3SX8Lvt4oMam/qo/mT2JUh343BgOzn8J7AYM8oLX3jKrLaIvLn
 TV6NvgO2BI9+WgumqDh9Q/ajFZjwxpTHR0nbpgcZcuaGKtdTDcYWMVWnju6hjj0sKQ9k
 Seew==
X-Gm-Message-State: AOAM531/W4NQqX/OsHlHs61E8e4ZuLv5sPuxHTfUbsyFbOwQQvnT6BiC
 NkXzTEqlA18/modGrlJA9JJ9s6wdrjc=
X-Google-Smtp-Source: ABdhPJx2oVkEkl0o6jNiQgpDcgR+Eq2Rrd7utxhN+tcpNb8qVN9GSPnnhkIIaFwqm0z8C3GyEeVeBg==
X-Received: by 2002:a50:e882:: with SMTP id f2mr10235259edn.76.1608195007253; 
 Thu, 17 Dec 2020 00:50:07 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id dd12sm22949542edb.6.2020.12.17.00.50.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 00:50:06 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] First batch of configure cleanups
Date: Thu, 17 Dec 2020 09:50:01 +0100
Message-Id: <20201217085005.10644-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After the Meson cleanups from yesterday, here are some
small improvements to configure, mostly removing obsolete
code.

Paolo


Paolo Bonzini (4):
  configure: remove useless code to check for Xen PCI passthrough
  configure: remove variable bogus_os
  configure: accept --enable-slirp
  configure: remove CONFIG_FILEVERSION and CONFIG_PRODUCTVERSION

 configure  | 27 +++------------------------
 version.rc |  4 ++--
 2 files changed, 5 insertions(+), 26 deletions(-)

-- 
2.29.2


