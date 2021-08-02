Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DFA3DD70C
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 15:26:41 +0200 (CEST)
Received: from localhost ([::1]:52226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAXxo-0007Wc-Pp
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 09:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mAXwo-0006mt-1y
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:25:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mAXwm-0001mM-DO
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:25:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627910735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SNQ90RLsDBPXB63ofUn9ENLvr8n+XGrcH+NfZtiD9a0=;
 b=dSAFtlIjqMh1WfLqZcy5iU6opEoyGueE63TEv7+IDRELgbMjuxltaHKBLvQHTxDpsyba/i
 qgZcmTYZWwNgXb8uWdIN4e5ekzjvLNPgxDXITvyDWFwxiEIikJ95IWzu7BvAFWa5/SjWxT
 uTwdgWisfh0u3D6jvNRG756V8j2MEL4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-7mlNW6v2PESfOvglFqOMdw-1; Mon, 02 Aug 2021 09:25:33 -0400
X-MC-Unique: 7mlNW6v2PESfOvglFqOMdw-1
Received: by mail-wr1-f72.google.com with SMTP id
 d10-20020a056000114ab02901537f048363so6472166wrx.8
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 06:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SNQ90RLsDBPXB63ofUn9ENLvr8n+XGrcH+NfZtiD9a0=;
 b=SDczni8xm8wLv3TvWVB4ZRszrebJWahSp1kWhNH+YxEINskZu2wO0cLjJxGNaAF2f/
 i0BGwjFQswlrDUKAUxcav8e8GAmKgQlbRd1+vQHNB3IVhGBWGMtbfM/i3I9K/eiq9z99
 VBMPZ2xbV61vUGl/s366uuXN4OqZWAkGSsWvIyHaM1se0XUxL9GdX4e6xZlQ7T+5Ji8Z
 eefTu3HuxX2xz3bS0xU4wSKXyWJZy9bLKSh6suON2/6ZfTCa+h7q5K8oSOy518Ku08xW
 6UUP2bcLhuKDZWGYftB9ZZIY28gLhPqZlabpnvsr3MNRtLlkcS0IJH157MRF8t6+3U9z
 wbFQ==
X-Gm-Message-State: AOAM531S6JQxoEoKmqfbwBaJC+zs66NU3c2HruGO4P/PB5nh9Vhbe+8+
 N9po8wYkhfcT0FLAW7V9cGlFH5uL4o9kxGKhWPeO+5AfKRQbVrs5OKZaxLVU/xpDwDCv2cfTTEQ
 wnrF3HclM1syCC6I=
X-Received: by 2002:a1c:2984:: with SMTP id p126mr16796689wmp.58.1627910732585; 
 Mon, 02 Aug 2021 06:25:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKYkchVmE3JzQRIEF3UfMBVxTkjjCThI9lLvHm0ig5o8Ma7eMdBZAncHtYecNES5HNlRH8WQ==
X-Received: by 2002:a1c:2984:: with SMTP id p126mr16796667wmp.58.1627910732372; 
 Mon, 02 Aug 2021 06:25:32 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83171.dip0.t-ipconnect.de.
 [217.232.49.113])
 by smtp.gmail.com with ESMTPSA id t15sm8509967wrw.48.2021.08.02.06.25.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 06:25:31 -0700 (PDT)
Subject: Re: "make check-acceptance" takes way too long
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <YQeu+Jm2Q0NlQ2Im@redhat.com> <878s1kgg2f.fsf@linaro.org>
 <CAFEAcA-JDq7erZNhnnoxQP-2UpNH1b_PMeRGj7j8s3Vx3tJceg@mail.gmail.com>
 <YQftcinYWVTiscXd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <59a6b17d-1d9e-9e4a-cba7-a029a3c32fe5@redhat.com>
Date: Mon, 2 Aug 2021 15:25:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQftcinYWVTiscXd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/08/2021 15.04, Daniel P. Berrangé wrote:
> On Mon, Aug 02, 2021 at 02:00:19PM +0100, Peter Maydell wrote:
>> On Mon, 2 Aug 2021 at 13:57, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>
>>>
>>> Daniel P. Berrangé <berrange@redhat.com> writes:
>>>
>>>> On Fri, Jul 30, 2021 at 04:12:27PM +0100, Peter Maydell wrote:
>>>>> "make check-acceptance" takes way way too long. I just did a run
>>>>> on an arm-and-aarch64-targets-only debug build and it took over
>>>>> half an hour, and this despite it skipping or cancelling 26 out
>>>>> of 58 tests!
>>>>>
>>>>> I think that ~10 minutes runtime is reasonable. 30 is not;
>>>>> ideally no individual test would take more than a minute or so.
>>>>>
>>>>> Output saying where the time went. The first two tests take
>>>>> more than 10 minutes *each*. I think a good start would be to find
>>>>> a way of testing what they're testing that is less heavyweight.
>>>>
>>>> While there is certainly value in testing with a real world "full" guest
>>>> OS, I think it is overkill as the default setup. I reckon we would get
>>>> 80-90% of the value, by making our own test image repo, containing minimal
>>>> kernel builds for each machine/target combo we need, together with a tiny
>>>> initrd containing busybox.
>>>
>>> Also another minor wrinkle for this test is because we are booting via
>>> firmware we need a proper disk image with bootloader and the rest of it
>>> which involves more faff than a simple kernel+initrd (which is my goto
>>> format for the local zoo of testing images I have).
>>
>> If you look at the log which has timestamps for the output, UEFI
>> takes some extra time but it's not too awful. The real timesink is
>> when it gets into userspace and systemd starts everything including
>> the kitchen sink.
> 
> Is it possible to pass "s" kernel arg to systemd to tell it to boot in
> single user mode so it skips most of userspace, while still providing
> a useful test scenario in much less time ?

FWIW, we're doing something similar in 
tests/acceptance/machine_s390_ccw_virtio.py already: The Debian job is using 
"BOOT_DEBUG=3" to drop into a debug shell early where we can already do all 
the necessary tests, and the Fedora-based job is doing the same with 
"rd.rescue". Additionally the Fedora job is also decompressing its initrd on 
the host already which is way faster than doing that via TCG in the guest. 
Both tricks saved us a significant amount of time in these jobs.

  Thomas


