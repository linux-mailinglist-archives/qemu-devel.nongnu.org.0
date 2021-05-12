Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C66937C770
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 18:21:29 +0200 (CEST)
Received: from localhost ([::1]:45488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgrc0-0008Gc-FW
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 12:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgrZF-0004d3-Hu
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:18:37 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:33764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgrZD-0004Qc-DQ
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:18:37 -0400
Received: by mail-ej1-x633.google.com with SMTP id t4so35917195ejo.0
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 09:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1CTVdN6oX5to/ullbOQmEafkbJqpMUF2CWPDPoLsbG0=;
 b=nJrReqP2tLCo++quek3sldHpMsGkauMnUfI5sAj9S4BjtVU+zPl7oTe5X4uNbKXDUL
 xJLC/u8oybOy43eqhqISYCRRnoYKq0lrOD21vy9L5N7FJv/5VLm92QyRTVF2e6GfMuCq
 B0ViAkgsi2bzVikWJfJBtd47z94eN3Y9+UmcnNkZ5mXUFhZ0MDqHVo8jbSPnI6Wtknrb
 wpojY0vjw6rmooVqsT+7aljWyjwRmn/j3MAmVbpxnFFZrpQPdikAbpUCCDUmCmpQSJhM
 Da0o7XPYXXbvBqV8QSvWZWX0BYDIAbfDXE8j/2iBTu0GqenlXTKlHFYTBJOznFnHmSvf
 fXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1CTVdN6oX5to/ullbOQmEafkbJqpMUF2CWPDPoLsbG0=;
 b=LTNfTP6ZOMjX43lsD3c6X/4nZSQ2i0Og8RR68Jl46rXjU3zR8S6S6I5knEE092Duag
 kW6CoTsU/KQCEuQ1lh2RYppmlX2m/JhHG0KUdxMi8cg2bFvLlXQftH3FkGBGh57uon3z
 awxw6l0IfXjfTx3T2psxZxsFAao7wAM6alK7R/2gAfLEeOzToLo6z1RT49BpjG9wEP68
 RyddBqDcrbtM1DqgVBBavkebkaEgj7GZkRHAL6nIAdVWWWJTWyZjgSo9wgJQqS0b7900
 vk6ZrCDgv+J0X0YLdSp/PXJuZtQSC1tzLXMvAgbwEnmbyhFvfCDbN/fvyTd8S8qT1G0S
 Q8IQ==
X-Gm-Message-State: AOAM530qK+wRDsm8KXcXeG/ltlQwO7hcN0PutuCSydNDMgr/B4npNPFm
 EWpYurb37/XeXped8yOY+aI11VEF4+m3O22iB+3lr8mSrFE=
X-Google-Smtp-Source: ABdhPJxsTVxYnhnS5SWLMdXMP9G5mW27J4NMWIwMC1J+ZIa/bFHydzoy7L6E4lSqk60klGePrYmys1ilITrB/wF76v4=
X-Received: by 2002:a17:906:eced:: with SMTP id
 qt13mr38157554ejb.382.1620836313745; 
 Wed, 12 May 2021 09:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210510130617.320981-1-marcandre.lureau@redhat.com>
 <CAFEAcA_mj-9EC2WhUKd4QN8xGk4JMjyr6_ycOD5ukZAGRdrjMg@mail.gmail.com>
 <CAJ+F1CLB4uMQsggZKX5kGBtSr14rZ7mW5rr4dwMi=hn4TTpHag@mail.gmail.com>
 <CAFEAcA8L6Qks-bZtbpgbmSaKcGB2waTEKpOtvZ_PQ7vxdzZ2pg@mail.gmail.com>
 <CAJ+F1CKBk2450Y85bcyneYHCbzBFq42Cruf1fRunXuzWB8sUVA@mail.gmail.com>
In-Reply-To: <CAJ+F1CKBk2450Y85bcyneYHCbzBFq42Cruf1fRunXuzWB8sUVA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 17:17:19 +0100
Message-ID: <CAFEAcA-ED+C+hnK_4jfK5JRLQ5mFW=XM-bPnD5O1ZmnEFH7XbA@mail.gmail.com>
Subject: Re: [PULL v2 0/1] readthedoc theme patch
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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

On Wed, 12 May 2021 at 17:02, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
> On Wed, May 12, 2021 at 7:56 PM Peter Maydell <peter.maydell@linaro.org> =
wrote:
>> >> NetBSD now complains:
>> >>
>> >> Configuring 60-edk2-x86_64.json using configuration
>> >> Program qemu-keymap found: NO
>> >> Program sphinx-build found: YES
>> >> ../docs/meson.build:30: WARNING: /usr/bin/sphinx-build:
>> >> Configuration error:
>> >> There is a programable error in your configuration file:
>> >>
>> >> Traceback (most recent call last):
>> >>   File "conf.py", line 154, in <module>
>> >>     import sphinx_rtd_theme
>> >> ModuleNotFoundError: No module named 'sphinx_rtd_theme'
>> >>
>> >> During handling of the above exception, another exception occurred:
>> >>
>> >> Traceback (most recent call last):
>> >>   File "/usr/lib/python3/dist-packages/sphinx/config.py", line 157, i=
n __init__
>> >>     execfile_(filename, config)
>> >>   File "/usr/lib/python3/dist-packages/sphinx/util/pycompat.py", line
>> >> 150, in execfile_
>> >>     exec_(code, _globals)
>> >>   File "conf.py", line 157, in <module>
>> >>     'The Sphinx \'sphinx_rtd_theme\' HTML theme was not found.\n'
>> >> sphinx.errors.ConfigError: The Sphinx 'sphinx_rtd_theme' HTML theme
>> >> was not found.
>> >>
>> >>
>> >>
>> >> Program python3 found: YES (/usr/bin/python3)
>> >> Program diff found: YES
>> >> Program dbus-daemon found: YES
>> >>
>> >>
>> >> as does freebsd and openbsd. Can we get the theme added to the VM
>> >> configs for those ?
>>
>> > What is used for the BSD configs? If it's tests/vm, I don't see readth=
edoc being installed there, and vm-build-* should work (at least some work =
for me, freebsd fails with ssh issue here)
>>
>> It's tests/vm.  The build doesn't fail, but the printing of the WARNING
>> is caught by my wrapper scripts (which grep for various warning/error
>> words to catch issues which don't trigger complete build failures).
>> Adding the theme to the configs would mean that we can continue to
>> test docs builds on those platforms.
>
>
> Didn't you install readthedoc manually there? I don't see those warnings.

No, I don't install anything manually on the BSD VM setups -- I just
use the tests/vm makefile magic to run a build-and-test.

thanks
-- PMM

