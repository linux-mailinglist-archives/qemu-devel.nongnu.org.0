Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6021302676
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 15:50:37 +0100 (CET)
Received: from localhost ([::1]:54792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l43CO-0006fg-J6
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 09:50:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l437q-0003uX-7g
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:45:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l437n-0002rH-9z
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:45:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611585950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/vTBGdpObdt7akXTKRcYVJLfbSFpvNvWMtOTP20LsSw=;
 b=K9ZFprSQHmpn0MNmn4jY7288Y4GfXFwTP+LYOAODru8TdXgi5pOrNueuhVfPt/j5r/7OYG
 UsTJ9tjRJwpzTXk1vIfVQzK7aDVCYO7pJ9FQ0yQ71HzKb90y2VPYlNghJNl+aLW1r0hxpq
 wMStKSVyMpM1Ur6lFgQjFAxehiUn5Dw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-M7Y9MNTcMDezn5e3QaR56w-1; Mon, 25 Jan 2021 09:45:48 -0500
X-MC-Unique: M7Y9MNTcMDezn5e3QaR56w-1
Received: by mail-ej1-f70.google.com with SMTP id m4so3841100ejc.14
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 06:45:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/vTBGdpObdt7akXTKRcYVJLfbSFpvNvWMtOTP20LsSw=;
 b=lAUzrJWrcGBITeHZWqlvUMjvcrbWeuRZWReBRwps6avagH0BVis2Vc2z3Qk8Hh64Er
 fI+r01QRya6m3AjVyTomaz8xYwghazcc43W8PzveVtonM3aa0Z74Rt8NOOtNLpqU/nD/
 IIioFx7A1TYptdeV9mwL5ZjaCYOPWXCiveSMj3DQk7l2dqitO7Lac2i4p7BCmZgyUYrY
 3Rms1+grw7SudR7kuPzoZd0ZJ9QhgQPC6/ph5x3dCEH/SA0SfEu1y8lgWQsaAq3WdPAA
 kMzYHC4ncNceHit/ai21x2pXg6wb+fOzHoQchcwM6B+HEdoz4lWFvtycHIOtM3ZDF8Jd
 FOhg==
X-Gm-Message-State: AOAM531WXhWidOwG/dXyEGZbFSJmkDThsgryRDKMJajY8dXbJMtaXNzI
 s7RFck/EM6Kkrkhey8sWhGGJBTHmlzE7eRNq9ZNWdrqJ7fAuTGttxacUXf0aVFk9vuMaShcwWCm
 d8IV/JqclFcqImfmEECyV+wmr5M9i9TpF0p4Eprx2v7+eHGnh2HTgPuWVXn1YGduH
X-Received: by 2002:a17:906:3a98:: with SMTP id
 y24mr557816ejd.436.1611585947420; 
 Mon, 25 Jan 2021 06:45:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxbqhCxaQl381d2LAvhvh+O0qV3j7JW5isaDMyu7oEjzWubENYGfe3V3+dRa6yNNc0pLIKnxQ==
X-Received: by 2002:a17:906:3a98:: with SMTP id
 y24mr557803ejd.436.1611585947278; 
 Mon, 25 Jan 2021 06:45:47 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id e22sm8473467ejd.79.2021.01.25.06.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 06:45:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/4] configure: Improve TCI feature description
Date: Mon, 25 Jan 2021 15:45:28 +0100
Message-Id: <20210125144530.2837481-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210125144530.2837481-1-philmd@redhat.com>
References: <20210125144530.2837481-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Users might want to enable all features, without realizing some
features have negative effect. Mention the TCI feature is slow
and experimental, hoping it will be selected knowingly.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 526c4cc1306..00952ac8186 100755
--- a/configure
+++ b/configure
@@ -1748,7 +1748,7 @@ Advanced options (experts only):
   --with-trace-file=NAME   Full PATH,NAME of file to store traces
                            Default:trace-<pid>
   --disable-slirp          disable SLIRP userspace network connectivity
-  --enable-tcg-interpreter enable TCG with bytecode interpreter (TCI)
+  --enable-tcg-interpreter enable TCI (TCG with bytecode interpreter, experimental and slow)
   --enable-malloc-trim     enable libc malloc_trim() for memory optimization
   --oss-lib                path to OSS library
   --cpu=CPU                Build for host CPU [$cpu]
-- 
2.26.2


