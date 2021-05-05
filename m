Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 282ED3738AD
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 12:41:25 +0200 (CEST)
Received: from localhost ([::1]:42038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leEy4-0005Ti-7d
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 06:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1leEuV-0000iO-Np
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:37:43 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1leEuT-0007V2-Me
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:37:43 -0400
Received: by mail-wr1-x42c.google.com with SMTP id l14so1276947wrx.5
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 03:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=dou4blMyX3Q0KvkRg2ZAZBd/b7MGORJL71zpLEWpHac=;
 b=up2Yo1pIMIPmFKv90lRXvYa2hNGKcReVQpPh5gErf2NI6u12M0Dlfi6gE1K3nKE+lN
 PXbg6dl+8w5SSL+iwSHmD7MkJs88S4gR+ru11L7eAkSDg745NXChhxnh9lWNMqNs+Vhj
 j/UuTx6jWw/sKuoxtIC4QygJ3jDdEVtBJRpgGTCiNcnI+TFM25d9kog9uEpJOJNusa3E
 uLoOQq2S0Er7Z1N5UyNC1JhNjaeVxLHmcY1kIZv84fhYUCmNTQI9t8uGN56UL8xM4dNs
 NS/z/anvDaYcFKG9yMioWsJttxorzWRiCPvZgdXVH2uAlvzs2pVv6nfBgnEpgCxe4HUf
 OuXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=dou4blMyX3Q0KvkRg2ZAZBd/b7MGORJL71zpLEWpHac=;
 b=k+7/ju0uDDpbLn7yUYFvMlUtgtQdQztGq79DJx3Tas3V66emRPXslnc43bz7PM1B/t
 Rtxq1NoSgPFeNZiPe7sPhBhvlXS7WgRH6k+Qf7GvOg7bnCQtmHsH0kBc9ZdDOaYGF62a
 plW4XiyF7P43bEdXBVXxJqseLH0b5DHOcnlt+hUYuIO3NWT6eRFM9S45pFcK72V6YwFI
 /Hnist9Hq50ZUGzmb5tgDqUNeZ0nJC5gwk7Tjt6pAxYVp5ftIyuyvI60SRiahdNYrjfB
 ktt4NZhdrYAhVWrIUQiOcG1r7kVZuIpPlsaeWUNoWpRW3fdvcEaxzW42yMb1uW1XNTKm
 oGsg==
X-Gm-Message-State: AOAM532mQXVdC9OUK/i25JewjcOBZx5EffVEIjKIDLiE4GpxdhTISYeh
 l7O9ydSHK4F4vTB3Oqamn+Oz4A==
X-Google-Smtp-Source: ABdhPJxBFHFpOeiKGsK2WQAb+xJ3nE4q8Qevw5Z86ilcpcvBHJ2X4pt0M9HXVoSod87TWCoCUxcXuw==
X-Received: by 2002:a5d:674c:: with SMTP id l12mr36802559wrw.357.1620211056214; 
 Wed, 05 May 2021 03:37:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s6sm5357097wms.0.2021.05.05.03.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 03:37:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0F1D11FF7E;
 Wed,  5 May 2021 11:37:34 +0100 (BST)
References: <20210505092259.8202-1-alex.bennee@linaro.org>
 <20210505092259.8202-6-alex.bennee@linaro.org>
 <YJJmYOWDl0UzziW7@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v1 5/7] docs: mark intention to deprecate TCG tracing
 functionality
Date: Wed, 05 May 2021 11:35:16 +0100
In-reply-to: <YJJmYOWDl0UzziW7@redhat.com>
Message-ID: <87lf8to49d.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 qemu-devel@nongnu.org, robhenry@microsoft.com, aaron@os.amperecomputing.com,
 vilanova@imperial.ac.uk, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, stefanha@redhat.com, mohamad.gebai@gmail.com,
 kuhn.chenqun@huawei.com, matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Wed, May 05, 2021 at 10:22:57AM +0100, Alex Benn=C3=A9e wrote:
>> Currently attempts to add a new TCG trace events results in failures
>> to build. Previous discussions have suggested maybe it's time to mark
>> the feature as deprecated and push people towards using plugins.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Luis Vilanova <vilanova@imperial.ac.uk>
>> Cc: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>  docs/devel/tcg-plugins.rst |  2 ++
>>  docs/devel/tracing.rst     |  7 +++++++
>>  docs/system/deprecated.rst | 13 +++++++++++++
>>  3 files changed, 22 insertions(+)
>>=20
>> diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
>> index 18c6581d85..edf04e3091 100644
>> --- a/docs/devel/tcg-plugins.rst
>> +++ b/docs/devel/tcg-plugins.rst
>> @@ -3,6 +3,8 @@
>>     Copyright (c) 2019, Linaro Limited
>>     Written by Emilio Cota and Alex Benn=C3=A9e
>>=20=20
>> +.. _tcgplugin-ref:
>> +
>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>  QEMU TCG Plugins
>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> diff --git a/docs/devel/tracing.rst b/docs/devel/tracing.rst
>> index ba83954899..6b0f46cd54 100644
>> --- a/docs/devel/tracing.rst
>> +++ b/docs/devel/tracing.rst
>> @@ -414,6 +414,13 @@ disabled, this check will have no performance impac=
t.
>>  "tcg"
>>  -----
>>=20=20
>> +.. warning::
>> +   The ability to add new TCG trace points relies on a having a good
>> +   understanding of the TCG internals. In the meantime TCG plugins
>> +   have been introduced which solve many of the same problems with
>> +   more of a focus on analysing guest code. See :ref:`tcgplugin-ref`
>> +   for more details.
>> +
>>  Guest code generated by TCG can be traced by defining an event with the=
 "tcg"
>>  event property. Internally, this property generates two events:
>>  "<eventname>_trans" to trace the event at translation time, and
>> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
>> index 80cae86252..0c9d3c1e1e 100644
>> --- a/docs/system/deprecated.rst
>> +++ b/docs/system/deprecated.rst
>> @@ -312,6 +312,19 @@ The ``I7200`` guest CPU relies on the nanoMIPS ISA,=
 which is deprecated
>>  (the ISA has never been upstreamed to a compiler toolchain). Therefore
>>  this CPU is also deprecated.
>>=20=20
>> +TCG introspection features
>> +--------------------------
>> +
>> +TCG trace-events (since 6.1)
>> +''''''''''''''''''''''''''''
>> +
>> +The ability to add new TCG trace points has bit rotted and as the
>
> When you say this "has bit rotted", just how bad is the situation ?
>
> Is the TCG tracing still usable at all, or is is fully broken
> already ?

Well patches 6/7 got it working for generic TCG things. I haven't been
able to get the architecture one working but I suspect that is some sort
of interaction between the per-arch trace header generation that I
haven't quite figured out yet.

It's currently broken without the included patches because it's not
really being exercised by anything.

>> +feature can be replicated with TCG plugins it will be deprecated. If
>> +any user is currently using this feature and needs help with
>> +converting to using TCG plugins they should contact the qemu-devel
>> +mailing list.
>> +
>
> Regards,
> Daniel


--=20
Alex Benn=C3=A9e

