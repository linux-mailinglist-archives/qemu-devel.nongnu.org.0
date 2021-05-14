Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A00380E52
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:38:54 +0200 (CEST)
Received: from localhost ([::1]:36526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhapx-0000Du-Qy
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaJ4-00074v-Rc
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:04:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaJ1-0005Yl-Ox
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:04:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621008291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mp2jdsNr0uNdTfjJQPypPSs+10AiUaIqMyo8WCovm0s=;
 b=C/RB3HUR0B1077iYq/rzQJLZr52aPufwckCIUS2xnyXMwkNuYGhfNFVApKHjrk9Cg+WT20
 FmlkQP6GBz0DpGq7BgFcCuJ3Yern24pEmFqm8LJW/kstKw+3ngzlKRg1s+9gpRnwpePb5r
 x+DB7ADWhw/RBtZhINUwNzaMAaNJ8/I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-xvQLSNa-M3-jFeq7qw2YwA-1; Fri, 14 May 2021 12:04:49 -0400
X-MC-Unique: xvQLSNa-M3-jFeq7qw2YwA-1
Received: by mail-wr1-f71.google.com with SMTP id
 2-20020adf94020000b0290110481f75ddso1632645wrq.21
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 09:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Mp2jdsNr0uNdTfjJQPypPSs+10AiUaIqMyo8WCovm0s=;
 b=W+lqpp5ltkrSdPZIXT6NTujSJ7PbGvRcRD8M+f4sC/O+lRZU2l+gak/sUPQn+RRqEV
 /gWJ+simwlhgzJVCL9FXNC6kMfKkwUNTm/F0ESF2IkenZ+KNMITXI0Q3uT5ciO8hhuF2
 98Ut1wFnr8ayCfMgN0vrAfWq4pw+6vW0RFX138l3KARTaH/AcVzSi15Rwx3a4regR/zN
 PiSbPl1zc4nySYD4b6e9q7/SONfSxbleLPF40XaEA+/3mMCUTeO+y50o/sPReJJ/ICGT
 OvQeBXT0O9MrtlsqpgoMYo0Z9OBUCVd3erlhm7exXcj5wXhYVulw6CCH/PvhhItQSQry
 0jnA==
X-Gm-Message-State: AOAM532OF0ShqYX+8/wOJLZblF3kgiYZaGZ8qeUG+oEr62AtNeqRcYsu
 ARUfaQe14YvKxHVLBR6sNBP80g1IXT5wLurWS0GeOEZEhkeUtL4/UofboyM5nl66sAdO5FoVxd2
 hLz9r4z4G8iNAfP10WqlFsED00eU0AzZV7VB4ZB0cHFXKBIm37QNqkOYC29DF
X-Received: by 2002:a05:600c:3510:: with SMTP id
 h16mr40769800wmq.38.1621008287299; 
 Fri, 14 May 2021 09:04:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkJvoSWPCrpbbkvXZj6Fv0tcBNFGdkbatEfN782X0HEUNi/8kqHa51D97Me+gSa59vk7MLng==
X-Received: by 2002:a05:600c:3510:: with SMTP id
 h16mr40769779wmq.38.1621008287067; 
 Fri, 14 May 2021 09:04:47 -0700 (PDT)
Received: from redhat.com ([2a10:800c:1fa6:0:3809:fe0c:bb87:250e])
 by smtp.gmail.com with ESMTPSA id r5sm724945wrw.96.2021.05.14.09.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 09:04:45 -0700 (PDT)
Date: Fri, 14 May 2021 12:04:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/16] checkpatch: Fix use of uninitialized value
Message-ID: <20210514160245.91918-13-mst@redhat.com>
References: <20210514160245.91918-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210514160245.91918-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: isaku.yamahata@intel.com, Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

checkfilename() doesn't always set $acpi_testexpected. Fix the following
warning:

Use of uninitialized value $acpi_testexpected in string eq at
 ./scripts/checkpatch.pl line 1529.

Fixes: d2f1af0e4120 ("checkpatch: don't emit warning on newly created acpi data files")
Cc: isaku.yamahata@intel.com
Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <161786467973.295167.5612704777283969903.stgit@bahia.lan>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 scripts/checkpatch.pl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 8f7053ec9b..3d185cceac 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1532,6 +1532,7 @@ sub process {
 		     ($line =~ /\{\s*([\w\/\.\-]*)\s*\=\>\s*([\w\/\.\-]*)\s*\}/ &&
 		      (defined($1) || defined($2)))) &&
                       !(($realfile ne '') &&
+                        defined($acpi_testexpected) &&
                         ($realfile eq $acpi_testexpected))) {
 			$reported_maintainer_file = 1;
 			WARN("added, moved or deleted file(s), does MAINTAINERS need updating?\n" . $herecurr);
-- 
MST


