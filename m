Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F31B2DBF9F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 12:42:50 +0100 (CET)
Received: from localhost ([::1]:59486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpVCj-0001tl-EH
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 06:42:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpV9z-0000fs-Kn
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 06:39:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpV9x-0005cr-In
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 06:39:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608118793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z9CVkegmeuS7j7b9dUL98T8QodYjwyt9k4dE/m2sI7Q=;
 b=RHNY3ngo68nVFBpXBwEHjH1CsUL0GHj83ehhpjtHQWAZX0iJRBF9TptofVaEzLfuRnLA7y
 IbH2KEKSpmIfz/RPfqLw4EEjRncJ977qNe2h+7VP7AlnI5E8NhxBQYELhqPilIXzrmypkE
 8p+qAtyo3bDJSGjyf7he4sMtnq9jJ8Q=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-eW31Zz9IOteBEocBtsrvKA-1; Wed, 16 Dec 2020 06:39:50 -0500
X-MC-Unique: eW31Zz9IOteBEocBtsrvKA-1
Received: by mail-ed1-f71.google.com with SMTP id dc6so11581745edb.14
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 03:39:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z9CVkegmeuS7j7b9dUL98T8QodYjwyt9k4dE/m2sI7Q=;
 b=apLoo/4dPZmpjxOTGCl+BJ3ARFC/FeTuvBkF2/xsLB2PZ9OF5KkdbyMG6WlmXp6bW2
 ZFySo4PSLOWIByPdeB6dVu23JtWgjNVEhrmuyKBt4ISgpGNNX1aTqnW+VqSLA4pP9eZv
 5U9kfnlq32mXksN9gOekzuLUi5fIofqK3kCm2K3vPhXtl9gtk9Q4DuHFbXsR6qGoireg
 HmQxvXOc/ED2hcpn1U3+hps/2kC2a/ANBZS/Xjhzl57RzJelTg4vhVqJqQFD0y9Tv23+
 hrfytCEOkZ8fcpGLAodJwVdh9IFMh4hYtwv5DyhEGP4ZxRhUSAAOyijzSkE0hacGssKp
 bnRA==
X-Gm-Message-State: AOAM531vakBEudsu6oBOUTrmH54brPsH/ba8TOBODM/kPUwJIbk5KYyz
 65lgDgdGYXlGEAzsqVCExSeFyfKHqgjRabcqJcCNC1hU/GRs5EtS7BJ+/dXz08p70uk3n5P01wG
 C/4NWDynTLIQRssVP7DPWd6u58j3kGM5AXVNbawcjRw20CyhUrUDEykT++nWvenz+pmA=
X-Received: by 2002:a05:6402:2292:: with SMTP id
 cw18mr33688645edb.336.1608118789243; 
 Wed, 16 Dec 2020 03:39:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdm/QZZT+ObEnNUxCMWmqGKUTE0+uPT3PG/C9+JmHYGOuRvVXLvtZ2Ml/MoyZNIvCaq1oljw==
X-Received: by 2002:a05:6402:2292:: with SMTP id
 cw18mr33688623edb.336.1608118788953; 
 Wed, 16 Dec 2020 03:39:48 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id ng1sm1201287ejb.112.2020.12.16.03.39.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 03:39:47 -0800 (PST)
Subject: Re: Are user static builds really dynamically linked ?
To: Peter Maydell <peter.maydell@linaro.org>,
 "Tj (Elloe Linux)" <ml.linux@elloe.vision>
References: <8732c6f5-34ac-dcce-ee9f-69e7dd612e4e@elloe.vision>
 <CAFEAcA8L2gHB6HMPO8YHNZff4pfp+VTrgK++3DH--OeqCZh-3w@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <afa57723-2ea1-d381-e548-30bd73e2885d@redhat.com>
Date: Wed, 16 Dec 2020 12:39:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8L2gHB6HMPO8YHNZff4pfp+VTrgK++3DH--OeqCZh-3w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/12/20 12:07, Peter Maydell wrote:
> On Wed, 16 Dec 2020 at 06:39, Tj (Elloe Linux) <ml.linux@elloe.vision> wrote:
>>
>> user --static builds are apparently resulting in dynamically linked
>> executables (to the glibc library, not other shared objects )
> 
> I think you mean that you end up with an executable that's
> dynamically linked but although it requires the dynamic
> linker (ld.so) it has an empty list of dynamic libraries
> (ie not even glibc).
> 
>> Concise summary:
>>
>> $ file ../qemu-aarch64_v*
>>
>> ../qemu-aarch64_v4.2.1: ELF 64-bit LSB executable, x86-64, version 1
>> (GNU/Linux), statically linked,
>> BuildID[sha1]=70f5e10ac0eb9b63d7758850e2f18d0a047d4b79, for GNU/Linux
>> 3.2.0, with debug_info, not stripped
>>
>> ../qemu-aarch64_v5.2:   ELF 64-bit LSB shared object, x86-64, version 1
>> (GNU/Linux), dynamically linked,
>> BuildID[sha1]=91fda2fa08f46d1bb6d19b6f72a4819a7c20fd7e, for GNU/Linux
>> 3.2.0, stripped
>>
>> $ ldd  ../qemu-aarch64_v*
>>
>> ../qemu-aarch64_v4.2.1:
>>          not a dynamic executable
>> ../qemu-aarch64_v5.2:
>>          statically linked
> 
> Something has definitely changed here. What you had with 4.2.1
> is what you should be getting. The obvious suspect is that
> something weird happened in the meson conversion...

Please send the (gzipped) build.ninja file.

Paolo

> 
> That said, there must be something specific to your setup which
> is causing this. I just tried (on Ubuntu 18.04):
> 
> $ git clone  https://git.qemu.org/git/qemu.git
> $ cd qemu
> $ mkdir build
> $ cd build
> $ ../configure --disable-system --enable-linux-user --static
> --target-list=aarch64-linux-user
> $ make -j8
> 
> and 'file qemu-aarch64' says:
> qemu-aarch64: ELF 64-bit LSB executable, x86-64, version 1
> (GNU/Linux), statically linked, for GNU/Linux 3.2.0,
> BuildID[sha1]=c3e1ffd0a2805a7043a40659ecbc7774cb42f7bf, with
> debug_info, not stripped
> and 'ldd qemu-aarch64' says:
>          not a dynamic executable
> 
> as expected.


