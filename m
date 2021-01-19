Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2F82FC030
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 20:43:38 +0100 (CET)
Received: from localhost ([::1]:55504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1wuf-0000nE-HV
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 14:43:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1w5R-0003XP-7E
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:50:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1w5O-0003Uh-Vx
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:50:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611082236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9yzszkImjws6KV4XZukmk1HoOAIleAy/lLQkFMCcXyE=;
 b=DYJz+mumWMTZE/csjbsC0GbozgQx57WHiksE5loo1wKbFTda3GfQOT7YnhGbs/t3ETkxAL
 7juC+XQkzNS9ay/uoLpHyJG5/dwfr5bp62bVSlQBCUI4MCjstFCzaI/du6uCJb/smuAVwd
 aa62mIzHA0IYoJ8VCM/syGoED26ec6c=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-SsDwu_4jMBSDywx2HqdkKA-1; Tue, 19 Jan 2021 13:50:34 -0500
X-MC-Unique: SsDwu_4jMBSDywx2HqdkKA-1
Received: by mail-ed1-f69.google.com with SMTP id o19so3194606edq.9
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 10:50:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9yzszkImjws6KV4XZukmk1HoOAIleAy/lLQkFMCcXyE=;
 b=aoyluHrLrwHx+KccLGg1rZUi7S075Bo0op7oyKgZXZ8UfRFt1CXjf03/7mMIZCdf8H
 w5AK5D7NGgMbrHMirSWsWWLRejP9TG6yy8m5W0iPeruELIWjuGduh91uvCGrFMs6etvG
 12zKp13pysH24feo/O25FAQOqRsG+gu/VV6vtYs8xbwU8l9yxkdRYrSuZgwf0n7uZ8lw
 P7xO822JO366pXKhTAfVRnxEHj+pDA9EqboC5LpRL7nwFw2Q1klTxRwTSMFw6XqXTpMk
 5+U0+AbbnkadULewIxPBSLkem0/ks6Gx5rset7Z5a4hplcaCWOfs5RIHvUmYhSY2xU0/
 gxjQ==
X-Gm-Message-State: AOAM533DUKiVH34XhxhaeeYLH9KFPOg0Up84HkaGx03vn+S5y4Eyq0aV
 tsGnius7ZF8kn7KwK1qpEmS7wAFG26q3LrEDg2pBvIz8wzZLKNJAU+D+betdKCVlM5xqfMWeb7C
 p+5JWGpFlw5XFEZJlyrp+AzpScUuc0LQZtnRO8djRnhukIn75xANAKE5XGfPrDcYt
X-Received: by 2002:aa7:d94b:: with SMTP id l11mr4471747eds.1.1611082233229;
 Tue, 19 Jan 2021 10:50:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0vE1Al5irX0lAJKJXKavYObC4pjrtb3lNBNGZKFTJQfRaCozNQvpD+cU+EufldDaGMM298g==
X-Received: by 2002:aa7:d94b:: with SMTP id l11mr4471728eds.1.1611082233032;
 Tue, 19 Jan 2021 10:50:33 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s1sm11166896ejx.25.2021.01.19.10.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 10:50:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/9] meson: Display if system emulation is selected in summary
Date: Tue, 19 Jan 2021 19:50:01 +0100
Message-Id: <20210119185005.880322-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210119185005.880322-1-philmd@redhat.com>
References: <20210119185005.880322-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meson.build b/meson.build
index d89eeb8c5ce..940898eb5b4 100644
--- a/meson.build
+++ b/meson.build
@@ -2370,6 +2370,7 @@
   summary_info += {'smbd':            config_host['CONFIG_SMBD_COMMAND']}
 endif
 
+summary_info += {'system-mode emulation': have_system}
 summary_info += {'module support':    config_host.has_key('CONFIG_MODULES')}
 if config_host.has_key('CONFIG_MODULES')
   summary_info += {'alternative module path': config_host.has_key('CONFIG_MODULE_UPGRADES')}
-- 
2.26.2


