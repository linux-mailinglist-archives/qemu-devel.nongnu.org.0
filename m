Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 911AE20AECC
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 11:14:09 +0200 (CEST)
Received: from localhost ([::1]:53522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jokQy-0006Qo-Ks
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 05:14:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jokQ5-0005ZY-Qj
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 05:13:13 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:49610
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jokQ4-0004DJ-23
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 05:13:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593162790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7Buvwg3FMBTf9SKmMoZdpP9V9sceOXiH8nSS9AaxJ7k=;
 b=CyFXF3RsFnaIrcAdolyHI0ihLT6cPdKeWLSA9uvfK8ruXM/KjdmmgW7wZJwYsvP1Z6ruyk
 +zN3y7Zq+eTLxqodxhlLdfRcWLb6PDo+AoKVENT0PCTgwiR+1SDEQtNBLgnTETog4D08j4
 xvmUdU+p6yQB7JHP7Lp+fy+yEIb/ST4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-pUooICQEPsu8h2MWwZhq5g-1; Fri, 26 Jun 2020 05:13:05 -0400
X-MC-Unique: pUooICQEPsu8h2MWwZhq5g-1
Received: by mail-wr1-f70.google.com with SMTP id o25so10063145wro.16
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 02:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=7Buvwg3FMBTf9SKmMoZdpP9V9sceOXiH8nSS9AaxJ7k=;
 b=HicjBqCfEj6wBbKPtZh467emsgcXyo9Olahl9dyfLTyl5C0uT1blTn8/Fd72+yWQ0d
 3Nlb8GTtvDachvhUjhdevuQwJfK4JfQtHIqPkgFa+r06bFKgy/hV8s8xDqGLCpQj5k65
 MSpS9ur6NpMAJU0huLcAbCdy7xpKBZaicmgZ14SFOSH/7gJx4tpS/ldyrsTjZ2/Bn4Ky
 /nCYiytTX09aWrwOGEEMtlgWV26dhzL4C78mKWB5wFv3he8+/LClXuBgYjvPkFpz4toX
 QT6nm5Lsxe30A+jsmHOed7OeIoSAomlnQ6CLbZxv2aWXOqphzBCDxFZO/J+tAYPV1jtp
 yCjQ==
X-Gm-Message-State: AOAM531etGhokAw6nXiNH9PSWmEy7vHJ+Jrrrz1wR+zftWnWNoQS0xui
 Nz+eQsORv0vlV0l8+GPHeKQNhiI2nrsKX28s1YSONR5IqxoBouhKQTPPyHyc+Gw5L1UUAYKR5et
 U6xpBKKnY1SAY7C4=
X-Received: by 2002:adf:a396:: with SMTP id l22mr2670472wrb.24.1593162784485; 
 Fri, 26 Jun 2020 02:13:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeu/lbarqE6GOUSLZB3BZ820TafXguXOtDwkJhX3tFDI0qegy99pJed3HL5rwbdiKcOY4s5g==
X-Received: by 2002:adf:a396:: with SMTP id l22mr2670442wrb.24.1593162784209; 
 Fri, 26 Jun 2020 02:13:04 -0700 (PDT)
Received: from [192.168.1.37] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id j41sm37630150wre.12.2020.06.26.02.13.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jun 2020 02:13:03 -0700 (PDT)
Subject: Re: [Bug 1885247] [NEW] Build error in Intel 32-bit hosts
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Bug 1885247 <1885247@bugs.launchpad.net>, arilou@gmail.com,
 Paolo Bonzini <pbonzini@redhat.com>
References: <159315507826.13901.17398620572438937429.malonedeb@wampee.canonical.com>
 <CAHiYmc7_ra2qWJ8mkZ-vqL5vN2BKdWxAZeKNnMEkPtien5-fsw@mail.gmail.com>
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
Message-ID: <b34bf27c-3189-addc-0c50-b0c0c533876d@redhat.com>
Date: Fri, 26 Jun 2020 11:13:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAHiYmc7_ra2qWJ8mkZ-vqL5vN2BKdWxAZeKNnMEkPtien5-fsw@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 03:23:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/26/20 9:37 AM, Aleksandar Markovic wrote:
> пет, 26. јун 2020. у 09:11 Aleksandar Markovic
> <1885247@bugs.launchpad.net> је написао/ла:
>>
>> Public bug reported:
>>
>> The code base is on master, checked out on Thursday June25th 2020,
>> 0250c595c9d. The build procedure:
>>
>> $ mkdir build-gcc
>> $ cd build-gcc
>> $ ../configure
>> $ make
>>
>> The build error message is:
>>
>>   CC      x86_64-softmmu/hw/hyperv/hyperv.o
>>   CC      x86_64-softmmu/hw/hyperv/hyperv_testdev.o
>>   CC      x86_64-softmmu/hw/hyperv/vmbus.o
>> /home/rtrk/Build/qemu-master/hw/hyperv/vmbus.c: In function ‘gpadl_iter_io’:
>> /home/rtrk/Build/qemu-master/hw/hyperv/vmbus.c:386:13: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
>>          p = (void *)(((uintptr_t)iter->map & TARGET_PAGE_MASK) | off_in_page);
>>              ^
>> cc1: all warnings being treated as errors
>> make[1]: *** [/home/rtrk/Build/qemu-master/rules.mak:69: hw/hyperv/vmbus.o] Error 1
>> make: *** [Makefile:527: x86_64-softmmu/all] Error 2

FWIW there is no CI job covering x86 KVM on 32-bit host build.
Should this be covered? I guess the problem is no CI services
provide 32-bit x86...


