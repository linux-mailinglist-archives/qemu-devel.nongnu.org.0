Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F533FFB3B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 09:42:59 +0200 (CEST)
Received: from localhost ([::1]:48646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM3ql-0004jw-27
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 03:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijunji@bytedance.com>)
 id 1mM3py-00045L-TE
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 03:42:11 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:45629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <weijunji@bytedance.com>)
 id 1mM3pu-0003LV-FA
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 03:42:08 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 f11-20020a17090aa78b00b0018e98a7cddaso3342839pjq.4
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 00:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=nXREGH7UcssxsGls4TpqN/3My2ILjgwwjSnTKo7Ckl4=;
 b=KiXEQsXdfuZJShCri4LUNWJ9o+nCGc+6qCDmPFb67nPxAkxIsZ/yUP1bHvd6wnlSEv
 rTozjTwxXQHPdTlHIYLC2ZFsdmdCTCzktNnQ7aXNdDi5978cszU/V78KWGnYsk/b5WlE
 fHmJcxv/sXp5/rtlqW8K5VOg+uXnmWmkBVpRgU1OmlsUUu5BEBNIiWwKxOmJ2/DN45xN
 lvb3bpM8pVjWIAhf+PIuwiWQ1M5HI0AGpyU0yrFCB7Lmf8sL+ywxZLuKL/Zb0xxSQboT
 wh6Oa0M9LM/zi2RzjgzLTdU4TokBi1SL9YQKFYmSIMkDKELGEhw/XZz3yiIVkjrYv0DS
 dveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=nXREGH7UcssxsGls4TpqN/3My2ILjgwwjSnTKo7Ckl4=;
 b=L5sWwllC6EhZkyi52tpj33b0/vieaGVEA67Pm/2ubwBLrkM08ccutwXk9hSU9L/8OR
 cBrLKrcs0c4WkxJ8BhdLHH0bKPH5StGGft0Bp5v5OHFRD61i8xXWMDY+6o518l5mdRaW
 l1ek+3GO5x5jN0l9ZAobnxB6VjvK5UkWcZ410fCqnjDx+5PeSvWr46DTLjKqNWzRvD7X
 CVbI1JzQs/8b3CY8KjCAXY6YDP2LA+tVUiCRdsEU+NP9Qq5iEtKNA1/1YZEdNLD1FV5y
 58SFe2vgzNViPx6Fe5vUaOFAqvsRokFvA6+LJjCam297XOpOAr62HTyxaYqITf8+dUdE
 MrMA==
X-Gm-Message-State: AOAM533tgC8VA8pj3aGc0NGFwCOeYpRHFoZpnO0nOslLDxUwJAwZyc0+
 b6T2TGklunEyGi3aRXXeZ4Gbzw==
X-Google-Smtp-Source: ABdhPJx9jFfBu+nlD8vhSJGr3W8ucdz7n747tSwepSc5EQ6/yAYK1sNLaqT1nRm3XypVmOJ/vRgOqQ==
X-Received: by 2002:a17:90a:c89:: with SMTP id
 v9mr2482459pja.175.1630654924349; 
 Fri, 03 Sep 2021 00:42:04 -0700 (PDT)
Received: from smtpclient.apple ([139.177.225.225])
 by smtp.gmail.com with ESMTPSA id u24sm4656287pfm.81.2021.09.03.00.41.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 Sep 2021 00:42:03 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: [RFC 0/5] VirtIO RDMA
From: =?utf-8?B?6a2P5L+K5ZCJ?= <weijunji@bytedance.com>
In-Reply-To: <CACGkMEsz4HQKpaw3P=ODXvN2AuqO+_YE0UHpzOFk5GbzX13V4A@mail.gmail.com>
Date: Fri, 3 Sep 2021 15:41:57 +0800
Content-Transfer-Encoding: 7bit
Message-Id: <4ED3B57F-A9D1-4A61-AA1D-94D14A932012@bytedance.com>
References: <20210902130625.25277-1-weijunji@bytedance.com>
 <CACGkMEsz4HQKpaw3P=ODXvN2AuqO+_YE0UHpzOFk5GbzX13V4A@mail.gmail.com>
To: Jason Wang <jasowang@redhat.com>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=weijunji@bytedance.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>,
 linux-rdma@vger.kernel.org, Yongji Xie <xieyongji@bytedance.com>,
 Cornelia Huck <cohuck@redhat.com>, yuval.shaia.ml@gmail.com,
 virtualization <virtualization@lists.linux-foundation.org>, jgg@ziepe.ca,
 dledford@redhat.com, =?utf-8?B?5p+056iz?= <chaiwen.cc@bytedance.com>,
 Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> On Sep 3, 2021, at 8:57 AM, Jason Wang <jasowang@redhat.com> wrote:
> 
> On Thu, Sep 2, 2021 at 9:07 PM Junji Wei <weijunji@bytedance.com> wrote:
>> 
>> Hi all,
>> 
>> This RFC aims to reopen the discussion of Virtio RDMA.
>> Now this is based on Yuval Shaia's RFC "VirtIO RDMA"
>> which implemented a frame for Virtio RDMA and a simple
>> control path (Not sure if Yuval Shaia has any further
>> plan for it).
>> 
>> We try to extend this work and implement a simple
>> data-path and a completed control path. Now this can
>> work with SEND, RECV and REG_MR in kernel. There is a
>> simple test module in this patch that can communicate
>> with ibv_rc_pingpong in rdma-core.
>> 
>> During doing this work, we have found some problems and
>> would like to ask for some suggestions from community:
> 
> I think it would be beneficial if you can post a spec patch.

Ok, I will do it.

Thanks


