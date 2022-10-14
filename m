Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AD05FEB39
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 10:56:37 +0200 (CEST)
Received: from localhost ([::1]:52318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojGUe-00034D-Au
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 04:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ojGQ4-00075p-E2
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 04:51:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ojGQ1-0001BW-DU
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 04:51:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665737508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tzyjkd7Q/h8A3VLaLbfK97SWThWmddAUiLWG0DU4oNE=;
 b=U4kfyihoQ3z0Gf+n325CrZsBeYWGRpSGELJgkbgs+udtEOyGHvt5gC3sN3EuHB6U6fk6LK
 +AcOfbX9kdy89Vwru9kjlrM9QNaUi66XkO3JUP+SCV73MKqZxYMmiOXg44T5PDq5JxxTdC
 N0L+hvioaG1KSm+RZAVNN5XLKCPcXUA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-319-YeLkUIzhOdGFQKUhNEtwIw-1; Fri, 14 Oct 2022 04:51:39 -0400
X-MC-Unique: YeLkUIzhOdGFQKUhNEtwIw-1
Received: by mail-ej1-f70.google.com with SMTP id
 sb13-20020a1709076d8d00b0078d8e1f6f7aso1922016ejc.8
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 01:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tzyjkd7Q/h8A3VLaLbfK97SWThWmddAUiLWG0DU4oNE=;
 b=qrHoHSyuG9kLH9SN/yQhkRpINUMaVBW8GCM6G7+hB1hdl6m234ptZZm/ZIn06RQ36m
 2bs5UOSS5073B0dssaf4OQvgsOWbwnyJvz5E6BcIlSIMZfDWquo+ZUbIpl6HsZaKlVJl
 3cCZUwasWmmPQZUs+w95UeNkSDOTYBq8J00xnw+/k9uUBoPJoVqHSW+fc7Ag/FN2ly/j
 lfdNbZO6eoQGKkW4qMc2x2kGzyoAfXzpM1Ik2xsY0HJIlinbOea0LdqTRmfTdvCPvTSi
 AuktgtwZOoKFscxDlEdXruv2AZLYx2rixhVDAFYvKFFsegmOdz2OhXriVJBC0Vrd/uhD
 XcGg==
X-Gm-Message-State: ACrzQf3h4FoyDFJ4y/Dz9btGDCjKxBXqtz4/+viSb63Ubz4l8u5r32zG
 PiwSG0mQyGRjRgJR9TDd3YBwDZuOcDnmrTjvDBMeelTo5kCQw4TzKoWgoW+0oNoIwd2ZT5b++lC
 CKiYQHm7vr1t3wjk=
X-Received: by 2002:a17:907:ea6:b0:782:1ace:9d5b with SMTP id
 ho38-20020a1709070ea600b007821ace9d5bmr2626166ejc.770.1665737498357; 
 Fri, 14 Oct 2022 01:51:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Egq/XORTL1BgQHTND9zbqM/JaSspxiYFlbwNpv9oaNeSK3xUhTdX+PLdra+Oe4ZG5aYaK+g==
X-Received: by 2002:a17:907:ea6:b0:782:1ace:9d5b with SMTP id
 ho38-20020a1709070ea600b007821ace9d5bmr2626150ejc.770.1665737498062; 
 Fri, 14 Oct 2022 01:51:38 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:e3ec:5559:7c5c:1928?
 ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.googlemail.com with ESMTPSA id
 gy9-20020a170906f24900b0073ddd36ba8csm1157318ejb.145.2022.10.14.01.51.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Oct 2022 01:51:37 -0700 (PDT)
Message-ID: <398b4657-7b21-5e15-1db6-e9225e6f3d4e@redhat.com>
Date: Fri, 14 Oct 2022 10:51:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] util/log: Always send errors to logfile when daemonized
Content-Language: en-US
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20221014060807.660587-1-groug@kaod.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221014060807.660587-1-groug@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.25, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/22 08:08, Greg Kurz wrote:
> 
> +        need_to_open_file = log_flags && !per_thread;

Pre-existing, but I think this should check log_per_thread instead of 
per_thread.

> +    } else if (filename) {
> +        /*
> +         * If we are daemonized, we will only log if there is a filename.
> +         */
> +        need_to_open_file = true;

Slightly nicer:

     } else {
        /*
         * If daemonized, always log to the -D file if present.
         */
         need_to_open_file = filename != NULL;
     }

> @@ -271,10 +276,22 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
>   
>       if (!logfile && need_to_open_file) {
>           if (filename) {
> -            logfile = fopen(filename, log_append ? "a" : "w");
> +            g_autofree char *fname = NULL;
> +
> +            /*
> +             * If per-thread, filename contains a single %d that should be
> +             * converted.
> +             */
> +            if (per_thread) {
> +                fname = g_strdup_printf(filename, getpid());
> +            } else {
> +                fname = g_strdup(filename);
> +            }
> +
> +            logfile = fopen(fname, log_append ? "a" : "w");
>               if (!logfile) {
>                   error_setg_errno(errp, errno, "Error opening logfile %s",
> -                                 filename);
> +                                 fname);
>                   return false;
>               }
>               /* In case we are a daemon redirect stderr to logfile */

This could conflict with the file opened by qemu_log_trylock() when 
per-thread logging is enabled *and* QEMU is daemonized.  Perhaps 
something like:

1) change qemu_log_trylock() to

-        if (log_per_thread) {
+        if (log_per_thread && log_thread_id() != getpid()) {

i.e. use the global_file for the main thread

2) change qemu_log_unlock() to

-        if (!log_per_thread) {
+        if (!thread_file) {

to match (1)

3) change log_thread_id() to something like

...
#else
     static __thread int my_id = -1;
     static int counter;
     if (my_id == -1) {
         my_id = getpid() + qatomic_fetch_inc(&counter);
     }
     return my_id;
#endif

and perhaps do a dummy trylock/unlock late in qemu_set_log_internal(), 
to ensure that the main thread is the one with log_thread_id() == getpid()?

I think this can be a separate patch before this one.

Paolo


