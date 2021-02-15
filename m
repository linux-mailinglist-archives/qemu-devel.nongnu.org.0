Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6E931BC09
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 16:16:37 +0100 (CET)
Received: from localhost ([::1]:45254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBfc4-0004id-1A
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 10:16:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lBfUX-00040O-Be
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 10:08:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lBfUU-0003fR-Qo
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 10:08:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613401723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=chMHfnSN6JOmHk6CKzP11fTnAwuLELxPGz1dR7dty2w=;
 b=epovSEMVpUWXPu2ziVXmCMRmJt9GcD9UVBmSObY80jlTTm5tpwGK/VMbJLEST7Cm3YzH9Y
 V0dsLm125At754dG60q2KBDlVf59k53UKi6LJx/qSl9Y1AOPwEAQrz2DneNSJlyM1UyZqw
 VMAZXxz7ooXHtAPpoeDAWVcOQ8v+dGY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-iNlO4Bn6Op-6ys3J9TlgXQ-1; Mon, 15 Feb 2021 10:08:41 -0500
X-MC-Unique: iNlO4Bn6Op-6ys3J9TlgXQ-1
Received: by mail-ej1-f71.google.com with SMTP id jg11so4534174ejc.23
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 07:08:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=chMHfnSN6JOmHk6CKzP11fTnAwuLELxPGz1dR7dty2w=;
 b=lORaJ18QV0Dh4Qw/5CXUL5fymbXaxkTy1I71JyD/pwHsjfZ1lfNzhO7oNZNIXfZtz9
 sePrrAn8CtCqYD1f5ZtrdEKJgvKO+ZqsKb3VlYKa9BKuQGMi4w8Ew4ccpaC6XgKzj3Wh
 6Yg9re4Ro4oXzSsGXKghCYlbwCnhULKcaV0RHPGlCv/ZlvOi2Z9mkqr3nzjEsIFEckhn
 LZ04M/RaGJDjUKvaq6iUauUrhy+ZVh0+3QEmgE6T1ebx55VKkrTNKM/FVF0W7xd/NydL
 fuT2MgTLKRRjQHSXysGC6DtcZmbgKXYdp7B5snEmrAXITCjsb84QXiGdOtVEvhGq+eeR
 utBQ==
X-Gm-Message-State: AOAM531d54sW7U/jDBWVejTGkTkoqdJzpCw/53gGrsdCuH+WlpL4XLNV
 ZaqrbxQmmQpYUfeikbJFs1M3J6YgGqiYQr+k/0HhMnlbWiB0Itkv8nJH3M2QVu12ibrz6NN81VV
 yy12Jbl0XyN7UbgU=
X-Received: by 2002:a05:6402:1013:: with SMTP id
 c19mr16298395edu.86.1613401720255; 
 Mon, 15 Feb 2021 07:08:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw7+6ZUrdQGCTGOP2ecgiGcsYAIyLis1pJKQk4oEkXG0QUoBa6kJNMQqBVQbYmCcNYTjZ3T0A==
X-Received: by 2002:a05:6402:1013:: with SMTP id
 c19mr16298369edu.86.1613401720090; 
 Mon, 15 Feb 2021 07:08:40 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id df15sm10260643edb.24.2021.02.15.07.08.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 07:08:39 -0800 (PST)
Subject: Re: [PATCH] monitor: Fix order in monitor_cleanup()
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20201013125027.41003-1-kwolf@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <12ad27f6-99f7-5c0f-c24a-f6784da67683@redhat.com>
Date: Mon, 15 Feb 2021 16:08:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201013125027.41003-1-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: alex.bennee@linaro.org, armbru@redhat.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/10/20 14:50, Kevin Wolf wrote:
> We can only destroy Monitor objects after we're sure that they are not
> in use by the dispatcher coroutine any more. This fixes crashes like the
> following where we tried to destroy a monitor mutex while the dispatcher
> coroutine still holds it:
> 
>   (gdb) bt
>   #0  0x00007fe541cf4bc5 in raise () at /lib64/libc.so.6
>   #1  0x00007fe541cdd8a4 in abort () at /lib64/libc.so.6
>   #2  0x000055c24e965327 in error_exit (err=16, msg=0x55c24eead3a0 <__func__.33> "qemu_mutex_destroy") at ../util/qemu-thread-posix.c:37
>   #3  0x000055c24e9654c3 in qemu_mutex_destroy (mutex=0x55c25133e0f0) at ../util/qemu-thread-posix.c:70
>   #4  0x000055c24e7cfaf1 in monitor_data_destroy_qmp (mon=0x55c25133dfd0) at ../monitor/qmp.c:439
>   #5  0x000055c24e7d23bc in monitor_data_destroy (mon=0x55c25133dfd0) at ../monitor/monitor.c:615
>   #6  0x000055c24e7d253a in monitor_cleanup () at ../monitor/monitor.c:644
>   #7  0x000055c24e6cb002 in qemu_cleanup () at ../softmmu/vl.c:4549
>   #8  0x000055c24e0d259b in main (argc=24, argv=0x7ffff66b0d58, envp=0x7ffff66b0e20) at ../softmmu/main.c:51
> 
> Reported-by: Alex Bennée<alex.bennee@linaro.org>
> Signed-off-by: Kevin Wolf<kwolf@redhat.com>

Is this a race, or is there a chance of adding a reliable reproducer to 
qtest?

Paolo


