Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DDD5BE0BD
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 10:49:49 +0200 (CEST)
Received: from localhost ([::1]:54432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaYwu-0000MZ-JB
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 04:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaYY0-0000uo-Px
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 04:24:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaYXx-0008Gs-RI
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 04:24:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663662241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CyLlvbOY5StrhxE4E0txCQQP9+bG+JjA8Zvy/LQl9Zc=;
 b=BpaJ25NMh0TduISiKeoce1CycnB8g+jTbTeGcfjLakjQzF/fUs9R+IyDg1L4DlG52i3KcU
 sGzCGIMSpPfHfiLp/OfeDRSQBnP2339eMaYuyg6XG6BUoAGZRKb77soTCusH8zIHzrZPCD
 P21RzNZIA1wywV5Qw9q8FhAB5Jlcnms=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-352-hk5C42SqNAC5SCGwYZERPA-1; Tue, 20 Sep 2022 04:23:59 -0400
X-MC-Unique: hk5C42SqNAC5SCGwYZERPA-1
Received: by mail-wm1-f72.google.com with SMTP id
 7-20020a05600c020700b003b4ce6e6b12so366597wmi.0
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 01:23:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=CyLlvbOY5StrhxE4E0txCQQP9+bG+JjA8Zvy/LQl9Zc=;
 b=ut/fG1Tvo7R84oM8m1rx7RO2oqMaUdwHqRGCQn+PMr5ffF27VaIFvaI1zmO8z4DZc0
 0lmHNU7bbyokPyN67BtQaT+vZaU1UR0btP/7lunF4X/3wAUClvpHRGaRKOPRlJBtUF+r
 ky6ZKDnCcyZD5Lz34IMzCqm5qiQw0rl4eUdiZmstshcAaR4kRQ+5RQEIoPj/S7cmaAw6
 aYFAgBVEPTEgqdBqdB38vabQXC+SXuIEFWzfMbveQ8Af6IqVzmqpx+Zp02KzaLsaVx9t
 kKBx/ZYK3L8TE4tU1VOxANTUSzE7pgaSWCHG/+sYunY6CwhkEjzeHevfMynRAMQ/fd6H
 LLeg==
X-Gm-Message-State: ACrzQf3sWLLkkCrtcBq7T0eX6WxtJHHLJDu2gMIg8hF6SYUfvK02jOW5
 /9E/vHGFEsTmTc24Nw9VCvUvURA6eTTJZRzfz3g9rDqUHQW7JJ0Bm3WTprrlL1WExIgmkIiYVUQ
 6XOQWSftucs0rZOk=
X-Received: by 2002:adf:fa82:0:b0:228:6122:9903 with SMTP id
 h2-20020adffa82000000b0022861229903mr13207714wrr.144.1663662238771; 
 Tue, 20 Sep 2022 01:23:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5BBu7ZQ9btzrrQNtzzc7ZqS8QQHoPNUYV+tOwYxVWNWWy/KgbBa/T3SXgbdUz3dmDpiPG4dw==
X-Received: by 2002:adf:fa82:0:b0:228:6122:9903 with SMTP id
 h2-20020adffa82000000b0022861229903mr13207698wrr.144.1663662238541; 
 Tue, 20 Sep 2022 01:23:58 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-8.web.vodafone.de. [109.43.177.8])
 by smtp.gmail.com with ESMTPSA id
 u7-20020adff887000000b00228d6bc8450sm1016301wrp.108.2022.09.20.01.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 01:23:58 -0700 (PDT)
Message-ID: <ed402176-df96-dff2-869b-a3326e6314ea@redhat.com>
Date: Tue, 20 Sep 2022 10:23:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: QEMU's FreeBSD 13 CI job is failing
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Brad Smith <brad@comstyle.com>,
 John Snow <jsnow@redhat.com>
References: <b403c8e4-3788-7ba1-a038-3a71fa0bc7c6@redhat.com>
 <Yyl4EO0L5h02HOLN@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Yyl4EO0L5h02HOLN@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.952, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 20/09/2022 10.21, Daniel P. Berrangé wrote:
> On Tue, Sep 20, 2022 at 08:44:27AM +0200, Thomas Huth wrote:
>>
>> Seen here for example:
>>
>> https://gitlab.com/qemu-project/qemu/-/jobs/3050165356#L2543
>>
>> ld-elf.so.1: /lib/libc.so.7: version FBSD_1.7 required by
>> /usr/local/lib/libpython3.9.so.1.0 not found
>> ERROR: Cannot use '/usr/local/bin/python3', Python >= 3.6 is required.
>>
>> ... looks like the Python binary is not working anymore? Does anybody know
>> what happened here?
> 
> FreeBSD ports is only guaranteed to work with latest minor release
> base image. The python binary recently started relying on symbols
> in the 13.1 base image, and we're using 13.0.
> 
> I updated lcitool last week to pick 13.1, so we just need a refresh
> on the QEMU side to pick this up.

OK ... Alex, IIRC you have a patch queued to update the files that are 
refreshed by lcitool ... does that already contain the update for FreeBSD, too?

  Thomas


