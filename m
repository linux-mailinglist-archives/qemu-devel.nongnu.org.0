Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA6039E7F7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 22:02:12 +0200 (CEST)
Received: from localhost ([::1]:44378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqLRr-0007C9-51
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 16:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqLPo-0006Ao-Rz
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:00:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqLPm-0001ye-R2
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:00:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623096001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KAYB5Xetz4WWo4QYwAjVl/WN4p5swTDmW5v9XUMAxsw=;
 b=RjmJ7Y5QEveMobe4l1wAYX3G9LKRCq/IK5THi7q468ONWz7LEE8vAXEPRGVbl2piBGw7CN
 F/ftIwe0U6kNL1wXvSbeVIB4T1eXdpcleHzqotDbdTuRIro2j5Md5l0lzIFXQs/eJ2SCT5
 dwY+X2R2fhVEKa4brQ8AcZKZ/6M8BfE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-TdLxpd_tPsikOOqMzPhDKg-1; Mon, 07 Jun 2021 15:59:58 -0400
X-MC-Unique: TdLxpd_tPsikOOqMzPhDKg-1
Received: by mail-wr1-f69.google.com with SMTP id
 t14-20020adfe44e0000b029011851efa802so8238904wrm.11
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 12:59:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=KAYB5Xetz4WWo4QYwAjVl/WN4p5swTDmW5v9XUMAxsw=;
 b=nB9XFEB1d4vfbYCelWmkhcdxGrpCVNPk33TZcJSn6oD1Jk2wLiONzVQp/jj73RkYgP
 SJgtfiIL28DogOztODCSYBJ//5xbsFZZFQ1HKGWSOUbWHHsBKnTdi3CPfuaEv6CwM8o1
 /P7Vnh4g3Sip5QwH+eP9iirHg4hYACWGnDiWtDelay6asHq+v6GdT6UAYgW1Gvmv1oZv
 j+oGFdYtegScQeV7U5N0VsR90pIkezmw6kGMBvtARWhDoo4y42tuyJz2he1jT0138I9+
 54rW0ETp5vttTnmn4dQFPyvnu/DppIvxVnWeBnGoe8wAH0/fOPqebWwC6B9IU5B17gvn
 kxGg==
X-Gm-Message-State: AOAM532jMyEmshWyPg2GzhOVl3sOSIeG1b3mlJnkaA5jsWpPUw35yAYN
 1yShHczNjcjOw56Xj3BBuyTsIXHVZpzhEOB9ZeJll08HgUq3fu5wnE1T4e4wNqGQDDNlqFxEndn
 QJzuJcfb2/5tTQtg=
X-Received: by 2002:adf:f211:: with SMTP id p17mr18507094wro.173.1623095996909; 
 Mon, 07 Jun 2021 12:59:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypIYLMamWD8/DGm/RekJTcWcgZPXblLH/5op0sp8wBsor5D3YNG28RuNweEn1esaxuT8mihg==
X-Received: by 2002:adf:f211:: with SMTP id p17mr18507074wro.173.1623095996662; 
 Mon, 07 Jun 2021 12:59:56 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6188.dip0.t-ipconnect.de. [91.12.97.136])
 by smtp.gmail.com with ESMTPSA id
 r18sm17582990wro.62.2021.06.07.12.59.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 12:59:56 -0700 (PDT)
Subject: Re: [PATCH v3 24/26] linux-user: elf: s390x: Prepare for Vector
 enhancements facility
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210607110338.31058-1-david@redhat.com>
 <20210607110338.31058-25-david@redhat.com>
 <9c585f97-b28d-c491-7969-42b2f1e2d968@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <1a1f269c-9edf-92af-4244-0ea9cdd9a64c@redhat.com>
Date: Mon, 7 Jun 2021 21:59:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <9c585f97-b28d-c491-7969-42b2f1e2d968@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.06.21 18:25, Richard Henderson wrote:
> On 6/7/21 4:03 AM, David Hildenbrand wrote:
>> +++ b/include/elf.h
>> @@ -605,6 +605,7 @@ typedef struct {
>>    #define HWCAP_S390_HIGH_GPRS    512
>>    #define HWCAP_S390_TE           1024
>>    #define HWCAP_S390_VXRS         2048
>> +#define HWCAP_S390_VXRS_EXT     8192
> 
> Probably best to fill in all of the values, even if we don't use them right
> now. Also, not the fault of this patch, but I don't think this belongs in
> include/elf.h.  This is linux specific, not some part of the elf specification.
> 

I can most certainly add all currently defined ones for s390x.

We do have the same defines "misplaced" for other archs as well. I'd 
like to avoid cleaning that up as part of this series. Thanks!

-- 
Thanks,

David / dhildenb


