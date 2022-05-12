Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE94524B01
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 13:08:46 +0200 (CEST)
Received: from localhost ([::1]:38598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np6gW-0000vP-Si
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 07:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1np6IT-00043r-ST
 for qemu-devel@nongnu.org; Thu, 12 May 2022 06:43:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1np6IS-0003JG-EM
 for qemu-devel@nongnu.org; Thu, 12 May 2022 06:43:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652352231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zixh27rOJqzaU6prg5M4nS1+VfDvRj+M1FNRXY+xSxY=;
 b=au1cp3HsJiKSX11JJrsa0u65zxdp3EjZoUitVVtkzrVzULVW3iEP3UgZdcdgD8OCY8p7t2
 TY+1Um2R/Ee64t5wLDIaJgGR8kSiuu1+5Wx281b6OZfbQtHRJ8nYwfCQZXTIZGucx7EmIB
 Qic5PetSGPKSPOce5oMTaaYzKFJGVwM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-AFXYon6qMZaGwGWTXUSFkg-1; Thu, 12 May 2022 06:43:50 -0400
X-MC-Unique: AFXYon6qMZaGwGWTXUSFkg-1
Received: by mail-ed1-f71.google.com with SMTP id
 r26-20020a50aada000000b00425afa72622so2875187edc.19
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 03:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zixh27rOJqzaU6prg5M4nS1+VfDvRj+M1FNRXY+xSxY=;
 b=20xFzEnADFg1C+vWQnT3xiEIxorgNvjqPLlvqtPnPjQ6Ja6b0CIPu4zxEDq6Aai3YG
 iFgyqYTQWW4EbQSkM6g2u++ZfHTtM27U4XWYR5CVDgOblkQEpsuvhhx9zgdiiJAQgNgk
 PavohOJzhSSf+pHw2pMcXZusrVSbmt772JV913Z4JgV9tjqTQ5ujck0ji2/PZOFhTGFP
 +/9/pFKviTqTeR0gOvrXzG43cNbhPv81Db+N5zJFUU1hzs9ZTckd8ZjPYRYgKl9NDoCu
 Qp7nIzUz/uWYD1cDElLvhRgMLeARqi8j7emxTedS5jcRJMqwYBKU6ljukG1RvLib89cq
 PUwA==
X-Gm-Message-State: AOAM531SNz8tVjE69aBrOeb0mGl98Sb+BPjdhjp23MYKRZKfVLBmLIZr
 WzAKwv/JDbu4juXO+QUEQM7TZbRysygO0h+Oebvk/xWlpXBcH6l0CMvWC5Lb1oGzl5UUm1llMZE
 ob+gm6gH2bMsf+CMEbrIbdPQLooqPbJ7bcnBljP3PZJs1vdMQArHBZZokKvKkOSW19mQ=
X-Received: by 2002:a17:906:99c3:b0:6f4:b02a:d53b with SMTP id
 s3-20020a17090699c300b006f4b02ad53bmr28806018ejn.331.1652352228474; 
 Thu, 12 May 2022 03:43:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6BJCOve5j6vE7syr4Izo/1CrfrZyYu3Pa7BMvbqlBgMimowz6ub0Vn2vB6e7Nh3QsCppTvQ==
X-Received: by 2002:a17:906:99c3:b0:6f4:b02a:d53b with SMTP id
 s3-20020a17090699c300b006f4b02ad53bmr28805984ejn.331.1652352228124; 
 Thu, 12 May 2022 03:43:48 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a1709062daa00b006f3ef214da8sm2024539eji.14.2022.05.12.03.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 03:43:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: nsaenzju@redhat.com,
	stefanha@redhat.com
Subject: [PATCH v2 0/3] thread-pool: fix performance regression
Date: Thu, 12 May 2022 12:43:43 +0200
Message-Id: <20220512104346.865536-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Together, these two patches fix the performance regression induced by
QemuSemaphore; individually they don't though.

The third patch is a small cleanup on top, that was enabled by the
recent introduction of min_threads/max_threads knobs for the
thread pool.

6.2:
   iops        : min=58051, max=62260, avg=60282.57, stdev=1081.18, samples=30
    clat percentiles (usec):   1.00th=[  490],   99.99th=[  775]
   iops        : min=59401, max=61290, avg=60651.27, stdev=468.24, samples=30
    clat percentiles (usec):   1.00th=[  490],   99.99th=[  717]
   iops        : min=59583, max=60816, avg=60353.43, stdev=282.69, samples=30
    clat percentiles (usec):   1.00th=[  490],   99.99th=[  701]
   iops        : min=58099, max=60713, avg=59739.53, stdev=755.49, samples=30
    clat percentiles (usec):   1.00th=[  494],   99.99th=[  717]
	
patched:
   iops        : min=60616, max=62522, avg=61654.37, stdev=555.67, samples=30
    clat percentiles (usec):   1.00th=[  474],   99.99th=[ 1303]
   iops        : min=61841, max=63600, avg=62878.47, stdev=442.40, samples=30
    clat percentiles (usec):   1.00th=[  465],   99.99th=[  685]
   iops        : min=62976, max=63910, avg=63531.60, stdev=261.05, samples=30
    clat percentiles (usec):   1.00th=[  461],   99.99th=[  693]
   iops        : min=60803, max=63623, avg=62653.37, stdev=808.76, samples=30
    clat percentiles (usec):   1.00th=[  465],   99.99th=[  685]
	
Paolo

v1->v2: support min_threads/max_threads

Paolo Bonzini (3):
  thread-pool: optimize scheduling of completion bottom half
  thread-pool: replace semaphore with condition variable
  thread-pool: remove stopping variable

 util/thread-pool.c | 70 +++++++++++++++++-----------------------------
 1 file changed, 26 insertions(+), 44 deletions(-)

-- 
2.36.0


