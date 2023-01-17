Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D11C66E3F8
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 17:46:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHp5R-00006Q-Uu; Tue, 17 Jan 2023 11:45:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pHp5L-0008PC-34
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:45:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pHp5J-0000YS-IH
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:45:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673973916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MmRXGH9ib5Havpv1xb23evBeZVYSnm1M/Dbt/HIXZvY=;
 b=aGhg7MVT0knIBK7AVUD3IAk4SfKDXGZyjYLCmDvgV0XIfDt8gsCwNwfWR6/lfxbv5WevZE
 Ng/R4mZwEAlVMHbx1AWCZ0GM7wFmNr7euMkIVppamJ3gUzNjZY73P7yYD9Gr4cbVqIL/d9
 GNi4rsoGFiRGcRD1e3UKPz5sRPkzHdE=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-599-RBGRmyaWNP-abHG8-6mtrw-1; Tue, 17 Jan 2023 11:45:14 -0500
X-MC-Unique: RBGRmyaWNP-abHG8-6mtrw-1
Received: by mail-qk1-f197.google.com with SMTP id
 bj28-20020a05620a191c00b007068d8b5051so2831211qkb.14
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 08:45:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MmRXGH9ib5Havpv1xb23evBeZVYSnm1M/Dbt/HIXZvY=;
 b=NGklELAovAGGO4Bd897nplbUNeEGHpBlTynVpybfN1+UXYSDTIy9hISeN0g7WvKB6Y
 Tu2Np4PH6JdNkvZMQPIUxPSHkA4aKAMuhCyDAaOhCTQk+xJaSeNaLxuSlloCZTkn/hOU
 Rsuuu9qtexkHWp3d0gyR4J4Ud0XgbOW6JHgKWVVNEKFwZmvf1Jj+Z3xpIO72V86cxMRU
 8YBRJcNb8cc1gjU/YO0KP4UUge61KnGCYx34m5SRDzQNtP2jH5lrHQXjFIiHiHHc/O/z
 xpfSP2cslKvqr1Vt5J+KGXR3iIvDFZzCtfQTVsfd1EYYD+i8NabWt+YapR+ECTjU5u7R
 NtuA==
X-Gm-Message-State: AFqh2kolRwZBbngHfsNSS3eAcXOhX9y1XiTM9sPLliNlj6aqOdDLJ8VS
 AsaSlNrB87oMN35LuO7nJ6t7mQVvTJwp11byt3wf0du/7tcXXaBnztm1/UbPsk3mu1RkAa/Z9w9
 tbxHRxWYL1OrHg2g=
X-Received: by 2002:ac8:48d9:0:b0:3b6:2f49:1acc with SMTP id
 l25-20020ac848d9000000b003b62f491accmr4148157qtr.16.1673973914271; 
 Tue, 17 Jan 2023 08:45:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsw1xt9CQmsaMyaiCDGeahsCOr0ZvDu48Gn1f0YW1N9zEmy1qj7EOUW4gD5QLksPRpncFE/Ww==
X-Received: by 2002:ac8:48d9:0:b0:3b6:2f49:1acc with SMTP id
 l25-20020ac848d9000000b003b62f491accmr4148137qtr.16.1673973914049; 
 Tue, 17 Jan 2023 08:45:14 -0800 (PST)
Received: from [192.168.8.105] (tmo-067-100.customers.d1-online.com.
 [80.187.67.100]) by smtp.gmail.com with ESMTPSA id
 n15-20020a05620a294f00b0070383f1b6f1sm20808190qkp.31.2023.01.17.08.45.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 08:45:13 -0800 (PST)
Message-ID: <5b67045b-d8d7-14ef-21ff-3fcadff9e5bf@redhat.com>
Date: Tue, 17 Jan 2023 17:45:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v6] tests/qtest: netdev: test stream and dgram backends
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Jason Wang <jasowang@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
References: <20230117131506.1394552-1-lvivier@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230117131506.1394552-1-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 17/01/2023 14.15, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Acked-by: Thomas Huth <thuth@redhat.com>
> ---
> 
> Notes:
>      v6:
>        - call socket_init() otherwise socket_check_protocol_support() fails
>        - if socket_check_protocol_support() fails then calls g_abort() to
>          report a problem.

Last problem fixed, next one occurring:

218/556 qemu:qtest+qtest-aarch64 / qtest-aarch64/netdev-socket                    ERROR           0.77s   exit status 3
------------------------------------- 8< -------------------------------------
stderr:
qemu-system-aarch64: -netdev dgram,id=st0,remote.type=inet,remote.host=230.0.0.1,remote.port=1234: can't bind ip=230.0.0.1 to socket: Unknown error
Broken pipe
../tests/qtest/libqtest.c:195: kill_qemu() tried to terminate QEMU process but encountered exit status 1 (expected 0)
TAP parsing error: Too few tests run (expected 6, got 4)
(test program exited with status code 3)
------------------------------------------------------------------------------

See: https://cirrus-ci.com/task/6491942456918016

... maybe it would be better to simply limit the test to
CONFIG_POSIX in the meson.build file?

  Thomas


