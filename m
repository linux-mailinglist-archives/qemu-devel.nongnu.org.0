Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 875072F6400
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 16:18:18 +0100 (CET)
Received: from localhost ([::1]:59958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l04O9-0004wZ-Ii
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 10:18:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l04GE-0005h2-Bb
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:10:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l04GB-0003uO-5K
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:10:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610637001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M8GrEaca1FvDTXI21onqBh7YlYJa4izAJ3+bTwl73l4=;
 b=FuVk3WEDHdyQ/i1d9Rt7HrUkCjjQjSyPA4AB39e4MLw/FiLh5s8L+/UYFW1AVQn6s3aw1y
 ZsG9jk9vzQWO0QiHjACFDWq+NfH5+NeWFPvlMa8Go/qcKAYsLMk8jUSJfsQHzQXKfuXvKM
 7hE7nglnFmRRiTIEz5GnQW1SnRYb41c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-JdyopnugNiei58LyuzpyTg-1; Thu, 14 Jan 2021 10:09:56 -0500
X-MC-Unique: JdyopnugNiei58LyuzpyTg-1
Received: by mail-wm1-f69.google.com with SMTP id k67so2006112wmk.5
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 07:09:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M8GrEaca1FvDTXI21onqBh7YlYJa4izAJ3+bTwl73l4=;
 b=UMRrMP8wMXaWMOjkdkg44K9+/DIiMlh0WUdGAtsrbFkCT4aeCTsoCDam/TscV+lD9o
 6AqouwWxqALDTMcr8gchB0oxynQtGkbf8wLjx37YnhYyRgN+xPnRbYQe/41IuUPhxaz0
 98cfDo56aRbOfrGhVAbSyqd8Q7Oq5Jtvsme3diXMi2zaPhthLrRYHgCWKmbPnFOS2Q58
 9fuO6OvvYjqxKnOGljo9HdLKuB2/1k86hbwvjvtwxOoURXZ67OJJtSuaXcYzZ03GKPY8
 RbuC6j0TqicPlDpYBCUDPua7CNsPdfirHgxpDUNhGDEMYklyJrjhCI3kwo7GAqfzaaRN
 L8HQ==
X-Gm-Message-State: AOAM531BCX6LK2ACKzjtXuRqWRnTIMAPNOev1b/X1sVwbNFGr65XKdvu
 pF5C1ewusjT/GMpUeEBs3oXpYILWsPr7uIm1WPn52Pd1Ks5e6aTOxGMjs6HEOO5kBivwclaf8gP
 L0a9Cfwi7JYkBfSPmRCEd71FqAETHkIWj/3WvWczmU5vpq2LfiMM1ViFKx67Br20f
X-Received: by 2002:a05:600c:410d:: with SMTP id
 j13mr4385696wmi.95.1610636994654; 
 Thu, 14 Jan 2021 07:09:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqNbhXY5ZvuFlHPk2/PI4YXxC3+1t8eanh0nkImcLCGMlWmJb4Ihng0uN6ds65nHenxVY7Yg==
X-Received: by 2002:a05:600c:410d:: with SMTP id
 j13mr4385667wmi.95.1610636994350; 
 Thu, 14 Jan 2021 07:09:54 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z63sm9258465wme.8.2021.01.14.07.09.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 07:09:53 -0800 (PST)
Subject: Re: [PATCH v3 1/2] Fix net.c warning on GCC 11
To: Alexander Bulekov <alxndr@bu.edu>, Miroslav Rezanina <mrezanin@redhat.com>
References: <cover.1610607906.git.mrezanin@redhat.com>
 <dcb4bfa3fe810236475b338f2f6401ec3d1a1c57.1610607906.git.mrezanin@redhat.com>
 <4fd8d2a3-e665-4422-79e0-4e2a7337e4fc@redhat.com>
 <20210114141920.qjsnlt3cmkauggtw@mozz.bu.edu>
 <20210114143803.vow3l6r5nlugz6sc@lws.brq.redhat.com>
 <20210114144217.7kjo6h7luxcbxxml@mozz.bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bb1fef7d-af3b-0951-fb08-c22bc0f37c80@redhat.com>
Date: Thu, 14 Jan 2021 16:09:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114144217.7kjo6h7luxcbxxml@mozz.bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/21 3:42 PM, Alexander Bulekov wrote:
> On 210114 1538, Miroslav Rezanina wrote:
>> On Thu, Jan 14, 2021 at 09:19:20AM -0500, Alexander Bulekov wrote:
>>> On 210114 1415, Philippe Mathieu-DaudÃ© wrote:
>>>> +Jason +Dmitry
>>>>
>>>> On 1/14/21 8:07 AM, Miroslav Rezanina wrote:
>>>>> When building qemu with GCC 11, compiling eth.c file produce following warning:
>>>>>
>>>>>    warning: array subscript 'struct ip6_ext_hdr_routing[0]' is partly outside array bounds of 'struct ip6_ext_hdr[1]' [-Warray-bounds]
>>>>>
>>>>> This is caused by retyping from ip6_ext_hdr to ip6_ext_hdr_routing that has more
>>>>> attributes.
>>>>>
>>>>> As this usage is expected, suppress the warning temporarily through the function
>>>>> using this retyping.
>>>>
>>>> This is not expected, this is a bug...
>>>>
>>>
>>> Seems related: https://bugs.launchpad.net/qemu/+bug/1879531
>>> -Alex
>>>
>>
>> Yes, it is caused by the issue triggering the warning. Do you know
>> whether the patch mentioned in bug was already sent?
>>
>> Mirek
> 
> I don't think so..

Just sent one:

https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg03205.html


