Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F388B432516
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 19:32:40 +0200 (CEST)
Received: from localhost ([::1]:45858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcWV6-0005N3-36
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 13:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcWTS-0003mu-8U
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 13:30:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcWTM-000598-M7
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 13:30:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634578251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eDWqC/8JUtf3hhnZznSoe0vLBDyUemGcUmvlkGJugZ8=;
 b=Sw73daZEG90aSIjVy52WU78cwQr2QGnqmhDZrrBOwHccvQAlpN9A6ga2Dkx2RQGmCNd1U3
 B74HEydRso2V4cCx6mq1i/KxRBGcfbwtGZn7zXgNeNiznbQvUeT8+3nV0MepuBzKhvdhmc
 qupkNpVn9K+bN6Q86yAhQWXMpG2Gdkc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-d8wMPij0PFW4FfPCBZ8__w-1; Mon, 18 Oct 2021 13:30:49 -0400
X-MC-Unique: d8wMPij0PFW4FfPCBZ8__w-1
Received: by mail-wr1-f69.google.com with SMTP id
 v15-20020adfa1cf000000b00160940b17a2so9061818wrv.19
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 10:30:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eDWqC/8JUtf3hhnZznSoe0vLBDyUemGcUmvlkGJugZ8=;
 b=DdFy888+JjGsED/G1ZHQA9z7V7z4N7zfJcS3bagBEYF1vfrRVi+lJxPWD37YE53/oV
 dBUpenCVxdwxFt57IsO8dxNG7Pq08TE8I7hPM6sFS9ayqfYgiwepc7LT0A3XgRdGovpS
 lQf9fQkC+d6YlJIlWdo+PsMNkUSMIl812JvhbXld78xj7KF6lPOyEsqBcBjpHHVa6TT+
 CFY6f3G+LzWfSBpwScqiBgtzJdSzv5YLBNp7faGoWWStxTK5jmGlJ+Co5Cf3qTHIIDfN
 fJWpKBeLp2FWbccePvdKi3evUZguuI0022TO/RHChe7lg8lqQdPRmNfARufRlmfq+g9Z
 zgxw==
X-Gm-Message-State: AOAM533p2KoSd9oPddQppz4qFr4FAw+/j6epDpvulWAE+Ka7DPuhRIEV
 Hy6l4ORILcklWcR3Ia8nVUMWn2vzhybu2X/jS0gVtwn/mLimvAUCskZkWi6s5/IdZOkOE0rZdoe
 M4Yz1DuzJ9bT2Xek=
X-Received: by 2002:a05:600c:4f92:: with SMTP id
 n18mr279318wmq.22.1634578248448; 
 Mon, 18 Oct 2021 10:30:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPgBWwcqirv7YdTunxNDc/0rcKmOtSjPeh6Mq6GpcfCHaCxzbkm37Hs29aZtBy0zMdYY8eVg==
X-Received: by 2002:a05:600c:4f92:: with SMTP id
 n18mr279283wmq.22.1634578248164; 
 Mon, 18 Oct 2021 10:30:48 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id f3sm70200wmb.12.2021.10.18.10.30.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 10:30:47 -0700 (PDT)
Message-ID: <9b8fce9e-a071-6ac9-4447-38562ac90dce@redhat.com>
Date: Mon, 18 Oct 2021 19:30:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH] chardev: don't exit() straight away on C-a x
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211018140226.838137-1-alex.bennee@linaro.org>
 <c40b635d-bfb9-8360-0151-4ea683eac402@redhat.com> <87o87mz4uu.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <87o87mz4uu.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Lukas_J=c3=bcnger?= <lukas.junger@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/18/21 18:14, Alex Bennée wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>> On 10/18/21 16:02, Alex Bennée wrote:
>>> While there are a number of uses in the code-base of the exit(0)
>>> pattern it gets in the way of clean exit which can do all of it's
>>> house-keeping. In particular it was reported that you can crash
>>> plugins this way because TCG can still be running on other threads
>>> when the atexit callback is called.
>>>
>>> Use qemu_system_shutdown_request() instead. I did a gentle rename of
>>> the runstate stub seeing as it now contains two functions.
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Reported-by: Lukas Jünger <lukas.junger@greensocs.com>
>>> ---
>>>  chardev/char-mux.c                     | 3 ++-
>>>  stubs/{runstate-check.c => runstate.c} | 5 +++++
>>>  stubs/meson.build                      | 2 +-
>>>  3 files changed, 8 insertions(+), 2 deletions(-)
>>>  rename stubs/{runstate-check.c => runstate.c} (64%)
>>>
>>> diff --git a/chardev/char-mux.c b/chardev/char-mux.c
>>> index ada0c6866f..a46897fcd5 100644
>>> --- a/chardev/char-mux.c
>>> +++ b/chardev/char-mux.c
>>> @@ -28,6 +28,7 @@
>>>  #include "qemu/option.h"
>>>  #include "chardev/char.h"
>>>  #include "sysemu/block-backend.h"
>>> +#include "sysemu/runstate.h"
>>>  #include "chardev-internal.h"
>>>  
>>>  /* MUX driver for serial I/O splitting */
>>> @@ -157,7 +158,7 @@ static int mux_proc_byte(Chardev *chr, MuxChardev *d, int ch)
>>>              {
>>>                   const char *term =  "QEMU: Terminated\n\r";
>>>                   qemu_chr_write_all(chr, (uint8_t *)term, strlen(term));
>>> -                 exit(0);
>>> +                 qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
>>>                   break;
>>>              }
>>>          case 's':
>>> diff --git a/stubs/runstate-check.c b/stubs/runstate.c
>>> similarity index 64%
>>> rename from stubs/runstate-check.c
>>> rename to stubs/runstate.c
>>> index 2ccda2b70f..f47dbcd3e0 100644
>>> --- a/stubs/runstate-check.c
>>> +++ b/stubs/runstate.c
>>> @@ -5,3 +5,8 @@ bool runstate_check(RunState state)
>>>  {
>>>      return state == RUN_STATE_PRELAUNCH;
>>>  }
>>> +
>>> +void qemu_system_shutdown_request(ShutdownCause reason)
>>> +{
>>> +    return;
>>> +}
>>
>> Hmm this isn't a stub anymore, this is the user-mode implementation.
> 
> It is? I don't think any of the chardev code touches user-mode, I had to
> add this because apparently other binaries link the libchardev code.

If it isn't then is should call g_assert_not_reached().


