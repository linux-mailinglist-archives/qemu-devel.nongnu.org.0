Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DDF2FC05D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 20:53:12 +0100 (CET)
Received: from localhost ([::1]:49804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1x3v-0002Zn-LH
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 14:53:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1w5V-0003br-8l
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:50:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1w5S-0003Wa-Bp
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:50:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611082241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/k5bjmk2LRLx9bl4raECw64bR1tmiiOlmpz+7iyHS6Q=;
 b=FzRA+fKxPTrAfhwKc2ciNJiBWF5h3KHd6ZKU4XiDGzubeZCp535Fh4VNWks4yxQOo9cYZh
 t+FNSpw4VC33gUcv93R/weD24VKSze2P26JAbto3GNvf4N/Jx0YpOccbA7t9ij/btlIoph
 IQPlRaFrocAkCMjzLC9Jqox3vmrkch8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-5KmB1P-tPqmkUMVaGA9SMw-1; Tue, 19 Jan 2021 13:50:40 -0500
X-MC-Unique: 5KmB1P-tPqmkUMVaGA9SMw-1
Received: by mail-ed1-f71.google.com with SMTP id r4so571177eds.4
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 10:50:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/k5bjmk2LRLx9bl4raECw64bR1tmiiOlmpz+7iyHS6Q=;
 b=FOJrrQwdvFnsuI7CmF/8/RAOE3o3WRwzcfSUki65Y2UyNyuNJo0d7JJ17yFcHTpufX
 CbBRbJaALM4wSAihilBBnx0AHCsrFn9kq1BOwNlvCa7VniG52TU3KiVcA/6qP13kBhpW
 YWAyGTLIiDq4iyuV0FqlV34wDWITcg0ws3PCxzKMJYgKNYAbxxDPReg29lRSVcvALp1z
 Z7IurCsxCmLmagAVZM+sLm8nwdK5mzSRpblXTf/9tkPwn3WLnr0mXz1BjRNKsdHFEUPs
 dYfSgQzZQJsPDAgPOpyZA8s0YMHuxlGgs55QCtYEgh7VAA6b+74wqjIYWL51ohcS050d
 kleQ==
X-Gm-Message-State: AOAM531lf5fiZnxZhPjLyU3lDHFZlCnBRWmJ8dMWUSOxKMQNUl4rHLi9
 up9AZ3TRd7AVgE6irgj8LZgvdihIpu7NN8NjfuE4w0y3iIWapxvrt6itCuU4gHDb3ehPiFmaa02
 FE/QbaOPO6Uq8rys8L0ZfNLA2YyMqLbnYZhlkdZvF3+2G9opv5HT2Hbp4OaX14Owd
X-Received: by 2002:a17:907:7356:: with SMTP id
 dq22mr3909420ejc.318.1611082238663; 
 Tue, 19 Jan 2021 10:50:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwR5zBQpn0TaTrJoscSk40oUMFE82EClnWUrZLVo3p9Vo5QSMZicsE4E85MDAbQ2wEauzQ2rw==
X-Received: by 2002:a17:907:7356:: with SMTP id
 dq22mr3909411ejc.318.1611082238493; 
 Tue, 19 Jan 2021 10:50:38 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id e19sm4995705eds.79.2021.01.19.10.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 10:50:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/9] meson: Restrict system-mode specific accelerators
Date: Tue, 19 Jan 2021 19:50:02 +0100
Message-Id: <20210119185005.880322-7-philmd@redhat.com>
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

Avoid displaying accelerators which are restricted to
system-emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meson.build b/meson.build
index 940898eb5b4..575e34d88ac 100644
--- a/meson.build
+++ b/meson.build
@@ -2377,13 +2377,15 @@
 endif
 summary_info += {'target list':       ' '.join(target_dirs)}
 
-summary_info += {'KVM support':       config_all.has_key('CONFIG_KVM')}
-summary_info += {'HAX support':       config_all.has_key('CONFIG_HAX')}
-summary_info += {'HVF support':       config_all.has_key('CONFIG_HVF')}
-summary_info += {'WHPX support':      config_all.has_key('CONFIG_WHPX')}
-summary_info += {'Xen support':       config_host.has_key('CONFIG_XEN_BACKEND')}
-if config_host.has_key('CONFIG_XEN_BACKEND')
-  summary_info += {'xen ctrl version':  config_host['CONFIG_XEN_CTRL_INTERFACE_VERSION']}
+if have_system
+  summary_info += {'KVM support':       config_all.has_key('CONFIG_KVM')}
+  summary_info += {'HAX support':       config_all.has_key('CONFIG_HAX')}
+  summary_info += {'HVF support':       config_all.has_key('CONFIG_HVF')}
+  summary_info += {'WHPX support':      config_all.has_key('CONFIG_WHPX')}
+  summary_info += {'Xen support':       config_host.has_key('CONFIG_XEN_BACKEND')}
+  if config_host.has_key('CONFIG_XEN_BACKEND')
+    summary_info += {'xen ctrl version':  config_host['CONFIG_XEN_CTRL_INTERFACE_VERSION']}
+  endif
 endif
 summary_info += {'TCG support':       config_all.has_key('CONFIG_TCG')}
 if config_all.has_key('CONFIG_TCG')
-- 
2.26.2


