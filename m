Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 389293A78A2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 09:59:38 +0200 (CEST)
Received: from localhost ([::1]:57514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt3yz-0000S1-9B
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 03:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lt3ps-0000HB-Ho
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 03:50:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lt3pq-0008PB-3b
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 03:50:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623743409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=swA/P5EzYv3qtt1uNoGwhjqQXFkRC+TCFqlh6NR5Dw4=;
 b=LSOn9ZJTMb7qC4XJ8SVOUkE0zNGGFgi/MgAdbxGroTBSCZnrDFTYTVcfbMJqvd5GcV/PVW
 8tVgha5N1YymlAYg96GfPoqZYIF7MrAXoED40pMJ/UIcJFKYuYObyO+05qfXk9bksSGuK7
 rIqJVunmenMb2IV9zX2QoYSfCSVphLU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-Y_CbajoFMc-eawaG23e3Aw-1; Tue, 15 Jun 2021 03:50:07 -0400
X-MC-Unique: Y_CbajoFMc-eawaG23e3Aw-1
Received: by mail-wm1-f69.google.com with SMTP id
 j2-20020a05600c1c02b02901cecbe55d49so119577wms.3
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 00:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=swA/P5EzYv3qtt1uNoGwhjqQXFkRC+TCFqlh6NR5Dw4=;
 b=mRS+KAH+qEZBf868vZqVdF/9zgMau5sKLsb9mrkNRXfYmbVolQhl9V60lWRxo+lXKj
 N8alqT58ILADr4f12doiJiEhktlI6Uv3ptlojaUQR2pQrL8cx+Mw5MtAZywSlIqT6+yw
 I0Hnrs/ZexyHDoHoasecu2uMXaQbzF9Qmn4grEZ37zD7npU2tib+VRflwP1faAZdgh3x
 FmW7gHivPLKS5PlijIzlVbIz0dv0Kea756ack47bnMS61KiOW2JDHZVDrVhR+3+9Jele
 UC4vdKucI68XU4MU5Dds6NJ30Cm+sTIJjFGsIiePYLWJa2+7TjujAvyNhnnvfheG6vAh
 Lf6g==
X-Gm-Message-State: AOAM533EKL6hckXPXcW5S48/yL9VYSGQqVdSL2WE8Iz7Uk41zWtHg2mI
 2gCmySt0ByjbHGiQVAR1+xpyW3YbdzvGKsS3+c1+zreM/LCdMDWS/fPgbSGvReQwtYIYCXywtTF
 kJixr2JEhif+WShQ=
X-Received: by 2002:a5d:44d2:: with SMTP id z18mr23434527wrr.358.1623743406597; 
 Tue, 15 Jun 2021 00:50:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwh6hJHJh/NF7C6fwAbhsm+zEpeWOwkD5ZuxVsmDbejRlIfaBOsq5XH+ypmxFqUYFI1bLl2tw==
X-Received: by 2002:a5d:44d2:: with SMTP id z18mr23434505wrr.358.1623743406418; 
 Tue, 15 Jun 2021 00:50:06 -0700 (PDT)
Received: from thuth.remote.csb (pd9e831d2.dip0.t-ipconnect.de.
 [217.232.49.210])
 by smtp.gmail.com with ESMTPSA id y20sm572412wma.45.2021.06.15.00.50.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 00:50:05 -0700 (PDT)
Subject: Re: [PATCH v2 3/8] util: Use real functions for thread-posix
 QemuRecMutex
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210614233143.1221879-1-richard.henderson@linaro.org>
 <20210614233143.1221879-4-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c4886cf3-db40-8df7-c78c-06c2f45e3eb3@redhat.com>
Date: Tue, 15 Jun 2021 09:50:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210614233143.1221879-4-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.489, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: pbonzini@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/06/2021 01.31, Richard Henderson wrote:
> Move the declarations from thread-win32.h into thread.h
> and remove the macro redirection from thread-posix.h.
> This will be required by following cleanups.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/qemu/thread-posix.h |  4 ----
>   include/qemu/thread-win32.h |  6 ------
>   include/qemu/thread.h       |  9 ++++++---
>   util/qemu-thread-posix.c    | 20 ++++++++++++++++++++
>   4 files changed, 26 insertions(+), 13 deletions(-)
> 
> diff --git a/include/qemu/thread-posix.h b/include/qemu/thread-posix.h
> index c903525062..cf8bc90468 100644
> --- a/include/qemu/thread-posix.h
> +++ b/include/qemu/thread-posix.h
> @@ -5,10 +5,6 @@
>   #include <semaphore.h>
>   
>   typedef QemuMutex QemuRecMutex;
> -#define qemu_rec_mutex_destroy qemu_mutex_destroy
> -#define qemu_rec_mutex_lock_impl    qemu_mutex_lock_impl
> -#define qemu_rec_mutex_trylock_impl qemu_mutex_trylock_impl
> -#define qemu_rec_mutex_unlock qemu_mutex_unlock
>   
>   struct QemuMutex {
>       pthread_mutex_t lock;
> diff --git a/include/qemu/thread-win32.h b/include/qemu/thread-win32.h
> index d0a1a9597e..d95af4498f 100644
> --- a/include/qemu/thread-win32.h
> +++ b/include/qemu/thread-win32.h
> @@ -18,12 +18,6 @@ struct QemuRecMutex {
>       bool initialized;
>   };
>   
> -void qemu_rec_mutex_destroy(QemuRecMutex *mutex);
> -void qemu_rec_mutex_lock_impl(QemuRecMutex *mutex, const char *file, int line);
> -int qemu_rec_mutex_trylock_impl(QemuRecMutex *mutex, const char *file,
> -                                int line);
> -void qemu_rec_mutex_unlock(QemuRecMutex *mutex);
> -
>   struct QemuCond {
>       CONDITION_VARIABLE var;
>       bool initialized;
> diff --git a/include/qemu/thread.h b/include/qemu/thread.h
> index 5435763184..2c0d85f3bc 100644
> --- a/include/qemu/thread.h
> +++ b/include/qemu/thread.h
> @@ -28,6 +28,12 @@ int qemu_mutex_trylock_impl(QemuMutex *mutex, const char *file, const int line);
>   void qemu_mutex_lock_impl(QemuMutex *mutex, const char *file, const int line);
>   void qemu_mutex_unlock_impl(QemuMutex *mutex, const char *file, const int line);
>   
> +void qemu_rec_mutex_init(QemuRecMutex *mutex);
> +void qemu_rec_mutex_destroy(QemuRecMutex *mutex);
> +void qemu_rec_mutex_lock_impl(QemuRecMutex *mutex, const char *file, int line);
> +int qemu_rec_mutex_trylock_impl(QemuRecMutex *mutex, const char *file, int line);
> +void qemu_rec_mutex_unlock(QemuRecMutex *mutex);
> +
>   typedef void (*QemuMutexLockFunc)(QemuMutex *m, const char *f, int l);
>   typedef int (*QemuMutexTrylockFunc)(QemuMutex *m, const char *f, int l);
>   typedef void (*QemuRecMutexLockFunc)(QemuRecMutex *m, const char *f, int l);
> @@ -129,9 +135,6 @@ static inline int (qemu_rec_mutex_trylock)(QemuRecMutex *mutex)
>       return qemu_rec_mutex_trylock(mutex);
>   }
>   
> -/* Prototypes for other functions are in thread-posix.h/thread-win32.h.  */
> -void qemu_rec_mutex_init(QemuRecMutex *mutex);
> -
>   void qemu_cond_init(QemuCond *cond);
>   void qemu_cond_destroy(QemuCond *cond);
>   
> diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
> index dcff5e7c5d..8e2b6653f5 100644
> --- a/util/qemu-thread-posix.c
> +++ b/util/qemu-thread-posix.c
> @@ -124,6 +124,26 @@ void qemu_rec_mutex_init(QemuRecMutex *mutex)
>       mutex->initialized = true;
>   }
>   
> +void qemu_rec_mutex_destroy(QemuRecMutex *mutex)
> +{
> +    qemu_mutex_destroy(mutex);
> +}
> +
> +void qemu_rec_mutex_lock_impl(QemuRecMutex *mutex, const char *file, int line)
> +{
> +    qemu_mutex_lock_impl(mutex, file, line);
> +}
> +
> +int qemu_rec_mutex_trylock_impl(QemuRecMutex *mutex, const char *file, int line)
> +{
> +    return qemu_mutex_trylock_impl(mutex, file, line);
> +}
> +
> +void qemu_rec_mutex_unlock(QemuRecMutex *mutex)
> +{
> +    qemu_mutex_unlock(mutex);
> +}
> +
>   void qemu_cond_init(QemuCond *cond)
>   {
>       int err;
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


