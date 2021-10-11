Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 272B1429962
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 00:19:44 +0200 (CEST)
Received: from localhost ([::1]:36386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma3e2-0002r9-Ks
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 18:19:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ma3bo-0001y1-VH
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 18:17:25 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ma3bm-0007dW-Ur
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 18:17:24 -0400
Received: by mail-wr1-x435.google.com with SMTP id v17so60518671wrv.9
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 15:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1c6xlXQ1QTb0juz95q6iUa0+1i5jkm1gQO3SWxBdgBY=;
 b=KcLrZN4jzTqfbYgRmYiLpNDG2kRO+whUH18DReiI7GTYr9FmuUnMq4BggDzCtad0Ua
 1eRovM0GYQzwHikfpg39Dld3WeE+2tKGR9QcaXYWS0wM6W1lgQyWa260o+G1oN7b4Xb5
 7zF3E4gQRE5DtWcb/8MO53YY/wpW9Z/hyA7Crkd9GWv7JfDIEkGGjywj7hNHAACINN3S
 dZilb/hCDUqz3I2IHB49+Dq/orlYtLyOHMQXjevTPTF8jl6ACzbcqDDyQd1Mn6TXCYNA
 C9t10qBPP6/hj/9JMY7Hls+qmZacUb3jq+xB18zpw4Hv3bbwDSpUu57EwNaV8BhvMP5A
 11KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1c6xlXQ1QTb0juz95q6iUa0+1i5jkm1gQO3SWxBdgBY=;
 b=FbKAh86bslO6HwAk9LzStKe4fhWt2mwaw2opJSY0MJEE9jRNlZ2N1xtbeVhY5yE+Vb
 4IDb2e4pY5ntI2uPa0RxGOfyxKRSSyeeE5dpuqCPaTBKBUXc5uPPXOnbFS0YGzgkTf4/
 E0qSfEFliwyJFug9sAQN7bvtImyFyiVgGP69T1Qt4oEqbGlfWv270Qg+TcApIDrfq8UY
 JtKuNZ1OCs11S7sMllmZ27t5Ipo9SHEhRUfm3SdzxsTffE3oshHcd55u/sNB1H7idwTM
 ltQ+iTih4yuvTQi027ZV4L/eoFH3ieYSa/Qp2S0z+NSDpIDrPgQQs21w0uoVEvNiCw0W
 q9Eg==
X-Gm-Message-State: AOAM5337U9pRMTHM3fOg3kVgxg6I95XvXcIvKUE9N674x22/bQyqTDl5
 qg2+64C0R98971Gx4hOM0QI=
X-Google-Smtp-Source: ABdhPJwRBrLc5rt2tvpRC+6JMQC6TtnXwOUlAPfh9UW2RalmRbOeIUaNtJgwhHCHsa8XrgyPnMB7Ew==
X-Received: by 2002:a05:600c:354a:: with SMTP id
 i10mr1766550wmq.70.1633990640918; 
 Mon, 11 Oct 2021 15:17:20 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id c132sm724700wma.22.2021.10.11.15.17.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 15:17:20 -0700 (PDT)
Message-ID: <8108c69d-a596-d6c9-a116-783f47904deb@amsat.org>
Date: Tue, 12 Oct 2021 00:17:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v1 2/2] memory: Update description of
 memory_region_is_mapped()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20211011174522.14351-1-david@redhat.com>
 <20211011174522.14351-3-david@redhat.com>
 <93dead18-5ea5-0afe-18c1-de9a06773687@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <93dead18-5ea5-0afe-18c1-de9a06773687@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/21 23:21, Richard Henderson wrote:
> On 10/11/21 10:45 AM, David Hildenbrand wrote:
>>   /**
>>    * memory_region_is_mapped: returns true if #MemoryRegion is mapped
>> - * into any address space.
>> + * into another #MemoryRegion directly. Will return false if the
>> + * #MemoryRegion is mapped indirectly via an alias.
> 
> Hmm.  I guess.  It kinda sorta sounds like a bug, but I don't know the
> interface well enough to tell.

I tend to agree there is a generic issue with aliases, see:

https://www.mail-archive.com/qemu-devel@nongnu.org/msg732527.html
then
https://www.mail-archive.com/qemu-devel@nongnu.org/msg799622.html
"memory: Directly dispatch alias accesses on origin memory region"

The API description looks OK to me, I'd rather change the
implementation... Maybe we need a MR_ALIAS_FOREACH() macro?

