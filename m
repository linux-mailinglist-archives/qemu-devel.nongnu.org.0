Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB022B6BB4
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:28:37 +0100 (CET)
Received: from localhost ([::1]:40776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4mS-0006I8-Ll
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:28:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kf4km-0005mE-GC
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 12:26:52 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:36915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kf4kk-0002bR-P7
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 12:26:52 -0500
Received: by mail-wm1-x344.google.com with SMTP id h21so3979728wmb.2
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 09:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=qsyzZMeq8aidi9nA7AJx3SY7dRgdbzxyet8D12H3+7w=;
 b=YVMcpyBoWR5E7OaJzRUmVEoN+jmrKoTlMHuMfv4SDjHs4ccYoBdga90IcVrs1nNelo
 kooEu1AR6O9qqBiaa1x1ZjRNr2Oui9ozoERxz5aBr1J4WaDfe7WF3+7yWGpwVoElv1ex
 LRuP9bdNuzTTJPotBeiMmUwFoW5NdL2gV5OzyktyD7XoarSsj9L6e7FRBhgfA169o1z8
 VfVjWsJdCRDt54nAahFhZBI1up8tOvSeFB12D3WRZSRJqjSvlEzDAhEJK7bOn6vebU1o
 vitSwA52vJon57TD0Do+icN7xtA6PCAWA8FnfnMlereRdJiT3xTKXOAJ06+5aVCrtsIi
 +RRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=qsyzZMeq8aidi9nA7AJx3SY7dRgdbzxyet8D12H3+7w=;
 b=E9M1Ez1wiXjglJUzFrDdi3eMrS8mhM5BM4S3JbN9nONgEnrtggrmnYbh0cvUWsngk4
 hEGbHaxBgNLGb50bkmLHoerGuKDwo5YAAoeU+nLmBpwpe9yQ83jkFsduegHXr00zXAjP
 y75wwmu65tis5fOofgslFwybaFZAmDSTNwUHt5MYC4pKMTLzQ6Suuc/7XbQxekerY3SK
 hB2Sefm8ohYnIO4OEdbrQEuhOpPzlZZIIXrPqRZFOqhXGWLwEvUDItWY1WPvWlpRzg83
 GVp814kYxeKAsuFdPj3ZT+b2QX3SjTPMko/dXaUuA5r7Kqg9R4aikJTpSBAnb8eYzLVZ
 D6SQ==
X-Gm-Message-State: AOAM531+MM4RY1gqQKphMf43Q4s59Jqdd/wMoYDBAP/2kmEWaBRZbdIq
 lbFicgt+tfUsOX2NS0caqq89VQ==
X-Google-Smtp-Source: ABdhPJwtHkgqc9201aX5R85PXtmUn8rhllVTGJSXOOQ6XEbjnw9gs0sgoij27cbTyhPsslTAjnra+A==
X-Received: by 2002:a7b:c925:: with SMTP id h5mr143402wml.5.1605634008969;
 Tue, 17 Nov 2020 09:26:48 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x12sm22264114wrt.18.2020.11.17.09.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 09:26:47 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DD7101FF7E;
 Tue, 17 Nov 2020 17:26:46 +0000 (GMT)
References: <20201106032921.600200-1-richard.henderson@linaro.org>
 <CA+E+eSAOL+Gx=8X54HTFup5Qash7erpuCSY3_t2gynr1X27tXg@mail.gmail.com>
 <8b0e2ecd-0a2d-de71-2fa6-6e47758d4db6@linaro.org>
 <CA+E+eSB6xuwWDvfzbwY1D6mxXg78ouhNyvHgzeaUDwgBhvyjQA@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Joelle van Dyne <j@getutm.app>
Subject: Re: [PATCH v3 00/41] Mirror map JIT memory for TCG
In-reply-to: <CA+E+eSB6xuwWDvfzbwY1D6mxXg78ouhNyvHgzeaUDwgBhvyjQA@mail.gmail.com>
Date: Tue, 17 Nov 2020 17:26:46 +0000
Message-ID: <87blfvx5bd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Joelle van Dyne <j@getutm.app> writes:

> Sorry, are you asking for a review from me? I don=E2=80=99t know if I=E2=
=80=99m
> qualified to review the other patches but I did review the iOS patch.

Anyone can review code and given you wrote the original patches you
certainly know enough about the flow to give some opinion. If things
aren't clear then please do ask questions. The pool of TCG backend
reviewers is small enough and helping out does help.

Failing that you can always send Tested-by: tags once you've tested a
series on the HW.

>
> -j
>
> On Tue, Nov 17, 2020 at 9:20 AM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 11/16/20 7:47 PM, Joelle van Dyne wrote:
>> > Hi, I'm wondering what the progress is for this patch set and the iOS
>> > support one? I know 5.2 is frozen, so will this be considered for 6.0?
>> > Apple Silicon Macs are out now and a few people are asking about QEMU
>> > support :)
>>
>> Yes, this will be considered for 6.0.
>>
>> It does need to be reviewed more completely than a "LGTM", but there's t=
ime for
>> that.
>>
>>
>> r~


--=20
Alex Benn=C3=A9e

