Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CED0A3FD284
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 06:45:55 +0200 (CEST)
Received: from localhost ([::1]:47706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLI8H-0004SW-Jh
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 00:45:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLI5b-0002Kd-Um
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 00:43:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLI5X-00066D-Uz
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 00:43:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630471383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=as3ToTRIzjd1k43OADxDSSaSwfQCFoTDFdQMf6sMHIQ=;
 b=VdvMDTDbrz954hXI0J1MmDx1obVsmCmbrplyJKVcMuAvt1eb+EgF4t373HoAO65+QRDTdG
 OugcMvi7SQidvjoKkMVu4F830Lve6vaHokreq5LK3RPYgD08OfCmnOL8ou+86e5wCCmkAG
 /otYjsoEUOxTkr3z9iUF26JDx6xbjrA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-TFihGOaDNs-OiUvPsAsipg-1; Wed, 01 Sep 2021 00:43:01 -0400
X-MC-Unique: TFihGOaDNs-OiUvPsAsipg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B799480198A;
 Wed,  1 Sep 2021 04:43:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E2401002391;
 Wed,  1 Sep 2021 04:42:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CE0E11800913; Wed,  1 Sep 2021 06:42:48 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] MAINTAINERS: Remove SPICE from Audio backends section
Date: Wed,  1 Sep 2021 06:42:47 +0200
Message-Id: <20210901044248.3122252-3-kraxel@redhat.com>
In-Reply-To: <20210901044248.3122252-1-kraxel@redhat.com>
References: <20210901044248.3122252-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

SPICE audio is already covered in the SPICE section,
so remove it from the Audio backends one.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-Id: <20210816191014.2020783-3-philmd@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8fb35b0d301d..282ad5a059aa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2275,6 +2275,7 @@ Overall Audio backends
 M: Gerd Hoffmann <kraxel@redhat.com>
 S: Odd Fixes
 F: audio/
+X: audio/spiceaudio.c
 F: qapi/audio.json
 
 Block layer core
-- 
2.31.1


