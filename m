Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA5F400278
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 17:41:29 +0200 (CEST)
Received: from localhost ([::1]:42046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMBJo-00006K-GK
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 11:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mMBHl-0006UQ-Bz
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:39:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mMBHj-000367-RH
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:39:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630683558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lJL1uyWi5nixepOLU3A/NLvVxlwGTHSMq5Rt1apVOdc=;
 b=hrM7tAco0dkC8AoXINPjTx5jak6PQn/3qOZ28j9l//qa5OKWALYzInhJeAgqafReR89Ec/
 SVrUX23tPogjPENsCfxORA0r2fbT4dHk1m97Y8gscYL+9I6srEx8fX6duxKWL9kgyLLpVR
 PeL5YxeQr6PWOGTIMqjhT4RrQGa/64Q=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-Q8m6K5glP2-SMfgdYxQtpQ-1; Fri, 03 Sep 2021 11:39:18 -0400
X-MC-Unique: Q8m6K5glP2-SMfgdYxQtpQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 r3-20020a0cc403000000b00377a3318261so6041482qvi.11
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 08:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=lJL1uyWi5nixepOLU3A/NLvVxlwGTHSMq5Rt1apVOdc=;
 b=hqXS93ciikLJHciTTUkCVS8qJjdo3Pkf/tj69SinBZcWiB82R/41iU5zfedOVucbsT
 ZJWNKLvXYnvNpRzAnCHbCWVStdtI8fW8gg8WYty7ePWqPOWxFTpGT8Fp/6RN0hh1B2qn
 ZCrcuYFVO2d/zFwJT87gtGROPJ21hDSCHAGtqQCPemQ0e0cJpvQkGj9EpoSGST3rZAMf
 cIs537Z9kogidKYxmpzPIcqzmLF3VIpNaayjGC0cMp74tyy1pr3WRKKUxHnZLrB3LC2Q
 /rzeqUMVZIR6OmnVZH7mteAKWlgp+8A1xY03y+pt4uAj/Qb/rpSPNbhLhLsN1wHpgjF/
 LfDQ==
X-Gm-Message-State: AOAM532sG12jrQpBAB7lVCByElj8g/mms7fQfDQ72V6hJQcWKyMMCKEs
 ewxN/JDa0grWwbDfK3btRD5eCEwswR4BxtrQj+a07k2PtYC/UypUoyhN9P1lkbWSs/nN+I1L2CV
 JNAmPyOQagDE7JcE=
X-Received: by 2002:ac8:7008:: with SMTP id x8mr1501056qtm.397.1630683557634; 
 Fri, 03 Sep 2021 08:39:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpljfGYX+JFsKY5XM/+5kNaOuPGVDvOrqcL+/Joh6rko0QWjODEsXHZwcd58JLdtffksWXXA==
X-Received: by 2002:ac8:7008:: with SMTP id x8mr1501037qtm.397.1630683557370; 
 Fri, 03 Sep 2021 08:39:17 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id u22sm4039731qkj.123.2021.09.03.08.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 08:39:16 -0700 (PDT)
Date: Fri, 3 Sep 2021 11:39:14 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v5 2/2] memory: Have 'info mtree' remove duplicated
 Address Space information
Message-ID: <YTJBotzQOjfQ9L7p@t490s>
References: <20210902062604.182620-1-philmd@redhat.com>
 <20210902062604.182620-3-philmd@redhat.com>
 <YTFIXrxd0i6GZbtG@t490s>
 <ae681972-e2c2-1453-00b7-1d4674fbd6c2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ae681972-e2c2-1453-00b7-1d4674fbd6c2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 03, 2021 at 10:40:25AM +0200, Philippe Mathieu-Daudé wrote:
> On 9/2/21 11:55 PM, Peter Xu wrote:
> > Hi, Phil,
> > 
> > On Thu, Sep 02, 2021 at 08:26:04AM +0200, Philippe Mathieu-Daudé wrote:
> >>   address-space shared 4 times:
> > 
> > I commented on the format of the output, I saw that it's switched back to the
> > v1.  Any reason?
> 
> The code uses the format you asked, I simply forgot to update the
> commit description :/ Sorry, I'll respin.

But I'm talking actually about the code too. :) After your answer I feel like
it's just an accident anyway.  Thanks,

-- 
Peter Xu


