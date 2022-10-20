Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0FE606445
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:23:47 +0200 (CEST)
Received: from localhost ([::1]:45410 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXOO-0004tx-BB
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:23:38 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXMh-0005JX-0r
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olWrA-00039Q-Ad
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 10:49:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olWr6-0005ks-Sw
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 10:49:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666277347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Ht4uc+F2VhKi75XpFbjwSsqeX/sAc/dV4pRAF7MDqY=;
 b=VdmNgbX/atK/ywkpSYMvnaFdILQfDTJ7bCKyxjpnaTzKy0QyWXnZTKrMhKQ1RLT01j8LA7
 hEensrbV3oZ1ku0IjsldXRcOrXgP8jpMQld5Tr0ykoCo5W/jCUU8o6ex7EInilrV0/yLsJ
 F3fQ0ymdEQ4rkp9OA+XbmmmDN66lmOg=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-iKJvRhF2PoCV9CRK3UBLnQ-1; Thu, 20 Oct 2022 10:49:04 -0400
X-MC-Unique: iKJvRhF2PoCV9CRK3UBLnQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 em2-20020ad44f82000000b004af5338777cso12894193qvb.4
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 07:49:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8Ht4uc+F2VhKi75XpFbjwSsqeX/sAc/dV4pRAF7MDqY=;
 b=1la5JZaxp1xukPOJKC7LkbGjB3P5ovHlTmKmXAQYbR9fC8xludbyPTkfH6K+0BBnzV
 vlMBKU87nTDdDi4vRxnNm3DHROeSnhUMxrG/71xIFyqYiI59v9iG9RatAXydrzrFPIQJ
 cWkUaLuITSuVSgTK/BvzrOxXOJFIu1GpN1evELdvCG4kVkqBTPte97YP55eNjPWbwVnQ
 qGseJIswk9oN5mFqTeTbNaTDe7cXU2YCVM8hok78qA2dXWV51hu0IxpiW+GDicKoHJPZ
 R6IiUVFNn43+4r32ahUp5lLHN3cpHyuG4qTQoCBmysD6uUj8uyl2sKk6kNl25Tg2bCel
 5KMg==
X-Gm-Message-State: ACrzQf3Whsc8tpBqmVMrcuKPxEtHzvE0E5HlnGr25mdAoSUGqPIgUgo3
 h82R+Hqqk/szujiCciqHlFeSuDZrmKbOU3iODPdtmUhO5P6KFsqthCWJ1/HFLRxFSi8/BAZCAye
 MqVubBQPT7WKvNPk=
X-Received: by 2002:a05:6214:e6b:b0:4b3:dcaf:c3a7 with SMTP id
 jz11-20020a0562140e6b00b004b3dcafc3a7mr11516024qvb.34.1666277344067; 
 Thu, 20 Oct 2022 07:49:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5oWaxjXIjtOg84/mDXFCwbgTI0D8L9sa7jNLjyAhRZGVP7+cxo6c5D4KJthUj3eEDZTCkahg==
X-Received: by 2002:a05:6214:e6b:b0:4b3:dcaf:c3a7 with SMTP id
 jz11-20020a0562140e6b00b004b3dcafc3a7mr11515993qvb.34.1666277343846; 
 Thu, 20 Oct 2022 07:49:03 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a05620a288c00b006b640efe6dasm7399796qkp.132.2022.10.20.07.49.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 07:49:03 -0700 (PDT)
Message-ID: <8050912a-58e2-892c-0808-1c4ea6168b68@redhat.com>
Date: Thu, 20 Oct 2022 16:48:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v12 16/17] tests/qtest: netdev: test stream and dgram
 backends
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 xen-devel@lists.xenproject.org, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>, Anthony Perard
 <anthony.perard@citrix.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Paul Durrant <paul@xen.org>,
 Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>
References: <20221020091624.48368-1-lvivier@redhat.com>
 <20221020091624.48368-17-lvivier@redhat.com>
 <0f964c69-e3c7-b40a-be5e-85ae0471916d@linaro.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <0f964c69-e3c7-b40a-be5e-85ae0471916d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/22 15:26, Philippe Mathieu-Daudé wrote:
> On 20/10/22 11:16, Laurent Vivier wrote:
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>> ---
>>   tests/qtest/meson.build     |   1 +
>>   tests/qtest/netdev-socket.c | 417 ++++++++++++++++++++++++++++++++++++
>>   2 files changed, 418 insertions(+)
>>   create mode 100644 tests/qtest/netdev-socket.c
> 
>> +int main(int argc, char **argv)
>> +{
>> +    int ret;
>> +
>> +    g_test_init(&argc, &argv, NULL);
>> +
>> +    qtest_add_func("/netdev/stream/inet/ipv4", test_stream_inet_ipv4);
>> +    qtest_add_func("/netdev/stream/inet/ipv6", test_stream_inet_ipv6);
>> +    qtest_add_func("/netdev/stream/unix", test_stream_unix);
>> +    qtest_add_func("/netdev/stream/unix/abstract", test_stream_unix_abstract);
>> +    qtest_add_func("/netdev/stream/fd", test_stream_fd);
> 
> The stream tests don't work for me (testing on Darwin).
> 
> ERROR:../../tests/qtest/netdev-socket.c:99:test_stream_inet_ipv4:assertion failed (resp == 
> "st0: index=0,type=stream,\r\n"): ("st0:index=0,type=stream,connection error\r\n" == "st0: 
> index=0,type=stream,\r\n")

My bad: I have changed the default value for "server" but I didn't update the test.

Thanks,
Laurent


