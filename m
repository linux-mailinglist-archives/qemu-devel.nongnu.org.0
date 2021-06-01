Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F50396BEB
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 05:33:42 +0200 (CEST)
Received: from localhost ([::1]:56264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnv9x-00067l-FS
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 23:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lnv96-0005Rw-St
 for qemu-devel@nongnu.org; Mon, 31 May 2021 23:32:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lnv94-0005Rt-Hg
 for qemu-devel@nongnu.org; Mon, 31 May 2021 23:32:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622518365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/cQ/sYih0VEvrw3PncyvfLrr0U/BDYndVj2KZKvtIfY=;
 b=YtquUQA19+2mhMbYbvSgO64I0I411sYvl9oH6XbxVAFFmWPr2zhLofyJGfG0benruwB3k4
 D1/6zI3gyE6aoGC2zANC5cHNrlOLu3NquknAuBo/oHyiUnIkrbDkpXzc7SI50UCsL4JAWj
 P5ld4NoY7zQa+VcqzI4Wmu3jfe3naPw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-pl4cv4_8P9m9kXg7BU1y0Q-1; Mon, 31 May 2021 23:32:42 -0400
X-MC-Unique: pl4cv4_8P9m9kXg7BU1y0Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 o10-20020a05600c4fcab029014ae7fdec90so733755wmq.5
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 20:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/cQ/sYih0VEvrw3PncyvfLrr0U/BDYndVj2KZKvtIfY=;
 b=Ej1HU+hyZfldSJ+1CrB59W2fLqMDiNO5ORE1HTGN4/c+gpBSA3dqzTjPnoMe5PZHbd
 2fySVgnelx4VZkh4YSshbYKO3yoaMjuSTxltbnv5AUbj8xRJRuqh88fVl8Gr2BIvjJ9f
 BCx5LX2gl85mfsOPz5vrX3FhE2jlPbTXdvqBkyGBsldSXs8Z5Cb3ZxgfomHilVk0jsxk
 dLlyqbFi2JoUWDYuej5ZTg/Ms4SJcuV9FpJnZeuY2HSR/FMp3HUQ5gqy5oeJHx1tmAB5
 CXh15NorRSunq5ROhuE6Dz9w6pQH4RbFWicib3VM+/OzDvMBFBB8eC08xbHizhL37S7i
 JvgQ==
X-Gm-Message-State: AOAM531m6e7oQEc2GdNDzVJxLtZH70h657bndXLu2Behee6qzSe3pN7T
 6drO2wxPw4EbsqT9p86YSDVxYUAq5xII+O/E3c/EXuowx4kwNCnfnMRIYkRUW8LM8uz6SrIrVgT
 ylNkoe8/erJk+YEg=
X-Received: by 2002:adf:fa85:: with SMTP id h5mr26147333wrr.70.1622518361720; 
 Mon, 31 May 2021 20:32:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3trH5Xl6z45NEe9CSxO6pE1J3wCYeCuVCqWxiFcPcXX73S67kS0wArOIOH3yDFkVQJJbnvA==
X-Received: by 2002:adf:fa85:: with SMTP id h5mr26147319wrr.70.1622518361546; 
 Mon, 31 May 2021 20:32:41 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id b188sm1437792wmh.18.2021.05.31.20.32.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 20:32:41 -0700 (PDT)
Subject: Re: [RFC PATCH 00/12] exec/memory: Experimental API to catch
 unaligned accesses
To: qemu-devel@nongnu.org
References: <20210520110919.2483190-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0728f5c6-92e7-32dc-a9eb-3d85f930ea4c@redhat.com>
Date: Tue, 1 Jun 2021 05:32:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210520110919.2483190-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

If there is any feedback, should I discard this experiment?

On 5/20/21 1:09 PM, Philippe Mathieu-Daudé wrote:
> This series is an experiment after chatting with Stefan and having
> received review from Peter / Richard on an orthogonal series aiming
> to handle unaligned pointers (atomically):
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg808954.html
> 
> Here we don't aim to fix unatomic accesses, however we are interested
> in catching malicious unaligned accesses from guests.
> 
> For that we introduce the MemTxAttrs::aligned field which allow
> accessors to return MEMTX_UNALIGNED_ERROR early enough, instead
> of trying the unaligned access which can potentially trigger a
> SIGBUS and abort the process.
> 
> To be able to pass/return alignment information we modify the
> memory load/store cached API, then add the
> virtio_ld/st*_phys_cached_with_attrs() handler (we only implement
> lduw for this experiment).
> 
> Finaly we modify vring_avail_flags() to return whether the guest
> requested an illegal (unaligned) memory access.
> 
> Note: The current virtio_ld/st*_phys_cached_with_attrs() API returns
> the value, and take the MemTxResult as argument, so I choose to
> return -1 (marked with /* XXX */ comment. We should switch to using
> an API which returns a MemTxResult and takes the value accessed as
> argument, this way we don't have to return random meaningless value.
> 
> But this is beyond the scope of this experiment, here we want to
> emphasize the introduction of the MemTxAttrs::aligned field and the
> MEMTX_UNALIGNED_ERROR return value.
> 
> Regards,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (12):
>   exec/memory_ldst: Use correct type sizes
>   exec/memattrs: Add attribute/error for address alignment
>   exec/memory_ldst: Return MEMTX_UNALIGNED_ERROR for unaligned addresses
>   exec/memory_ldst_cached: Sort declarations
>   exec/memory_ldst_cached: Use correct type size
>   exec/memory_ldst_cached: Set MemTxResult on success
>   exec/memory_ldst_cached: Document aligned addresses are expected
>   exec/memory_ldst_cached: Check address alignment if requested
>   hw/virtio: Use correct type sizes
>   hw/virtio: Extract virtio_lduw_phys_cached_with_attrs()
>   hw/virtio: Have vring_avail_flags() return a boolean value
>   hw/virtio: Display error if vring flag field is not aligned
> 
>  include/exec/memattrs.h               |   3 +
>  include/hw/virtio/virtio-access.h     |  39 +++++++--
>  include/exec/memory_ldst.h.inc        |  16 ++--
>  include/exec/memory_ldst_cached.h.inc | 114 ++++++++++++++++++++------
>  hw/virtio/virtio.c                    |  22 ++++-
>  memory_ldst.c.inc                     |  69 +++++++++++++---
>  6 files changed, 211 insertions(+), 52 deletions(-)
> 


