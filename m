Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C138247F0C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 09:10:40 +0200 (CEST)
Received: from localhost ([::1]:55492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7vlX-0003qN-50
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 03:10:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k7vkh-0003Q7-Vp
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 03:09:47 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:32996
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k7vkf-0000wn-UX
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 03:09:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597734584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CaW7zHXKMhFwuMzVRR09C7NvT4o4C9WMvLT6PfGyflQ=;
 b=L5KEpH9T783N8AlAJijCpqpMZ8x/h1wwgHIngyy4HXOwSLgRKsDte5BG81yOA6F3CGinG+
 MhcsYyKR3ZqjOL3L+zwOidG5XDbn+hN+KCwh0YhsvsOjyQ3r2WI6Fwn10zxH1u6yxvikhd
 JXQWpzWVIZKmlm3FEN5cvp+0dQCpfcs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-U30dP2tBMpKovYiowv5PbQ-1; Tue, 18 Aug 2020 03:09:40 -0400
X-MC-Unique: U30dP2tBMpKovYiowv5PbQ-1
Received: by mail-wr1-f70.google.com with SMTP id b18so7882746wrn.6
 for <qemu-devel@nongnu.org>; Tue, 18 Aug 2020 00:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=CaW7zHXKMhFwuMzVRR09C7NvT4o4C9WMvLT6PfGyflQ=;
 b=SBMKya/MtAcvON5Mv1eL4EpBgy3J5Hb2LHH2SNmnln9G4bOnn2LdJAwsA2XHKzg89z
 fRNug/ezZcSU3IPxSn0sa7WI2UcxA8e2sf+9X/7PLpswh/S6texnvjUP4ee9VFfidhAQ
 h13LfF6ssarhc1IWEMBaGb8lm54vJaa7rMj/DbWtaB9WdWG+5ybdQvEBnegqIJ7IwNVa
 njmv8vwqtMh0AS3HG6LNQIZ5zwdvZ/378WMHiJm7IusnSkz27NBkF+KOaiiqBWJx2xU0
 TN0jWBhfLdSVHTBgQyVZQvYn6bqU7af62S6NpTGCWaZ31hSPlzOtVoNocPze9UAFNdeK
 w4WA==
X-Gm-Message-State: AOAM5315Z06uyvVMgoBGEbaCFECHIWWzvahhXRlzNXR42m+SLBduClxJ
 aQm0EVM+DtZCfKbeXSfyM3E/0haYGlBcTwEB0yri6nIUE+uliW89W2zKhzU1j1K633GcRfFdDe5
 VwscTtBJ0m85qE/c=
X-Received: by 2002:a05:600c:284:: with SMTP id
 4mr18237253wmk.48.1597734579608; 
 Tue, 18 Aug 2020 00:09:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0mgplL6xYXSjmxFm6yndwaG6cBwjBMnaHU/N2AjQBqKEEfYZzdP4137XvsWD9K3RCyjI0dA==
X-Received: by 2002:a05:600c:284:: with SMTP id
 4mr18237228wmk.48.1597734579413; 
 Tue, 18 Aug 2020 00:09:39 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id 6sm31916446wmf.4.2020.08.18.00.09.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2020 00:09:38 -0700 (PDT)
Subject: Re: [PATCH-for-5.1 v2 0/2] stubs: Fix notify-event stub linkage error
 on MinGW
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20200805085526.9787-1-philmd@redhat.com>
 <ce101d90-910a-5906-4034-7d3aacbb3dc2@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <1922ebe5-6a8a-52a5-e8a5-50ea03a47fe7@redhat.com>
Date: Tue, 18 Aug 2020 09:09:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <ce101d90-910a-5906-4034-7d3aacbb3dc2@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 02:16:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pavel Dovgalyuk <dovgaluk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/20 8:37 AM, Paolo Bonzini wrote:
> On 05/08/20 10:55, Philippe Mathieu-Daudé wrote:
>> 2 trivial patches to fix the link error reported by Thomas:
>>
>>   LINK    tests/test-timed-average.exe
>>  libqemuutil.a(main-loop.o): In function `qemu_notify_event':
>>  util/main-loop.c:139: multiple definition of `qemu_notify_event'
>>  tests/test-timed-average.o:/builds/huth/qemu/tests/../stubs/notify-event.c:5: first defined here
>>  collect2: error: ld returned 1 exit status
>>  rules.mak:124: recipe for target 'tests/test-timed-average.exe' failed
>>
>> Philippe Mathieu-Daudé (2):
>>   exec: Restrict icount to softmmu
>>   stubs: Remove qemu_notify_event()
>>
>>  include/sysemu/cpus.h  | 4 ++++
>>  exec.c                 | 4 ----
>>  softmmu/cpus.c         | 7 +++++++
>>  stubs/cpu-get-icount.c | 2 +-
>>  stubs/notify-event.c   | 6 ------
>>  stubs/Makefile.objs    | 1 -
>>  6 files changed, 12 insertions(+), 12 deletions(-)
>>  delete mode 100644 stubs/notify-event.c
>>
> 
> Patch 1 will be superseded by Claudio's refactoring.  For patch 2 please
> respin according to the review.

The respin is available as <20200805100126.25583-3-philmd@redhat.com>:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg727616.html


