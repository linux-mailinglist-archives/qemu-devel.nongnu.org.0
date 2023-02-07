Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2F468D190
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 09:39:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPJVQ-0004jM-On; Tue, 07 Feb 2023 03:39:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPJVF-0004it-LT
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:39:01 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPJVD-0002WS-GG
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:39:00 -0500
Received: by mail-wm1-x32d.google.com with SMTP id n13so10456436wmr.4
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 00:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XH+948ZDbs8LHeO3IlFsGNCbbavGQ/tFpYr/1Ko+r1I=;
 b=RgtQdyXE9GuzGWC6RHCkVpe0a7B27IU/tMEcxY7px1aMCK8Tn6gkCGtz7sS0/3GuIN
 TEyYl3xAIPueHQ+mLVt+79YwwY2KuZEoOEkIesCZFxiHo1BYZtg7zycKKNT40VrpoS5Q
 6mcdNHe5gELUV5C0413cEhd+1t5manCsZ624ldGtukeSIxPqNlQ8J5GChLOdioOrG7G6
 osFEvN6SGwHjOxbAZyt+lCmh9/RsAwWlAcYRAJhFeI5E1nuRCjQLDpvz13H3Iy+Du1GH
 XRvUZE39i3MXf7OEegxpl+EWYV4tyOZED+uo9GflhqLPPPDouIrnOHU8gyE+KVQETXjJ
 +l2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XH+948ZDbs8LHeO3IlFsGNCbbavGQ/tFpYr/1Ko+r1I=;
 b=q6pCXJMdfWUwW+BjrZxYUWAVTEgCRCRo+tMZMlK24WnbQzy11k1z/B9amTrpv5wZyy
 z/zR4TYotcSMgylkXCdfLOyJjXyajyFUyc4iJqxwWg183ppDdmSGQKshSRqHlCUkDdd5
 nXw3CIdFunc8UsdhFc9W1s9zYUbXqYRbSVR8jhRP5FmWNj95tRfGB5DyqVuA4ReGjc+t
 eRoyRAYs2YX4pBtHFKDJqAz5dM6tw/2u1sS2jWsaWtp2kNq0QaCJq0HYP5UiieTJrtZV
 9jejtjl2LBIfBhH2gPPicBGUBQQoeP0ilgxEbPhVFoIjbnE7691hOjt1x8DqVS9Y53XE
 cLew==
X-Gm-Message-State: AO0yUKVjA6AbpnxQwBUB/+1C5xfmKiWSKmUhYVPlPL/qLfc7hLk/sfcA
 OqJjCr4xxXNrS8z0IEZcWc0ZIQ==
X-Google-Smtp-Source: AK7set+/cxc16qN8MfmapyDQDS2K2lUDSYOslNGsWSVLOnTJTaViIS/GBrdggZVHy8rW55Cfvp1OTw==
X-Received: by 2002:a05:600c:4da2:b0:3df:e1d1:e14c with SMTP id
 v34-20020a05600c4da200b003dfe1d1e14cmr3053199wmp.20.1675759136947; 
 Tue, 07 Feb 2023 00:38:56 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t6-20020a05600c198600b003dc492e4430sm13757239wmq.28.2023.02.07.00.38.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 00:38:56 -0800 (PST)
Message-ID: <31d00642-3682-a054-c71f-848e0c4e0daa@linaro.org>
Date: Tue, 7 Feb 2023 09:38:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 09/12] replay: Simplify setting replay blockers
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, jiri@resnulli.us, jasowang@redhat.com,
 pavel.dovgaluk@ispras.ru, pbonzini@redhat.com, zhanghailiang@xfusion.com,
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com,
 kkostiuk@redhat.com
References: <20230207075115.1525-1-armbru@redhat.com>
 <20230207075115.1525-10-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230207075115.1525-10-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 7/2/23 08:51, Markus Armbruster wrote:
> replay_add_blocker() takes an Error *.  All callers pass one created
> like this:
> 
>      error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED, "some feature");
> 
> Folding this into replay_add_blocker() simplifies the callers, losing
> a bit of generality we haven't needed in more than six years.
> 
> Since there are no other uses of macro QERR_REPLAY_NOT_SUPPORTED,
> replace the remaining one by its expansion, and drop the macro.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   include/qapi/qmp/qerror.h |  3 ---
>   include/sysemu/replay.h   |  2 +-
>   replay/replay.c           |  6 +++++-
>   replay/stubs-system.c     |  2 +-
>   softmmu/rtc.c             |  5 +----
>   softmmu/vl.c              | 13 +++----------
>   6 files changed, 11 insertions(+), 20 deletions(-)


> diff --git a/replay/replay.c b/replay/replay.c
> index 9a0dc1cf44..c39156c522 100644
> --- a/replay/replay.c
> +++ b/replay/replay.c
> @@ -376,8 +376,12 @@ void replay_finish(void)
>       replay_mode = REPLAY_MODE_NONE;
>   }
>   
> -void replay_add_blocker(Error *reason)
> +void replay_add_blocker(const char *feature)
>   {
> +    Error *reason = NULL;
> +
> +    error_setg(&reason, "Record/replay feature is not supported for '%s'",
> +               feature);

Either name 'feature' as 'cli_option' and use '-%s' in format,

>       replay_blockers = g_slist_prepend(replay_blockers, reason);
>   }
>   
> diff --git a/replay/stubs-system.c b/replay/stubs-system.c
> index 5c262b08f1..50cefdb2d6 100644
> --- a/replay/stubs-system.c
> +++ b/replay/stubs-system.c
> @@ -12,7 +12,7 @@ void replay_input_sync_event(void)
>       qemu_input_event_sync_impl();
>   }
>   
> -void replay_add_blocker(Error *reason)
> +void replay_add_blocker(const char *feature)
>   {
>   }
>   void replay_audio_in(size_t *recorded, void *samples, size_t *wpos, size_t size)
> diff --git a/softmmu/rtc.c b/softmmu/rtc.c
> index f7114bed7d..4b2bf75dd6 100644
> --- a/softmmu/rtc.c
> +++ b/softmmu/rtc.c
> @@ -152,11 +152,8 @@ void configure_rtc(QemuOpts *opts)
>           if (!strcmp(value, "utc")) {
>               rtc_base_type = RTC_BASE_UTC;
>           } else if (!strcmp(value, "localtime")) {
> -            Error *blocker = NULL;
>               rtc_base_type = RTC_BASE_LOCALTIME;
> -            error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED,
> -                      "-rtc base=localtime");
> -            replay_add_blocker(blocker);
> +            replay_add_blocker("-rtc base=localtime");
>           } else {
>               rtc_base_type = RTC_BASE_DATETIME;
>               configure_rtc_base_datetime(value);
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 9177d95d4e..9d324fc6cd 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -1855,9 +1855,7 @@ static void qemu_apply_machine_options(QDict *qdict)
>       }
>   
>       if (current_machine->smp.cpus > 1) {
> -        Error *blocker = NULL;
> -        error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED, "smp");
> -        replay_add_blocker(blocker);
> +        replay_add_blocker("smp");

... or use "-smp" here (yes, pre-existing).

>       }
>   }

