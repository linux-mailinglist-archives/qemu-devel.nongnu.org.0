Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A31C86EF84E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 18:21:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prht8-0000qw-Kf; Wed, 26 Apr 2023 12:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1prht1-0000pu-3i
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:20:55 -0400
Received: from esa13.hc2706-39.iphmx.com ([216.71.137.83])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1prhsy-0005pS-Jn
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:20:54 -0400
X-IronPort-RemoteIP: 209.85.222.197
X-IronPort-MID: 274887218
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:s32PR6BEe7p8rBVW/5Dhw5YqxClBgxIJ4kV8jS/XYbTApDh33zwDx
 mUeDDuFPv6KNGKkf9wiOom09EgH6J7Rn4BkTANkpHpgcSl2pJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH2dOCn9SImvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0ilaYDkpOs/jY8E814qyo0N8llgdWic5j7Qe2e0Y9Ucp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VTKlLgFVHmZkl+AsBOtiN/Shkaic7XAha9hXB/0F1ll/gpo
 DlEWAfZpQ0BZ8Ugk8xEO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPj39VKFWcYF7YF2c9QP3weq
 sEWAw4kO0Xra+KemNpXS8Fpj8UnadDoZcYR4yA/iz7eCvkiTNbIRKCiCd1whm9hwJATW6yEP
 YxAOGUHgBfoOnWjPn8eDII4kP2AjGS5fjFFwL6QjfBovziDk1YogNABNvLSQp+YV+8IgH2Gt
 1vE0lTeKDo2M/m2nG/tHnWEw7WncTnAcJsfEaD9+vN0jVm7wGsVBxsLE1yhrpGEZlWWXtteL
 wkN+XNro/FjqwqkSd7yWxD+q3mB1vIBZ+dt/yQBwFnl4sLpD8yxVjhsouJpADD+iPILeA==
IronPort-HdrOrdr: A9a23:VfV79qOYir+728BcTv+jsMiBIKoaSvp037BL7TEVdfUxSKalfq
 +V8sjzpSWYtN9vYgBZpTntAsm9qArnhOdICOoqTNWftWvd11dARbsKheCP/9SKIUzDH4BmpM
 RdmxYSMqyVMbDH4PyKhjVRrLsbsb66zJw=
X-Talos-CUID: 9a23:felHj2DPrRD65Bj6EyZ71GoNPO4PSWD+5VDuPh/nNGhCdpTAHA==
X-Talos-MUID: 9a23:FdQ9YgRtX0mrjolKRXTrvHJwJu01/Z+wGXkPvKUhkeKoMglZbmI=
Received: from mail-qk1-f197.google.com ([209.85.222.197])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Apr 2023 12:20:28 -0400
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-74dfe945c74so480491985a.3
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 09:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682526026; x=1685118026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=68oaiYGL7UhG3W5jva6oSZ0GIeZDrcn2k6P7uHwGxlY=;
 b=GPwkKqfMeRvTFAZrgPKv8bMlXpyYlBayJKhJzqHG5BIK6OrTDro8JzVteKvvXlbHlt
 EB1n295qx5imnztk8ou4Fs8FjAciy1VcAZ0QKbqM9ylsYRwHRoTEA/LrN4gKPtbWJzyS
 /AAyO8lrDZXNWjv7e5HfeEHZK+fAGyxkYLRi1z+CX1nSRs3mxHrce6l6ojymGhFJbJE5
 m+xi9uE85yrD8cOvUGr4Rl1ZY2KwfLFIqzUM5Y4moyGWbwqU/L4CZXXOnxd019jCQUpJ
 Xq1YccGNS8kFpEWQEfu3fvzbX/FdpGPqsGl2XcGCl25+Z9EOtAdUWUuXR53XumLyaLUa
 Hi6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682526026; x=1685118026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=68oaiYGL7UhG3W5jva6oSZ0GIeZDrcn2k6P7uHwGxlY=;
 b=fVyZSzRvkZAw5RXr3e+udrMgglTgxZMdhtQT1L5mLz37Sn+IO5M42rz9sP7i/wy8qn
 euGCYjTlqp/xSqGrZeG+N2UZosUGJ4DfS/Gw5A4ehwVdXEmmY35UmCmkhcyNxtxtdEIl
 Ri1/tXjC+92lhOU31/58pv3eTOyPfqjcn5xxTGgvMqssGYDNJL9j4jKJymdstpv8yL8+
 TuhzNoOpi4FjL8gDk06n1YPCTxTC/V2l50bvd/BkG/iLGUA+KE1tmu4zwyHwQMkJgTz5
 qBeDKr/Krrs/FW0mmT1jVNgG+GdiEVgmQiFo9qY7nvHrzz8QokoSM3fd33L9Pn9hGw/r
 ZItQ==
X-Gm-Message-State: AAQBX9dARgfI99DZlmTQgBkNdqTECQUlwa6ibAVMspI564CSKNzyNq6t
 gZqriAOt1wNsVb2W3K0NIkwdnHITfbjccIZQ6qaIqKRlEaBPA3jQF+KGB78bWi442CT9ShKWhCs
 gEim1IWy1168y9SI3KoaENgqBKfjBx6g7FYbFIpGW62M=
X-Received: by 2002:a05:622a:170b:b0:3ef:2fbd:90ba with SMTP id
 h11-20020a05622a170b00b003ef2fbd90bamr36987139qtk.43.1682526026314; 
 Wed, 26 Apr 2023 09:20:26 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZQ8VKoo+uzlCju2hLXsNgUukt/YuhPXMH+1U2lg+TgXrBGRCGZoz4tHhYIZMqzVz3YbCwMlg==
X-Received: by 2002:a05:622a:170b:b0:3ef:2fbd:90ba with SMTP id
 h11-20020a05622a170b00b003ef2fbd90bamr36987110qtk.43.1682526026089; 
 Wed, 26 Apr 2023 09:20:26 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a05622a050d00b003ef38277445sm5432332qtx.16.2023.04.26.09.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 09:20:25 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org (open list:PReP)
Subject: [PATCH v9 8/8] raven: disable reentrancy detection for iomem
Date: Wed, 26 Apr 2023 12:19:51 -0400
Message-Id: <20230426161951.2948996-9-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230426161951.2948996-1-alxndr@bu.edu>
References: <20230426161951.2948996-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.83; envelope-from=alxndr@bu.edu;
 helo=esa13.hc2706-39.iphmx.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.266, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

As the code is designed for re-entrant calls from raven_io_ops to
pci-conf, mark raven_io_ops as reentrancy-safe.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 hw/pci-host/raven.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
index 072ffe3c5e..9a11ac4b2b 100644
--- a/hw/pci-host/raven.c
+++ b/hw/pci-host/raven.c
@@ -294,6 +294,13 @@ static void raven_pcihost_initfn(Object *obj)
     memory_region_init(&s->pci_memory, obj, "pci-memory", 0x3f000000);
     address_space_init(&s->pci_io_as, &s->pci_io, "raven-io");
 
+    /*
+     * Raven's raven_io_ops use the address-space API to access pci-conf-idx
+     * (which is also owned by the raven device). As such, mark the
+     * pci_io_non_contiguous as re-entrancy safe.
+     */
+    s->pci_io_non_contiguous.disable_reentrancy_guard = true;
+
     /* CPU address space */
     memory_region_add_subregion(address_space_mem, PCI_IO_BASE_ADDR,
                                 &s->pci_io);
-- 
2.39.0


