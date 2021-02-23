Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B383227B1
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 10:23:01 +0100 (CET)
Received: from localhost ([::1]:46172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lETuG-00081c-Mh
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 04:23:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lETpn-0004CJ-Ia
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 04:18:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lETpj-0005fR-35
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 04:18:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614071896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CT9RZ9uHl+J4O6Vu1Eq9hj6tUE/gpABjgsQ9wGYI5QA=;
 b=LiQoCw/atuCWRhPq/oaW/FmhFn8FzjZIhj/waDn2xNQlXlEXxVMtYRyAwrifoBWdHOZlkv
 osDE6Zc2qVFx1Qzw7cden2/Xsk4NyXbDXiT2hy5oWAOOx7PWfbYdLarP5a4JTMPYdODbAm
 LWHEHcHZYRKHheopFz1W8vNlw4N/Zq0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-AcmLeskmP1WcuXM4LUu0fQ-1; Tue, 23 Feb 2021 04:18:14 -0500
X-MC-Unique: AcmLeskmP1WcuXM4LUu0fQ-1
Received: by mail-wm1-f69.google.com with SMTP id b62so940957wmc.5
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 01:18:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CT9RZ9uHl+J4O6Vu1Eq9hj6tUE/gpABjgsQ9wGYI5QA=;
 b=qP7BiMaVZb70LpdtUhTWu7L8gH/vPnFpiJAgffZ5A+rpoHyI/mOHntsEOT4aohC7UX
 OtYN2c56kub3Npo86AqAm50u+BV/HDZudxe/AVbXO+vfO3iYIZoxYVM7ZP6q7tvgUMZh
 JH0nqySCc/JZ6jIcQ9LoVLY7luzvIae/Rhbcnv5vaIaWGPYVSZySJAcYFBB3RcMxf4x5
 GAshjBhDZd9zrMbRBMsQzhGJd/3p1nD5VDMOrBeK/5HsJoLwhnULqjH/FfZ0SEjUDn+I
 H17zo51nU7bzVH47Q7AYMrZnU6Ze5dBn+Ng+9gpjXQKcT3Htv+dBpcPhAmhgUmg5hsgx
 FeZg==
X-Gm-Message-State: AOAM531n5fD/0bQb9X4YDmKbsGu+svsmZU6Q0DgQcvvwTmnMzbRQX+5X
 +wp921Mi46BMNwm2GM/Q1jGMN5vPOPVtycaw6uQrxYA5PP6q6ulpSFhm3K1lYBbkEQ+lZkZeYGt
 RrjZvzRNs8dj9P60=
X-Received: by 2002:adf:e60e:: with SMTP id p14mr8430499wrm.388.1614071893066; 
 Tue, 23 Feb 2021 01:18:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJQnpL5Wj0nY8VAc7xYo1M7oqbPXfWQ0ROToIS1tr1e63o4NG5k2fxNUoVlZvgKPb1VWmnMg==
X-Received: by 2002:adf:e60e:: with SMTP id p14mr8430485wrm.388.1614071892880; 
 Tue, 23 Feb 2021 01:18:12 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q24sm1924474wmq.24.2021.02.23.01.18.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 01:18:12 -0800 (PST)
Subject: Re: [RFC v1 00/38] arm cleanup experiment for kvm-only build
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
References: <20210221092449.7545-1-cfontana@suse.de>
 <875z2k53mn.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a3ed4064-6dec-24c6-8138-ce8301f01e1e@redhat.com>
Date: Tue, 23 Feb 2021 10:18:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <875z2k53mn.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 8:00 PM, Alex Bennée wrote:
> 
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> Hi all,
>>
>> this is an experiment, a cleanup based on and requiring the series
>> "i386 cleanup PART 2":
>>
>> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg05935.html
>>
>> The goal is to split the code between TCG-only and non-TCG code,
>> fixing the KVM-only build (configure --disable-tcg),
>>
>> and laying the ground for further cleanups and the use of the
>> new accel objects in the hierarchy to specialize the cpu
>> according to the accelerator.
>>
>> This is known to be an early state, with probably a lot of work
>> still needed.
> 
> Well early work is looking pretty good:
> 
>   18:59:22 [alex@idun:~/l/q/b/default] review/arm-cleanup-rfc1|… ± ls -lh qemu-system-aarch64
>   -rwxr-xr-x 1 alex alex 107M Feb 22 18:08 qemu-system-aarch64*
>   18:59:29 [alex@idun:~/l/q/b/default] review/arm-cleanup-rfc1|… ± ls -lh ../disable.tcg/qemu-system-aarch64
>   -rwxr-xr-x 1 alex alex 76M Feb 22 17:47 ../disable.tcg/qemu-system-aarch64*

:~)

> 
> and I've tested the KVM side works well enough with a basic image.


