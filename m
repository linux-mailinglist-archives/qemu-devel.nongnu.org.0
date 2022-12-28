Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2D56573A1
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 08:26:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAQo0-0005IO-7t; Wed, 28 Dec 2022 02:24:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAQnv-0005IF-80
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 02:24:47 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAQns-0001HW-Oa
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 02:24:46 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso7516294wms.5
 for <qemu-devel@nongnu.org>; Tue, 27 Dec 2022 23:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ddOjGmub0QQkG7LqXE4Ji/jp8Esuov27HzIsya1DjCA=;
 b=VUaJQfHZYwDoh8NAcOvdWYhltEuQkzBcHiFH7+kTBCcDFctM12H6jtk+hAuCFc4IEM
 vULcurbUPCGDqN/+3vJcuh0ez1jVXgljzFrfA8L4kuCiKP+hmygJk3wa9z6GTD8yd7kT
 bMO3+peeS/PV5UmIRXYTeSXAv9ztP7PJaO4eP7tep/wpi42c66ucL6+JJet7O4/GQEZ7
 pza3rjX48MKYoNhRHBkNJD/iLIgYq5vdY8NqRoqlGeWL1s5ZhIT6oJilEa25zWz4YtLE
 6T6dbbgob21JQRn96/icYJq/vL9P3ZHzO6509DTVMYh1mgwQ6tTCTTnleOyyb5OpJOfR
 0B1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ddOjGmub0QQkG7LqXE4Ji/jp8Esuov27HzIsya1DjCA=;
 b=2e1bTXQwbNxMgbO0kwXvXUlLNwr0pn9n/28axmzsly0d+z80SiznSHmo6rMS17I0x5
 QDiVEfnu9Yh9Gw+YCYOW4oHgbfNtm+lwo2VKp3RI6GHvwnIorlcWBk0v/sxVs6XLFwv+
 4Opj1/YnkdLuzYuqEWxei/IFk1ExbKoHbEQ1fC0MJW5xQpHFnUc2tN1E/9jXp8n2VMoG
 kKrtGmO0HC1+SsXGxZ2QA4lyqRC7AQofEn66jHR7Neh0rMBIttRrG9NO4HzEQss5KXwr
 F4vcwKHAUOElVd49OrBx9VoHKNZAfUjosMjct55oVcUEHLvLzWRDeT43elhj8sCXW1v9
 havA==
X-Gm-Message-State: AFqh2krRSxEOmfzBRGDpMksbrS0NYO4X1HimsI4AASTF+dBQpk7C9Fqx
 KASkbGpAMg3g2JIhj5Qw6V6vrw==
X-Google-Smtp-Source: AMrXdXuw2tIpNeux0NxAsbF8pynspjeHp5y0fAek3+1yt1iHA54FCTwgX4BWyyT410E878zpsqjnzA==
X-Received: by 2002:a05:600c:4e08:b0:3d2:139e:f64f with SMTP id
 b8-20020a05600c4e0800b003d2139ef64fmr17452088wmq.40.1672212282443; 
 Tue, 27 Dec 2022 23:24:42 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p19-20020a1c5453000000b003d2157627a8sm23912890wmi.47.2022.12.27.23.24.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Dec 2022 23:24:42 -0800 (PST)
Message-ID: <d8cae78a-705e-b536-82c8-ddbc6eafda3b@linaro.org>
Date: Wed, 28 Dec 2022 08:24:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 3/4] accel/tcg: Handle false negative lookup in
 page_check_range
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: iii@linux.ibm.com
References: <20221224151821.464455-1-richard.henderson@linaro.org>
 <20221224151821.464455-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221224151821.464455-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 24/12/22 16:18, Richard Henderson wrote:
> As in page_get_flags, we need to try again with the mmap
> lock held if we fail a page lookup.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/user-exec.c | 39 ++++++++++++++++++++++++++++++++-------
>   1 file changed, 32 insertions(+), 7 deletions(-)
> 
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index 2c5c10d2e6..c72a806203 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -525,6 +525,7 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
>   int page_check_range(target_ulong start, target_ulong len, int flags)
>   {
>       target_ulong last;
> +    int locked, ret;

have_mmap_lock() returns a boolean, can we declare 'locked'
as such, ...

>   
>       if (len == 0) {
>           return 0;  /* trivial length */
> @@ -535,42 +536,66 @@ int page_check_range(target_ulong start, target_ulong len, int flags)
>           return -1; /* wrap around */
>       }
>   
> +    locked = have_mmap_lock();
>       while (true) {
>           PageFlagsNode *p = pageflags_find(start, last);
>           int missing;
>   
>           if (!p) {
> -            return -1; /* entire region invalid */
> +            if (!locked) {
> +                /*
> +                 * Lockless lookups have false negatives.
> +                 * Retry with the lock held.
> +                 */
> +                mmap_lock();
> +                locked = -1;

... skip this confusing assignation, ...

> +                p = pageflags_find(start, last);
> +            }
> +            if (!p) {
> +                ret = -1; /* entire region invalid */
> +                break;
> +            }
>           }
>           if (start < p->itree.start) {
> -            return -1; /* initial bytes invalid */
> +            ret = -1; /* initial bytes invalid */
> +            break;
>           }
>   
>           missing = flags & ~p->flags;
>           if (missing & PAGE_READ) {
> -            return -1; /* page not readable */
> +            ret = -1; /* page not readable */
> +            break;
>           }
>           if (missing & PAGE_WRITE) {
>               if (!(p->flags & PAGE_WRITE_ORG)) {
> -                return -1; /* page not writable */
> +                ret = -1; /* page not writable */
> +                break;
>               }
>               /* Asking about writable, but has been protected: undo. */
>               if (!page_unprotect(start, 0)) {
> -                return -1;
> +                ret = -1;
> +                break;
>               }
>               /* TODO: page_unprotect should take a range, not a single page. */
>               if (last - start < TARGET_PAGE_SIZE) {
> -                return 0; /* ok */
> +                ret = 0; /* ok */
> +                break;
>               }
>               start += TARGET_PAGE_SIZE;
>               continue;
>           }
>   
>           if (last <= p->itree.last) {
> -            return 0; /* ok */
> +            ret = 0; /* ok */
> +            break;
>           }
>           start = p->itree.last + 1;
>       }
> +
> +    if (locked < 0) {

... and check for !locked here?

> +        mmap_unlock();
> +    }
> +    return ret;
>   }



