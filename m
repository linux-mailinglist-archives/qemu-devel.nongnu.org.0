Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65673321C7E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 17:12:30 +0100 (CET)
Received: from localhost ([::1]:56500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEDoz-0002JJ-Af
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 11:12:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEDkC-0008By-Mc
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 11:07:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEDkA-0000sX-Ks
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 11:07:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614010049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W+zoJPZsKuYfuXtjnQiVhoL0lDlDVISBIzFP/OWberA=;
 b=PxqjgOWrmjLRHZklV9PETQsR3FIbyXI2k7ZfZmUun6EE0870WRnEuFIsOcG3wxl46DeUbB
 hMuyexp5J7tXsTH2Dten/YjFnwKqEsSAqJXOyRSOhx4iskHr/3pRlzz3T1Qj/cqQPd3Rnd
 o83/vNjMa+Gl9TyA1LaQSZs2Kzz036g=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-yucLrM9lOieTSSvdFzApRg-1; Mon, 22 Feb 2021 11:07:26 -0500
X-MC-Unique: yucLrM9lOieTSSvdFzApRg-1
Received: by mail-ed1-f69.google.com with SMTP id z12so7252253edb.0
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 08:07:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W+zoJPZsKuYfuXtjnQiVhoL0lDlDVISBIzFP/OWberA=;
 b=b5Zl1gIw4SFtNZ7CJgccM0MbVNArGrikBZPVEIoqLIBDNiitoaomQYSytHtgszupUh
 c0MA2PAXjq4eK7yOJSyu7ND4JuqPXITEMdLREmtwMaRZwfjXKx7v5yPx8E/up8QhlkF6
 vCdFCf0/aQ5Yb0JrAgDMwsblYt2FR872p7zoK1VJmCr9xEon0fdJ03Xj/5aZgpTAejkB
 6vui7M12X7leiyaVu0owALLPf2E4JDjAT2zyKsW6Cfd4qdlUtHG64yh1zuHsa3BJnbeA
 LjV+p/yNNCpI09UOk09Naz6qU40HCLvSM7Ftcd3JLSR9WJb9Ok114Cjo4d1l4jmLoK1V
 m92A==
X-Gm-Message-State: AOAM5329Rjo2QHxbPN31wspTDR0ctSxjDDXICpw34EjPjUvmunWrt8Nq
 wItO4bM9pLH2HQuz7Qj9sgQNvmnGIJfrrqLDjel8wveavkuA+Ay4/GxbETjoMmxG4LPoxoLjvUr
 yEpe/R795t2i/CA1nePUFjNyaX5dzYiEU/6HLkpW/o3B/WLXmXJQF/VU//o2UMwcg
X-Received: by 2002:a05:6402:26c9:: with SMTP id
 x9mr23401864edd.365.1614010044835; 
 Mon, 22 Feb 2021 08:07:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYWLg3wqXgdw2CoD6pb9uw+EDPAZvXFzhzTE1E+W2GphPql4XnLxNgTKs+0tLrtvsJZP8NzQ==
X-Received: by 2002:a05:6402:26c9:: with SMTP id
 x9mr23401843edd.365.1614010044658; 
 Mon, 22 Feb 2021 08:07:24 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id ia25sm9000648ejc.44.2021.02.22.08.07.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 08:07:23 -0800 (PST)
Subject: Re: QEMU hosting
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Fosshost <admin@fosshost.org>, Stefan Hajnoczi <stefanha@gmail.com>
References: <CAJSP0QVZuh8H-U1vtFMhasqSsSy3OA4jmRvwZrQEAx3=1dcb+w@mail.gmail.com>
 <LO2P123MB2605DA330913C7D2DA311EF1C8D10@LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM>
 <b803bbce-ef10-229b-eccb-b26f0e589a43@redhat.com>
Message-ID: <b19717c3-bf78-9369-e84a-b8f965d7150f@redhat.com>
Date: Mon, 22 Feb 2021 17:07:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b803bbce-ef10-229b-eccb-b26f0e589a43@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 4:56 PM, Philippe Mathieu-Daudé wrote:
> Hi Thomas and Stefan,
> 
> On 1/5/21 7:55 PM, Fosshost wrote:
>> Hi Stefan
>>
>> Thank you for your email.
>>
>>  1. We do not offer MacOS hosting
>>  2. We can provide virtual machines with full KVM virt on x86
>>     architecture and soon arm64 v8
>>  3. We do not provide dedicated servers.
> 
> Would it be possible to have a dedicated VM for a git LFS server [*]?

Just noticed the Mirrors-as-a-Service option "(available for package
mirrors, operating systems, repositories, documentation, static assets,
etc)":

https://docs.fosshost.org/en/home/getting-started#production-services
https://docs.fosshost.org/en/home/mirrors-as-a-service

> If so, what storage is usable? Are there network traffic limits?
> 
> Thanks,
> 
> Phil.
> 
> [*] https://docs.gitlab.com/ee/topics/git/lfs/
> 
>> ------------------------------------------------------------------------
>> *From:* Stefan Hajnoczi <stefanha@gmail.com>
>> *Sent:* 05 January 2021 14:21
>> *To:* Fosshost <admin@fosshost.org>
>> *Cc:* qemu-devel <qemu-devel@nongnu.org>
>> *Subject:* QEMU hosting
>>  
>> Hi Thomas,
>> In November you emailed qemu-devel asking if the QEMU project was
>> interested in exploring hosting with Fosshost.org. I think my reply
>> may have gotten lost so I wanted to check if you have time to discuss
>> this again.
>>
>> The main hosting need that QEMU has is for continuous integration
>> system runners. We are particularly interested in non-x86/non-Linux
>> build machines and a dedicated server for reproducible performance
>> tests. Just today there was discussion on #qemu IRC about how to go
>> about adding a macOS build machine, for example.
>>
>> It would be great to find out more about Fosshost.org and whether we
>> can work together.
>>
>> Thanks,
>> Stefan
> 


