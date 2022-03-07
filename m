Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD584D0BB0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 00:07:51 +0100 (CET)
Received: from localhost ([::1]:58116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMSD-00010g-Rt
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 18:07:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM6t-0007LJ-6T
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:45:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM6r-0005dF-NC
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:45:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ezHczUZNer51n68XHQRo+8Gd2wahCXeNyLSEi3/WKiI=;
 b=QywDdwbjCmwXtQvOrzcxUU4pL9uYBxX39fQ2FeB51zKps/Gji/Ppif9r5mfmTuihEiyihw
 I2mdgAPoHDCNDdH2/GZq4GdJoWFOmjA/edDd5KzXIW7CmVz+JtNbAUOhh9A+YK1EiZXRVf
 UYEXGnHq5san3zo5sTQ0XCKgBxwDpqM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-XYgw29DnNAa5-f3CTvDJTw-1; Mon, 07 Mar 2022 17:45:44 -0500
X-MC-Unique: XYgw29DnNAa5-f3CTvDJTw-1
Received: by mail-wr1-f72.google.com with SMTP id
 h11-20020a5d430b000000b001f01a35a86fso4955521wrq.4
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:45:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ezHczUZNer51n68XHQRo+8Gd2wahCXeNyLSEi3/WKiI=;
 b=MmDdVwmPLT3GpviHgCZPhAOAr/6wi/0+WM8vUEzJ9PLJSs2GQSeRgKKXApgieUlANH
 HU0snto5oIEj/LMizMuNuS4pTUxK+HGG8ZhfeZ85yUd+O8/utUbK6kmdnd33EimEY4jR
 sedBL8oPaPkNpQGWPElyC5jtJ9oW2d4fVSpbr86Oxtjd+NA4IYL53Br+QY7OfX46J/+U
 Jws4uZx2DlGuB6vLDBxpfEbYz73Zbe0CBrkx+6GaoejaDIag2egp/Zz1QCHEgixMTfWQ
 2KCbNBAt70TzgnPNLwL81YZQtvQiYMMdOkP4G94ngbDZoPZA6w/qYp5hiTCTam9t7bA6
 siJQ==
X-Gm-Message-State: AOAM532GZRqy9AUuPTGoBdkEnQyRv99eio4oqXFVDUEEA5Ep0Ps9YO2d
 uD0+wYA96b/atJwUQJziZHPxx/StVpnZKowWEwIU64wEWMrytYp2iZwvSQNbf+YFx3wcA0nZIHG
 ymSACC8cXJ18uLk4VweujVf8ewqaf+7y/LOtojz7sUpFhQtyj+Tqp4itlQxJn
X-Received: by 2002:a7b:ca57:0:b0:381:570c:ed95 with SMTP id
 m23-20020a7bca57000000b00381570ced95mr945321wml.169.1646693142170; 
 Mon, 07 Mar 2022 14:45:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjtQK2+O9iQR+hwxcI/3iWs55gB8EA67dvBtvyHwRpjKi6oP2KHp6d6Vmxq5i+swUjHvFr+A==
X-Received: by 2002:a7b:ca57:0:b0:381:570c:ed95 with SMTP id
 m23-20020a7bca57000000b00381570ced95mr945302wml.169.1646693141922; 
 Mon, 07 Mar 2022 14:45:41 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 l10-20020a7bc44a000000b003899263bab1sm493798wmi.20.2022.03.07.14.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:45:41 -0800 (PST)
Date: Mon, 7 Mar 2022 17:45:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 21/47] hw/i386/pc_piix: Mark the machine types from version
 1.4 to 1.7 as deprecated
Message-ID: <20220307224357.682101-22-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The list of machine types grows larger and larger each release ... and
it is unlikely that many people still use the very old ones for live
migration. QEMU v1.7 has been released more than 8 years ago, so most
people should have updated their machines to a newer version in those
8 years at least once. Thus let's mark the very old 1.x machine types
as deprecated now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220117191639.278497-1-thuth@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/pc_piix.c         | 1 +
 docs/about/deprecated.rst | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 8d33cf689d..b72c03d0a6 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -757,6 +757,7 @@ static void pc_i440fx_1_7_machine_options(MachineClass *m)
     m->hw_version = "1.7.0";
     m->default_machine_opts = NULL;
     m->option_rom_has_mr = true;
+    m->deprecation_reason = "old and unattended - use a newer version instead";
     compat_props_add(m->compat_props, pc_compat_1_7, pc_compat_1_7_len);
     pcmc->smbios_defaults = false;
     pcmc->gigabyte_align = false;
diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 85773db631..cf02ef6821 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -324,6 +324,14 @@ machine is hardly emulated at all (e.g. neither the LCD nor the USB part had
 been implemented), so there is not much value added by this board. Use the
 ``ref405ep`` machine instead.
 
+``pc-i440fx-1.4`` up to ``pc-i440fx-1.7`` (since 7.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+These old machine types are quite neglected nowadays and thus might have
+various pitfalls with regards to live migration. Use a newer machine type
+instead.
+
+
 Backend options
 ---------------
 
-- 
MST


