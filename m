Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 408F43FFF4B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:38:29 +0200 (CEST)
Received: from localhost ([::1]:49306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM7We-0003Hq-7m
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM74z-0001aC-5P
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:09:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM74t-0002Do-UN
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:09:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630667386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i6HJ8MqhTy0s+GzLLhKT2UPzz5+277m7r3JgXnumMB8=;
 b=dj1cw4F4RIxxspQuGotaecoHDO+GCg1YjTub3Qnt2FkapFfXup0YFoKKMTquM00A5D1PFs
 D8WZYASnx3ZJCiZgBx8U57RPQj6zO+iUlUCuxuzTOKqsmLGDhbIzdg8HWOmpl7uITVP0Dj
 +yUX+ItTlgoBCaQFlFMRXPcGvm74Wkw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-RwHkYFLSPGu-hvnkWJXPbQ-1; Fri, 03 Sep 2021 07:09:46 -0400
X-MC-Unique: RwHkYFLSPGu-hvnkWJXPbQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 y13-20020adfe6cd000000b00159694c711dso262741wrm.17
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 04:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i6HJ8MqhTy0s+GzLLhKT2UPzz5+277m7r3JgXnumMB8=;
 b=d48kx1OZooPRlGEtIK1c8sfP3GwNFIfBV4vZDgBR8J8MuxAuURcjNRN5KkyWQTCchw
 tY7Va1NNE1c1W6uTDQ5tIE4rQx+niu7hDpyPn1RX/idnW7JWzcTW3I83shNQtHguRLrs
 PntknPZBgg6N6OXTg5ic6S5N/dA5M2IZrQAMf6NA5w+DpUZIsUbtaI+2hvNwvI6Cp0LE
 yXCfxf8EWxgwxvZxhuXF/vKjAezAuA1dWEGOLAa/QksYO60pZHQI5d164qs+RCcp4YOY
 fPByeIdqRHhBwDLLlRyEfsLS96BiQI/g3k5bepUu9B6GPp+3DCEgn6G01Xt08RfpNAmU
 YZ6g==
X-Gm-Message-State: AOAM530/09W/xzsm7+h5rPEH/Xw8y+K+uLJvbpuCyDPjpN9YRRoqtiBU
 tjPQ6sAuq4T1BkUnuTO2m15dZJ+nWBYPV7qZrIgWlDcbeITuoyO72u18v+l1YQbd3Bzf7MFxJ4P
 52FGb4raujUlZydUWy2Rgc9bzvsRv9Dd2PUGfb4zOfpBVPnOGEpUmTRTdLodHnUpt
X-Received: by 2002:adf:d1a8:: with SMTP id w8mr3454915wrc.306.1630667384674; 
 Fri, 03 Sep 2021 04:09:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTWWNvgUfXwGCxUu6tWBFBNL+R3tBdmQts4xFcP/prwWKpnKH5frCHZXk2WgxNT0N9oeyPWA==
X-Received: by 2002:adf:d1a8:: with SMTP id w8mr3454844wrc.306.1630667384303; 
 Fri, 03 Sep 2021 04:09:44 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 t14sm3887073wmi.12.2021.09.03.04.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:09:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 28/28] checkpatch: Do not allow deprecated g_memdup()
Date: Fri,  3 Sep 2021 13:07:02 +0200
Message-Id: <20210903110702.588291-29-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903110702.588291-1-philmd@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Zhang Chen <chen.zhang@intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Laurent Vivier <laurent@vivier.eu>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

g_memdup() is insecure and as been deprecated in GLib 2.68.
QEMU provides the safely equivalent g_memdup2_qemu() wrapper.

Do not allow more g_memdup() calls in the repository, provide
a hint to use g_memdup2_qemu().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 scripts/checkpatch.pl | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index cb8eff233e0..4ce9d753492 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2850,6 +2850,11 @@ sub process {
 			WARN("consider using g_path_get_$1() in preference to g_strdup($1())\n" . $herecurr);
 		}
 
+# enforce g_memdup2_qemu() over g_memdup()
+		if ($line =~ /\bg_memdup\s*\(/) {
+			ERROR("use g_memdup2_qemu() instead of unsafe g_memdup()\n" . $herecurr);
+		}
+
 # recommend qemu_strto* over strto* for numeric conversions
 		if ($line =~ /\b(strto[^kd].*?)\s*\(/) {
 			ERROR("consider using qemu_$1 in preference to $1\n" . $herecurr);
-- 
2.31.1


