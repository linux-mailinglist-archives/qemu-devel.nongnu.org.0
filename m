Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2FB6074A0
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 12:07:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olowE-00030z-Uq
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:07:40 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloO2-0002iq-E3
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oloNp-00024n-MN
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:32:07 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oloNo-0006JR-39
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:32:05 -0400
Received: by mail-wm1-x333.google.com with SMTP id y10so1831570wma.0
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 02:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lqq4zzBhlmooFt4FjzKzSd74kR82FUfV6MQzCvUbGfM=;
 b=HOfmmAkoYAB/6RWVnJ5t+WcKhBJPfREl5NGfaXDCZ7WWmTPxftiE3bzHrMb+Z9is6p
 ka8C2pManh7RpXJft3uWB7qbpyCeOfznm6InYEJ3dEm8/OHYB9zzeyUPwAPxECrj1gvF
 SmFvNy0G1imgYDkOIbHCML4KFUOVsTN3DrGz2eZSlWjIlm27/xfOgHemxSq4N37lgm97
 hkHnD8hj2qxeYzc5gnnvq2um3OM+2C1wEre/gqPgHgVVNgM/q9UkoyDQPz7ears7r1tN
 ueYGvIwKLUlx0kbFSFlWzvGJn3J83oZODNN/SDquQSrdlaR45x3HQwsyohRMaublnYXt
 Zlxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Lqq4zzBhlmooFt4FjzKzSd74kR82FUfV6MQzCvUbGfM=;
 b=SV97h7rNg7eDUMv6mwBR8m3+l8l2eCIIq65lz6jQ/ga6I6Jj1HQ90F7OApl7e6XSVT
 SabgFq0V9uVfrgI1VbEUgDhdVXrfqSZgRXo/pFjmj1DheRYk5eciKYPwf1JV2TgxTz4n
 /hzDij8gPR8B80isGmFHb4ZmWpFpuqopKOIWLTDsu7TUnqvFN34sqIAujExm9uX3+11s
 GTe3sdKcnamV/UMJHK1SofLJvttTTv+98WzTcmXWT3UV4eEo8MmKUfR+WP+mMDfaod0d
 ur7cK2IUJriHnsbIULXMPd+GTbT4JnGrZmdXSA0h6tVmIcYyaEBDWl0OssD1vYYHJgTi
 4zNQ==
X-Gm-Message-State: ACrzQf1JAN7Dc3LOK7D+P4kXYU3EMnzYwIAzaq3JQXiHvnvdLL2ji/Ox
 R7jTaoXnoYqtORMfssl9tsJ43g==
X-Google-Smtp-Source: AMsMyM7F8na6H5F/7PBnBqUkkxX44r7NNIEVUmj8Uo2NgcFPcUimKHSAISgkNg+Lku4jWRRjFCKD3A==
X-Received: by 2002:a05:600c:3b1d:b0:3c6:ff0d:6a60 with SMTP id
 m29-20020a05600c3b1d00b003c6ff0d6a60mr12013977wms.183.1666344722261; 
 Fri, 21 Oct 2022 02:32:02 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 fc19-20020a05600c525300b003b505d26776sm2591355wmb.5.2022.10.21.02.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 02:32:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 36E1A1FFB7;
 Fri, 21 Oct 2022 10:32:01 +0100 (BST)
References: <20221020123506.26363-1-ani@anisinha.ca>
 <20221020083810-mutt-send-email-mst@kernel.org>
 <CAARzgwwd_How_h+9sHWPOrWWZ7CbX+DN-uy-KiGf1VVyVmrLnA@mail.gmail.com>
 <20221020084311-mutt-send-email-mst@kernel.org>
 <CAARzgwxfKbrxAqb15GXp4j1enDPUhGBsL5jUzFtDvJkGM-7azw@mail.gmail.com>
 <20221020150857-mutt-send-email-mst@kernel.org>
 <CAARzgwwDjjHL-1fEeuySNZm8NbnGNaeE5h6zrPz_zaANfs5dsw@mail.gmail.com>
 <CAARzgww8P4Za=+r8q2a30TCY7Uzw6g2tgHeLLKr7R+WV-7qQVg@mail.gmail.com>
 <20221021042449-mutt-send-email-mst@kernel.org>
 <CAARzgwyW+ved0iVinWzSCg+KSCL67v+m6KySRdg_hUUev8JLDA@mail.gmail.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ani Sinha <ani@anisinha.ca>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Igor Mammedov <imammedo@redhat.com>, John Snow
 <jsnow@redhat.com>, Maydell Peter <peter.maydell@linaro.org>, Paolo
 Bonzini <pbonzini@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,
 Qemu Devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, Wainer
 dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v6 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
Date: Fri, 21 Oct 2022 10:30:09 +0100
In-reply-to: <CAARzgwyW+ved0iVinWzSCg+KSCL67v+m6KySRdg_hUUev8JLDA@mail.gmail.com>
Message-ID: <87k04t7ca6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Ani Sinha <ani@anisinha.ca> writes:

> On Fri, Oct 21, 2022 at 2:02 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>
>> On Fri, Oct 21, 2022 at 05:45:15AM +0530, Ani Sinha wrote:
>> > And have multiple platform specific branches in bits that have fixes f=
or those
>> > platforms so that bits can run there. Plus the existing test can be en=
hanced to
>> > pull in binaries from those branches based on the platform on which it=
 is being
>> > run.
>> >
>>
>> What a mess.
>> Who is going to be testing all these million platforms?
>
> I am not talking about branches in QEMU but branches in bits.
> If you are going to test multiple platforms, you do need to build bits
> binaries for them. There is no way around it.
> bits is not all platform independent python. It does have binary executab=
les.
>
> Currently bits is built only for the x86 platform. Other platforms are
> not tested. I doubt if anyone even tried building bits for arm or
> mips.

I'm not worried about test bits on other targets, but we do run x86
targets on a number of hosts. The current reliance on a special patched
host build tool for only one architecture is the problem. If  we just
download the iso that problem goes away.

> It makes sense to try things incrementally once we have something going.
>
> Lets discuss this on a separate thread.
>
>> All this does nothing at all to help developers avoid
>> bugs and when they do trigger debug the issue. Which is
>> after all why we have testing.
>> Yes once in a very long while we are going to tweak
>> something in the tests, and for that rare occurence
>> it makes sense to periodically rebuild everything,
>> otherwise code bitrots.
>>
>> But the test is supposed to run within a VM anyway, let's
>> have an image and be done with it.
>>
>> --
>> MST
>>


--=20
Alex Benn=C3=A9e

