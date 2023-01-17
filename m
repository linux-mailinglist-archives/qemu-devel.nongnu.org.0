Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D1366DB35
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 11:33:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHjGz-00076X-6Z; Tue, 17 Jan 2023 05:32:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pHjGs-000763-3J
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:32:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pHjGq-00016l-KV
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:32:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673951567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OFN0cn32L17ltzMsg97kBXDIeN9Bni2FxYSRqnWxiRo=;
 b=c7FC/O60LGkFunDgTpwglzxfnuv7qYXjQ4viOHdKZsahYHI27c5dMN3YAWrNZnos5sCm7D
 v0FVuGauxHPeKkUMJwD6JYBSDoBctCMBY8bvmw5+fh0jRP05vCrHlCp/yKHH9sxz6AwpDU
 iuzEdDIsrUKJfuO6oZqOoDweUhJg/S8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-551-Rh-6A2jZNyaP_m6OPy25vw-1; Tue, 17 Jan 2023 05:32:45 -0500
X-MC-Unique: Rh-6A2jZNyaP_m6OPy25vw-1
Received: by mail-qv1-f69.google.com with SMTP id
 jh2-20020a0562141fc200b004c74bbb0affso15929750qvb.21
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 02:32:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OFN0cn32L17ltzMsg97kBXDIeN9Bni2FxYSRqnWxiRo=;
 b=Tvn095sa4vYFXKBxmsunbHVRROeBA9/Ftp4q1aGoojuETL9JEGKwWQGCi/4voPN7PB
 AblbIbSRwfNyfbI5p8WmFMXMCj4k/W6pbAP6x0pk83Ykk/Ewvq1PvUySxbGC4AbCQRCN
 1p9AGH4FaPWhHO4pFgZCHmro3Tv79dS8S+DvUw9R6to6aQw0V1EcTHv/1Kq8i9nbKjV3
 pkap0YsEqT5+21XAHWpyNB4WxPGRJR/tO0wZVduDPeB7E9kUcvRQaVWqa6MSbNntf+gZ
 IAmbXKQjW5BDL5pNrSoQ6p+51CfR7Zg1ooQP1cp8fTnWarQcsMrBwvBToNV78Mc9nWli
 TcWw==
X-Gm-Message-State: AFqh2krSGXhELLY1FuE2t75xHMGcVWR56Ae7mJfYSby9qgYJ87ro7bYM
 yCni6e4da/ipAwsncbvtTD09lDEefVGs+sajNB2KHic8e3tC6s+p0Kz0WLgPvX8FjFnU5lXmO5d
 iG8UtDFJZkKyBTLk=
X-Received: by 2002:a05:6214:1fd5:b0:531:f392:9920 with SMTP id
 jh21-20020a0562141fd500b00531f3929920mr3868029qvb.5.1673951565472; 
 Tue, 17 Jan 2023 02:32:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtoVmI/H1Oh4CtMYB6CkbcRj8cz6OJozAK38ofOnf5YqgpGSlc5tHpVy9B8Y41+hR5srTzVjA==
X-Received: by 2002:a05:6214:1fd5:b0:531:f392:9920 with SMTP id
 jh21-20020a0562141fd500b00531f3929920mr3868012qvb.5.1673951565281; 
 Tue, 17 Jan 2023 02:32:45 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-26.web.vodafone.de.
 [109.43.177.26]) by smtp.gmail.com with ESMTPSA id
 q44-20020a05620a2a6c00b006fc9fe67e34sm5801712qkp.81.2023.01.17.02.32.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 02:32:44 -0800 (PST)
Message-ID: <43415e4f-c6bf-31c6-3a2e-cea86c511223@redhat.com>
Date: Tue, 17 Jan 2023 11:32:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] tests/qtest/qom-test: Do not print tested properties
 by default
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20221215153036.422362-1-thuth@redhat.com>
 <CAFEAcA_EUNGFzLh8d9631WZR+-bR8oVynBs6=FV_kmLWNx2bSg@mail.gmail.com>
 <CAFEAcA80=+dXd5uDfSd8-sAPwbrYMqaPKhLGt7w8vh3MiQwLCQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA80=+dXd5uDfSd8-sAPwbrYMqaPKhLGt7w8vh3MiQwLCQ@mail.gmail.com>
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

On 17/01/2023 11.23, Peter Maydell wrote:
> On Mon, 16 Jan 2023 at 16:55, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Thu, 15 Dec 2022 at 15:30, Thomas Huth <thuth@redhat.com> wrote:
>>>
>>> We're still running into the problem that some logs are cut in the
>>> gitlab-CI since they got too big. The biggest part of the log is
>>> still the output of the qom-test. Let's stop printing the properties
>>> by default to get to a saner size here. The full output can still
>>> be enabled by setting V=2 (or higher) in the environment.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   v2: Use atoi() to do proper checking of the verbosity level
>>
>> Applied to master in the hope of improving the CI logs; thanks.
> 
> Looks like we can still hit the gitlab log limit in some
> cases, even with this patch; here's an example job:
> https://gitlab.com/qemu-project/qemu/-/jobs/3610621992

Ok, too bad ... three ideas to improve this situation further:

- We could shut up those "Obtaining properties of" lines by
   default

- Stop running the tests with "V=1"

- Instead of doing "cat meson-logs/testlog.txt" in the CI
   scripts, we switch to "tail -n 1000 meson-logs/testlog.txt"
   instead

What do you think?

  Thomas


