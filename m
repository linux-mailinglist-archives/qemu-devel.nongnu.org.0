Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB65935E39A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 18:15:44 +0200 (CEST)
Received: from localhost ([::1]:58154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWLhX-00069s-MO
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 12:15:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWLVT-00019T-Tr
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:03:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWLVR-0003sO-GF
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:03:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618329791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QZUvVoFVhF3AN9m/vGhzo2dype57spKvnnIF5A0eXrI=;
 b=b24qHvsWm32c5crhzP8+E+QIRfDzXCjcPh1ZqqaXd/euUO93y1DBnztPR9YC0cdn+FLVKZ
 Y5RlXtSJsgXWMOPzxTErEj9LX7RK6uQ/Zht7/enEpwfHBSVGWdXLXGohByOtgwB00RGQPK
 88B8UhCxPmzduGw/Jn9HE93k1oOu3uI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-8Y5h3E0LPsC1ngqol1xSWQ-1; Tue, 13 Apr 2021 12:03:10 -0400
X-MC-Unique: 8Y5h3E0LPsC1ngqol1xSWQ-1
Received: by mail-wr1-f69.google.com with SMTP id n16so929720wrm.4
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 09:03:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QZUvVoFVhF3AN9m/vGhzo2dype57spKvnnIF5A0eXrI=;
 b=VzD1Vr479Ujm58AZt6Cwxi8DplHP+pRR7b4RUHuFIkMfKxpT6xazjyx4/FHeYcs/l9
 f/2O8EE+RSfcB9HuGGGh+Ues132RbBtB5PQR4RbphfnUn64oaY2Y8Dbxfoq9zaeYPb4m
 q+iYgpT+4ckOC/HRfdMIe0vWK0IrD+LVT2rQHBi/aVHF/NVTsj2FWJC1Rn56slg/hAnl
 mo5xlOYXGacadSvv4SSlkNu535fEU36lEiq0/ueuTG5u1M13IRX5EYUXCRRHvP0Wha8a
 TKTdIGrux8bdfCNmqG5MrK9TgLXCyb0aBVjOMswkv9d0sLOww6lVzlvasEANusGEGTdN
 jR8w==
X-Gm-Message-State: AOAM532sowEwDREc7oAzJFjA8vlznEWcYfmL0lYpMzKl4XwfOir5Iz2P
 dBNqegNGpVkMrsqz9H2NwzyYhGKS4IElI7MpvI3JflRWmG2st1rGTc40zO90e5m+YxgkIRnTvHl
 r/N4yPCsSKwpjYks=
X-Received: by 2002:adf:fc01:: with SMTP id i1mr4257204wrr.374.1618329788417; 
 Tue, 13 Apr 2021 09:03:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyo3FVLeGYnUxLZF1ubkQuN6KYDfArqPwHjScEwtRmbCMybah/IHJu+7uconV296s1qU7eO+Q==
X-Received: by 2002:adf:fc01:: with SMTP id i1mr4257178wrr.374.1618329788264; 
 Tue, 13 Apr 2021 09:03:08 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id i12sm748439wmd.3.2021.04.13.09.03.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 09:03:07 -0700 (PDT)
Subject: Re: [PATCH] cutils: fix memory leak in get_relocated_path()
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20210412170255.231406-1-sgarzare@redhat.com>
 <22828e2d-2c8e-c753-31e5-7588f9064b10@redhat.com>
 <20210413114742.i7bu2sc2w6ityjic@steredhat>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9a2dbbdc-b47d-793a-33c5-b529756eafdc@redhat.com>
Date: Tue, 13 Apr 2021 18:03:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413114742.i7bu2sc2w6ityjic@steredhat>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 1:47 PM, Stefano Garzarella wrote:
> On Tue, Apr 13, 2021 at 12:59:36PM +0200, Philippe Mathieu-Daudé wrote:
>> Is this fix aiming at 6.0 release?
> 
> The leak is minimal, but the fix is very simple.
> So, I think it can go if someone has a pull request to send with other
> patches, but I'm not sure with which tree.

I'd say Paolo...

Cc'ing Daniel/Marc-André who have a good GLib understanding.

> 
> Thanks,
> Stefano
> 
>>
>> On 4/12/21 7:02 PM, Stefano Garzarella wrote:
>>> get_relocated_path() allocates a GString object and returns the
>>> character data (C string) to the caller without freeing the memory
>>> allocated for that object as reported by valgrind:
>>>
>>>   24 bytes in 1 blocks are definitely lost in loss record 2,805 of 6,532
>>>      at 0x4839809: malloc (vg_replace_malloc.c:307)
>>>      by 0x55AABB8: g_malloc (in /usr/lib64/libglib-2.0.so.0.6600.8)
>>>      by 0x55C2481: g_slice_alloc (in /usr/lib64/libglib-2.0.so.0.6600.8)
>>>      by 0x55C4827: g_string_sized_new (in
>>> /usr/lib64/libglib-2.0.so.0.6600.8)
>>>      by 0x55C4CEA: g_string_new (in /usr/lib64/libglib-2.0.so.0.6600.8)
>>>      by 0x906314: get_relocated_path (cutils.c:1036)
>>>      by 0x6E1F77: qemu_read_default_config_file (vl.c:2122)
>>>      by 0x6E1F77: qemu_init (vl.c:2687)
>>>      by 0x3E3AF8: main (main.c:49)
>>>
>>> Let's use g_string_free(gstring, false) to free only the GString object
>>> and transfer the ownership of the character data to the caller.
>>>
>>> Fixes: f4f5ed2cbd ("cutils: introduce get_relocated_path")
>>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>>> ---
>>>  util/cutils.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/util/cutils.c b/util/cutils.c
>>> index ee908486da..c9b91e7535 100644
>>> --- a/util/cutils.c
>>> +++ b/util/cutils.c
>>> @@ -1055,5 +1055,5 @@ char *get_relocated_path(const char *dir)
>>>          assert(G_IS_DIR_SEPARATOR(dir[-1]));
>>>          g_string_append(result, dir - 1);
>>>      }
>>> -    return result->str;
>>> +    return g_string_free(result, false);
>>>  }
>>>
>>
> 


