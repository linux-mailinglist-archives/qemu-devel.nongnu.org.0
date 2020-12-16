Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 311122DC7F2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 21:52:02 +0100 (CET)
Received: from localhost ([::1]:45206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpdmC-0004In-Lh
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 15:52:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kpdik-0002oG-UC
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 15:48:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kpdij-0004Mi-00
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 15:48:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608151703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9n8M2ce9XuOwDa00NO6YtkIm7X0n60lrDnzJNFtdfiM=;
 b=AWRF8ezOLIBIk7z/LJ1pKBXOiT71F8E575HFNILbyBe21jrtgAVjR6rPjWjVE6xY2g5BfH
 Ot9fcLV/VsuN7Xr5pFMBeeoYMngaeJr3TynmsBhgwa8lnansgDMuhLwsWpA+mDcaHkPh8A
 z4grcfmjwUvicx5upImhU+Pn/QGrpmo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-H7FXu09lMn-Zs0nVOhd1Pg-1; Wed, 16 Dec 2020 15:48:21 -0500
X-MC-Unique: H7FXu09lMn-Zs0nVOhd1Pg-1
Received: by mail-qv1-f69.google.com with SMTP id 102so18754616qva.0
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 12:48:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9n8M2ce9XuOwDa00NO6YtkIm7X0n60lrDnzJNFtdfiM=;
 b=XYmOdUUW05iwVvWuX9xquhsh1mVbu/McHIRF+rciEmRTQcyB83S5AJ07wq91rZBEWi
 hyvuCaXPMYET7T7BJUeA5crQ9q13CWvt9wmW3mETh88BKqnQkINn9zh55F+vxH2SKMPJ
 rSOoZXFs9yZzj/lfEm2Q0UtqZGkKD2TXNqnj9zXVtHBX01lq1UtFFXlbYpBHF1P3nTdq
 NPFyDJfNT+RM1g838o6k6zZY6mk9v/B7WZW9aez+tTKL0RZOKZ72MU+8ZtEGdRp5WxFQ
 CSbFiZrGYXOenbiHHhjvGbk6ge5efGx6YZN8wNFEej33dwezAnxAAi9SRbZb3ECyAMHp
 ZCtA==
X-Gm-Message-State: AOAM530s5AcjUTqLENb7kkD8aeuVXvbToe4AVHWih9Q5Oq55Dl8/FMHL
 REifR47dj4u4GycIACfGAINewMHyH6eINwUZKBqBrg1VsxBEQ/2GmYWpPogDtojGQduGbHPIOlO
 5GTGyQZ6iPRLM5TQ=
X-Received: by 2002:ad4:5187:: with SMTP id b7mr20491897qvp.2.1608151700945;
 Wed, 16 Dec 2020 12:48:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzq3oPhLxgX8ceYKEYT+D+VeCALRHmB6EAGN52tcZasWI0TCGLwWbeSg/uu9gWeHSyOWm3vnA==
X-Received: by 2002:ad4:5187:: with SMTP id b7mr20491884qvp.2.1608151700786;
 Wed, 16 Dec 2020 12:48:20 -0800 (PST)
Received: from xz-x1 ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id f22sm1882194qkl.65.2020.12.16.12.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 12:48:19 -0800 (PST)
Date: Wed, 16 Dec 2020 15:48:18 -0500
From: Peter Xu <peterx@redhat.com>
To: Keqian Zhu <zhukeqian1@huawei.com>
Subject: Re: [PATCH 1/2] accel: kvm: Fix memory waste under mismatch page size
Message-ID: <20201216204818.GA39844@xz-x1>
References: <20201215071948.23940-1-zhukeqian1@huawei.com>
 <20201215071948.23940-2-zhukeqian1@huawei.com>
 <20201215175719.GA112585@xz-x1>
 <8a23c62d-1167-d005-e98b-14507e15fbf2@huawei.com>
MIME-Version: 1.0
In-Reply-To: <8a23c62d-1167-d005-e98b-14507e15fbf2@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jiangkunkun@huawei.com,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 16, 2020 at 04:21:17PM +0800, Keqian Zhu wrote:
> One more thing, we should consider whether @start and @size is psize aligned (my second
> patch). Do you agree to add assert on them directly?

Yes I think the 2nd patch is okay, but please address Drew's comments.

Returning -EINVAL is the same as abort() currently - it'll just abort() at
kvm_log_clear() instead.

Thanks,

-- 
Peter Xu


