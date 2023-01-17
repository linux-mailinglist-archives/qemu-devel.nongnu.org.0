Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3237666DA75
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 11:00:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHilc-0000Tw-4q; Tue, 17 Jan 2023 05:00:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pHilZ-0000Tg-1f
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:00:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pHilX-0001oT-C0
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:00:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673949626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BuTTAvc6CwyE80vW5CFYr9Zm723BG8oMYzJ2KiseC0U=;
 b=aAqMYyJsx+c6vP5E4kEBPI4NFrwnJb6EWG4/vSwx5227jRoWh06uHI+hLwSt2BXaU1g35B
 X5yCp/WIXKqPmt/PfxrCAimiVNt4oBRZBZWjNzrNA1KYh+Xw3PrLxxGviv2lYNVxZFRheb
 7MyYonMdf2CgdGVV21yjpD9+eT6dI9Y=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-629-YkL7KbWjNjupoxKBW2gh4Q-1; Tue, 17 Jan 2023 05:00:25 -0500
X-MC-Unique: YkL7KbWjNjupoxKBW2gh4Q-1
Received: by mail-qv1-f72.google.com with SMTP id
 jy13-20020a0562142b4d00b00535302dd1b8so285839qvb.18
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 02:00:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BuTTAvc6CwyE80vW5CFYr9Zm723BG8oMYzJ2KiseC0U=;
 b=seu8jwMpewB5/a9A7z/CuhbXmHbnLIa9cpM7FBHFB1GDY26/JF4kHh0WpEUUCL0qfY
 3q9GRX0mUoxMvK7t6d3VmgFjiANY+rp2hR3jIWKoZp8NbyZ06eUvzurCD9m4IGLnoStX
 ZtpOStsLYYIyiCmTR6s7OMUkQVJh2XRBZ+TW3PqqSZzVjC0mrM+KemksbPLZ4fijxTh5
 QFIj8tYQwINvHltGbrCMudqMVw0SYEYJJXxgYu+cWkStJnxYbzP9YTFzbj2781KtpT8Z
 BBY2Va8soRo3B7YXS6RWFmA9Pivkn2sZ7wnAbX9sqOHjoQ+Q2c/gA7PJwNIOpozFfLtf
 4uaQ==
X-Gm-Message-State: AFqh2kq8e89W9yZ16ZpmYs5gurTKDBSWjasbqAQ+p8Gsc4XnSTy0XZIV
 b9Wn189rqQI+sABwmyCsyA5XB2d0kgxfTUT3k2ipYDd7qnjGbcUeiQm3F5++C5A6w7sj3I/HY08
 ocrNm6vI0hRWXoak=
X-Received: by 2002:a05:622a:2483:b0:3a8:20e5:49bc with SMTP id
 cn3-20020a05622a248300b003a820e549bcmr3000575qtb.41.1673949625026; 
 Tue, 17 Jan 2023 02:00:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXutzsRpJ8Erwt5X/nVj5mEJ+9Nf4T3bkHa2O6nFf4rGBVPNl6KyEi7QrxigSvEShUsJwZi0WQ==
X-Received: by 2002:a05:622a:2483:b0:3a8:20e5:49bc with SMTP id
 cn3-20020a05622a248300b003a820e549bcmr3000552qtb.41.1673949624799; 
 Tue, 17 Jan 2023 02:00:24 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-26.web.vodafone.de.
 [109.43.177.26]) by smtp.gmail.com with ESMTPSA id
 m5-20020ac86885000000b0039cba52974fsm15787640qtq.94.2023.01.17.02.00.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 02:00:24 -0800 (PST)
Message-ID: <5a13b5c9-f8d4-6b4f-b55b-4b8a0ac54867@redhat.com>
Date: Tue, 17 Jan 2023 11:00:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5] tests/qtest: netdev: test stream and dgram backends
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
References: <20230105093751.416666-1-lvivier@redhat.com>
 <3d55b710-4601-4f8b-5289-72997ea09e5a@redhat.com>
 <0b29c231-da85-5302-31bc-b2e420c2b394@redhat.com>
In-Reply-To: <0b29c231-da85-5302-31bc-b2e420c2b394@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 16/01/2023 09.40, Thomas Huth wrote:
> On 16/01/2023 09.29, Laurent Vivier wrote:
>> ping
>>
>> On 1/5/23 10:37, Laurent Vivier wrote:
>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>>> ---
>>>
>>> Notes:
>>>      v5:
>>>        - disable test_stream_fd and  test_dgram_fd on windows as 
>>> socketpair()
>>>          is not defined.
>>>        - enable test_stream_unix_abstract only on linux as "abstract"
>>>          unix socket parameter is only defined on linux.
>>>      v4:
>>>        - rework EXPECT_STATE()
>>>        - use g_dir_make_tmp()
>>>      v3:
>>>      - Add "-M none" to avoid error:
>>>        "No machine specified, and there is no default"
>>>      v2:
>>>      - Fix ipv6 free port allocation
>>>      - Check for IPv4, IPv6, AF_UNIX
>>>      - Use g_mkdtemp() rather than g_file_open_tmp()
>>>      - Use socketpair() in test_stream_fd()
>>>      v1: compared to v14 of "qapi: net: add unix socket type support to 
>>> netdev backend":
>>>      - use IP addresses 127.0.0.1 and ::1 rather than localhost
>>>
>>>   tests/qtest/meson.build     |   2 +
>>>   tests/qtest/netdev-socket.c | 444 ++++++++++++++++++++++++++++++++++++
>>>   2 files changed, 446 insertions(+)
>>>   create mode 100644 tests/qtest/netdev-socket.c
> 
> Acked-by: Thomas Huth <thuth@redhat.com>
> 
> I'll queue it for my next pull request (unless someone else wants to take 
> this first)

Sorry, but I have to unqueue it again. I'm still seeing failures
in the Windows Cirrus-CI:

  https://cirrus-ci.com/task/5867407370092544

For example:

218/556 qemu:qtest+qtest-aarch64 / qtest-aarch64/netdev-socket                    ERROR           0.02s   exit status 3
------------------------------------- 8< -------------------------------------
stderr:
socket_check_protocol_support() failed

(C:/Users/ContainerAdministrator/AppData/Local/Temp/cirrus-ci-build/build/tests/qtest/netdev-socket.exe:3300): GLib-CRITICAL **: 09:08:00.984: g_utf8_to_utf16: assertion 'str != NULL' failed

(test program exited with status code 3)

No clue where this comes from, though, I don't see a call
to g_utf8_to_utf16() in your code?

  Thomas


