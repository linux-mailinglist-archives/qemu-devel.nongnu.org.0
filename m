Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F3831A35B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 18:12:48 +0100 (CET)
Received: from localhost ([::1]:56754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAbzr-0002MF-LP
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 12:12:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAbyx-00018B-Eh
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 12:11:51 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAbyv-0007xH-32
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 12:11:51 -0500
Received: by mail-wr1-x42c.google.com with SMTP id v1so4487wrd.6
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 09:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=5EEpL3LuF8nEL24QWPq5zw1x4JdAd89uache76FZUSA=;
 b=EWsXEZ37gGlwobetfreTLO8saX4TNP8XmbnvczbCzBQyEnGWF6wtgCtF/Bac7MIjK1
 VrZF1GI52J2StQBX2cv8+jx69xHaA6f/MoBMrIPI9HDNVNoqidvo6GLFltCP3lWd8+Xm
 WPPhsA5fIOFV4+7FjkoOsZ3KwbNy/tt2dSXyZCQ/yaERpJ3UWVzhkdVeIo+5lztBIKIZ
 72Kv/E6NxRD9RERJ6u65EEXkPMOJmMhKjp7X4E5o5cbsCBq3om1u3KeH4Q5h/LcunPzV
 tNfSrgsZpVFBzKQsblnDBPdpg07sVnGStgGmloCPW8lnvcym3oAUmJIkuRQk5K3LyKHM
 YK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=5EEpL3LuF8nEL24QWPq5zw1x4JdAd89uache76FZUSA=;
 b=WxIORtaavoezmYSLeCCAtoQk/4iqMNUb9Hf1ugJF2HqsOZFbNaUg8p0/ElMDk7JAgw
 uYZafHGLOIdeErb3E8seqri4QgN/yTSDZU2OLjrAXyll3lqpJdxW/C2fFOS7z2n275gu
 nG3PL4c5hqzDGpE6zKWhdP3TfTOMC9sXVDXUU+NloaJH4AYPNToeHPXfQjHTmFLvaYQr
 GTR+S3I7LY2ZhqKVUKbHHuM2rMNAsQjJob02Lc740EXz8WdyIhAVSsovkvleUxRQlUw8
 Gc7WoIry1iHmDsWjiX3IuNfvWUV55z02EDY/a+CSl8XiIIyL/e7XyDzE/srX/HLHI00i
 9toA==
X-Gm-Message-State: AOAM533kwz/XkVkReLwH6oStNXw2WHqgwdUl2EkjbXIksFyRka36svg5
 4Fd/byXuzXxTG8qJ6vlOXh5HWQ==
X-Google-Smtp-Source: ABdhPJx3IoVJyontiUM/q6MjOxIeYEMKZLxVLCWDPHNCQzy+3oipJDktBPKlndytOn3+jTp+zPDXMA==
X-Received: by 2002:a5d:4cd0:: with SMTP id c16mr4669437wrt.84.1613149907120; 
 Fri, 12 Feb 2021 09:11:47 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t9sm6870649wrw.76.2021.02.12.09.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 09:11:45 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1992F1FF7E;
 Fri, 12 Feb 2021 17:11:45 +0000 (GMT)
References: <20210210221053.18050-1-alex.bennee@linaro.org>
 <20210210221053.18050-17-alex.bennee@linaro.org>
 <ef56fb67-4424-335f-45d2-a96dcefb1b2f@amsat.org>
 <3b444f83-55cd-493a-d841-4bca87bac3e0@linaro.org>
 <b80367a8-9596-8e83-d013-8f4eea66e9a4@amsat.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 16/21] accel/tcg: actually cache our partial icount TB
Date: Fri, 12 Feb 2021 17:06:24 +0000
In-reply-to: <b80367a8-9596-8e83-d013-8f4eea66e9a4@amsat.org>
Message-ID: <87v9axxlbi.fsf@linaro.org>
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, kuhn.chenqun@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 2/11/21 7:48 PM, Richard Henderson wrote:
>> On 2/11/21 2:21 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>>>> -    insns_left =3D MIN(0xffff, cpu->icount_budget);
>>>> +    insns_left =3D MIN(CF_COUNT_MASK, cpu->icount_budget);
>>>
>>> Can you describe this change a bit please?
>>=20
>> Replacing a magic number with its proper symbol.
>
> I am confuse because I see:
>
> #define CF_COUNT_MASK  0x00007fff

This is the largest partial count you can store in the CF flags (0x8000
is used for LAST_IO). The decrement field can handle the full u16
although in practice I would never expect a final block to be more than
a few instructions. We could probably shorten the mask without any
deleterious effect if we needed to scrape together any more CFLAGS.

--=20
Alex Benn=C3=A9e

