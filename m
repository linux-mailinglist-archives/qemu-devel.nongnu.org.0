Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 558866F2491
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 14:17:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psjVP-00067W-FN; Sat, 29 Apr 2023 08:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVO-00067A-1F
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:16:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVM-0004sU-Dv
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:16:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682770603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rZjfT0cTItj0hs1HOL6CzpkHNiD5S5aMbOQBf2WtlOU=;
 b=gQ/gl6Z2QWHkx2TESowyalhQKpPTDZ/bo6TXmuCYRPiU4F+CY8BQkQnNEt3jKY3/EzHVHG
 DEFlYoMaRQraPoyCJT6TOocGF+7EB5/fbxIcj5aC/tCnEa49r5ef1ILTtt4ze5+CA2v4A8
 mGAuJFNsg4637HIni8nTbbmvRcOMxIw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-O4uV6ym2MI6EakU6XRZIBw-1; Sat, 29 Apr 2023 08:16:42 -0400
X-MC-Unique: O4uV6ym2MI6EakU6XRZIBw-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-94a35b0d4ceso80112966b.3
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 05:16:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682770600; x=1685362600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rZjfT0cTItj0hs1HOL6CzpkHNiD5S5aMbOQBf2WtlOU=;
 b=kaP6N0VB+zxSO/5ef1desxjtXs0Qm+fkuz2YMoUUcHpaXqucfVx5w19uFutK3t7l8z
 0yxn40TFxxhA8YHyrn5CcfVIawWsGdfhgjK+JgcjY9vd0tW2PYoWkb8W/bkecNfgmV35
 ehU1YKVwjEdXMudMkBcYkYASp9Bb/OwdbVcxv0DeCHSVDBpohUq8/Z0vK1kABt8QNP9A
 ku+wSlZRVQLr1HF1SUMP7DpkxUMKymduCreSJUr8iZ4p60+L9+Q+Ll3IEJZhmZ2e2h9w
 oWKABl7LiDS+JR1pBF5OoyWvO/060Nuzzj435KZ9ij3zv9NILrbTSfKeHEFRZLxN3D31
 +CWw==
X-Gm-Message-State: AC+VfDw3xzmn1z+cRt10dAgn44TgSXS5UkKwBmNUe1RPP3Jf0VLP8poS
 ru2R7HDecQTARYWoSe9UD9oUeCfhefa4bNzfFwr0jUZ47Kv/2cN3UUVW50kzwpW85nmYpBrKsHD
 ecH9S7pOPfp1JmDDKWa4XZuir97tnZQf2K1T/EPQl8I7o3eYGmgKgXdVy1rNylA1rHb2jrIb5rC
 w=
X-Received: by 2002:a17:907:da4:b0:959:8cbe:63a5 with SMTP id
 go36-20020a1709070da400b009598cbe63a5mr8111224ejc.44.1682770600504; 
 Sat, 29 Apr 2023 05:16:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5zWSqwOGvKrLYiO+4SY+g5UBCEo6DSAZbXm3vMfBrEWxgpIPAU2t4o+JZ1H4zAf+SveBzr5g==
X-Received: by 2002:a17:907:da4:b0:959:8cbe:63a5 with SMTP id
 go36-20020a1709070da400b009598cbe63a5mr8111200ejc.44.1682770600120; 
 Sat, 29 Apr 2023 05:16:40 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 qt2-20020a170906ece200b0094e1344ddfdsm12335263ejb.34.2023.04.29.05.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 05:16:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 01/17] qapi,
 i386/sev: Change the reduced-phys-bits value from 5 to 1
Date: Sat, 29 Apr 2023 14:16:20 +0200
Message-Id: <20230429121636.230934-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230429121636.230934-1-pbonzini@redhat.com>
References: <20230429121636.230934-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Tom Lendacky <thomas.lendacky@amd.com>

A guest only ever experiences, at most, 1 bit of reduced physical
addressing. Change the query-sev-capabilities json comment to use 1.

Fixes: 31dd67f684 ("sev/i386: qmp: add query-sev-capabilities command")
Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <cb96d8e09154533af4b4e6988469bc0b32390b65.1664550870.git.thomas.lendacky@amd.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qapi/misc-target.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index de9105452377..bf04042f45d9 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -172,7 +172,7 @@
 # -> { "execute": "query-sev-capabilities" }
 # <- { "return": { "pdh": "8CCDD8DDD", "cert-chain": "888CCCDDDEE",
 #                  "cpu0-id": "2lvmGwo+...61iEinw==",
-#                  "cbitpos": 47, "reduced-phys-bits": 5}}
+#                  "cbitpos": 47, "reduced-phys-bits": 1}}
 #
 ##
 { 'command': 'query-sev-capabilities', 'returns': 'SevCapability',
-- 
2.40.0


