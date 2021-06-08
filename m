Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CADF239F3F0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 12:44:53 +0200 (CEST)
Received: from localhost ([::1]:58564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqZE4-0002vg-Sr
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 06:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqZC9-00013P-Hb
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 06:42:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqZC7-0007sN-Rw
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 06:42:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623148971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G1EizyqKlAZ+Hg0iEpM6ML03wpjMinDZsv1HB6ywObE=;
 b=Vddkc9mtNGey2sXLLUI841GN6WJFi9+eAgApbG3/U60TaIVONJmcG7bJlCv5B7R3Ki/Ti7
 sq5p+MA5kVeimmrr6L04kyWTXLkrt5FvhojRIaks2nAoyW18+d+wI0+7OPC4g2brhxKcIt
 QY03xqRDh9Z36ODwnTwDAVb4A7XtvRU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-MMDi80sIOUmySUH5IxszUA-1; Tue, 08 Jun 2021 06:42:50 -0400
X-MC-Unique: MMDi80sIOUmySUH5IxszUA-1
Received: by mail-wm1-f70.google.com with SMTP id
 v25-20020a1cf7190000b0290197a4be97b7so566223wmh.9
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 03:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G1EizyqKlAZ+Hg0iEpM6ML03wpjMinDZsv1HB6ywObE=;
 b=XDXZA3IzZpBrF5+eX+S5+9Uv9AvQYoqbpFOTNeV0Dy4Gc1YrfSvJ51MZLVUvWPHGhh
 h9PCXuAwynloksmjdppqDqwpA+uNOJ3JgMi0K2M0SgdnyiU0zxINucycdfSK6SaF+xix
 OhTGZaJci6imy84gjMYewaIHPNd9eI6pZ3V2e9kRo28ggwg5VrJ9zDJ941/95AfbZkp6
 NxPonyCSndXnqx7o3kIEQDvwz36jZnBjTgldsyEQXaFhmml3eqmvxi9sGgcNelJTNDbu
 I9XxNT33EqO/GzAePz32fPUIeeBEqsUuPVnd4tO2H7DiEJHhlk09Xsci6f6WDiTe+bEB
 Igmw==
X-Gm-Message-State: AOAM532jpDQBm/VdxcH3ULOCGGMiFT33cfMbqZEMRjcnJhInpE82I/mg
 P8+/GDoGzLaTzXU/JsTT2n0TO4A+8YasUrhhd+l4HIRM539mHb1m0/5ksj6sL5X1foFKD6ElL0X
 O5E20OIhjjIxkZOY=
X-Received: by 2002:a5d:494c:: with SMTP id r12mr21613860wrs.421.1623148968876; 
 Tue, 08 Jun 2021 03:42:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUYznfDDypI9vvzyXaYeDO22Pby0aB+fmHxqMBK3wN118bCf/TPrA3C0kPCiOwNO58281pSw==
X-Received: by 2002:a5d:494c:: with SMTP id r12mr21613849wrs.421.1623148968754; 
 Tue, 08 Jun 2021 03:42:48 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id a1sm21974940wrg.92.2021.06.08.03.42.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 03:42:48 -0700 (PDT)
Subject: Re: [PATCH v8 02/12] accel: Introduce 'query-accels' QMP command
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210526170432.343588-1-philmd@redhat.com>
 <20210526170432.343588-3-philmd@redhat.com> <87r1hi7tna.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <762ff787-c2e7-b0fa-7938-64bea05044e7@redhat.com>
Date: Tue, 8 Jun 2021 12:42:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87r1hi7tna.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/3/21 7:19 PM, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> Introduce the 'query-accels' QMP command which returns a list
>> of built-in accelerator names.
>>
>> - Accelerator is a QAPI enum of all existing accelerators,
>>
>> - AcceleratorInfo is a QAPI structure providing accelerator
>>   specific information. Currently the common structure base
>>   provides the name of the accelerator, while the specific
>>   part is empty, but each accelerator can expand it.
>>
>> - 'query-accels' QMP command returns a list of @AcceleratorInfo
>>
>> For example on a KVM-only build we get:
>>
>>     { "execute": "query-accels" }
>>     {
>>         "return": [
>>             {
>>                 "name": "qtest"
>>             },
>>             {
>>                 "name": "kvm"
>>             }
>>         ]
>>     }
>>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Tested-by: Alex Bennée <alex.bennee@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> v8:
>> - Include code snippet from Markus adding to machine-target.json
>>   to be able to use enum values or union branches conditional.
>> - Use accel_find() on enum to be sure the accelerator is enabled
>>   at runtime (chat with jsnow / eblake).
> 
> Hmm something broke because now I get:
> 
>  /usr/lib/x86_64-linux-gnu/libpixman-1.so -lgthread-2.0 -lglib-2.0 -lstdc++ -Wl,--end-group
> /usr/bin/ld: libqemu-aarch64_be-linux-user.fa.p/accel_accel-qmp.c.o: in function `qmp_query_accels':
> /home/alex/lsrc/qemu.git/builds/arm.all/../../accel/accel-qmp.c:15: undefined reference to `Accelerator_lookup'
> collect2: error: ld returned 1 exit status
> [1327/1413] Linking target qemu-io

Sorry I missed that for user-mode, will be fixed in v9.


