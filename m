Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7929248DDFB
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 20:02:05 +0100 (CET)
Received: from localhost ([::1]:37692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n85MJ-0007G1-70
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 14:02:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n85Ch-0000L5-NM
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 13:52:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n85Ce-0007tv-32
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 13:52:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642099922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=rJ5yvVrLRhCi2fhFSRcPqSa4hz7mzueVl7ocHE4nJ88=;
 b=RzTrNrJ9L1a4m6qnb31eujRgtF5czazKZJC1BK6bjD/Ub3T8mYfxmkbs+ctCo7y49gSZn8
 SHS1C92N4pN/dedp+mITzMJW/QSoo5orMfr/SI4jvKz918dhUrhoZDNGbB8B7zKx0IWONh
 ZBugXfNwDojIyUpN4Wd7Vj9bNbbmeAE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-X1f7XCGcOGSmOVKt2pSWWA-1; Thu, 13 Jan 2022 13:52:01 -0500
X-MC-Unique: X1f7XCGcOGSmOVKt2pSWWA-1
Received: by mail-wr1-f69.google.com with SMTP id
 q2-20020adfab02000000b001a3ed59eb96so1380564wrc.20
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 10:52:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=rJ5yvVrLRhCi2fhFSRcPqSa4hz7mzueVl7ocHE4nJ88=;
 b=DWvwzWzx8QLsE58FKWQX6oVFyIsU1GzatCFEE6s1Fv103TJs9gQJCHNZXerohx0COi
 cFssHyWt+u6isL67skHU0pLhb/9wIchZ7Jc8H9/w7pXQnnmOgKP1i8q86pWS9+p4ga4g
 GseM5txSrtsD5udb1m6848L48E8YFQePn3kiit5jmf3w3BB8Q49B29IlLqFOTE3gk/Ua
 vqxHPFFN7K7KUcqli5YNQKL+qQKh1j+pUHQEr8EBUeGhW4vpgBmCeIVL+DRVd2RGbL41
 rG7qqjvOzdayYLpO9LvHNZNyD4TU833B5zkqvu0bh3fG7iMXUEgzLfiLNkSQbg/JVZVR
 j4lg==
X-Gm-Message-State: AOAM5312Ur/axzOMzVTOqmC3Jucxu7A6ufUkDplCoXjHWdlQqRsPCkX1
 CC3GRmSM/Xyb9JA0eDj4PfmU3+S5y0F57PQR4mYrM/ZTk6vUGbMZTGs1p5LqfjyrYl/xkNEnS68
 T/PbNykC5GnSFbwfwGe9MwXRMBty+XtAkGrE0wUScvt6BKRtD41IyZOu99+po5aOUF7k=
X-Received: by 2002:a7b:c8d0:: with SMTP id f16mr5099893wml.142.1642099919794; 
 Thu, 13 Jan 2022 10:51:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzV8KoPWyjuOSybRuzR75qvQn/riIc5fIoYRQnMCPjDsWHUhXYU5W7+xjrNOc2K8CbgWwOJ9A==
X-Received: by 2002:a7b:c8d0:: with SMTP id f16mr5099865wml.142.1642099919412; 
 Thu, 13 Jan 2022 10:51:59 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id h5sm3263267wrq.44.2022.01.13.10.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 10:51:58 -0800 (PST)
Date: Thu, 13 Jan 2022 18:51:56 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, clg@kaod.org, danielhb413@gmail.com,
 david@gibson.dropbear.id.au, groug@kaod.org, lvivier@redhat.com
Subject: ppc pbr403 vmstate
Message-ID: <YeB0zGRC/ct8DAzM@work-vm>
MIME-Version: 1.0
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,
  Is there any easy way of getting a machine where the pbr403 vmstate
would be generated?

  Given my vague understanding of vmstate subsection naming, I think
we need:

diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index 756d8de5d8..e535edb7c4 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -718,7 +718,7 @@ static bool pbr403_needed(void *opaque)
 }
 
 static const VMStateDescription vmstate_pbr403 = {
-    .name = "cpu/pbr403",
+    .name = "cpu/tlb6xx/pbr403",
     .version_id = 1,
     .minimum_version_id = 1,
     .needed = pbr403_needed,

to fit the rule where the name of a subsection is prefixed
by the parent name. (Something a new check I added just triggered).

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


