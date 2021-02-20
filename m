Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD0132072D
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 22:14:20 +0100 (CET)
Received: from localhost ([::1]:56606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDZZz-0004NJ-Js
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 16:14:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lDZZC-0003va-7Y
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 16:13:30 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:53639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lDZZA-0005gT-OI
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 16:13:30 -0500
Received: by mail-wm1-x329.google.com with SMTP id x16so10018693wmk.3
 for <qemu-devel@nongnu.org>; Sat, 20 Feb 2021 13:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=4Hiv2V2/gv+mRXIopufuqpSGHZNjJ5i7r2tbZxDInX0=;
 b=AMVTDvb+HG9TekVfZ71W56jUisUeOPXmdUwSVSVUBLzJZFQ35srLxacEwwlGyOcV+Y
 vl6zdEdnoic77uYMR1ixtmetqcvIj9Ygp9lxg+SH9pTURzJ7HBJXLXEpnZqPBJaJmyRn
 iTHf3md/vBt6YZkydBW90PaacgxKnYO7DA52d1asblZSVSjjeZ1/0jzE5NyfXx0dB1oU
 vNCNID2s41EinLmWTe/g2KhIZqbQXdw9NUxYGQ4/ov4vSjroa3DRcQxG6dGSLP1+7ffZ
 bnDl9qjl1Yx7A/rYxMVUJuH8v9xhXZKc5WNY/an8emUma9ykRvCnOfqzVCEkyiKSxCXS
 edQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=4Hiv2V2/gv+mRXIopufuqpSGHZNjJ5i7r2tbZxDInX0=;
 b=Nr2xujlAw29cA5okD7eAW+QrHlb0+UJTkJTVZFFYgYkOrL45TMO5eMT0zRVYmrfYDM
 Lg25YmBjATgxb33fqX6OUlD5i8DEXRPPv2SkYmBjvS1j8eIquFCfPJRtg4uez4+wcf8D
 CAWsdb7g8thIJmn6+iGLZdcGsHRMdtYDIklXS3L5nUYxZoKQo5jyCVwkAjwDtYmGo4al
 OdYJeE9KSaXM9JB/riw9zJITUrsZBjKUVl1p1czOD4XBogaFXOedrrtyd8J0bHkXdn3n
 qJjt3NnuQVJ8u7d/bxev2k7Bf6eTyf0iCVnvJvBl5p5fl7jYd8q6WJP6DH8ywy2uSIiu
 g7KQ==
X-Gm-Message-State: AOAM531F/BdjCsQaYBIVww/CdTZhQ1C0PyxNVWhdycIbO6cYy2BQI38w
 LETOgTRMJF6zGO30IIWalyA6GnVq/1/4JA==
X-Google-Smtp-Source: ABdhPJxWPFPru338o/pe4CRDUgRxUZB5S+a3CVemgdQq0/kcImvsWZ001mZZMyYcf2KeQ3JAoFmmCg==
X-Received: by 2002:a1c:9d0c:: with SMTP id g12mr11125013wme.160.1613855607253; 
 Sat, 20 Feb 2021 13:13:27 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k15sm18194825wrn.0.2021.02.20.13.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Feb 2021 13:13:26 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 62D211FF7E;
 Sat, 20 Feb 2021 21:13:25 +0000 (GMT)
References: <20210219110950.2308025-1-thuth@redhat.com>
 <ca4a7cf3-c0b8-2074-d288-d402e5900cf9@amsat.org>
 <c429f806-ae37-9939-d215-fe98bffb84dd@redhat.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] gitlab-ci: Remove unused container images
Date: Sat, 20 Feb 2021 21:11:44 +0000
In-reply-to: <c429f806-ae37-9939-d215-fe98bffb84dd@redhat.com>
Message-ID: <87tuq6jvd6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> On 19/02/2021 13.00, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 2/19/21 12:09 PM, Thomas Huth wrote:
>>> We're building a lot of containers in the gitlab-CI that we never use.
>>> This takes away network bandwidth and CPU time from other jobs for no
>>> use, so let's remove them for now. The individual containers could be
>>> re-added later when we really need them.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   .gitlab-ci.d/containers.yml | 92 -------------------------------------
>>>   1 file changed, 92 deletions(-)
>>=20
>> I'm not enthusiast with this patch because I use various in this list
>> from time to time for testing or cross build/disas binaries.
>
> When I look at our current huge list of containers, I wonder how do we kn=
ow=20
> which containers still get used (in the sense of not only build), and whi=
ch=20
> ones are likely already bit-rotten? And why do we need that many containe=
rs?=20
> Why both, debian-arm64-test-cross.docker and debian-arm64-cross.docker an=
d=20
> not combine them?

debian64-arm64-test-cross is based of testing because we need a newer
GCC than the QEMU cross compiler to build the SVE and MTE tests for
aarch64 check-tcg.

> And why do we need that many individual cross-compiler=20
> docker files if we already have debian-all-test-cross.docker that can be=
=20
> used to test most of them? ... for me, as a docker ignorant, this is all=
=20
> very opaque and some clean up IMHO could really help here.

Because it's quite heavyweight for users who may only be building one or
two arches to pull down all the compilers in one image.

>
>> Not having
>> these containers used mainstream probably show the failure of the
>> project to add good testing coverage on these targets. Most of them are
>> for hobbyist with little time. Removing them will make it even harder
>> to add tests.
>
> Do you really use the docker files from the gitlab registry? I'd rather=20
> expected that people build those locally in case they need them...?
>
>> Can't we keep them disabled? Or put them in manual mode?
>
> Well, I guess manual mode is fine, too, as long as they don't waste CPU=20
> cycles and network bandwidth anymore for most people who don't need them.
>
>   Thomas


--=20
Alex Benn=C3=A9e

