Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF6D37C752
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 18:05:39 +0200 (CEST)
Received: from localhost ([::1]:37492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgrMg-0007d1-13
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 12:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgrDY-0003ve-K0
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:56:12 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:43834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgrDV-0006Rj-M8
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:56:12 -0400
Received: by mail-ej1-x634.google.com with SMTP id l4so35733619ejc.10
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 08:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=akLROyEp+YLqUBuRhdFEdu3VPEXWVcj5g0jkfCgj5xQ=;
 b=XuR0hbFuG7v+f8xGluFVRA0/1KyV4rx6eZvN2oXFt94dcLxPCTKWhqvIyCBDpOl07n
 XKHvN+YEhbEY9VT7ZTgI+tqi2rwDR951X4YBpHta0PsM6AZ3j8iiuijU6UyBiCIcAQnf
 OOfg/kX8Bj29WQmVWcVFFkAkAbWIxGdxB2K8lP/vK+Em/xeeG8BIK3ReLbQPdRwT50lx
 2l6bKUXiEa3Lv9JhxRGCaimy+4PM6qRhbcKZIiknRJuTE7M9JanGHh8MP7FSplZC9JQs
 RrSc74pFh8bzE2u180XMBiaRfeRrEslMvIxZ8rEI9Lq+LvsjqBpeyXbycPo2XUumXlxk
 scZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=akLROyEp+YLqUBuRhdFEdu3VPEXWVcj5g0jkfCgj5xQ=;
 b=YvqIJYB8Y15YYtadXH9Y+PB5URgZ7SVcq3tCEVlUYi1QUFW9QhQOvTfn+jPsw0+SDo
 6NUL+wcnvgZidWWEIRth9x2fhqNUCpNmPpz4DSdonGnohD/USC/1344SrI4Lp8nfCac1
 iKdOJ5qac2j/WQntcDA7wbEZCbV5q1tcKVf4h9etFcLiMHOy/ktdmT2Fymlx7dQxf8u9
 5IHpTa5K/4LIjJUHV47AhumEyvxcbeHTPJSOxXvk2doZgdzC96M4Wd++nC+p7aGyrSYK
 3nT90nVpvPOG+eY8SJBeFXtyTYZCigPSFwyphlELB3Z5zwjwuvvFzn4DttgP7Lesl33y
 kWDg==
X-Gm-Message-State: AOAM530voS63D7hzc0Pf26bjO42+ytFbY9UXE9lQ0J8APENhbRjmNL/Z
 LsOcyvPY/YQFUeG3AzJFQhD9wAKbQkTOZW0xz+a2Iw==
X-Google-Smtp-Source: ABdhPJxf8QNqQQEOdnBpIFjFMUKpSyYgOVAcBtmL0P5sVPvRkyoWlCt4bmDGhLq1HLOSG9b7f0sv2LvgYta0tGpl0QE=
X-Received: by 2002:a17:906:11cc:: with SMTP id
 o12mr38817895eja.85.1620834967765; 
 Wed, 12 May 2021 08:56:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210510130617.320981-1-marcandre.lureau@redhat.com>
 <CAFEAcA_mj-9EC2WhUKd4QN8xGk4JMjyr6_ycOD5ukZAGRdrjMg@mail.gmail.com>
 <CAJ+F1CLB4uMQsggZKX5kGBtSr14rZ7mW5rr4dwMi=hn4TTpHag@mail.gmail.com>
In-Reply-To: <CAJ+F1CLB4uMQsggZKX5kGBtSr14rZ7mW5rr4dwMi=hn4TTpHag@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 16:54:53 +0100
Message-ID: <CAFEAcA8L6Qks-bZtbpgbmSaKcGB2waTEKpOtvZ_PQ7vxdzZ2pg@mail.gmail.com>
Subject: Re: [PULL v2 0/1] readthedoc theme patch
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Wed, 12 May 2021 at 16:17, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Wed, May 12, 2021 at 5:47 PM Peter Maydell <peter.maydell@linaro.org> =
wrote:
>>
>> On Mon, 10 May 2021 at 14:06, <marcandre.lureau@redhat.com> wrote:
>> >
>> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >
>> > The following changes since commit d90f154867ec0ec22fd719164b88716e8fd=
48672:
>> >
>> >   Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.1-202=
10504' into staging (2021-05-05 20:29:14 +0100)
>> >
>> > are available in the Git repository at:
>> >
>> >   git@gitlab.com:marcandre.lureau/qemu.git tags/rtd-pull-request
>> >
>> > for you to fetch changes up to f1852f5d7e6fc2ead874261c0388b1889825700=
0:
>> >
>> >   sphinx: adopt kernel readthedoc theme (2021-05-10 15:12:09 +0400)
>> >
>> > ----------------------------------------------------------------
>> > Pull request
>> >
>> > ----------------------------------------------------------------
>> >
>> > Marc-Andr=C3=A9 Lureau (1):
>> >   sphinx: adopt kernel readthedoc theme
>>
>> NetBSD now complains:
>>
>> Configuring 60-edk2-x86_64.json using configuration
>> Program qemu-keymap found: NO
>> Program sphinx-build found: YES
>> ../docs/meson.build:30: WARNING: /usr/bin/sphinx-build:
>> Configuration error:
>> There is a programable error in your configuration file:
>>
>> Traceback (most recent call last):
>>   File "conf.py", line 154, in <module>
>>     import sphinx_rtd_theme
>> ModuleNotFoundError: No module named 'sphinx_rtd_theme'
>>
>> During handling of the above exception, another exception occurred:
>>
>> Traceback (most recent call last):
>>   File "/usr/lib/python3/dist-packages/sphinx/config.py", line 157, in _=
_init__
>>     execfile_(filename, config)
>>   File "/usr/lib/python3/dist-packages/sphinx/util/pycompat.py", line
>> 150, in execfile_
>>     exec_(code, _globals)
>>   File "conf.py", line 157, in <module>
>>     'The Sphinx \'sphinx_rtd_theme\' HTML theme was not found.\n'
>> sphinx.errors.ConfigError: The Sphinx 'sphinx_rtd_theme' HTML theme
>> was not found.
>>
>>
>>
>> Program python3 found: YES (/usr/bin/python3)
>> Program diff found: YES
>> Program dbus-daemon found: YES
>>
>>
>> as does freebsd and openbsd. Can we get the theme added to the VM
>> configs for those ?

> What is used for the BSD configs? If it's tests/vm, I don't see readthedo=
c being installed there, and vm-build-* should work (at least some work for=
 me, freebsd fails with ssh issue here)

It's tests/vm.  The build doesn't fail, but the printing of the WARNING
is caught by my wrapper scripts (which grep for various warning/error
words to catch issues which don't trigger complete build failures).
Adding the theme to the configs would mean that we can continue to
test docs builds on those platforms.

thanks
-- PMM

