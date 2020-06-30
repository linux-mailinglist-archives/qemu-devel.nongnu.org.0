Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B521920F2DD
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 12:41:00 +0200 (CEST)
Received: from localhost ([::1]:39152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqDhD-0003GP-NN
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 06:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jqDea-0007R1-Vg
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 06:38:17 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:30888
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jqDeY-0002Jq-V7
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 06:38:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593513494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Odgb6jy8EO1qmpvwH8AySvxbGpHXkOS/Y+ZFSjxPPU0=;
 b=KfsM8zq/mx2ks2CQYLq5cvQJhgXtQPVNmao+S28qcwlVrfrpctICGHDm7/iwKN+L38tu3I
 VR5EeEt+oXCUoAzVVmA2rhjVs4ayrd4CcZz3zTTLcFxdslP24IyJxnp1zMUccafwIeAKco
 KeDslcQUASqaCak+YAvsovwLhjISMa0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-VA7IZMMAPj6wzEBnE8F3rw-1; Tue, 30 Jun 2020 06:37:47 -0400
X-MC-Unique: VA7IZMMAPj6wzEBnE8F3rw-1
Received: by mail-ej1-f71.google.com with SMTP id b24so12723758ejb.8
 for <qemu-devel@nongnu.org>; Tue, 30 Jun 2020 03:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Odgb6jy8EO1qmpvwH8AySvxbGpHXkOS/Y+ZFSjxPPU0=;
 b=J/5ARnG0eVEpqFAuWzppVAqorWlqiEb/xZvdHI90wKt8WPBbS6oWjqAdHo0EgstXwD
 axk10sTyzsLPBlDWNNufumcVYGNG15UYDQm/dqEq4Gmh+dFR4VXWoiwtcbOurVvS3ySe
 hubkvhLvpzwfTve0GTbxMYp5eu0vhHsCWNZoT0lVLj8FQj5CQHCbSbwXf9AwyWiKK6ne
 ZWu/aZOhMKnD/wUnVA/EqAVmsZ5yYEzXs8jAUGnz9wzd4zSwIsLiyLke2TPNrxKnW5vR
 ehqTUDQMl+q4of9KT6RhIXcIdyb+k2GebD2o3V2hQX+rU9Lr+fUo8XN8x2uIw+wgF3H2
 zCdw==
X-Gm-Message-State: AOAM532tmJzaujpOMBii3gRUFc0xUl4SvZyTIwZyZwvN8qg5T9qTPK4R
 99eaWc3gB8CVdwtv5SK6BS2/UKLVm6/2swPhLu1w8ZhKkgeQCsv4l27QgZuB2bPD3NgcnTFs4nZ
 4siUk9hnYm8gPrU8=
X-Received: by 2002:aa7:db4f:: with SMTP id n15mr6554065edt.193.1593513466355; 
 Tue, 30 Jun 2020 03:37:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4OeINd9qe3Ow2fnBCa0tZ4tZ14NwLhsn3B6UWZvgfWqeCees84DHK5XqGuTRMgxEyUlqjOA==
X-Received: by 2002:aa7:db4f:: with SMTP id n15mr6554053edt.193.1593513466210; 
 Tue, 30 Jun 2020 03:37:46 -0700 (PDT)
Received: from x1w.redhat.com (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id q7sm1758631ejo.22.2020.06.30.03.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 03:37:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] hw/block/nvme: Update specification URL
Date: Tue, 30 Jun 2020 12:37:36 +0200
Message-Id: <20200630103739.9715-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200630103739.9715-1-philmd@redhat.com>
References: <20200630103739.9715-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 01:11:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At some point the URL changed, update it to avoid other
developers to search for it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 1aee042d4c..6628d0a4ba 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -11,7 +11,7 @@
 /**
  * Reference Specs: http://www.nvmexpress.org, 1.2, 1.1, 1.0e
  *
- *  http://www.nvmexpress.org/resources/
+ *  https://nvmexpress.org/developers/nvme-specification/
  */
 
 /**
-- 
2.21.3


