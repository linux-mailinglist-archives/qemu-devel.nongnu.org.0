Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BB12FD6D9
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:25:06 +0100 (CET)
Received: from localhost ([::1]:58264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2HE9-0000h8-5d
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:25:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l2HCY-0008CO-99
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:23:26 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:45574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l2HCW-0000fZ-Qv
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:23:26 -0500
Received: by mail-ej1-x631.google.com with SMTP id ke15so26926232ejc.12
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 09:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4SOM3vqfkXA4JUiHcxeK52I4bKkuH7HyT0M/S98k4uw=;
 b=qNeI5LzbGWvryse2TzCdVhU2zw9F3x+ozBqcdj7xB/12llHOJTF0oeRtgZRtxNXTUU
 eR0FyDMpuVxWAMDKSYTutlkBRUR6WLws1/x/WzCAxVukvB8N/hXOZtEuD0YEHiJwch9k
 93WQjFYzRflIBlACgCG6rBRpbghRkzJyYqJApcgnWoeyU4GPhxfaSOiGUBbTKmYMXup3
 Wo55LHJv3k90BOKdmaFF62PrXYp344+fz8prEkF4rWu06wqzdwmuNwK4prNxV3Jit+qb
 Bd7GyJdAEnREH3k/So3fCOl71tlMjSzkOLHKCE8Pg/citUz8L/hzgbwixM7E2NZwqG4b
 XOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=4SOM3vqfkXA4JUiHcxeK52I4bKkuH7HyT0M/S98k4uw=;
 b=OqQfzPUs7PoUoU5n6Q/OBorfCCVHTpcwmh7903GiA06Lc/UErXIRtfojxPEgr0pQTc
 mvpRgE7DCM4MKwr0ZIfAU24cuUy5Zoy+c64gt5NhdQyEWsdgJDoAiyHSEPIkZbvA3UDa
 xDWLlOGw39GJOVcgcanhSfB7fHujXeyD/KiJliflUpLles2arMfFrGASl4HA00P5SFnS
 wgvPRsZA0mbZtgeGTrruWb42evX72fRnNgutde9VRfTkvyURXVOPY+r8Nyg5g9//C7zh
 tBmnHiu172Zwmllvzxyq7dNWsLpeWtp8L6nMLBxxLDcF2f9Ur4awJuEFUa2s3ODrEO0y
 +nUA==
X-Gm-Message-State: AOAM531WoLoA87NUKXJpewJeKnEcRcWhXjhIkBgvD/ygsRd+NCOhyZZy
 cknLtS9RCGPdw03ovRdsryR6WvQ8mwplaw==
X-Google-Smtp-Source: ABdhPJxAA0C8ggkajzlTQzMqQNqk3Io3DRvPMTrKs54jv8qQXNgloyQ8OnkQHupABy+xMUML19v5lQ==
X-Received: by 2002:a17:906:fa85:: with SMTP id
 lt5mr6885482ejb.344.1611163402534; 
 Wed, 20 Jan 2021 09:23:22 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zk10sm1184007ejb.10.2021.01.20.09.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 09:23:21 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] meson: Further cleanup of summary
Date: Wed, 20 Jan 2021 18:23:18 +0100
Message-Id: <20210120172320.26742-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Inspired by Philippe's "meson: Clarify summary" and based on it.

Paolo Bonzini (2):
  meson: Summarize configurable features together
  meson: split the summary in multiple sections

 meson.build | 90 ++++++++++++++++++++++++++++++-----------------------
 1 file changed, 51 insertions(+), 39 deletions(-)

-- 
2.29.2


