Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7867A35DB31
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 11:32:11 +0200 (CEST)
Received: from localhost ([::1]:37984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWFP0-00070n-HM
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 05:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lWFNR-0006Yz-6j
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 05:30:33 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:45022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lWFNP-0005Vs-0F
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 05:30:32 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 j4-20020a05600c4104b029010c62bc1e20so8350919wmi.3
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 02:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=I4heae6Mi9QpmIx7cfNj9ZfNtGCwj5S0bJBS5h7o3r8=;
 b=OQqNfS3q+nyUjaNV0wIrVFwYY5qHVAz7lM+ZO5D06gCmUzu/kp4/ET7IyKlL9Fna/K
 xBrHH77/vl8xsNQRrFPFPQSzw8zaTMDq/G5nk/+q/e6TtJ6HW8NVCuvemMGUcE4MnODt
 uMyYkIPHnWGYw2y8niMquGx8CWu83XjLaFGXNluld79Yb3T8kXPv+Ls3nj5XwkYSE1kG
 +xraXf+hkhdbcGCN23mw40fmXBpGIdOB68n5wiSLl5VHg8rhGZJnVqHReIrAr+tSe881
 e0DBXEQKwV4Xm2rl2jjp3yUq0rwf9jctbDGMP2guioLHG6qnLEIAcr6LvfhbBUTPQ0U5
 iy5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=I4heae6Mi9QpmIx7cfNj9ZfNtGCwj5S0bJBS5h7o3r8=;
 b=VRLAhKzHmI3uWp7SzrKt4a5Uwo9YvXmvjlUMrfsL4MOG4wjZXh2C+gV3QJO0OGPhQs
 mPIp0IwH4ZGPv02qvHYNNzooQNoFRHhE3DAgiD6m4lcWvmOCHLcYxzLXeQHAWVt2v1PM
 rgfp9zfMqAtdIe1nmfvPcI5DPqn3rOAxBqLdJsSQOcZbFESQhQFcN1txTdtnd4XIfixg
 WgjGqKd+pYVrCxUKwhnk1NLf+4foAjMJ6xL+k7mbmvv0FAadGpBY82swXck/Gnd9mIbT
 qlijCdTqhjwu3Hjpbl9AbSw/yg5/iPTLNL1sMpAB05VajVgL2gyg4CV3McGLsGv3My1s
 n04g==
X-Gm-Message-State: AOAM533oIfP5zVFpPA9tr0rwseh0/WAMuGmFUNnMpT5L+0Qd1JnMwus0
 rVdDXsvr1HP8++qQyBLtBR1jNQ==
X-Google-Smtp-Source: ABdhPJzmxvX+p4AwS3kpLR/iUT66IvCvZ7ojGwVGoXqMFBFcXTLussQyM9SU6lUe6ZBnnhKjP8Wm9w==
X-Received: by 2002:a1c:f204:: with SMTP id s4mr3233271wmc.8.1618306227884;
 Tue, 13 Apr 2021 02:30:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e13sm21709173wrg.72.2021.04.13.02.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 02:30:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8D1771FF7E;
 Tue, 13 Apr 2021 10:30:26 +0100 (BST)
References: <87eefnwd0l.fsf@linaro.org>
 <032cba5b-1b8a-ef47-dd3d-6e4caef1223b@vivier.eu>
 <87czv3s9i3.fsf@linaro.org> <YHRgkuNwPhiRz6vn@stefanha-x1.localdomain>
 <87r1jfmhnr.fsf@linaro.org> <YHVXSJs6JpCnSvqw@stefanha-x1.localdomain>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: trace_FOO_tcg bit-rotted?
Date: Tue, 13 Apr 2021 10:25:39 +0100
In-reply-to: <YHVXSJs6JpCnSvqw@stefanha-x1.localdomain>
Message-ID: <87o8eimszx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: =?utf-8?Q?Llu=C3=ADs?= Vilanova <vilanova@imperial.ac.uk>,
 matheus.ferst@eldorado.org.br, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stefan Hajnoczi <stefanha@redhat.com> writes:

> On Mon, Apr 12, 2021 at 08:06:57PM +0100, Alex Benn=C3=A9e wrote:
>>=20
>> Stefan Hajnoczi <stefanha@redhat.com> writes:
>>=20
>> > On Fri, Apr 09, 2021 at 05:29:08PM +0100, Alex Benn=C3=A9e wrote:
>> >>=20
>> >> Laurent Vivier <laurent@vivier.eu> writes:
>> >>=20
>> >> > Le 06/04/2021 =C3=A0 18:00, Alex Benn=C3=A9e a =C3=A9crit=C2=A0:
>> >> >> Hi,
>> >> >>=20
>> >> >> It's been awhile since I last played with this but I think we are
>> >> >> suffering from not having some test cases for tracing code
>> >> >> generation/execution in the tree. I tried adding a simple trace po=
int to
>> >> >> see if I could track ERET calls:
<snip>
>> >
>> > Llu=C3=ADs: are you happy to deprecate tcg trace events in favor of TCG
>> > plugins?
<snip>
>
> That said, I haven't used the TCG trace event functionality and maybe
> I'm missing something obvious that Llu=C3=ADs will point out :).

I've updated the Cc to what I think is Llu=C3=ADs current email as I was
getting bounces from the old academic address.

--=20
Alex Benn=C3=A9e

