Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B291617BD1
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 12:43:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqY5J-0001GX-Dz; Thu, 03 Nov 2022 07:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oqY4K-000176-9f
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 07:07:37 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oqY46-0001W5-GH
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 07:07:30 -0400
Received: by mail-wr1-x432.google.com with SMTP id k8so2252040wrh.1
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 04:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ioAj/03PTFf/uaiN9wTTpWC9jrZkUh7XgFAdXmVFeT0=;
 b=j0V8X8STX7IWgaMvz/VBrVye0Zw1tiw9dS0tetGfb65dn/24Em4poHnWrjFjPRu1rW
 QPF06iaqBLCbRK6LCjsRkgQmrsZbVF0k2ri6CHtKeYb+paUGktf4erRVPj4BQT3qQQjB
 29a584Pa2jOV2tTR2UAMow5MJ2eJ++FQDxg65xYCJeW+ps2Osv1OeKUFXUoLCgAr2g79
 oQP9zTPuBFnyFufkdvLPz0fQB1DlD33oHRBxenaInenjUnLdj2riIZTh3djfxjPzPvYs
 zsGgVwuuhjJkz5YO6NIgE1ymjoIaajiow9YxleDaIhXGJK/WusZHNC78e14PJ0+zE/XV
 zd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ioAj/03PTFf/uaiN9wTTpWC9jrZkUh7XgFAdXmVFeT0=;
 b=RDhKwbHGCX3DrKTCpqPlBGg6h59L918Qa6yqzfTRHMVE9rjNq6AqQDy+UYCToPaY6K
 gLeRt5IK1/Ofzt+RqcUqHQ8kB9t+vMFxnfMMUXnHNuZG5U8v8IK/Yox+H71QCqB//0TR
 DCRx4bQR+7DVpbHuYJ01BYqcHokzzjSSir2b4pTeln/sTRufClBoAbRTxENp2Hy4RK9R
 LzR4PS7+nHb48d95gE6qRxeQh2/sCX+pZOeT1zg8taET6IneVJbu1XzR4LXBBFdMNOAk
 QyBY1gY7u70IxagmQND0yQqB+XlDVI0haXbaVhj03vvxDKuZpJD78n1gbtngzIFYch+J
 XlSw==
X-Gm-Message-State: ACrzQf2VFqz7iW1gUk3VChdQ2AFlMtV42u3+mvrgCLrnveMWJq8mWWWc
 ZlYsYHkitwQaa6bm/HPVnEfapA==
X-Google-Smtp-Source: AMsMyM7NGSI02kuYWsWBe/V7h4jAfDD1+ML65sT6lw5hyMNAqTtrwDeLdnnqMIolLSgYthT6UlPUSg==
X-Received: by 2002:a5d:50ca:0:b0:236:776c:3075 with SMTP id
 f10-20020a5d50ca000000b00236776c3075mr18645206wrt.656.1667473636709; 
 Thu, 03 Nov 2022 04:07:16 -0700 (PDT)
Received: from [192.168.182.175] (216.red-88-29-181.dynamicip.rima-tde.net.
 [88.29.181.216]) by smtp.gmail.com with ESMTPSA id
 l16-20020adfa390000000b002362f6fcaf5sm619394wrb.48.2022.11.03.04.07.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 04:07:15 -0700 (PDT)
Message-ID: <e6aa73fb-f5e3-b24c-b963-b66849c9925f@linaro.org>
Date: Thu, 3 Nov 2022 12:07:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v14 16/17] tests/qtest: netdev: test stream and dgram
 backends
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, xen-devel@lists.xenproject.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Stefan Weil <sw@weilnetz.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221021090922.170074-1-lvivier@redhat.com>
 <20221021090922.170074-17-lvivier@redhat.com>
 <700ef645-6cb6-66e6-00a9-3db187be0c43@redhat.com>
 <0fd82709-7612-25e0-66c0-d9494931d8c4@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <0fd82709-7612-25e0-66c0-d9494931d8c4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/11/22 10:33, Laurent Vivier wrote:
> On 10/28/22 07:04, Jason Wang wrote:
>>
>> 在 2022/10/21 17:09, Laurent Vivier 写道:
>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>>> ---
>>
>>
>> I got this:
>>
>> 63/63 ERROR:../tests/qtest/netdev-socket.c:139:test_stream_inet_ipv6: 
>> assertion failed (resp == expect): ("st0: 
>> index=0,type=stream,connection error\r\n" == "st0: 
>> index=0,type=stream,tcp:::1:40389\r\n") ERROR
>> 63/63 qemu:qtest+qtest-x86_64 / 
>> qtest-x86_64/netdev-socket                  ERROR 5.29s killed by 
>> signal 6 SIGABRT
>>  >>> QTEST_QEMU_IMG=./qemu-img QTEST_QEMU_BINARY=./qemu-system-x86_64 
>> MALLOC_PERTURB_=96 
>> QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon 
>> G_TEST_DBUS_DAEMON=/home/devel/git/qemu/tests/dbus-vmstate-daemon.sh 
>> /home/devel/git/qemu/build/tests/qtest/netdev-socket --tap -k
>> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― ✀ ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
>> stderr:
>> **
>> ERROR:../tests/qtest/netdev-socket.c:139:test_stream_inet_ipv6: 
>> assertion failed (resp == expect): ("st0: 
>> index=0,type=stream,connection error\r\n" == "st0: 
>> index=0,type=stream,tcp:::1:40389\r\n")
>>
>> (test program exited with status code -6)
> 
> I'm not able to reproduce the problem.
> 
> Is this 100% reproducible?
> Is IPv6 enabled on your test machine?

If IPv6 is not available, this test should be skipped, not failing.

