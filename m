Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAFF3C82F6
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 12:31:32 +0200 (CEST)
Received: from localhost ([::1]:38592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3cAt-0008NH-VC
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 06:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m3c9g-0007a2-SN
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 06:30:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m3c9e-0007Vx-5k
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 06:30:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626258612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U0oh8AbecBKrOkAXJTbBzODoFC5WFVvvH+eKQOtUiqE=;
 b=YRgQevIHar7g4zdS3yXGd+SAOeZTLwJc2pXGbqOuxeqg2iTfFd6Xcm7UDF9KA8PcM2rH1Z
 Mlj1eGEp/GXEfSiNVcMtvxPMpy1to1iqrAnJpQZlty+CcHiZdj0HAjioNSuXGjPeoUCzf9
 4i18UMaochRgFCvRXvoYWFcL55sOobE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-7RroOCC9OCyXu7NYFdAUMA-1; Wed, 14 Jul 2021 06:30:11 -0400
X-MC-Unique: 7RroOCC9OCyXu7NYFdAUMA-1
Received: by mail-wr1-f69.google.com with SMTP id
 u13-20020a5d6dad0000b029012e76845945so1269615wrs.11
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 03:30:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=U0oh8AbecBKrOkAXJTbBzODoFC5WFVvvH+eKQOtUiqE=;
 b=CoIsiUzJObje5BBqZ6looYuhO9RWFPXGwEalmCM0Nv/qNi9jtbLQtCLe2VUAAKGPVS
 E8txucCRJYko1BTbqiPmDc8WPhic/4QISipdBaVl1LLG13g+nJIKP2VtweY0xbF2WJ9X
 8aeIqTOffAI1nPeKDfWy5jZIcs9A3nsoihkM17jJzDU7FmqWmXEbDefFDCa0hkLaiSnp
 tltXxLP6CToTZ9xP1MWrO7dcrDRiZK2I2w2Aag85P6I714UQxTxsaGzuFcRFrVprd2P1
 55tN1+6Vs5V4MxUMEUmek0MKMYntXsqboZpZv9vMkkS9RsKOIrJ6lLMBslXLYVsPVT1a
 hzvQ==
X-Gm-Message-State: AOAM532xj6WwamQsIPUqv9qU62p11k5Q1ODhpDCOLmCk9gByyzgqDZpw
 g78/TPvrbmZAbcZN0b+58sWFELGDuNg78AkufLykhD/mY+u6lPZc7G10pvNaeQlT8yecLiDcIM3
 ANm54oAqU77MnyM0=
X-Received: by 2002:a7b:c0d0:: with SMTP id s16mr3235054wmh.133.1626258610699; 
 Wed, 14 Jul 2021 03:30:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzL2bjk0vE9XnM5jCHJm1PeTqsoAfi4l20Zs5o8cR/OR3NhHRI/Yq/sWlLxzfpJ26V16tuE9Q==
X-Received: by 2002:a7b:c0d0:: with SMTP id s16mr3235031wmh.133.1626258610506; 
 Wed, 14 Jul 2021 03:30:10 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c60d5.dip0.t-ipconnect.de. [91.12.96.213])
 by smtp.gmail.com with ESMTPSA id
 f130sm2042404wmf.23.2021.07.14.03.30.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 03:30:10 -0700 (PDT)
Subject: Re: [PATCH v1] migration: clear the memory region dirty bitmap when
 skipping free pages
To: "Michael S. Tsirkin" <mst@redhat.com>, Wei Wang <wei.w.wang@intel.com>
References: <20210714075104.397484-1-wei.w.wang@intel.com>
 <20210714062715-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <25a2203f-fe82-41a6-ab40-2e4b5522fa14@redhat.com>
Date: Wed, 14 Jul 2021 12:30:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714062715-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.368, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: peterx@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.07.21 12:27, Michael S. Tsirkin wrote:
> On Wed, Jul 14, 2021 at 03:51:04AM -0400, Wei Wang wrote:
>> When skipping free pages, their corresponding dirty bits in the memory
>> region dirty bitmap need to be cleared. Otherwise the skipped pages will
>> be sent in the next round after the migration thread syncs dirty bits
>> from the memory region dirty bitmap.
>>
>> migration_clear_memory_region_dirty_bitmap_range is put outside the
>> bitmap_mutex, becasue
> 
> because?
> 
>> memory_region_clear_dirty_bitmap is possible to block
>> on the kvm slot mutex (don't want holding bitmap_mutex while blocked on
>> another mutex), and clear_bmap_test_and_clear uses atomic operation.

How is that different from our existing caller?

Please either clean everything up, completely avoiding the lock 
(separate patch), or move it under the lock.

Or am I missing something important?

-- 
Thanks,

David / dhildenb


