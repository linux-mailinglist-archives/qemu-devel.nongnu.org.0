Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B3F28F1E1
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 14:15:37 +0200 (CEST)
Received: from localhost ([::1]:44678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kT2AS-0005R3-U0
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 08:15:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eafanasova@gmail.com>)
 id 1kT29E-0004my-V9; Thu, 15 Oct 2020 08:14:20 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:44359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eafanasova@gmail.com>)
 id 1kT297-0005z8-HE; Thu, 15 Oct 2020 08:14:18 -0400
Received: by mail-lf1-x142.google.com with SMTP id b1so3287896lfp.11;
 Thu, 15 Oct 2020 05:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=dQmz9rhOlDq0/v2hbjxNx9h96+dAcVbZNubb/iXznIs=;
 b=piCUUFbyoL8Ed8g0hah127MyF62P6+tx+NjUy8QnB2rakG+vYa4M337ryABTzYSrFH
 mp0omeHkoSFd6qZyzlOcnUDTSKBQmL7EuDIGtokqJHbbA0Izio11nnX3/zWs9aduAdok
 B1uZ3SWX0TO/Knxs8QwFXKiXQzaq/xQ9bd8TE5IkucXlfX1Rpvh6WF8TFdm9XnOrtC++
 +ldk0onjhfNOtwR0MRNFrCRtJSrANxv9E2NvwnqvJqMvBsu93i920jCK6msMoy5Rgjk/
 jdbEKn4OMHTlR5M3Yi3rWNNkc2NsuRxLH5OxaURL7jYXWI3On5kNPBpv+dBrvd1UGvj9
 qIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=dQmz9rhOlDq0/v2hbjxNx9h96+dAcVbZNubb/iXznIs=;
 b=jgGO2u/ISuiV0VXJ/pMAgom/cOEaDLWmBvLaK5NmGP2xZPE5JWxidboZD1+BY8CZCv
 7agRmg+CN9Pk4ZJ8eeDRmFEr0RZYJoAkdqnIECWqIXi/rr9QzXjB3mpLDnvu1mnSHaSU
 ERanOMHw2aYqG74MwAAtALgYZuLFKxkJTNLG3h2E4mPuIaR7noxKS6+OBgMy8rqu2+j9
 9G//Ej8v1K7aY1pZ3WlhAZvcjDuBIgZNFM4ywhZh/f8x8HlWE5shoyg5Egvzk8/svFL6
 3bkgILHAq5TDJO5BKIcWkvYBwgYs0d0+FXciOnNVCtmfN/IBo2TjjVQI/A/wGoqtyqnt
 39zw==
X-Gm-Message-State: AOAM531WiDpHqQDELnKYIENvveNnFRvKD7ao4o42a70+noY8478uUbE0
 Tfva3A12fvCOmI3VWRB66ZA=
X-Google-Smtp-Source: ABdhPJwl+ckbQwZ5A6+trQDL3DF17h3m15WGRm1C+FykN+9z8Etyom+fr9XFodGBjqNjp94cGojoLQ==
X-Received: by 2002:a19:7917:: with SMTP id u23mr974577lfc.543.1602764050366; 
 Thu, 15 Oct 2020 05:14:10 -0700 (PDT)
Received: from [192.168.167.128] (37-145-186-126.broadband.corbina.ru.
 [37.145.186.126])
 by smtp.gmail.com with ESMTPSA id x8sm970036lff.222.2020.10.15.05.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 05:14:09 -0700 (PDT)
Message-ID: <e04b538ddbf6b6612c0c94602740ff78a98812d7.camel@gmail.com>
Subject: [PATCH] block/qcow2-cluster: remove dead code
From: Elena Afanasova <eafanasova@gmail.com>
To: kwolf@redhat.com, mreitz@redhat.com, qemu-block@nongnu.org
Date: Thu, 15 Oct 2020 05:13:54 -0700
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::142;
 envelope-from=eafanasova@gmail.com; helo=mail-lf1-x142.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since handle_dependencies() returns 0 or -EAGAIN the following case can be removed.
Spotted by PVS-Studio.

Signed-off-by: Elena Afanasova <eafanasova@gmail.com>
---
 block/qcow2-cluster.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index aa87d3e99b..e2e0db0cc9 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -1806,8 +1806,6 @@ again:
              * structs before starting over. */
             assert(*m == NULL);
             goto again;
-        } else if (ret < 0) {
-            return ret;
         } else if (cur_bytes == 0) {
             break;
         } else {
-- 
2.25.1



