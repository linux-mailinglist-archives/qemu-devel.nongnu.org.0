Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 353F434D45F
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 17:58:10 +0200 (CEST)
Received: from localhost ([::1]:39690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQuHJ-0006Al-9p
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 11:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lQuG6-0005fE-3m
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 11:56:54 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:42526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lQuG2-0005eJ-Nw
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 11:56:52 -0400
Received: by mail-ed1-x52b.google.com with SMTP id l18so14785143edc.9
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 08:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dVeKkMyy2/4+QYDHHGfgV4dPPcvJ0clu2PEPPyULR4g=;
 b=DcBj1wCnO2SJ3yACD6nJoDBPltYTJ1nB7U5cNolSYMa2doLpc0xYwySKR48l8yttc3
 PnXf6s1yUsruJi2Rt3CUezLSl7tsqom0TDCDP143CM+nbba+ynC4gHNt2IMUlK6IAp2R
 bKC3aPRwGO5ivYTRakcaqGxusOJ6sKv8DMeBNSmQKn+7/D8yfbAzyeqxGaxZUAkxRsIV
 Gf9UDNgEr6RFz7b9aICd9KI2x4t3ixJUHyQDsW3LLkxX7y6d80CVcfrsKv82f3EUZLeQ
 LT4VN/IsV22yY+u9GR6mdp6lBvsL18y4+7sdZ4t4YQMQ9tGTmXNd1e+QzjXJg3He+SHy
 pWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dVeKkMyy2/4+QYDHHGfgV4dPPcvJ0clu2PEPPyULR4g=;
 b=XZaGSTYc0HAHP42OoyBhL1sxq5pDoYf6pLlSYC7+UMw7shtmjiin4j0acUQ0YaSE8h
 OkrNkZQJsjZD3utsAERptpnNUBiPk+UBta9iJ/IaP7QryX03GsDvrMAJTGaBF1pFIhWu
 33B0FCAnT2bgxKvFHv4LZPT1bl+d0RxGCJZVqdkE9EFjJzu1fVAnUib6XKQTWr+aOslp
 eb4HKyXLrf8G/L8bRswxA4iBjxe4ltPDOHkV5uhy2UbFZ0EJr71QqsLm9pBrWcPyfkqu
 Hn86xLI1zqxuH9VabqjF+e22BZRIlXud/PRicn1Zkiybo2nI1mqt/KZyr2Lqo+eZ5kkW
 vO4w==
X-Gm-Message-State: AOAM532uZJZ49IUZn5HVDIEboV2uqs238HJ17uTRvn50alOcH1kUrUQ+
 KPNMBrmGrK2EFv0Ef4hCglFr+kZznLVPPKntIWCtew==
X-Google-Smtp-Source: ABdhPJx9BgF87WlBV4EF6idan4l+5m/UH9vvPtEVuE/wyGmUaBL6i93dZzlz3FR6ARstRyXXvC4aCY2crJvJvx91sOY=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr28637241edu.100.1617033408640; 
 Mon, 29 Mar 2021 08:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210328184533.752840-1-marcandre.lureau@redhat.com>
 <CAFEAcA9FiNLr=CsxRLpUbMgROMBmO-8WoPtEkfL4b4+ZHrAhdA@mail.gmail.com>
 <CAJ+F1CJK450rAMA7VU2b7VFL0FK6f3mkR=kwPB+d5M4DozRHFg@mail.gmail.com>
In-Reply-To: <CAJ+F1CJK450rAMA7VU2b7VFL0FK6f3mkR=kwPB+d5M4DozRHFg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Mar 2021 15:56:17 +0000
Message-ID: <CAFEAcA_i-jx4PvDSqcZ12TWtJMzRoEBGO3tUbUJqU1voecksaw@mail.gmail.com>
Subject: Re: [PULL 00/10] For 6.0 patches
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: Lukas Straub <lukasstraub2@web.de>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 29 Mar 2021 at 15:17, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Mon, Mar 29, 2021 at 5:54 PM Peter Maydell <peter.maydell@linaro.org> =
wrote:
>>
>> This produces a backtrace from sphinx-build which nonetheless doesn't
>> cause a build failure:
>>
>>
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
>
>
> ../docs/meson.build:30: WARNING: /usr/bin/sphinx-build-3:
> Configuration error:
> The Sphinx 'sphinx_rtd_theme' HTML theme was not found.
>
> ../docs/meson.build:32:6: ERROR: Problem encountered: Install a Python 3 =
version of python-sphinx and the readthedoc theme


So why do you get that message, and I see the above? Older
sphinx-build ?

Also, if this isn't fatal (the build does continue), meson
shouldn't print ERROR here, ideally.

>> Program python3 found: YES (/usr/bin/python3)
>>
>>
>> In particular I see that on all the BSD VMs. If we're going to
>> require rtd that means we need to ensure it's present on all
>> the VM configs, docker configs, everything the CI uses, etc.
>> You should also flag up new build-deps in the pullreq cover
>> letter.
>
>
> I updated all docker configs. We don't have sphinx in the BSD VMs apparen=
tly, am I wrong?

We must do, because trying to build this merge in the VMs produces
errors from sphinx-build...

-- PMM

