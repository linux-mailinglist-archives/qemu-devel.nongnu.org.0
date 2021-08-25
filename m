Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 931F63F7DBC
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 23:29:26 +0200 (CEST)
Received: from localhost ([::1]:49034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJ0SR-0003jf-1B
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 17:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJ0RI-0002OX-Um
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 17:28:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJ0RG-0004Hz-C9
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 17:28:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629926880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ns31E8TMqXqoYRXzI9Qt4OOYd1Cc+I1EIm22XWDyEGo=;
 b=Hs1WfEC7kS1DdRSTWf2Z6uBO3YAoPoF/IzetHWQ+7EkH8gDw3f4OfcK/olP5nQ4luzgMdb
 2WjUTLQ6Btf4h6EwbZxVpASxVCjiwTJL9RvckekllyqGY9LQl/3U5Qza6O49JuP5yixdvE
 mS6TUk1bzYJyLgjTt6VQfdIPA/lguB8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-ABFEEhAINgaX95ybiiClrg-1; Wed, 25 Aug 2021 17:27:59 -0400
X-MC-Unique: ABFEEhAINgaX95ybiiClrg-1
Received: by mail-wm1-f69.google.com with SMTP id
 o3-20020a05600c510300b002e6dd64e896so1408801wms.1
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 14:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ns31E8TMqXqoYRXzI9Qt4OOYd1Cc+I1EIm22XWDyEGo=;
 b=Cf6Cwn6Tbl+vGaF+syYkFX88hwZ2SvByqWq/e+RrvsDB0DyqQ5cFMz/7IiZpIrlkXH
 tWFyVQ5W6cmoKEmzhPJPgEieK9S3K2cgRN2LJ+5WuR+o4/HlQ6VWfvvlXX3p8ev0H0yr
 wRg5UT6CaDZnZzZDvkGIw8ZdntnEVRAKzB8Uj20o1+u3JNl9zWsA+Hdx8EQeukZSW33z
 NsreyjUKeuNFYHgwLyiJI9PBPOWzYKnR0pffZQtkLr7XiHyq6r5EAY7ieSPCSUtOi2QD
 zJ7pXQQkLha80EF+fH3II0PSuRMgWa8O/61+llnOGb+3VRAys8eOn/aZvDeodum9PzyV
 /k1Q==
X-Gm-Message-State: AOAM531MLsDaKJ5etc7T/dZk0KMb3Skxt6uGzMXz3pkip2e4lWSdYoGa
 M2dtYUaLEWA/Pq95E5cN/b67cUSnBTnG8yVqFn7/W86d1a9rPfJ+tScJoQDR1rbv+9pfQOKnqXF
 akJXc3zVmsMgrsVc=
X-Received: by 2002:a05:6000:18a:: with SMTP id
 p10mr223916wrx.40.1629926877733; 
 Wed, 25 Aug 2021 14:27:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz07zflatcaYhKt7lBs82itSfyrjKJoGv6YyCjRxxmfyNabJY8GOkzj3Ja6kSmXRFRzlQvjLQ==
X-Received: by 2002:a05:6000:18a:: with SMTP id
 p10mr223903wrx.40.1629926877557; 
 Wed, 25 Aug 2021 14:27:57 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id n8sm1067529wra.24.2021.08.25.14.27.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 14:27:57 -0700 (PDT)
Subject: Re: [PATCH 02/19] host-utils: move abs64() to host-utils
To: Eduardo Habkost <ehabkost@redhat.com>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
References: <20210824142730.102421-1-luis.pires@eldorado.org.br>
 <20210824142730.102421-3-luis.pires@eldorado.org.br> <YSW8TigYwJVIrd5w@yekko>
 <CP2PR80MB36683DC7E9BEEA136FD0DD5EDAC69@CP2PR80MB3668.lamprd80.prod.outlook.com>
 <20210825202638.2vtjxcsau2cghbr3@habkost.net>
 <CP2PR80MB3668D3C0F23858EE7D4610F5DAC69@CP2PR80MB3668.lamprd80.prod.outlook.com>
 <20210825211805.cn6iodnnibn2vd6i@habkost.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d155f139-2ebf-df38-2fbd-432255d696be@redhat.com>
Date: Wed, 25 Aug 2021 23:27:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210825211805.cn6iodnnibn2vd6i@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.24, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "groug@kaod.org" <groug@kaod.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/25/21 11:18 PM, Eduardo Habkost wrote:
> On Wed, Aug 25, 2021 at 08:37:17PM +0000, Luis Fernando Fujita Pires wrote:
>> From: Eduardo Habkost <ehabkost@redhat.com>
>>
>>>> Right, that's true of any standard implementation of abs().
>>>> I thought about making it return uint64_t, but that could make it
>>>> weird for other uses of abs64(), where callers wouldn't expect a type
>>>> change from int64_t to uint64_t. Maybe create a separate uabs64() that
>>>> returns uint64_t? Or is that even weirder? :)
>>>
>>> Which users of abs64 would expect it to return int64_t?
>>> kvm_pit_update_clock_offset() doesn't seem to.
>>
>> Oh, I wasn't referring to any specific users. What I meant is
>> that, if we make abs64() generically available from host-utils,
>> callers could expect it to behave the same way as abs() in
>> stdlib, for example.
> 
> That would be surprising, but do you think there are cases where
> that would be a bad surprise?
> 
> I don't think anybody who is aware of the abs(INT_MIN),
> labs(LONG_MIN), and llabs(LLONG_MIN) edge cases actually _like_
> that behaviour.
> 
> If you really want to avoid surprises, providing a saner function
> with a different name seems better than trying to emulate the
> edge cases of abs()/labs()/llabs().

Agreed. See do_strtosz() for example.


