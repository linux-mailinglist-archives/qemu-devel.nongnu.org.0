Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F80546081
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 10:52:10 +0200 (CEST)
Received: from localhost ([::1]:37268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzaNF-0003sT-R3
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 04:52:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZXg-0001f4-Bu
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:58:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZXe-0006Lu-Tt
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:58:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g4U9bw5pSjHDx4BnmbquU3cG+Yy+OPvWEp846qgpgxU=;
 b=HqaaFEFa8wcffLPrNyb2DISrAFirGfVmL0C5+mfDN8D9h9uI5N4BBcrexXkguxg3CZf+Rk
 JbP+ZhlL3hb4NSUDyQvbMchUUekbm8gfJQxC5udIYKy7f/iA5Wltd6J2Nwva9Kja3BNaG8
 D0oRhgHvEb1V8io09kaXl4X1Phx5pQE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-vkcdR_Z_OdilZ2iU34pE2w-1; Fri, 10 Jun 2022 03:58:37 -0400
X-MC-Unique: vkcdR_Z_OdilZ2iU34pE2w-1
Received: by mail-wm1-f71.google.com with SMTP id
 z13-20020a7bc7cd000000b0039c4a238eadso4999454wmk.9
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:58:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g4U9bw5pSjHDx4BnmbquU3cG+Yy+OPvWEp846qgpgxU=;
 b=Jp45T+2ku6gtpp8WmOB8vMFZ8p4l48Sd5mvVJL2cv1qxXWoV9uQCTwGe8fM9RzR9Fb
 LlLKDZp5pP0Vlj0Sw6Q/iECQi+PCgN0WrWNcQx7hSTyF0aYJh/LYEy1BaOCqdTFd4Sxv
 E9aWO7CuG2xNUXpfu/H4aOgFam+k5XkQTug6BKdwafsjMg0TPqsqMS33RUVFVbNVHjcz
 TTTA60ZQ7BD0XO93ewBnB3wa4+WRiCmSMsKwpWwWPWUlGejBi3Zb9NhfwFIsybnJxB67
 v5+GW1LyND/8bTIkCggfGlvkWR73d03W5vDIiFRdchsxlzT74Oi0NWOeYrym6QQrYNMf
 3Fww==
X-Gm-Message-State: AOAM531P3Cp5bmUAdLmEW5lkiREaoCwrx3RUAY2CsFbm7RUCQGBJWDbi
 U0DkQTCWsmfcQ2G8yvR7ExgTzIJX3tvR34aHOtMlwkrJd3q3p7oThu1a0jAtQoScUJgte3VpPmt
 HKTdTsFdfYnCg8hdmSLHnom+8sA33bhljDM17qJvRFl8tfVLutQ5EIH+CK+Lm
X-Received: by 2002:a05:6000:1c02:b0:218:42ab:281f with SMTP id
 ba2-20020a0560001c0200b0021842ab281fmr24186962wrb.607.1654847915632; 
 Fri, 10 Jun 2022 00:58:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyVC8d4hpfx44o18cb9H36abqADrJILByXcETDU1ny/htjNDJwlBAUT2GVl2DkDyFpyouHuA==
X-Received: by 2002:a05:6000:1c02:b0:218:42ab:281f with SMTP id
 ba2-20020a0560001c0200b0021842ab281fmr24186934wrb.607.1654847915364; 
 Fri, 10 Jun 2022 00:58:35 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 q18-20020a5d61d2000000b0020d0c9c95d3sm23589645wrv.77.2022.06.10.00.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:58:35 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:58:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 31/54] acpi: pc/q35: tpm-tis: fix TPM device scope
Message-ID: <20220610075631.367501-32-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

tpm-tis 2.0, is not a PCI device but ISA one, move it
under ISA scope to fix incorrect placement.

Fixes: 24cf5413aa0 (acpi: Make TPM 2.0 with TIS available as MSFT0101)
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20220608135340.3304695-32-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index bbe02b068e..6b496480d2 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1813,15 +1813,14 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
 #ifdef CONFIG_TPM
             if (TPM_IS_TIS_ISA(tpm)) {
+                dev = aml_device("ISA.TPM");
                 if (misc->tpm_version == TPM_VERSION_2_0) {
-                    dev = aml_device("TPM");
                     aml_append(dev, aml_name_decl("_HID",
                                                   aml_string("MSFT0101")));
                     aml_append(dev,
                                aml_name_decl("_STR",
                                              aml_string("TPM 2.0 Device")));
                 } else {
-                    dev = aml_device("ISA.TPM");
                     aml_append(dev, aml_name_decl("_HID",
                                                   aml_eisaid("PNP0C31")));
                 }
-- 
MST


