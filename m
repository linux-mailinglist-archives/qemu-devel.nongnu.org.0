Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BCB4D06EF
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:52:50 +0100 (CET)
Received: from localhost ([::1]:42538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRITR-0002PC-P2
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:52:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRI9L-0001de-Vo
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:32:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRI9K-0007fG-CJ
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:32:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646677921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1JwxISqjk34U/Em+QBjR5C6TkqMxFzvfG0OV6IcBE0o=;
 b=XEfQRKj+E0ZPIlwZx+V0MsT9vV7uidGDmaEfTDrIpmp10sg8YSd4/xhJrJbh9KxY2BbJb4
 9K0lDq2OwNOo1EGey8hMtaqkIqTwvZiyxS1Qk34mSiVE29P7FcwTYaUtDlXt1n219vJLJt
 gV2/HClOWmY9fcCs+1PNmiMLfO++fno=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-KIw5LLF3Ozivm2tAPdU7LA-1; Mon, 07 Mar 2022 13:31:55 -0500
X-MC-Unique: KIw5LLF3Ozivm2tAPdU7LA-1
Received: by mail-wr1-f70.google.com with SMTP id
 f14-20020adfc98e000000b001e8593b40b0so4843658wrh.14
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 10:31:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1JwxISqjk34U/Em+QBjR5C6TkqMxFzvfG0OV6IcBE0o=;
 b=kSvbI7w7mTDb/xmU0TNIMLPjHmmF/ai7rz79bGsHpKgJZdzFSr3CL6DOt0IFp6pN8X
 lGtYYSuRyfmb3Ktmcb98H66PhHm3UdNBcmF1oZ8XwOp7PP/ERlmkliiZqfKXLLBPMN/X
 4dUp/c3O2CcOUMP+lzkaY/tBOaL1MydRWh5GRcQFPsjOtzv6VRXKZcQOJRFabHd/JaWw
 EeqogrztHPVsnWBuO4AryJsx3XX2Aie4ySZv7WLpmde4U2bG7IxyvS5Q3F+nQwN1bvVU
 /BKHRJ4gkwTqVqEqPXJvQ7tHGqfDvkQVXwnZUNzWqO3kVR9Y1tvTh3VrrUbpBdTo9GOO
 SqTg==
X-Gm-Message-State: AOAM532wBeMKTrnqtCUa5OWlYxuBcTug9QJX8zcXr8H3O1SH1UG7To2O
 r1noCUYfgX7kMD4nl8oozRUCRwU7bXbpu3AGYfFzAw+fGRG+UbvXrYGvdxgFEReVN6Y8/7focEN
 SIRf0VsBZ2p5wv04=
X-Received: by 2002:adf:f38d:0:b0:1f0:490a:92ae with SMTP id
 m13-20020adff38d000000b001f0490a92aemr9019426wro.497.1646677913231; 
 Mon, 07 Mar 2022 10:31:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBN/mOP4/YumA5BFBl4oZHMDWuVUQySeMFKMOLP06Yr0XUhtUhBSYEo74DExtH0DrCdoY8qA==
X-Received: by 2002:adf:f38d:0:b0:1f0:490a:92ae with SMTP id
 m13-20020adff38d000000b001f0490a92aemr9019409wro.497.1646677913013; 
 Mon, 07 Mar 2022 10:31:53 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 z6-20020adfd0c6000000b001f1ffd04672sm2224188wrh.12.2022.03.07.10.31.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 10:31:52 -0800 (PST)
Message-ID: <82a2233a-8bd2-66ef-b8f0-d44c039eeb52@redhat.com>
Date: Mon, 7 Mar 2022 19:31:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] tests/avocado: Cancel BootLinux tests in case there is no
 free port
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220228114325.818294-1-thuth@redhat.com>
 <YiX/kzf7cW+YcNN5@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YiX/kzf7cW+YcNN5@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/03/2022 13.50, Daniel P. Berrangé wrote:
> On Mon, Feb 28, 2022 at 12:43:25PM +0100, Thomas Huth wrote:
>> The BootLinux tests are currently failing with an ugly python
>> stack trace on my RHEL8 system since they cannot get a free port
>> (likely due to the firewall settings on my system). Let's properly
>> check the return value of find_free_port() instead and cancel the
>> test gracefully if it cannot get a free port.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   Unfortunately, it still takes > 70 seconds for each and every
>>   tests from tests/avocado/boot_linux.py to get canceled, so
>>   tests/avocado/boot_linux.py still renders "make check-avocado"
>>   for me pretty unusable... looking at the implementation of
>>   find_free_port() in Avocado, I wonder whether there isn't a
>>   better way to get a free port number in Python? Brute-forcing
>>   all ports between 1024 and 65536 seems just quite cumbersome
>>   to me...
> 
> Even in the worst case of testing every single port,
> for INET and INET6 and for STREAM and DGRAM sockets,
> that find_free_port port completes in a couple of
> seconds.

Weird, on my system, the test runs for 70 seconds, just to finally 
discovered that there was no free port available.

> This code is all inherantly racy though, because as
> designed it is checking for a port that's available
> and then later calls wait_for_phone_home which spins
> up a HTTP server listening on the port. The port can
> be used in between the check and use. This can be
> the case if running many things in parallel on the
> host.
> 
> It would be better to spin up that server using
> kernel port auto-selection at the start eliminating
> the race entirely.  Then just record the port that
> was allocated and use that when building thue
> cloudinit config for the guest.

That sounds much better, indeed... now we just need a volunteer to fix it ;-)

  Thomas


