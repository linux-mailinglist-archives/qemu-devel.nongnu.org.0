Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1378C30BF53
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:27:17 +0100 (CET)
Received: from localhost ([::1]:51650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vi8-0006YP-5J
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:27:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6vg9-0005Z2-PZ
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:25:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6vg6-0008U4-4U
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:25:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612272309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=di2HVjjYqK+QCuhauDffqN2CeBz7Zcfx4hopJKJ2RtI=;
 b=AHYBuEEj3nqwSv9+Y8LYgK7MRy2J74k7PXvUpXqCDK/OxzQ6cN7/kH43ICMs2q1k5LN1gf
 wgz13LeMNOAn8hoBBuMAPiDnsG3Lt2odjsM7BWkHrL7vxV0mMXXKhCzrE2OXYq0iGNz3Y5
 wS/XHtEPIE8kHCL+LVwV26uHdyZmiMI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-3AgMaROIP7mO71TzVdhAqw-1; Tue, 02 Feb 2021 08:25:07 -0500
X-MC-Unique: 3AgMaROIP7mO71TzVdhAqw-1
Received: by mail-wr1-f72.google.com with SMTP id p16so12200039wrx.10
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 05:25:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=di2HVjjYqK+QCuhauDffqN2CeBz7Zcfx4hopJKJ2RtI=;
 b=ViIvWfCQsSt7qxZUes2NK4QN0bZOJDwFC17WQP2hxyV7kSxG3CwyvD7Q9fcZK0DuIx
 uUuG3kdEhcKo7UPd3MDkWZryTHHU/X5SxlMPN6kxNmXBUTRzS8u+/3Zi6TQQKwyxpN/S
 R3Ve/2neSPfk3Ik8szaQbMDYqnXjy0gVeJnxmOpkfJIr1mtfnx0jERhFKYhe3ud9WW5n
 qJoYuy0uVfC34JCDWZ+X/tC8/FvHok4Y0GTj5p6zraN7/FHy39IwbFZa1UabcQFsju2m
 bHaNJAY+parCk8EMwKJvHwcsPK1EwUcWdRZFX7K5u3h8bt8r+U7tE/1w2MeIg+BXFyoD
 jRdA==
X-Gm-Message-State: AOAM531vn/G/TJmKSKrXYNAbegixGZcYzbmjzUuz4TR2si+UqRc9T9dy
 uM4B1RUaQ6UnDTM/jTizEK+1aHyUatxzoPMTJAzcjwUl0S/qbt4nd80beRArIVvCSrn5/UP70G4
 CcvxSOp0bRHpXgms=
X-Received: by 2002:a5d:4391:: with SMTP id i17mr23674476wrq.57.1612272306262; 
 Tue, 02 Feb 2021 05:25:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLIxEIqpguEa5E5rGLAAtKmMWTv1BadiCmLk2kjGzc0DCOJV964jB52Mo2k5h7UPahLNeJiA==
X-Received: by 2002:a5d:4391:: with SMTP id i17mr23674449wrq.57.1612272306002; 
 Tue, 02 Feb 2021 05:25:06 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id m205sm2648529wmf.40.2021.02.02.05.25.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 05:25:05 -0800 (PST)
Subject: Re: [PATCH] configure: Escape non-numbers in version_ge()
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210202104911.879393-1-philmd@redhat.com>
 <87mtwmtz9w.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <551e39ae-461d-6a3f-9add-26f508e851d0@redhat.com>
Date: Tue, 2 Feb 2021 14:25:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87mtwmtz9w.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 1:43 PM, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> On Red Hat based distributions, the configure script emits various
>> warnings:
>>
>>   # ./configure
>>   Using './build' as the directory for build output
>>   ./configure: line 212: test: 2-15: integer expression expected
>>   ./configure: line 213: test: 2-15: integer expression expected
>>   ./configure: line 212: test: el8: integer expression expected
>>   ./configure: line 213: test: el8: integer expression expected
>>
>> This is produced by the gdb version check introduced in commit
>> b1863ccc957 ("configure: gate our use of GDB to 8.3.1 or above"):
>>
>>     gdb_version=$($gdb_bin --version | head -n 1)
>>     if version_ge ${gdb_version##* } 8.3.1; then
>>         echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
>>     fi
>>
>> Because on RHEL/Fedora the minor version is not a plain number:
>>
>>   $ gdb --version | head -n 1
>>   GNU gdb (GDB) Fedora 9.1-7.fc32
>>
>>   $ gdb --version | head -n 1
>>   GNU gdb (GDB) Red Hat Enterprise Linux 8.2-15.el8
>>
>> Fix by only using the leading numbers, stripping the rest.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  configure | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/configure b/configure
>> index e85d6baf8f8..21f6530a812 100755
>> --- a/configure
>> +++ b/configure
>> @@ -205,7 +205,7 @@ version_ge () {
>>          local_first=${2-0}
>>          # 'shift 2' if $2 is set, or 'shift' if $2 is not set
>>          shift ${2:+2}
>> -        local_ver1=$*
>> +        local_ver1=$(echo $* | sed -E 's/(^[0-9]+).*/\1/')
>>          set x $local_ver2
>>          # the second argument finished, the first must be greater or equal
>>          test $# = 1 && return 0
> 
> I already have a fix that was posted in:
> 
>   Subject: [PATCH  v2 7/8] configure: make version_ge more tolerant of shady version input
>   Date: Fri, 22 Jan 2021 18:18:53 +0000
>   Message-Id: <20210122181854.23105-8-alex.bennee@linaro.org>
> 
> About to feature in the pre-PR series I'm about to post.

Oh I missed it.

Thanks,

Phil.


