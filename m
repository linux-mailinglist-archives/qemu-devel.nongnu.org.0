Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4C958A8A4
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 11:19:24 +0200 (CEST)
Received: from localhost ([::1]:42196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJtUJ-0002Ld-Nl
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 05:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oJtPt-0008OX-C8
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:14:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oJtPr-0005Yh-Ds
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:14:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659690886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jk6Bco7ppYzrK3Htr59gwEmE1t0OiLQA/HtCDP5HYJM=;
 b=CjpGVcf736Oi/1MkYfXeB6uH7b3kMDT7nehOuZr43MwzvRT+tsbjj4mskAFz8DHom+xGbk
 sZAe6Phn3smOu/Xq8nnqwkx8tFuTfcG+BC7QAzmR7tgFn6qaOthqzzsA5DK0urqKX5KYNE
 m0cZtngxP80A8MmnSCk91OFc8pyoFYc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17--zn3lwEKO9Guax5xJnrEfw-1; Fri, 05 Aug 2022 05:14:44 -0400
X-MC-Unique: -zn3lwEKO9Guax5xJnrEfw-1
Received: by mail-ej1-f71.google.com with SMTP id
 qa39-20020a17090786a700b007309910696fso1006224ejc.4
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 02:14:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Jk6Bco7ppYzrK3Htr59gwEmE1t0OiLQA/HtCDP5HYJM=;
 b=d0wIJSir1Z5bU6xQ2/hDIKhNoffm0cz51vzI4y6l4BEhcKXz+x2G7YDytabnc2GDII
 opcwzalDN6v/8SzwCI8tC+mf7k7/ze51Pl+KM+nLpKLsdFNbpD5SRVq76LA9wdN5orIF
 MsJmHP/uUkuWSvsoT1yvoRMK2f7syrLNYNVj6wZET3mE8SlTCUWDkdaUtWtHfe/RTDOZ
 kwfzNFAs7WXUtbq8aw94BIu9tbszlZOoJfnEM007tBvyhLczU7iQRYpdeC7CyBLGpBzQ
 h301DET10+wQtQbifdSuC5VxbEH3kzaSdIgH1Qt8GsBnwxuQdux2Orc1yEPW4TnYd0dm
 92+Q==
X-Gm-Message-State: ACgBeo3pA1t2oalQ1d8gdzrS5RiOh5zYN1jN7T8EpqgKjLFtgUnYqP6v
 lIa5zti9dN7KbU7CAjppzguudOB5JvyzO49W9HRdPM9y3B7WhPDmhmNp/G4uu+tsQ+IwqlJF5tF
 Qo5JwkCZSzILQ6cw=
X-Received: by 2002:a05:6402:1f87:b0:43b:b88d:1d93 with SMTP id
 c7-20020a0564021f8700b0043bb88d1d93mr5720967edc.314.1659690883643; 
 Fri, 05 Aug 2022 02:14:43 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6chkZz+LavzaydfXfUmQyYsSZbj5LIq299fwH6FJFu5OOZE+QhffOtRlQqEqN63iTvxY9X1g==
X-Received: by 2002:a05:6402:1f87:b0:43b:b88d:1d93 with SMTP id
 c7-20020a0564021f8700b0043bb88d1d93mr5720944edc.314.1659690883468; 
 Fri, 05 Aug 2022 02:14:43 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-42-113-85.web.vodafone.de.
 [109.42.113.85]) by smtp.gmail.com with ESMTPSA id
 e22-20020a1709062c1600b00730aa5f15cfsm1355439ejh.63.2022.08.05.02.14.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 02:14:42 -0700 (PDT)
Message-ID: <4c92be4e-aab6-7b30-b0b3-6d5fc7f43f92@redhat.com>
Date: Fri, 5 Aug 2022 11:14:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "Zhang, Chen" <chen.zhang@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 "stefanha@gmail.com" <stefanha@gmail.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Xie Yongji <xieyongji@bytedance.com>
References: <cover.1659403195.git.jag.raman@oracle.com>
 <MWHPR11MB00312737931679069FAAE7AB9B9D9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <e8eab8e6-e6a5-af95-223f-e0ca91b4d833@redhat.com>
 <20220805044052-mutt-send-email-mst@kernel.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/1] Update vfio-user module to the latest
In-Reply-To: <20220805044052-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/08/2022 10.55, Michael S. Tsirkin wrote:
> On Fri, Aug 05, 2022 at 09:21:07AM +0200, Thomas Huth wrote:
>> On 02/08/2022 12.00, Zhang, Chen wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Qemu-devel <qemu-devel-
>>>> bounces+chen.zhang=intel.com@nongnu.org> On Behalf Of Jagannathan
>>>> Raman
>>>> Sent: Tuesday, August 2, 2022 9:24 AM
>>>> To: qemu-devel@nongnu.org
>>>> Cc: stefanha@gmail.com; berrange@redhat.com
>>>> Subject: [PATCH 0/1] Update vfio-user module to the latest
>>>>
>>>> Hi,
>>>>
>>>> This patch updates the libvfio-user submodule to the latest.
>>>
>>> Just a rough idea, why not depends on linux distribution for the libvfio-user.so?
>>> It looks no libvfio-user packet in distribution's repo.
>>>
>>> Hi Thomas/Daniel:
>>>
>>> For the RFC QEMU user space eBPF support,
>>> https://lore.kernel.org/all/20220617073630.535914-6-chen.zhang@intel.com/T/
>>> Maybe introduce the libubpf.so as a subproject like libvfio-user.so is more appropriate?
>>
>> Fair comment. I never noticed them before, but why do we have those
>> submodules in the subprojects/ folder (libvduse, libvfio-user and
>> libvhost-user)?
> 
> I don't think they are submodules are they?

Drat, my bad! It's only libvfio-user that is a submodule. Never mind the 
other two.

>> ... I don't think it's the job of QEMU to ship libraries
>> that a user might want to use for a certain feature, so could we please
>> remove those submodules again?
> 
> Why not?  Fundamentally I don't see why would libvhost-user be less
> important to users than e.g. qemu-img or qemu-bridge-helper. There's no
> rule saying we can only ship a single binary.

If libvhost-user does not have another home, then it's fine to have it here, 
I guess, but libvfio-user should rather be packaged as a proper library by 
the distros instead if it has a different upstream home.

  Thomas


