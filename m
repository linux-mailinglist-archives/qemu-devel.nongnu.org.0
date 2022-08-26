Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0D15A2E6E
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 20:29:10 +0200 (CEST)
Received: from localhost ([::1]:54174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRe4q-0002oX-U9
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 14:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRe2k-0000hX-3I
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 14:26:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRe2h-0004F0-8y
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 14:26:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661538414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NVtE1oY+8+ACPLrGRj3G+eL+/XmXWnagd50fpLFjh+k=;
 b=UznGGOQKZiUT5SFzrPjO/FSZay6AQRBfRaENn599bO7ogBN1ZCxDnyqergHvL5uPJ7oSg2
 B97SVfeIyy9QvC324aVOObQD1X84FvFChx/sP/janCjLEUUkEh+azOswa1D/g/sfSzcMi4
 ojeiIycT1N3d/aC3xoZjlbMoulFNIXU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-471-nmStlnvxNOyK9uNWcYOQdQ-1; Fri, 26 Aug 2022 14:26:52 -0400
X-MC-Unique: nmStlnvxNOyK9uNWcYOQdQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 d1-20020adfa341000000b0022571fbdfe2so254997wrb.3
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 11:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=NVtE1oY+8+ACPLrGRj3G+eL+/XmXWnagd50fpLFjh+k=;
 b=ORanXSCvg80yYEAhjiQvANY3WgJ/R2QS1VakHc5tg+Wl5C0EmUKcWtpQ3qT+xtbMfF
 m/7dF2gj6bwAUD35XEdm8MvTFeeGHGG68RuJkjvI5OnKHiOzNO+d/+53pKMH6Tm//jZa
 fkSh0vShCwIyVXLQ7FLcutL12i3O+BzBY5JdY8pbnS5HvfsNQC90Z4iPW8GmwS9v6yjF
 ySIZmh5/P9jNRmPWNQA/0UXCh+af+cWjiM3uTxhQyRxRX13FdTBTR1fni86EtjTT4c5C
 zgrWLLbogF2DuDnZSJfYkbzW/Uz6zN+tbBsvK8qgvi6S1CPeNo/si3OkJAZFZotJ4M6j
 dxTA==
X-Gm-Message-State: ACgBeo19ERFcUNcxPo73WcHgsqHt+yHc3NiHHW1meIZs+SGgr4/70ZiO
 WuXALmKTiArLgmNSMmncV0LqVPSBM3d4NhAlIn0Sjs8kWolAdsDdYoLIuTPvjKtpN448j2rnnF1
 8ax7p7le7q5qOkfg=
X-Received: by 2002:a05:600c:20f:b0:3a5:a785:7f2a with SMTP id
 15-20020a05600c020f00b003a5a7857f2amr531858wmi.94.1661538411403; 
 Fri, 26 Aug 2022 11:26:51 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7ZINSnN6xffPjVa7Cy2H9VAJr4vJIlVS8YwzNlrVHs2WUSEl/ACS5X77QZTmqnRMCIbTIwGw==
X-Received: by 2002:a05:600c:20f:b0:3a5:a785:7f2a with SMTP id
 15-20020a05600c020f00b003a5a7857f2amr531852wmi.94.1661538411170; 
 Fri, 26 Aug 2022 11:26:51 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-60.customers.d1-online.com.
 [80.187.98.60]) by smtp.gmail.com with ESMTPSA id
 p20-20020a05600c359400b003a35516ccc3sm340725wmq.26.2022.08.26.11.26.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 11:26:50 -0700 (PDT)
Message-ID: <91c5a3b9-555e-51d4-1daa-9a4692ea437a@redhat.com>
Date: Fri, 26 Aug 2022 20:26:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 27/51] tests/qtest: Use send/recv for socket communication
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng
 <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-28-bmeng.cn@gmail.com>
 <dbb7f0fd-22e6-a5e0-88ce-5810290170ce@redhat.com>
 <CAEUhbmVmyT7ETTJdJH=UzZyf5_PaA8QMfsc=0rjJKK+8RHeztw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAEUhbmVmyT7ETTJdJH=UzZyf5_PaA8QMfsc=0rjJKK+8RHeztw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 26/08/2022 16.59, Bin Meng wrote:
> On Thu, Aug 25, 2022 at 9:04 PM Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 24/08/2022 11.40, Bin Meng wrote:
>>> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>>>
>>> Socket communication in the libqtest and libqmp codes uses read()
>>> and write() which work on any file descriptor on *nix, and sockets
>>> in *nix are an example of a file descriptor.
>>>
>>> However sockets on Windows do not use *nix-style file descriptors,
>>> so read() and write() cannot be used on sockets on Windows.
>>> Switch over to use send() and recv() instead which work on both
>>> Windows and *nix.
>>>
>>> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>>> ---
>>>
>>>    tests/qtest/libqmp.c   | 4 ++--
>>>    tests/qtest/libqtest.c | 4 ++--
>>>    2 files changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/tests/qtest/libqmp.c b/tests/qtest/libqmp.c
>>> index ade26c15f0..995a39c1f8 100644
>>> --- a/tests/qtest/libqmp.c
>>> +++ b/tests/qtest/libqmp.c
>>> @@ -36,7 +36,7 @@ typedef struct {
>>>
>>>    static void socket_send(int fd, const char *buf, size_t size)
>>>    {
>>> -    size_t res = qemu_write_full(fd, buf, size);
>>> +    ssize_t res = send(fd, buf, size, 0);
>>
>> This way we're losing the extra logic from qemu_write_full() here (i.e. the
>> looping and EINTR handling) ... not sure whether that's really OK? Maybe you
>> have to introduce a qemu_send_full() first?
>>
> 
> I am not sure if qemu_send_full() is really needed because there is an
> assert() right after the send() call.

That's just a sanity check ... I think this function still has to take care 
of EINTR - it originally looked like this:

  https://git.qemu.org/?p=qemu.git;a=commitdiff;h=c3e5704af19ac6

... and you can also see the while loop there.

  Thomas



