Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCC6526E5E
	for <lists+qemu-devel@lfdr.de>; Sat, 14 May 2022 08:56:34 +0200 (CEST)
Received: from localhost ([::1]:46276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nplhZ-0002f7-RH
	for lists+qemu-devel@lfdr.de; Sat, 14 May 2022 02:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nplbb-0008BP-47
 for qemu-devel@nongnu.org; Sat, 14 May 2022 02:50:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nplbX-0007eJ-Em
 for qemu-devel@nongnu.org; Sat, 14 May 2022 02:50:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652511017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AfBb3Cjb+HadOjJh4ascv8MI1gfwCW45FR4gDCBTd6s=;
 b=hhbx17U5GQKY32APYqhfX1wIDemM0jD2LMrKHWfjA5SEsIlHUYQwjNUCJGCY/n2wXe+9XH
 PKt1byJn5w6ohjXRIl6RrG8gjPF92yyqrM0P92Jd1uaBAkV4VpZ7EYSmwsw8vcdAwGX1KS
 otZzIhiZsOepZg/BYZNWrMwSp6xfhhc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-zIiQDVpXPRuyJULSy9X2RA-1; Sat, 14 May 2022 02:50:15 -0400
X-MC-Unique: zIiQDVpXPRuyJULSy9X2RA-1
Received: by mail-wr1-f71.google.com with SMTP id
 m8-20020adfc588000000b0020c4edd8a57so3314917wrg.10
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 23:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AfBb3Cjb+HadOjJh4ascv8MI1gfwCW45FR4gDCBTd6s=;
 b=y9DZfTPK23A3FdD5/7Mez7M7it1aJ/u4m0pMEC1RFylf3Vkl0Lx/bmtpsP+oLI9EFQ
 EKxTkNlKBXpUvDAD+iwln8NTrtbr3A+bEsdht4gtJIGwuWs9fxAZHg/ta2YhNKZNIDj4
 IOnQ4BRDMLKX+YjGw6IVxTElVA0P9ofJLmAfgB8zdjHfLwL+bOlpTHUBnNjlt+c40dTF
 pPWa1S+k35IXRuxWks6eE1de6jD5OFbhDgzAXuoo/UIvNUjUjd5oHJkkIrH4/mrV3lHy
 ncV0u9ItFi1gTJ67soo1giW64b5EScxVfpWYm4xi0I5c6HoWPEwgE4YACAaafJle3Ji+
 WGcg==
X-Gm-Message-State: AOAM530xhNN8+mzW8nBlmj6qlgsm88RHiNnAul26g0En9nkxe1Xbmxqy
 eofWciP9COFgCNH729YpkyyctklH1nEI9ijyrHhXsyGie9uDywQ2gqjt3dg2/ltxNUkTqP8JJp5
 c7b9rcGfQ8brznHpPmgu0xI0IYVLhzslr6XQUn0LuEP4g5iyMS1v81hm4ZbHv5Cfs0gc=
X-Received: by 2002:a05:600c:1e83:b0:395:b8e8:d256 with SMTP id
 be3-20020a05600c1e8300b00395b8e8d256mr7665151wmb.134.1652511013920; 
 Fri, 13 May 2022 23:50:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmcXpWlvzhV63HzFbleFx7VRdbBayNRVKJQbHqT/P6rmAP3rkoyroVZdVr4/ki+c2sRxhq2Q==
X-Received: by 2002:a05:600c:1e83:b0:395:b8e8:d256 with SMTP id
 be3-20020a05600c1e8300b00395b8e8d256mr7665124wmb.134.1652511013528; 
 Fri, 13 May 2022 23:50:13 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v3-20020adf8b43000000b0020c5253d8c2sm3966734wra.14.2022.05.13.23.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 23:50:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	nsaenzju@redhat.com
Subject: [PATCH v3 0/3] thread-pool: fix performance regression
Date: Sat, 14 May 2022 08:50:09 +0200
Message-Id: <20220514065012.1149539-1-pbonzini@redhat.com>
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

v2->v3: fix NULL pointer dereference [Nicolas]

Paolo Bonzini (3):
  thread-pool: optimize scheduling of completion bottom half
  thread-pool: replace semaphore with condition variable
  thread-pool: remove stopping variable

 util/thread-pool.c | 74 +++++++++++++++++++---------------------------
 1 file changed, 30 insertions(+), 44 deletions(-)

-- 
2.36.0


