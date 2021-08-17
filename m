Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F19AF3EF12F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 19:58:53 +0200 (CEST)
Received: from localhost ([::1]:33234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG3MT-00006S-28
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 13:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mG3L7-0007Ci-LU
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 13:57:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mG3L5-0003Ub-Uw
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 13:57:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629223047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=14X5ZKgAXIXqju2A7ggN/u5F/REHb2TFfv6WqpVnB7s=;
 b=B+knXu77A9vBWjLca6h/gS+kYuwLUM6EjGZ1IJr9I9fUuU49sZzymbk3L3y/AYQ5G0ULbE
 Yw/Js+6t9FW2Zv47MCxhdFNQFR/9bSt7jvCXbARuIJV4TKd3YrXJrIo5MDx1VbGZLbu8ea
 FFJqbudZtNGLQst3QncKy06qSjn3Zrg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-76NoRq6hN3aYZ-6AnusnSw-1; Tue, 17 Aug 2021 13:57:25 -0400
X-MC-Unique: 76NoRq6hN3aYZ-6AnusnSw-1
Received: by mail-wr1-f69.google.com with SMTP id
 m2-20020a0560000082b0290154f6e2e51fso6874335wrx.12
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 10:57:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=14X5ZKgAXIXqju2A7ggN/u5F/REHb2TFfv6WqpVnB7s=;
 b=PUPNnBeVvSEyUq6epiMz7pzWgRL/1uY3MWbxcRM1itYFCfwgVFjsxErcFUeKuQPb1b
 intcd5YBDjAgiDazRkjIsH53JFZR438gXSr0vraQBPZtmuGUmHjCxs9olyBPXhJ/VwyJ
 BAt0Sez/JYFytvBrLCPF+fTuG79fzNYOFf9FfuiokOa/jusnisOWRZil3QYbIaAHd3i0
 f2qfwA5av+cPRW4oxlZJuxThEIWO5azLZEm3vzAmR15WvSn76eGkA+zoe5BbMivKO+gt
 dJch5ECi3qhhL+9QdOBKGQ/j8PvUni0ZXb7DL2U7QbJ8ZFu6MCIcI2LZNQcBCXQ/sCvg
 BdZw==
X-Gm-Message-State: AOAM530os96fZ3JPlzJgGZhw+j98+cen34fyUySSti/bpSe86b/UW9Qi
 QiRWY/WMsOduB6flHHW6hADu6XjPB78oFJjUP/cfB2HMm4subYMuEntzY99yL4eyK4KgYfylX0W
 RCGo6Wt0NCbuRp9E=
X-Received: by 2002:adf:ec81:: with SMTP id z1mr5793355wrn.181.1629223044410; 
 Tue, 17 Aug 2021 10:57:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzE44/1W3aM1AMmaok0YZ9rEBOuCUC3A2iSS+fILd8CJ3EI99wb3FZuqOjc40PXChUNURXLVQ==
X-Received: by 2002:adf:ec81:: with SMTP id z1mr5793335wrn.181.1629223044176; 
 Tue, 17 Aug 2021 10:57:24 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id b18sm3218230wrr.89.2021.08.17.10.57.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 10:57:23 -0700 (PDT)
Subject: Re: [PATCH 1/3] MAINTAINERS: Split Audio backends VS frontends
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <20210816191014.2020783-1-philmd@redhat.com>
 <1790111.v9OTG8XKiZ@silver>
 <20210817124127.2ip6fq2ndlubqn5s@sirius.home.kraxel.org>
 <2098132.JuaFiSchrr@silver>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0d7f824c-8392-9a94-90be-befa45b3a722@redhat.com>
Date: Tue, 17 Aug 2021 19:57:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2098132.JuaFiSchrr@silver>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.961, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>, clamky@hotmail.com,
 Yonggang Luo <luoyonggang@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?S8WRdsOhZ8OzIFpvbHTDoW4=?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/17/21 6:12 PM, Christian Schoenebeck wrote:
> On Dienstag, 17. August 2021 14:41:27 CEST Gerd Hoffmann wrote:
>>   Hi,
>>
>>>> +Overall Audio frontends
>>>
>>> I would call that "Audio Hardware Emulation" instead of "Overall Audio
>>> frontends".
>>>
>>>> +Overall Audio backends
>>>
>>> Likewise I would call this section "Shared/common QEMU audio library/
>>> subsystem" or something like that instead of "Overall Audio backends".
>>
>> Well, frontend/backend is common qemu terminology, with "frontend" being
>> the emulated/virtual device as seen by the guest and "backend" being the
>> host-side wireup (i.e. -audiodev / -blockdev / -chardev / -netdev / ...)
>>
>> take care,
>>   Gerd
> 
> Yeah, I was seeing this (like usual) more from an external/new developer 
> perspective where the semantic for "frontend"/"backend" is not that obvious 
> here.

"Audio Backends" is in the "Subsystems" meta-section, and
"Audio Frontends" in the "Devices" one.

Maybe we using the === separator for meta-sections (like rST)
instead of --- would help seeing the difference.

I don't want to use parenthesis in the descriptions because
this then breaks the get_maintainer.pl output when parsed
by (git) scripts.

> 
> But okay ...
> 
> Acked-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> 
> Best regards,
> Christian Schoenebeck
> 
> 


