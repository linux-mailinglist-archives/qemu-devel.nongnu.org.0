Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9856E383B26
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 19:21:03 +0200 (CEST)
Received: from localhost ([::1]:43434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligvO-0008NP-IW
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 13:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ligPu-0004Z7-5K
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:48:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ligPq-0004DJ-86
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:48:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621270105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zNeM0xPw53xCp5f6u5kYq3HvuBA089fryJN/hBBkX7g=;
 b=LaI1C5rr9a2/P46zNgZbCed8qzVjbg+AXDDFOGJt4+HVNOG3hV1YJdOFg13knSCW72r3FU
 zTdQHnpXoHQQMAjcz+8OkH7SWviOYWEdxLlk0C1hvy0fKJ8oy60mQ0rDFnYgR7r4oFkEX5
 iwfKD1UA4sbdNGLkq0Axm4y+z974AMU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-0R_LJ1FtODOEV1kqfVnmJQ-1; Mon, 17 May 2021 12:48:24 -0400
X-MC-Unique: 0R_LJ1FtODOEV1kqfVnmJQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 i19-20020a05640242d3b0290388cea34ed3so4237298edc.15
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:48:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zNeM0xPw53xCp5f6u5kYq3HvuBA089fryJN/hBBkX7g=;
 b=CV5zRVkXG6YtW48KezwX0T9H3YuSjaOXA2SDkzU4hF8MGXpSOBasOF9M1An+5hLeyA
 9bqUn77x/qrSnmGdImR2r+aBXElac9NhOfM8iBe+9rOxVefBLynOMOlCJ2ed8iaPqGqK
 b83UgV/v/2Cs8u1yyuFoEhsAfltahdqJ6/4VFvVmSE5z195iqCpDK+BRlWzxkXKTGbbh
 Zv63cQgOkSe2LekRPpYaKhboF1PUfhSwN/pEyWJ886jokUZbKWjcQXn7MzAnAcFq9JOr
 kl2zZjcn0EhVtdLiyW0XiaXmM5czq9VklsifJPY/8GgPfVt3YdGbFq0Xr6yOGIKykMyA
 ouPA==
X-Gm-Message-State: AOAM533feQn8SZ8oaNYzp2kWWwnIQmpYaMWJ9i6yJAFbTqdF03UjmiMo
 AX1zW4IgwVd/aaa01sqH97FdoPHZMD3AfMSPUTzXIFMeb8XoxQOlcmGIT2uFVGpQPyagO2/FipI
 RNCnueZzyTaegYazWAaxMiAD6GhxEBkxECuGbeR7nfRA6QiD2bOVIgVAG99JzYPb2
X-Received: by 2002:a05:6402:17d9:: with SMTP id
 s25mr1098215edy.337.1621270102713; 
 Mon, 17 May 2021 09:48:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEXsYbun9g7nia8dhL1w9xl3RN9wuFjsgBh9P9hAMcXQgQFZQGekf/5hnzCUdnyX5VBNai6Q==
X-Received: by 2002:a05:6402:17d9:: with SMTP id
 s25mr1098190edy.337.1621270102461; 
 Mon, 17 May 2021 09:48:22 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id v12sm11681567edb.81.2021.05.17.09.48.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 09:48:22 -0700 (PDT)
Subject: Re: [PATCH 3/3] pc-bios/s390-ccw: Add a proper prototype for main()
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
References: <20210512171550.476130-1-thuth@redhat.com>
 <20210512171550.476130-4-thuth@redhat.com>
 <1539bd87-8ba2-9015-ecfe-753af61847f2@redhat.com>
 <30134a03-459f-5029-fb57-48e266bb2d41@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <25461df7-a30f-0c94-a64d-3e7ec3108871@redhat.com>
Date: Mon, 17 May 2021 18:48:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <30134a03-459f-5029-fb57-48e266bb2d41@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/14/21 12:09 PM, Thomas Huth wrote:
> On 12/05/2021 21.54, Philippe Mathieu-Daudé wrote:
>> On 5/12/21 7:15 PM, Thomas Huth wrote:
>>> Older versions of Clang complain if there is no prototype for main().
>>> Add one, and while we're at it, make sure that we use the same type
>>> for main.c and netmain.c - since the return value does not matter,
>>> declare the return type of main() as "void".
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   pc-bios/s390-ccw/main.c     | 3 +--
>>>   pc-bios/s390-ccw/s390-ccw.h | 1 +
>>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/pc-bios/s390-ccw/main.c b/pc-bios/s390-ccw/main.c
>>> index 5d2b7ba94d..835341457d 100644
>>> --- a/pc-bios/s390-ccw/main.c
>>> +++ b/pc-bios/s390-ccw/main.c
>>> @@ -281,7 +281,7 @@ static void probe_boot_device(void)
>>>       sclp_print("Could not find a suitable boot device (none
>>> specified)\n");
>>>   }
>>>   -int main(void)
>>> +void main(void)
>>>   {
>>>       sclp_setup();
>>>       css_setup();
>>> @@ -294,5 +294,4 @@ int main(void)
>>>       }
>>>         panic("Failed to load OS from hard disk\n");
>>> -    return 0; /* make compiler happy */
>>>   }
>>> diff --git a/pc-bios/s390-ccw/s390-ccw.h b/pc-bios/s390-ccw/s390-ccw.h
>>> index 79db69ff54..b88e0550ab 100644
>>> --- a/pc-bios/s390-ccw/s390-ccw.h
>>> +++ b/pc-bios/s390-ccw/s390-ccw.h
>>> @@ -57,6 +57,7 @@ void write_subsystem_identification(void);
>>>   void write_iplb_location(void);
>>>   extern char stack[PAGE_SIZE * 8]
>>> __attribute__((__aligned__(PAGE_SIZE)));
>>>   unsigned int get_loadparm_index(void);
>>> +void main(void);
>>
>> Can we keep the forward declaration in the source?
> 
> There are two main() functions, one in main.c and one in netmain.c,
> that's why I think it's better to declare the prototype only in one
> place, i.e. in a header?

Since it is a kludge to make the compiler happy, I'd rather keep
it local, but I don't mind much :)


