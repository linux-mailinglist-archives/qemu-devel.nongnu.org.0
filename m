Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E714300E08
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:48:47 +0100 (CET)
Received: from localhost ([::1]:46930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l33MM-0006mb-FX
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:48:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l33Iv-0004zE-1l
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:45:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l33It-0002cJ-Bl
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:45:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611348310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BS4UgVi6YkcI9gALuOcfQ485tajLCMcuiC5E8yTwxc8=;
 b=GI7bW+tIY/owxhkuu+/ui42Gj8XInljKY5LF3e3PFd9jy5hjPBhQO/WTXvLiXWz2SSeUkc
 7GGcYknT/QzixeS4u66958RPRa8qnSRNPXdc2y7paUdYG5v7ClymyG6Gx8v0z8D699V3nO
 oN7Ag+/JV/MNoO1l0NlveFmurOzlnz0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-EvJwCvmSMRi67S0lNvN8LA-1; Fri, 22 Jan 2021 15:45:07 -0500
X-MC-Unique: EvJwCvmSMRi67S0lNvN8LA-1
Received: by mail-ej1-f72.google.com with SMTP id p1so2677189ejo.4
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 12:45:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BS4UgVi6YkcI9gALuOcfQ485tajLCMcuiC5E8yTwxc8=;
 b=PMTQmPZ8A6dw6spg95Js8+aaxLXVrVzi3D8yquZDf2mEWsoXyLf/IYAbvcNMTEeBV1
 DuoLsHcS3tpvFFYBc40yBtf1GSj9/rutGtT0PBfRC6eXetevfH7JFT5KpWvQfbygbeFx
 SQCgGykur+3xFRSwabCKWDB5vjTeKf6A1htK2ZcRPwsIvVShx/qUzlCpKVodE+ahsVZe
 DSQ6y6T37XWnEM9KaIkJe7wnayK2aqq3yWDG+gsTPaPetOHMg11mw88gTkrxuQcxxsDz
 2FN12xaHvz0M3pJwXiPX060sDvN07Io6+zQJAM24Q/9UuC1EQsKlCgurkrxPnVDs4Tqo
 zOxg==
X-Gm-Message-State: AOAM530ruJAEeLpvOvD49VsKSbIRTL3hmuj3xWUpIPfjSUk6cqRi9dMg
 Jxns8pP0ZYN9DnX3NYK0Eembllzpr0LZXM8++pfQJfWGxMwNjcQa2Jc5oFkQGwzZ3Y5HejIPdGP
 zl7yI13Wu7GdG6Lme0w7o6JgQ2Zd69do6NWr4sKZBwetRjsR/alWLhBm1LcfqEXib
X-Received: by 2002:a05:6402:14b:: with SMTP id
 s11mr4439530edu.214.1611348306238; 
 Fri, 22 Jan 2021 12:45:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0dHMcfgaUDK4+Odqgy3SMUCdFjQbcUtB1rngABW4hdqxEvRvMmbiv+iSd+O6gBYRYwHyDNA==
X-Received: by 2002:a05:6402:14b:: with SMTP id
 s11mr4439509edu.214.1611348306083; 
 Fri, 22 Jan 2021 12:45:06 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id m22sm6236571edp.81.2021.01.22.12.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 12:45:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 04/12] meson: Do not build optional libraries by default
Date: Fri, 22 Jan 2021 21:44:33 +0100
Message-Id: <20210122204441.2145197-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122204441.2145197-1-philmd@redhat.com>
References: <20210122204441.2145197-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following libraries will be selected if a feature requires it:

- capstone
- fdt
- SLiRP

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
 meson.build | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meson.build b/meson.build
index a1e1eb318a5..61cbb89cd44 100644
--- a/meson.build
+++ b/meson.build
@@ -1446,6 +1446,7 @@
   ]
 
   libcapstone = static_library('capstone',
+                               build_by_default: false,
                                sources: capstone_files,
                                c_args: capstone_cargs,
                                include_directories: 'capstone/include')
@@ -1523,6 +1524,7 @@
 
     slirp_inc = include_directories('slirp', 'slirp/src')
     libslirp = static_library('slirp',
+                              build_by_default: false,
                               sources: slirp_files,
                               c_args: slirp_cargs,
                               include_directories: slirp_inc)
@@ -1568,6 +1570,7 @@
 
     fdt_inc = include_directories('dtc/libfdt')
     libfdt = static_library('fdt',
+                            build_by_default: false,
                             sources: fdt_files,
                             include_directories: fdt_inc)
     fdt = declare_dependency(link_with: libfdt,
-- 
2.26.2


