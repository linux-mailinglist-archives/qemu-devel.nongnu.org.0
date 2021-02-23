Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F2E322A31
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 13:07:31 +0100 (CET)
Received: from localhost ([::1]:59692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEWTR-00051h-H3
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 07:07:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEWRz-0004as-3N
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 07:06:00 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEWRu-0005Sv-TA
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 07:05:58 -0500
Received: by mail-wr1-x432.google.com with SMTP id d11so2957971wrj.7
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 04:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=BExo7Xo7W1lwhqB8XpwJ43yMMEoId7SWdRhKGaTZwSk=;
 b=gU3Hy0btJuPjW5J1jQEc0wQwxOSGGwrATSlgMHqigBTFm+NhfVIP5r8v5nP3Ke2MVk
 6y0xwKddniDIi5IZ00wPXZciRdrchYLBVhJutKSKOw/ZWey8wCxAXHN+IQw4YXkCq3XK
 HKxWATqmEs7NZ6JnfjtFy3qzpdahytM6+RfmMrlO+yYqqWWPhiWGcnoH5Kk5/HbteSRG
 uSJuhVBMHMMtNIEsWf999wDFO/WWr5uPBjFIWqZ0Trg/7MqU6qtsebmQYEPJPRtQrLpC
 SvYpKBqTCWffgpo5Jmu+1T99MqXVWFE6WmZ4qD5s8Mz7ug/U9+0Cz4Q99v51lIre/ayN
 ptAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=BExo7Xo7W1lwhqB8XpwJ43yMMEoId7SWdRhKGaTZwSk=;
 b=Hdk775mnlyyxmg0ZQodaTdpGdiMc8v793MxjAjj0oPIuSJ3ho0MM8/FFn9rOh81QHA
 yxY8DX45gL5GQpbWLPM+hUUN4uluBMY3r44+zWa91oJ6UgLJ/mhZ5u6UOBCZ02xg5uPn
 RzDg/J4urKC2vLlZRdYnxZR4V7OmgTe70+c0g4zN0yI/oH9Eb6IGPLkccIkgsL2zaHg5
 HG2cG44C83X99LIk6xXG4zSIYrb+u5taUpime7IfcZxwfSBM85IxZijUI3MfW5kvYZmO
 TDI6PhUAr8sKDgyiJzUFv+3URTh7IlZGBbGdG86XSDN2g/ECXTj/UChftss/DlyFMqYC
 jVrQ==
X-Gm-Message-State: AOAM533VZ7m+HwJJot5RYjDPzidYjrjORT47zsrbnu/LqTFPFagFdv3T
 ElNCkxoIQz5cq9L3646hiqJ52A==
X-Google-Smtp-Source: ABdhPJxqpS2wMry3H1rlRay8Q9XYZ/hmjfEf+tDEyL+MKgoGOPdGpORToC1kRkDEMLIR6Ely8WeIUg==
X-Received: by 2002:a5d:4842:: with SMTP id n2mr14500933wrs.181.1614081953198; 
 Tue, 23 Feb 2021 04:05:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v1sm2376713wmj.31.2021.02.23.04.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 04:05:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AE7251FF7E;
 Tue, 23 Feb 2021 12:05:51 +0000 (GMT)
References: <20210223095931.16908-1-alex.bennee@linaro.org>
 <CAFEAcA-v51sgBiNs5hpHwyQx0X=rYdmaWYPesJ0pGy=+ufyi4w@mail.gmail.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] docs: move CODING_STYLE into the developer documentation
Date: Tue, 23 Feb 2021 12:03:43 +0000
In-reply-to: <CAFEAcA-v51sgBiNs5hpHwyQx0X=rYdmaWYPesJ0pGy=+ufyi4w@mail.gmail.com>
Message-ID: <87o8gb3s68.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 23 Feb 2021 at 10:02, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> There is no particular reason to keep this on it's own in the root of
>> the tree. Move it into the rest of the fine developer manual and fixup
>> any links to it. The only tweak I've made is to fix the code-block
>> annotations to mention the language C.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>> diff --git a/README.rst b/README.rst
>> index ce39d89077..f5d41e59b1 100644
>> --- a/README.rst
>> +++ b/README.rst
>> @@ -66,7 +66,9 @@ When submitting patches, one common approach is to use=
 'git
>>  format-patch' and/or 'git send-email' to format & send the mail to the
>>  qemu-devel@nongnu.org mailing list. All patches submitted must contain
>>  a 'Signed-off-by' line from the author. Patches should follow the
>> -guidelines set out in the CODING_STYLE.rst file.
>> +guidelines set out in the `style section
>> +<https://qemu.readthedocs.io/en/latest/devel/style.html>` of
>> +the Developers Guide.
>
> This is the first instance of a qemu.readthedocs.io URL in the
> tree. Do we really want to have our references to our documentation
> be to a third party website ?

Well I browsed to:

  https://www.qemu.org/docs/master/

which re-directed me to the readthedocs URL. However it looks like:

  https://www.qemu.org/docs/master/devel/index.html

DTRT so I can fix that.

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

