Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E5B3C45E6
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 09:48:58 +0200 (CEST)
Received: from localhost ([::1]:52546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2qgT-0006PD-Le
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 03:48:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m2qel-0004tZ-Ox
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 03:47:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m2qek-00052N-6M
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 03:47:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626076029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nR9ycyZ8m5xJnXNZRObw7Py4fExMDSMUzgSpMHJY1vU=;
 b=jLC2NYVpZd0y//vaXLQ1NBjlzHBLCH0qt3iZRxV6CUxL2eSV6e56BT3bsZSdzyp2GYSyt0
 5Qkf+MbCXox3DuzhJiuqSUDOOW+OfV7vJDGDf3kQ+618JozsLJV6DAqWJyFnKqgxxo6HV/
 4GWvRXRAo1syqmSPH10wyAaryWWD7EI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-G1e_0Ys0McS2lGmG6WqtAQ-1; Mon, 12 Jul 2021 03:47:08 -0400
X-MC-Unique: G1e_0Ys0McS2lGmG6WqtAQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 m31-20020a05600c3b1fb02902082e9b2132so7035321wms.5
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 00:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=nR9ycyZ8m5xJnXNZRObw7Py4fExMDSMUzgSpMHJY1vU=;
 b=e9ZxKyiJ4i4cknk+HBoaHNQFvlCsmujNFdvyR38EKW+gDSN/2hGt5xJAlbgcVLckOA
 aPBm3W4Mods0FPoS1qvNMMvLLz9ERFNRcgmHHrjV2GjINJyTtyNal4gAUBOkhnSvDl1g
 pw028RSPOZNvtrR9fHJgbihlGHZ+Qw1ENb/jOySakYA5hgD66TZvdmxR54QOtSrjvg0W
 NT5IOejQnX1EEoUcdjRgUHdHhTcU/RLkmacpIw4Ko+Z1xS2J9+JJUp3+tWxWW8LwOSR5
 wqf/LBXAkoq6RAk0uhOvnt/c2PuRo3WMDvg/FOnzV/5XXK4W2uhKmeSTiVJuBjKsYhnv
 3nEg==
X-Gm-Message-State: AOAM5312BN29bkdcW6sRkQJCtAiXjb95Q+JGV/hcTfFemvpAg2bd0XYd
 zt5jWtJTpfhr7IKNknu0J+r8AQeZYPG5fduHML6iyEoUjfuR5mdMscw2o5eFxi5FflmTk26mPF1
 2AdMlUq9o/fqT4Io=
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr54003821wmh.151.1626076027054; 
 Mon, 12 Jul 2021 00:47:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxo6cbOdK8GtnZr48+t/zqcsbPjRIV5a6GvEbJpJLGvigOrNRa9iX2X6KvnE6ltqoogRYtpQ==
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr54003814wmh.151.1626076026937; 
 Mon, 12 Jul 2021 00:47:06 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 m7sm17534849wms.0.2021.07.12.00.47.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 00:47:06 -0700 (PDT)
Subject: Re: [PATCH v2 3/6] block: Clarify that @bytes is no limit on *pnum
To: Eric Blake <eblake@redhat.com>
References: <20210623150143.188184-1-mreitz@redhat.com>
 <20210623150143.188184-4-mreitz@redhat.com>
 <adfe02d6-4b40-86f1-fa6b-55cf00405036@virtuozzo.com>
 <3c4ae0ed-a7d7-b6c3-1785-f6e4a9efec7e@redhat.com>
 <20210628191044.or4e2h7jza6r4a4m@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <c04ea9cf-c2bd-b6f9-46ae-8319cf7625cf@redhat.com>
Date: Mon, 12 Jul 2021 09:47:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628191044.or4e2h7jza6r4a4m@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.631, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.06.21 21:10, Eric Blake wrote:
>>>> +++ b/include/block/block_int.h
>>>> @@ -347,6 +347,11 @@ struct BlockDriver {
>>>>         * clamped to bdrv_getlength() and aligned to request_alignment,
>>>>         * as well as non-NULL pnum, map, and file; in turn, the driver
>>>>         * must return an error or set pnum to an aligned non-zero value.
>>>> +     *
>>>> +     * Note that @bytes is just a hint on how big of a region the
>>>> +     * caller wants to inspect.  It is not a limit on *pnum.
>>>> +     * Implementations are free to return larger values of *pnum if
>>>> +     * doing so does not incur a performance penalty.
>>> Worth mention that the cache will benefit of it?
>> Oh, right, absolutely.  Like so:
>>
>> "block/io.c's bdrv_co_block_status() will clamp *pnum before returning it to
>> its caller, but it itself can still make use of the unclamped *pnum value.
>> Specifically, the block-status cache for protocol nodes will benefit from
>> storing as large a region as possible."
> How about this tweak to the wording to make it flow a little better:
>
> block/io.c's bdrv_co_block_status() will utilize an unclamped *pnum
> value for the block-status cache on protocol nodes, prior to clamping
> *pnum for return to its caller.

Sure, thanks!

Max


