Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA9443CCF9
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 17:05:32 +0200 (CEST)
Received: from localhost ([::1]:54292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfkUd-0003q9-Vb
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 11:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfjec-0007mr-Ur
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 10:11:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfjeZ-0003A8-F8
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 10:11:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635343902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rPlcjmpRh7lIBb9ysHvcn9Jm3y0keBJttZPoQy9XWeU=;
 b=SA5KFqhjOi5AFneriUuPW2/VvZ4XL+2NyCh9cSCyj5kvc8wehhQ5Su4xgwMwRzaGs1nDz2
 iUuXxYpl5G1VgMPID4YP60l1kKZn7B9iTRJKX1oVqQMmJWhCqb/TVVo+6mdXaSZrV+ekFo
 3QZqQomv9/AQ6BfHwjiag6iAo15w/Rw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-HOEtUQQkOaiKyf-h9_z0Dg-1; Wed, 27 Oct 2021 10:11:41 -0400
X-MC-Unique: HOEtUQQkOaiKyf-h9_z0Dg-1
Received: by mail-wm1-f71.google.com with SMTP id
 i187-20020a1c3bc4000000b0032ccd252cf3so1307076wma.7
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 07:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rPlcjmpRh7lIBb9ysHvcn9Jm3y0keBJttZPoQy9XWeU=;
 b=r1fhUWELkLEYWfIaDces62LloAKrr4L8iejnxMDOMC5Ncy73+xhvSoTwjjVqANVn+g
 wvZjS+D86CqerlC54kA+gj+n76XEjIWTw7GWbgkcHSnFzZUHCc/njTBMV9IEm+POGi9c
 +fUQMzT9lDcDuC6ibOt+TVyOxF/pS5iPZmwraAwM5YCU6CzWEQTeTcj64wnYb+Yjt4Wj
 le6uPxwhIiOdErf9NHcL/u7a19pPvxBGn2x/QhAFBLea2SKMYfjHoEA11JgbI5w4L+nC
 bmTEBsbdtC6U3uLh24eWQ5c9py9vqLV2tgccIHyAYDzLy8s1rdn4N6jKdKQkhR10ro55
 yIHA==
X-Gm-Message-State: AOAM531OGvDyZewZspaymb98NuQFnYhhgoyvItmAoe8bnysAb1gMU3Qk
 bI/wX99jeB5HDJzDyZYNme/+tPNrldnqNwGWa5qkR0DahWr246e02edOOQL1mhiRRAtDSCAwE7z
 dsJETAkkGJ4Y78FY=
X-Received: by 2002:a05:600c:3b89:: with SMTP id
 n9mr5942151wms.7.1635343900272; 
 Wed, 27 Oct 2021 07:11:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1FjwOf1e6IdsT5TMePNBMDiAYa24+2CFNIXTvefxpkQihLhiTxR4JuhEFTMrIeN+uxEoKeQ==
X-Received: by 2002:a05:600c:3b89:: with SMTP id
 n9mr5942126wms.7.1635343900116; 
 Wed, 27 Oct 2021 07:11:40 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id j7sm4782010wmq.32.2021.10.27.07.11.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 07:11:39 -0700 (PDT)
Message-ID: <8fc703aa-a256-fdef-36a5-6faad3da47d6@redhat.com>
Date: Wed, 27 Oct 2021 16:11:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 02/12] vhost: Return number of free memslots
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20211027124531.57561-1-david@redhat.com>
 <20211027124531.57561-3-david@redhat.com>
 <4ce74e8f-080d-9a0d-1b5b-6f7a7203e2ab@redhat.com>
 <7f1ee7ea-0100-a7ac-4322-316ccc75d85f@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <7f1ee7ea-0100-a7ac-4322-316ccc75d85f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Hui Zhu <teawater@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 16:04, David Hildenbrand wrote:
> On 27.10.21 15:36, Philippe Mathieu-Daudé wrote:
>> On 10/27/21 14:45, David Hildenbrand wrote:
>>> Let's return the number of free slots instead of only checking if there
>>> is a free slot. Required to support memory devices that consume multiple
>>> memslots.
>>>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>> ---
>>>  hw/mem/memory-device.c    | 2 +-
>>>  hw/virtio/vhost-stub.c    | 2 +-
>>>  hw/virtio/vhost.c         | 4 ++--
>>>  include/hw/virtio/vhost.h | 2 +-
>>>  4 files changed, 5 insertions(+), 5 deletions(-)

>>> -bool vhost_has_free_slot(void)
>>> +unsigned int vhost_get_free_memslots(void)
>>>  {
>>>      return true;
>>
>>        return 0;
> 
> Oh wait, no. This actually has to be
> 
> "return ~0U;" (see real vhost_get_free_memslots())
> 
> ... because there is no vhost and consequently no limit applies.

Indeed.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


