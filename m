Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46824650F3E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 16:50:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7IOG-0001VL-EP; Mon, 19 Dec 2022 10:49:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7IOE-0001V2-4G
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:49:18 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7IOA-0008O0-Uv
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:49:16 -0500
Received: by mail-wr1-x429.google.com with SMTP id i7so9075701wrv.8
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 07:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cf1gSwDtoLZDzBOeFSVnSpZdMTAz1QCSwzDHx8Ewkxk=;
 b=Fi2iPeL/pixrWUJnBDzrGI6yBMichsPQX6GuZ+9dzHkZwqaFuVAwBnaWWrmqIEmbMe
 zSNyGJroYy8nT8xe0gQFyURUjD1/oSgm/68QVxQX4tUI8xOyrQUgEPaITY5a8FlAj5tH
 jA3L4leQB/myi1bTqaRyJNmbmrYTCLOPmMArokC7XG2DtebWeD5zkd1qbqgGTO+vS33v
 VQklMaEIP87l/Etq/U0OPvKQgJgmYujnoAmpdw1Rdeu2+qGkpusS13Zw1i0AAqz6lC1m
 jGuDJ+kYSYptyGB0af+WyA/Q81vrcfBo1OyUD0+bqSio+h2Qnt91thzbuNP92x6lcIXO
 zXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cf1gSwDtoLZDzBOeFSVnSpZdMTAz1QCSwzDHx8Ewkxk=;
 b=ZMkOtZaXtrdxztZXZfY/p/R3k/+YdQ57GjfTsMGTn/2CXO9gw7UIlt/lvhIJadWWUa
 n+IxPP3S+l9XE4B0Y+OQC4uQEQYnGeBrDnNjMDDZOXgKJbwTt6tHCPUk1yUpULZEMY5A
 E9YUxdG0lmOo4neDlMJb7/23ilwE9dAQuXRSQ+ICp6dV/PFtXKjBE2/CkdEnuxb6OGtd
 oaCA9kbNoKOQOrm1UTQuZfE6ekPsjFkPoulKiOh8yzvb5GzCWRyfl+oSdq5maaa56paL
 ICs5oykrhIKpZXx5CdexgcwpwglpnXtOOnAryzo2WH05P8iK3MQBqoQBzEzzCrGagrxR
 GysQ==
X-Gm-Message-State: AFqh2koJ9jzkOObEEuZAECLgFjxzvfLXpbC0gIcskMKVI/QCWQVwE31s
 lQC/9jr0FdkJEJbwolqdDdMzAQ==
X-Google-Smtp-Source: AMrXdXu+kx2OE02cHxgelV/KCre41t9/wpZVa1S+22FX7Eg4qzGcI7uDlZSND2radMsFwXxRelj7ZA==
X-Received: by 2002:a5d:6701:0:b0:251:248f:7c6a with SMTP id
 o1-20020a5d6701000000b00251248f7c6amr6631011wru.13.1671464949900; 
 Mon, 19 Dec 2022 07:49:09 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m2-20020a5d4a02000000b0022ae0965a8asm10424755wrq.24.2022.12.19.07.49.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 07:49:09 -0800 (PST)
Message-ID: <4d316fbd-963b-6fd6-fb70-708719cdcacb@linaro.org>
Date: Mon, 19 Dec 2022 16:49:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 08/11] contrib/gitdm: Add Facebook the domain map
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Iris Chen <irischenlj@fb.com>,
 Peter Delevoryas <pdel@meta.com>, Daniel Mueller <muellerd@meta.com>
References: <20221219121914.851488-9-alex.bennee@linaro.org>
 <052012F1-2E78-40FC-990B-6AA3C95FDB37@pjd.dev>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <052012F1-2E78-40FC-990B-6AA3C95FDB37@pjd.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 19/12/22 16:22, Peter Delevoryas wrote:
> 
> 
>> On Dec 19, 2022, at 4:19 AM, Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>> ﻿!-------------------------------------------------------------------|
>>   This Message Is From an External Sender
>>
>> |-------------------------------------------------------------------!
>>
>> A number of Facebook developers contribute to the project. Peter can
>> you confirm your want pjd.dev contributions counted here or as
>> an individual contributor?
> 
> Oh, hey: yes I can confirm that, I want pjd.dev contributions counted here as fb stuff.
> 
> By the way: recently, every Facebook developers email has migrated to “username@meta.com”. So now all my fb.com email goes to my meta.com inbox. We may or may not want to include both emails. I think the fb.com emails will stay around for quite a while, but yeah.

gitdm tool is only use to display statistics from your past
contributions. If you want the get_maintainers.pl script to
use your updated email address, you probably want to send a
patch to update the .mailmap file.

>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Cc: Iris Chen <irischenlj@fb.com>
>> Cc: Peter Delevoryas <pdel@fb.com>
>> Cc: Peter Delevoryas <peter@pjd.dev>
>> Cc: Daniel Müller <muellerd@fb.com>
>> ---
>> contrib/gitdm/domain-map         | 1 +
>> contrib/gitdm/group-map-facebook | 5 +++++
>> gitdm.config                     | 1 +
>> 3 files changed, 7 insertions(+)
>> create mode 100644 contrib/gitdm/group-map-facebook

