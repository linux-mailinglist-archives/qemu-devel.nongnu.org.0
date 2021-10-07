Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC188425194
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 12:57:44 +0200 (CEST)
Received: from localhost ([::1]:37320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYR5r-0005ny-LP
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 06:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mYR3E-00049b-Jo
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:55:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mYR3C-00010p-Uq
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:55:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633604097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nRSAD5KPtmw5aRkmr1apk1G7ivTA4mUUkDab8pimcHw=;
 b=d8cmn+kXrPFMsO4Xv2LVEf4l+LB2eGmNW1gmPgbJRAOvDUge2XAkbdJwxqYgODsItxvN1O
 U0YjqJvVGfMmX4kvlVShw4IYNPlLLsBKjUnnfAWpakhEqSRlx0DdtIUQkAGO2zJXTLBsw8
 6er0sD+2Gw8yJUU9VBXMdnARJ28dwII=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-L-JLT2opN-6Ecr-eWBEAuw-1; Thu, 07 Oct 2021 06:54:50 -0400
X-MC-Unique: L-JLT2opN-6Ecr-eWBEAuw-1
Received: by mail-ed1-f71.google.com with SMTP id
 bo2-20020a0564020b2200b003db3540f206so5289648edb.23
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 03:54:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nRSAD5KPtmw5aRkmr1apk1G7ivTA4mUUkDab8pimcHw=;
 b=7YUEVzcA8sYSnDHloe+1E86qQl5JPoxOYU4nz7H7Or5OFum44AApu++82lYWLpJin4
 EipkKFNdIiX/AHHiYNfmQr+dX0n/lnkHzRl/6Zp16Xq9xCuquOBTVtZjBga08cb+rcH/
 38lZbgUBJLY4lmcQ1zyboroJIG9DAFD3zi6w75K0PREUqBeR+iZno715JBgpwcUs1Bev
 WwrcMTRHjZwcMOVPEk0zBMnlZ7JovEJJQx3jQiQjIgHzowUnJ8IS2JV3kha9sr7sdFND
 wBLAX3q6HmXCsBgbTtXchAbPbhRyBlrnJsElixV/oyGY0w8KSkPcK5B8LTWSyHuOCzUh
 YFIw==
X-Gm-Message-State: AOAM531TiQ6mRaIaQaEtFWhSNgG1PXKh848FINyPS1raHVJDrhi3G4V8
 6Dplu9aU5tgi/V1QYAaxQRZCqDzfieEialJ2JBFOu/d9qLOM1qYx+CNEpRvHqLi0VqzpPCfe8v2
 cGyOvp4dlxp4FjqZkRAGzNfL1N/8UOJKBOlL7JIAtnZj7pFmnbojGtqX0mLS5U6nE898=
X-Received: by 2002:a05:6402:5252:: with SMTP id
 t18mr5180948edd.129.1633604089344; 
 Thu, 07 Oct 2021 03:54:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlV8FQKH/kgWoAMP6UujCIotgYEmwtgmymCGdZSCQ9p9pjXV6c2ImXJNji2+f0+SjZ21yk3w==
X-Received: by 2002:a05:6402:5252:: with SMTP id
 t18mr5180813edd.129.1633604088076; 
 Thu, 07 Oct 2021 03:54:48 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 i6sm11908022edc.50.2021.10.07.03.54.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 03:54:47 -0700 (PDT)
Subject: Re: [RFC PATCH v2 04/25] include/block/block: split header into I/O
 and global state API
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-5-eesposit@redhat.com>
 <YV6+8+NiBO8uG/GC@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <76bbb291-d9bf-ad5e-a4a7-93ee80c281ca@redhat.com>
Date: Thu, 7 Oct 2021 12:54:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YV6+8+NiBO8uG/GC@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.05, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.964,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 07/10/2021 11:33, Stefan Hajnoczi wrote:
> On Tue, Oct 05, 2021 at 10:31:54AM -0400, Emanuele Giuseppe Esposito wrote:
>> +int bdrv_pwrite_sync(BdrvChild *child, int64_t offset,
>> +                     const void *buf, int64_t bytes);
> 
> Why is this bit of a surprise since the other synchronous I/O functions
> aren't included in this header. Why did you put it here? This one may be
> safe to move to the I/O API.

Considering that in the next patch I did not even add an assertion for 
it, I am confident enough that it was a copy-paste mistake. This goes 
into I/O.

> 
>> +int bdrv_block_status(BlockDriverState *bs, int64_t offset,
>> +                      int64_t bytes, int64_t *pnum, int64_t *map,
>> +                      BlockDriverState **file);
> 
> This function just called bdrv_block_status_above(), which is in the I/O
> API. I think it's safe to move this to the I/O API or else
> bdrv_block_status_above() shouldn't be there :).
> 

It *seems* that while bdrv_block_status_above() is an I/O, probably 
running in some coroutine (from here its internal qemu_in_coroutine 
check), bdrv_block_status might be called from the main loop (or 
alternatively the function is never invoked in the tests, so the 
assertion never triggered).

Maybe bdrv_block_status_above is one of the few functions that are both 
I/O and Main loop? I put it in I/O as it can't have the assertion.

Thank you,
Emanuele


