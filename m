Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D30A71CDFE7
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 18:05:15 +0200 (CEST)
Received: from localhost ([::1]:42456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYAva-0004AR-8A
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 12:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jYAqg-0006Mi-HP
 for qemu-devel@nongnu.org; Mon, 11 May 2020 12:00:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53849
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jYAqe-0005Wp-Q2
 for qemu-devel@nongnu.org; Mon, 11 May 2020 12:00:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589212807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eu0XX77Dn/vBKTVA9RDF85LaaJtuPM6IKZJuw/5Ci5I=;
 b=TQwDcYdAGFQ9RfFLn5nIhqTR9xh8meK2y+x7Pm6FlYHL1/5fsR5mbAOlD6/9jPzf4gewRQ
 AbizcZrgkm0ul8/sl2eEgkxO1YLGVj5wU54APLrWwpulZBJnowcAL50d06pK1DRKR3AhdF
 60s6vEq74/o9T8YpZNRIVGZ1z2KPrRA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-LCYF4MOON1ObzF1sYgC7ng-1; Mon, 11 May 2020 12:00:05 -0400
X-MC-Unique: LCYF4MOON1ObzF1sYgC7ng-1
Received: by mail-wr1-f70.google.com with SMTP id q13so5458667wrn.14
 for <qemu-devel@nongnu.org>; Mon, 11 May 2020 09:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Eu0XX77Dn/vBKTVA9RDF85LaaJtuPM6IKZJuw/5Ci5I=;
 b=sd4bfxKaIlI1C446An+kCSlVcshM1P7xkMaDYDpapxiY+ylX0x8Vp1PZc84EKnfIWP
 UEr9lw8EFs83eOZq+3Foqt4aCTRnr8jWVYW0JMk1/M8tmn/4uQhAXdTEGPTDziUkyS9L
 qOmejvei+CNkxTQzQlxtVAY4XUWnf92U7LMRA6OgqiNG4GGyaFhVSS2T04AkiJCUk/gY
 70El8+P/uqOUz3ayvJdwAfiDRK83liZFMHZWHD/x8tXIptcEOmCJy2K4jYCxENh+xApC
 H+rPOEMRgL4AsQCZHyIObnYy1U2T1/MyOQ2Pw4XdsBim3nHhZ35Hf2EzkRH9eMpnJrTz
 HQFw==
X-Gm-Message-State: AGi0PuYoMUgoB+eYtGK8EwVmZGsDL29kTcO+FgUtZpFto/woBmZc7ry5
 0RLrx2ozmY2r3fT4JkWfqmyLkufh+gSm97i5CAXcd2VbznwjAPMFirXwdtOSbZHRQa/21I/SXUQ
 cLZAK+G149Rda2mA=
X-Received: by 2002:adf:9f48:: with SMTP id f8mr19925431wrg.228.1589212804113; 
 Mon, 11 May 2020 09:00:04 -0700 (PDT)
X-Google-Smtp-Source: APiQypLI04F4qe1cKA0iaNsGFBdWgkY0UyVSkhbeZ6iTtfNtpZVAGxqGo6MaqXUzRb3Jh111uT9HQg==
X-Received: by 2002:adf:9f48:: with SMTP id f8mr19925401wrg.228.1589212803850; 
 Mon, 11 May 2020 09:00:03 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id q9sm3426417wmb.34.2020.05.11.09.00.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2020 09:00:02 -0700 (PDT)
Subject: Re: [PATCH] hostmem: don't use mbind() if host-nodes is epmty
To: Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20200430154606.6421-1-imammedo@redhat.com>
 <20200504154450.GM5244@habkost.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <34c80b6d-c6f3-3772-140a-4650e2356d25@redhat.com>
Date: Mon, 11 May 2020 18:00:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200504154450.GM5244@habkost.net>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 02:55:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: pbonzini@redhat.com, mhohmann@physnet.uni-hamburg.de, berrange@redhat.com,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eduardo,

On 5/4/20 5:44 PM, Eduardo Habkost wrote:
> On Thu, Apr 30, 2020 at 11:46:06AM -0400, Igor Mammedov wrote:
>> Since 5.0 QEMU uses hostmem backend for allocating main guest RAM.
>> The backend however calls mbind() which is typically NOP
>> in case of default policy/absent host-nodes bitmap.
>> However when runing in container with black-listed mbind()
>> syscall, QEMU fails to start with error
>>   "cannot bind memory to host NUMA nodes: Operation not permitted"
>> even when user hasn't provided host-nodes to pin to explictly
>> (which is the case with -m option)
>>
>> To fix issue, call mbind() only in case when user has provided
>> host-nodes explicitly (i.e. host_nodes bitmap is not empty).
>> That should allow to run QEMU in containers with black-listed
>> mbind() without memory pinning. If QEMU provided memory-pinning
>> is required user still has to white-list mbind() in container
>> configuration.
>>
>> Reported-by: Manuel Hohmann <mhohmann@physnet.uni-hamburg.de>
>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> 
> Queued on machine-next, thanks!

I've been debugging this issue again today and figured it was not 
merged, if possible can you add the "Cc: qemu-stable@nongnu.org" tag 
before sending your pull request?

Thanks,

Phil.


