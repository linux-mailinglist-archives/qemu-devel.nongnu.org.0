Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B057524AC0
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 12:49:04 +0200 (CEST)
Received: from localhost ([::1]:52670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np6NS-0006Tk-UZ
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 06:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1np6IC-0003qg-3C
 for qemu-devel@nongnu.org; Thu, 12 May 2022 06:43:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1np6I8-0003IZ-K9
 for qemu-devel@nongnu.org; Thu, 12 May 2022 06:43:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652352209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zixh27rOJqzaU6prg5M4nS1+VfDvRj+M1FNRXY+xSxY=;
 b=PcKnoOVENT5PsenAybkMFOHiStndq6bYMUP5fVWrsZRWMsYazur+JKcFV4FA+/tTIAWwIN
 ANn+2+RTxKpS9kxVPY0aaQnJ3vvaleRHG0lNhVedFwIg1lOCBYX5fK6HiF+k56+RF96shP
 F85KxSnxWAYjko7/bqM1DGTvCi3vNQQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-YMc2izkgNTupde6b-Ma-yw-1; Thu, 12 May 2022 06:43:28 -0400
X-MC-Unique: YMc2izkgNTupde6b-Ma-yw-1
Received: by mail-ej1-f69.google.com with SMTP id
 qa15-20020a170907868f00b006f4c89bf2e3so2630603ejc.9
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 03:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zixh27rOJqzaU6prg5M4nS1+VfDvRj+M1FNRXY+xSxY=;
 b=AmKnUnzkSVjyPMUY5audwIq3gJu3u3nkEQWDJfasKeEpuGHDpqZ2uQfnzQsEiQbN8i
 5Qy6LITB714FX1VnHw3lGhVTsh8q9SesuRx1pFQd84y/NjdgqnepwuaklPlDn/x798wS
 R+ETQrIPr0B8s6ju1sqeYvwevd10xC6r/YT4Qvrs6G3pTmsP8hZb0OH/cTewN064wCIJ
 ro/Eub//NgCnAml4vTSXdoF0Wk9OTVzL5Bz065sM+fp4MkHUxbHCV61mdzqRrbLWvetg
 Ti93LfyrVR1lbtkuPUL+UNs/Db06e7wNB4v+R6PY+iUh6BFL5pTua7rQUS4XEZV+8R9y
 EoKA==
X-Gm-Message-State: AOAM533DVwYNxKGezaDiVX67DavL6E/3YHWGZlWg9n3F7UdGD3EZWJPl
 D41NKaxDGHeqpyY6ugA+5gKZPa6FK5Sk4Ly5z0CVukPXT25PkDsU9tb4+OcWUaUUSxCKtnXByAC
 nxr5z7U49cc6C7ls/wKgjIlOTCafega6jcoq5P0sJkAuOEne2FI1WirPpDm4lJrHjkEo=
X-Received: by 2002:a17:907:2d11:b0:6f4:7cf0:2275 with SMTP id
 gs17-20020a1709072d1100b006f47cf02275mr29169618ejc.72.1652352207310; 
 Thu, 12 May 2022 03:43:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgS47gugLWbO+EGRJu051XtdTk4HidqGeU4Qp0WCLqp3KM5srBolN4ubb9NVCESNddzG9pFA==
X-Received: by 2002:a17:907:2d11:b0:6f4:7cf0:2275 with SMTP id
 gs17-20020a1709072d1100b006f47cf02275mr29169582ejc.72.1652352206857; 
 Thu, 12 May 2022 03:43:26 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a1709070b1400b006f8c8e43a45sm1978208ejl.103.2022.05.12.03.43.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 03:43:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] thread-pool: fix performance regression
Date: Thu, 12 May 2022 12:43:22 +0200
Message-Id: <20220512104325.865481-1-pbonzini@redhat.com>
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


