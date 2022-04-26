Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D130B50FAFC
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 12:37:22 +0200 (CEST)
Received: from localhost ([::1]:57570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njIZN-0007oM-LW
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 06:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1njIRS-0004jb-Bu
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 06:29:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1njIRQ-0006ux-KA
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 06:29:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650968947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NEIWBEsTm8UkFFGDWKGWZ+tjUYgCnCml7bR+2np4heQ=;
 b=EkIBvuI9a4WPD0QWSJ0fQ3IcjYjnS1n/M7VglRtSzy7rc9i9i6DORJ/26py3chLNAtXNoq
 oBVkncTk4JoEmJu9JDwWzdmKE3ErknOYlK5V2NkAO47NjiRlmSVpCNOg7C5edl+i9v2K3a
 ETwr2moEhufWIJtQFUUavGy35+4Iios=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-F_0Ukp71M5-rVQRbV5hEQA-1; Tue, 26 Apr 2022 06:29:06 -0400
X-MC-Unique: F_0Ukp71M5-rVQRbV5hEQA-1
Received: by mail-wr1-f69.google.com with SMTP id
 k29-20020adfb35d000000b0020adc94662dso1707053wrd.12
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 03:29:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NEIWBEsTm8UkFFGDWKGWZ+tjUYgCnCml7bR+2np4heQ=;
 b=f/fajyNPBAsV+j3AXRwjCmUa5VTvNkOgX8iO/FF+GF2NWz+o5eqq2V0igl7gKrPhPd
 as3aFdLVjnod++lXodyuCnsd8KQUQskRjN9jH/irVHFAh1mt3vj2nLiDqfhymfsyEydB
 YOAchcOEQg7es2v5e3qq/LRSrsm+409OqVp/Ku+sZxQRsvc0TGz0nBujb5zYwTZnzcUT
 /gF9qR5bw95Dr5L3MYmjQg0GB2aiBG6hPT5eA30e1wPc8GntOC4o6nRD1vEwSLb4mJyO
 9zk+ksvh2GK31lD9i+N4DzDCkm6d7ny4BIl8E31Wb/nibH4lSH7ytnqd7GQUInxc/LIs
 mMuw==
X-Gm-Message-State: AOAM531wgKMdMXzaF5hRZX5BgMiRNGCle4vYFgzZo2lF83NK6T4UtI3j
 B7idKea+fOQlq9WgotzzmmqBH99hUzlSyE5Z/UJd5ECCGe5Ooy/vmZlVuQbyg42w6ZyeCupjCUD
 LWcyIddRbLLZTUaE=
X-Received: by 2002:adf:f406:0:b0:20a:ded8:6803 with SMTP id
 g6-20020adff406000000b0020aded86803mr5862951wro.232.1650968945531; 
 Tue, 26 Apr 2022 03:29:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZRXrnlsuI8Wx/UtuOdDunuZWijSGzwrUry1YrX2wBJJWJhj0SgxRmcgG2LPBI4t5Curr6vw==
X-Received: by 2002:adf:f406:0:b0:20a:ded8:6803 with SMTP id
 g6-20020adff406000000b0020aded86803mr5862929wro.232.1650968945278; 
 Tue, 26 Apr 2022 03:29:05 -0700 (PDT)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 n5-20020adf8b05000000b00207a4fd0185sm11093955wra.7.2022.04.26.03.29.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 03:29:04 -0700 (PDT)
Message-ID: <de67365b-c466-7534-e68d-c99313a0fd7e@redhat.com>
Date: Tue, 26 Apr 2022 12:29:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 07/26] tests: make libqmp buildable for win32
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
 <20220426092715.3931705-8-marcandre.lureau@redhat.com>
 <50da3bb2-6199-ea6d-99de-b70b708c3d84@redhat.com>
 <CAMxuvazuqNRfL_Wi+QKpqgpBobq+2T_P1QuyZ-0+OtR6h-YOrg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAMxuvazuqNRfL_Wi+QKpqgpBobq+2T_P1QuyZ-0+OtR6h-YOrg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/04/2022 12.25, Marc-André Lureau wrote:
> Hi
> 
> On Tue, Apr 26, 2022 at 1:32 PM Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 26/04/2022 11.26, marcandre.lureau@redhat.com wrote:
>>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>
>>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>> ---
>>>    tests/qtest/libqmp.h |  2 ++
>>>    tests/qtest/libqmp.c | 37 +++++++++++++++++++++++++++++++------
>>>    2 files changed, 33 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/tests/qtest/libqmp.h b/tests/qtest/libqmp.h
>>> index 94aa97328a17..772f18b73ba3 100644
>>> --- a/tests/qtest/libqmp.h
>>> +++ b/tests/qtest/libqmp.h
>>> @@ -20,8 +20,10 @@
>>>    #include "qapi/qmp/qdict.h"
>>>
>>>    QDict *qmp_fd_receive(int fd);
>>> +#ifndef G_OS_WIN32
>>>    void qmp_fd_vsend_fds(int fd, int *fds, size_t fds_num,
>>>                          const char *fmt, va_list ap) G_GNUC_PRINTF(4, 0);
>>> +#endif
>>>    void qmp_fd_vsend(int fd, const char *fmt, va_list ap) G_GNUC_PRINTF(2, 0);
>>>    void qmp_fd_send(int fd, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
>>>    void qmp_fd_send_raw(int fd, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
>>> diff --git a/tests/qtest/libqmp.c b/tests/qtest/libqmp.c
>>> index 0358b8313dc4..5f451ebee796 100644
>>> --- a/tests/qtest/libqmp.c
>>> +++ b/tests/qtest/libqmp.c
>>> @@ -15,9 +15,15 @@
>>>     */
>>>
>>>    #include "qemu/osdep.h"
>>> -
>>>    #include "libqmp.h"
>>>
>>> +#include <unistd.h>
>>> +#include <stdlib.h>
>>
>> unistd.h and stdlib.h should have been added by osdep.h already, so please
>> remove these two lines.
> 
> Right  (it will be part of the follow-up series, moving it to a
> standalone project). Ack with that?

Sure, the two headers should then be added in the patch where you remove 
osdep.h.

  Thomas


