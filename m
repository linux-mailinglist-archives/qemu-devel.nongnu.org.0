Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB46642385
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 08:22:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p25mh-0006vN-1r; Mon, 05 Dec 2022 02:21:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p25mf-0006v0-Jw
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 02:21:01 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p25md-0005LL-Tt
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 02:21:01 -0500
Received: by mail-wm1-x32d.google.com with SMTP id v7so8046695wmn.0
 for <qemu-devel@nongnu.org>; Sun, 04 Dec 2022 23:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C2gXh6Q4hDSUw7USa2OxqYaRiBaVCQxTWG5sS+Ae9Kw=;
 b=I3XBmYkuqaBAo4Z4dLEsw5w4we5nZkEi24QQKsporvzdKT8WxHS6i8MGxZUFHIMbLl
 tPvb7zF0El0CbERgaqwGDwSuBTd94n6aqAqStkjKbVWcY9GdqTuJVOYW1r91W3y5wvIN
 ZlUJotCYCDJA9zGsPgdw6z6ctEuoL+QuxXkXrUyYeCj5kdQTSAVYaKynZP1jvq92tqcg
 lbY1n5o+ikFQIJrY1m9jt60ASu+k+vedcN3aPv1ESX9dwpvTq26NBAwePh0b906fZdxu
 4v6FaUeXe3Us53R7F2ceQ+DAp3PNBR4pRILPDhx0weh4THUnYzIxqOZmUT2VyUbsDXqU
 EfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C2gXh6Q4hDSUw7USa2OxqYaRiBaVCQxTWG5sS+Ae9Kw=;
 b=ekSMsAvphEH//7ME2SmPS7cQe5qXXBLfLkqJZSCSBKpYE2b6rY9Ht7smq8Or17GXCX
 IZWkkmrtah5dU8pP9gDbKDUuV2XfSimtyRnIoytDlFmVvYTrMGmXhzeDUU/PGbkfqRWw
 rBZPyRxCuVaaieXyD51E63ztb6dK5FoSMEuhydF2q9JmrdSeb1EoOlt7Y6n9O5vudvCr
 dsoNeYVv7mFN8O4JkpZw/AtI9aRH4RLQh0kpFcnjkiMwe4gdhVl4XfbK99ZDEq10coju
 0vrg5ozpGgDEIPWgR3g2n61rFQX1Ti3u7RCpJy0N4VZmeBG68pexS0aMGpKj5erbXWAd
 tjPA==
X-Gm-Message-State: ANoB5pmeNAHoPv1B2aLEZGOyZKYyUYe3Ms+eqE80mcucMkRniZcPpDkv
 yj59ebul4rdQNh1jJzCbFMxCGA==
X-Google-Smtp-Source: AA0mqf5ompFxk4QW3At8B6NKTD8BRE2/6aQ6tL5wBWcrO/xQH8YTjEAQZrqOAFYTk+nK992Ueia9Hw==
X-Received: by 2002:a05:600c:601f:b0:3c6:f1fa:d677 with SMTP id
 az31-20020a05600c601f00b003c6f1fad677mr38356599wmb.59.1670224858231; 
 Sun, 04 Dec 2022 23:20:58 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i12-20020adffc0c000000b00241d21d4652sm13300918wrr.21.2022.12.04.23.20.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Dec 2022 23:20:57 -0800 (PST)
Message-ID: <995f9bba-d763-7f58-b0f9-d47f257e0c6c@linaro.org>
Date: Mon, 5 Dec 2022 08:20:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] net: Fix qemu crash when hot-pluging a vhost-net failed.
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, Yangming <yangming73@huawei.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "wangzhigang (O)" <wangzhigang17@huawei.com>,
 "zhangliang (AG)" <zhangliang5@huawei.com>
References: <0357c2371db0438eac0de474db2b8ddc@huawei.com>
 <CACGkMEtm=P27rQLJOWZgVaf=N0VWU1Vo1NnCxnU9D6ZPhb7JVg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CACGkMEtm=P27rQLJOWZgVaf=N0VWU1Vo1NnCxnU9D6ZPhb7JVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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

On 5/12/22 07:37, Jason Wang wrote:
> On Mon, Dec 5, 2022 at 2:23 PM Yangming <yangming73@huawei.com> wrote:
>>
>> Dear all:
>>
>>
>>
>> I found a bug of qemu: hot-pluging a vhost-net may cause virtual machine crash in following steps:
>> 1. Starting a vm without any net device.
>> 2. Hot-pluging 70 memory devices.
>> 3. Hot-pluging a vhost-net device.
>>
>>
>>
>> After the 3rd step, the qemu crashed with following messages:
>>
>>
>>
>> vhost backend memory slots limit is less than current number of present memory slots
>>
>> warning: vhost-net requested but could not be initialized
>>
>> qemu-system-x86_64: ../net/net.c:1106: net_client_init1: Assertion `nc' failed.
>>
>> 2022-12-05 03:14:08.794+0000: shutting down, reason=crashed
>>
>>
>>
>> This commit is used to fix the mentioned problem. It is based on commit a33c25399f9bc3dcf83064adeba2a82e61bf4608 of master branch.
> 
> Thanks for the patch, would you please send a formal patch (not as an
> attachment), you can do it via git-send-email.

You can find some help on how to proceed here:
https://www.qemu.org/docs/master/devel/submitting-a-patch.html


