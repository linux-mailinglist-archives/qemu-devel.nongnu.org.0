Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 791BF605FB7
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 14:05:37 +0200 (CEST)
Received: from localhost ([::1]:56578 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olUIc-0000nG-He
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:05:24 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olTYy-00035c-6L
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 07:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olT5Z-0007wL-3o
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:47:53 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:41585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olT5R-0004dQ-PG
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:47:48 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so1908932wmb.0
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 03:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xM04DnTcWuGHI7Nslu9WTfgjYxdY7ov/dfpvpa9LHgs=;
 b=zJ/yU8icMzgsXYHRirA2bFJwfo0r56Jz/CfYx6IgBu5F+j7Yn8L6ofWLDiygwQ4akm
 jwSd8Am1jTpPA6En0gZmYYlSX9lULalOE+deXdRnyXUzSBE30OUR/RxzREfqEmAcaXA5
 03mw2R7OYEGVhbz0TGuStL8OcbEULYgMb8JLN689aI037Vbg7YkyNJii9iBH84lf0h+a
 0KuRY0yUABdnARrkhMoepXaJiO5z/Gubs0FZvcnNcrWWOiiXITYGNp9aFoOVUyAVLhTo
 IyMvU015f8pijz+R7Ot4Bj8NYz5+yjSLqZIpkxET4n6003gVohiKqMYmOlXM074QMjpT
 iEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xM04DnTcWuGHI7Nslu9WTfgjYxdY7ov/dfpvpa9LHgs=;
 b=w5BX01nuScW/6RxqIaJgSoKPc3d3j6fOaXdmV+XpSNUDDGkT9vSW0a23HVxrozlKLb
 Fjx7+OpWoXMi/YbHoTEqR1/0nTR9OJ5LIllL8477unGcQlPo1oaMaOrDxpiLpxmOiAD3
 jFfp5vHg2TIFRetCBZAjI+eJgHO12R5fufOKgLFEVcbDWbKuJeiqrPFy2aEUrY3Y9kw4
 /qH5ZVARi0PRR6kHJWlEhh7oj9LYaPlL9dQvMrR2b6RZc9OiAiY3mQTUeJm+ZafTzKjT
 WezjpLF3AhwmnzIavhHQ0uyoijxX8TsVCrbdT+iQiN3AItghlpuiViCC0d0oe4FJeFU2
 DOVg==
X-Gm-Message-State: ACrzQf1wLGi6fX2IusfRbWfWxLIIgyjVKYw/XcyLT9oYNiqQ8dXAIXbA
 NGBV8Wrwmkhi+OoMiXoJfL3SUw==
X-Google-Smtp-Source: AMsMyM5ijHEVpDn1ehEyJ4WQDTWN+v3YIJecRJAcn+M3NpCZWy5QfKTylUk6Hhg/kfLd0rfk4unvfw==
X-Received: by 2002:a1c:35c9:0:b0:3c3:d9a:385f with SMTP id
 c192-20020a1c35c9000000b003c30d9a385fmr8646995wma.139.1666262860178; 
 Thu, 20 Oct 2022 03:47:40 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c315100b003b4a68645e9sm2586990wmo.34.2022.10.20.03.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 03:47:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1233D1FFB7;
 Thu, 20 Oct 2022 11:47:39 +0100 (BST)
References: <20221019025828.683113-1-ani@anisinha.ca>
 <20221019025828.683113-6-ani@anisinha.ca> <8735bjbzhf.fsf@linaro.org>
 <CAARzgwy96mb9=sQJhDn_ZpjxfTVRX4rCfEpuWnMZFcqYkq8rcQ@mail.gmail.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ani Sinha <ani@anisinha.ca>
Cc: Cleber Rosa <crosa@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Maydell Peter
 <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin
 <mst@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 05/10] acpi/tests/avocado/bits: add SPDX license
 identifiers for bios bits smilatency tests
Date: Thu, 20 Oct 2022 11:47:11 +0100
In-reply-to: <CAARzgwy96mb9=sQJhDn_ZpjxfTVRX4rCfEpuWnMZFcqYkq8rcQ@mail.gmail.com>
Message-ID: <87czamai0k.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

> On Wed, Oct 19, 2022 at 9:02 PM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>>
>>
>> Ani Sinha <ani@anisinha.ca> writes:
>>
>> > Added the SPDX license identifier for smilatency tests.
>> > Also added a comment indicating that smilatency test is run from withi=
n the
>> > biosbits environment/VM and hence is not subjected to QEMU build/test
>> > environment dependency fulfilments or QEMU maintanance activities.
>> >
>> > Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> > Cc: Paolo Bonzini <pbonzini@redhat.com>
>> > Cc: Maydell Peter <peter.maydell@linaro.org>
>> > Cc: John Snow <jsnow@redhat.com>
>> > Cc: Thomas Huth <thuth@redhat.com>
>> > Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> > Cc: Igor Mammedov <imammedo@redhat.com>
>> > Cc: Michael Tsirkin <mst@redhat.com>
>> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
>> > ---
>> >  tests/avocado/acpi-bits/bits-tests/smilatency.py2 | 4 ++++
>> >  1 file changed, 4 insertions(+)
>>
>> Thinking about this again, why not just merge this with the initial code
>> dump?
>
> I wanted to keep the original test scripts untouched from bits and
> make our changes in separate commits. That way it helps to understand
> exactly what we added/modified in the original bits test script.

That if fair enough as long as bisection isn't broken. Do the tests only
get run at the end of the series?


--=20
Alex Benn=C3=A9e

