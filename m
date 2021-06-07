Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D275139D987
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 12:22:16 +0200 (CEST)
Received: from localhost ([::1]:34478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqCOd-00047Q-TE
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 06:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqCHs-000199-K8
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 06:15:16 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:55244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqCHq-0006rr-Rl
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 06:15:16 -0400
Received: by mail-wm1-x32c.google.com with SMTP id o127so9650257wmo.4
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 03:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=0tG58hq+kZgcLua2n9MkUg4oj/u62eyv88AkQlbbNfM=;
 b=ioHfnHMOXSqbGWzqIC/yKaAwq9p0iNi3ap7GXn8XzJp9J7zQozubo5qAEJhIi1h8mD
 dkoQA/sNRNCVZEtIZliCpjHVrcjwYOtoMkz/2raVlMXWJwrLx6IsZQxjKB6et3TG9MqH
 h0kFQ8Kke3EDOeArTYynu2Ua2i6gBVE88+hIsUqoO7qdNCTpOnhm5IEAFjK9aqRUz+Wu
 obS2JOWTySuI37Jcj/TMfvvKyLsfsidSv081zqYGMB6nJS2nSYWVhHWjuC34edcf1De9
 Sjkeg68FtCTrz8q7sI/HEP+sZvtkBQ2ts9fdjP5BXEn1oCMTfu7/BN+r5FDvbTRum0ik
 VT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=0tG58hq+kZgcLua2n9MkUg4oj/u62eyv88AkQlbbNfM=;
 b=daRTrEQOFVtzQIWynqOAgz3ZZXAgrYBHjnTior0RGWYl+AUZYYFMY5sspcFjTA7BPo
 9wM7flDY7silKtHIv0IjzXNF9gTpNwu7EF0D488OjuBhlGjgERMCUFnBX0ZBUb3N2nvj
 ihQDc1j/wuHYjm2+8WeYFW1frrLLj06VaOiV8Rq6goz2eWymI6f1JFZdnKAil55nWTom
 oInK/iFfINU+/M/Ilx7p4uMvefc0zvBnRrSEk41v1lsnEhOQXsfKZQGub5o3KNy4jet0
 Y1LBuoLky6o0RRm7flmbsfIE6drLeQe9+nYCO3ITWnxtMhTmCUK55H8pu3TBgbGrvDjW
 0Elg==
X-Gm-Message-State: AOAM532FkM6PGmxx3RFo6Ydm5+zgz2zdKaSR1DgA+fWurX9FYz3HpodE
 clRWmTh6pcoc34/eV/6yulTRag==
X-Google-Smtp-Source: ABdhPJxs6UQ/5NMokcKRly2f8dYMUl0fUnS0wOUOygAY7SZT29e0kuFomKuSDdDNag0hULmP4RCnGg==
X-Received: by 2002:a7b:c761:: with SMTP id x1mr16482896wmk.118.1623060912651; 
 Mon, 07 Jun 2021 03:15:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o11sm394047wmq.1.2021.06.07.03.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 03:15:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C8B011FF7E;
 Mon,  7 Jun 2021 11:15:10 +0100 (BST)
References: <OS3PR01MB61515F08F0709D9E22B8DDDFE9249@OS3PR01MB6151.jpnprd01.prod.outlook.com>
 <TYCPR01MB6160FB4A9712F3F5E14D8BBAE93E9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <CAFEAcA_fZ_jC640XrFUCSk6YxzoSmdwDaMDAXoX47mBFKdS9hg@mail.gmail.com>
 <a56283b3-3bb2-d9a3-9a6e-8175cc17b376@linaro.org>
 <TYCPR01MB6160998DCE40866CDC3134BBE93C9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <65323e52-789c-567a-3446-ccb7709877e2@linaro.org>
 <TYCPR01MB6160266A2DFDE090276C44D0E93B9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <CAFEAcA9vttSZRRX_DS7p6Hgo-4zbhDfkSd0jb-+LJZUOLrumAA@mail.gmail.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC] Adding the A64FX's HPC funtions.
Date: Mon, 07 Jun 2021 11:14:38 +0100
In-reply-to: <CAFEAcA9vttSZRRX_DS7p6Hgo-4zbhDfkSd0jb-+LJZUOLrumAA@mail.gmail.com>
Message-ID: <87o8cinfpt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 4 Jun 2021 at 09:29, ishii.shuuichir@fujitsu.com
> <ishii.shuuichir@fujitsu.com> wrote:
>>
>> Hi, Richard.
>>
>> > Well, Peter disagreed with having them enabled by default in -cpu max,=
 so we
>> > might need at least one extra property.  I see no reason to have three
>> > properties -- one property a64fx-hpc should be sufficient.  But we mig=
ht not
>> > want any command-line properties, see below...
>>
>> I understood.
>>
>> > For comparison, in the Arm Cortex-A76 manual,
>> >    https://developer.arm.com/documentation/100798/0301/
>> > section B2.4 "AArch64 registers by functional group", there is a conci=
se
>> > listing of all of the system registers and their reset values.
>>
>> Thank you for the information.
>>
>> > The most important of these for QEMU to create '-cpu a64fx' are the
>> > ID_AA64{ISAR,MMFR,PFR} and MIDR values.  These values determine all of
>> > the
>> > standard architectural features,
>>
>> The values of ID_AA64{ISAR,MMFR,PFR} and MIDR are not listed in the spec=
ifications published at this time.
>> Of course, they are listed in the A64FX specification document managed w=
ithin Fujitsu,
>> but we cannot tell how far these setting values can be disclosed
>> without checking with the A64FX specification staff within Fujitsu.
>
> If somebody has access to A64 hardware they could write a minor kernel
> patch to just print the values...

We do have access to some a64fx hardware I think... or at least there is
some in the lab that tcwg can get access to.

>
> -- PMM


--=20
Alex Benn=C3=A9e

