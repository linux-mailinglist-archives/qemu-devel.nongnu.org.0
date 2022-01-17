Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FD3490BB0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 16:45:47 +0100 (CET)
Received: from localhost ([::1]:41314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9UCY-00057F-Qg
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 10:45:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n9TKD-0007EO-Ng
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 09:49:37 -0500
Received: from [2a00:1450:4864:20::334] (port=50707
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n9TKB-0008VV-IA
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 09:49:37 -0500
Received: by mail-wm1-x334.google.com with SMTP id w26so20932366wmi.0
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 06:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=bljvlSsFSaA8NpI2TY+e+M5Rmk0ETp8ZzVYgpFZg43M=;
 b=SWzx0i0MU0dzy11JYnd1IevwE0L9zj5Us4QB5Y7TIQ/V+FZvE8ck6cBooFIzd2EOC7
 dyMwQnJuKS+eB5a3TAsfYnSzRBgofxmnLJqngJqRK5vAgtaLkimh9RxEIXzEKs8Notq/
 5hzGbZ7pZTntomQ9QFJMk1NBjpT+2UlDarYtNAV0JI+rQaKCJVmgiIjtNlbEvcTmNvWg
 X1NrUToxJBHQAH+F8aQdp8AYlG8yMSNiGnax/tW8LOc2LIeBFjII5H7XJlCZARAcGa5n
 fi5uBrpz1liSvupPLOBkflQFJ8IJunR+LtI1ZzqE1WU9bMsOBruNzibf6FVrhEVlG8Ek
 eQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=bljvlSsFSaA8NpI2TY+e+M5Rmk0ETp8ZzVYgpFZg43M=;
 b=Zr0tB1doA9PlsX2T74GvXZXdpG7QsFH3pc9A624tZ3SB2zLsSE7GbTtR+B+gZd7Tho
 ESqI5IDvCOEfZUuwnsQ2zjaq41bQGgleemmjap2+afxOQ77sweGb8px36NS9ssIUm0ot
 uSQf34kvy4pvgXcsjEoD7SMPH1g5HM0dT0cc70Q/D8UnxTXVcfBEZ+H8D0anLPsqfpPm
 x5nyONGTC6Pn8QMeLjCUmn43HwoIDiU7p727MGaVOqySF330Ny4sYMKc/0N+G6jS+pWp
 uUFy2ZqbjlX+BnTtvWcDq5/RsrFtgMrqizk4x0q0+O/4k0dM93gyF5HHuK/zu8ZZeTuW
 HarA==
X-Gm-Message-State: AOAM533WsrUvxy6ZNFEOiEfrsaF2Exv3oL/GA4taOGWaXf5CKUErgN1Z
 rJWh34UHaKq1A12Y4OivBC2tsA==
X-Google-Smtp-Source: ABdhPJwoA1fQACXcm2nJFkmcUA/kz+Uxm337XyeY1e3/jrTv/5LfcKylpIYD9qvtU0s/qGMITTdo2g==
X-Received: by 2002:adf:f945:: with SMTP id q5mr20070463wrr.115.1642430973667; 
 Mon, 17 Jan 2022 06:49:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i12sm11501129wrf.100.2022.01.17.06.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 06:49:32 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1B7E01FFB7;
 Mon, 17 Jan 2022 14:49:32 +0000 (GMT)
References: <SN6PR02MB42057F473618E661B72E1FF3B8AB9@SN6PR02MB4205.namprd02.prod.outlook.com>
 <107df921-3339-7b73-15f3-daba2d61882e@linaro.org>
 <SN6PR02MB420572E9084C240BE8E698CAB8AB9@SN6PR02MB4205.namprd02.prod.outlook.com>
 <SN6PR02MB42059B3D252751BEDBB540C3B8AC9@SN6PR02MB4205.namprd02.prod.outlook.com>
 <SN6PR02MB42050D02581C5FF732732D29B8559@SN6PR02MB4205.namprd02.prod.outlook.com>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Brian Cain <bcain@quicinc.com>
Subject: Re: hexagon container update
Date: Mon, 17 Jan 2022 14:47:21 +0000
In-reply-to: <SN6PR02MB42050D02581C5FF732732D29B8559@SN6PR02MB4205.namprd02.prod.outlook.com>
Message-ID: <87o84aa03n.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Brian Cain <bcain@quicinc.com> writes:

>> -----Original Message-----
>> From: Brian Cain
>> Sent: Friday, October 1, 2021 7:23 PM
>> To: Richard Henderson <richard.henderson@linaro.org>; Alex Benn=C3=A9e
>> <alex.bennee@linaro.org>; qemu-devel@nongnu.org
>> Cc: Taylor Simpson <tsimpson@quicinc.com>
>> Subject: RE: hexagon container update
>>=20
>> > -----Original Message-----
>> > From: Brian Cain
>> ...
>> > > -----Original Message-----
>> > > From: Richard Henderson <richard.henderson@linaro.org>
>> > ...
>> > > On 10/1/21 12:59 PM, Brian Cain wrote:
>> > > > Alex,
>> > > >
>> > > > We need to update the docker container used for hexagon for new te=
st
>> > cases
>> > > proposed in Taylor's recent patch series under review.  Thankfully,
>> > CodeLinaro
>> > > has provided a binary of the hexagon cross toolchain so now I think =
we can
>> > > simplify the hexagon docker file to something like the below.  I hop=
e this
>> also
>> > > means that we can remove the exceptional handling for the hexagon
>> > container.
>
> We had some issues with the previous attempt to update the container.
> The linux-user "signals" test failed. Richard pointed out that the
> archive of the C library had what looks like a defect that would cause
> the test to fail.
>
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg849635.html
>
> I'm following up now with a workaround - the attached patch references
> a toolchain which avoids the problem and passes the signals test. This
> toolchain is based on llvm+clang 13.0.1-rc2. BTW, the release page has
> a signature provided in case anyone wants to verify the download:
> https://github.com/quic/toolchain_for_hexagon/releases/tag/13.0.1-rc2_
>
> Can we try again with this new container definition?
>
> -Brian
>
> [2. 0001-Update-Hexagon-toolchain-to-13.0.1-rc2.patch --- text/x-diff; 00=
01-Update-Hexagon-toolchain-to-13.0.1-rc2.patch]...

Could you send the updated patch against the current master in the usual
way please?

That way I know it's been tested and there is less risk of me botching
up a franken patch by applying to the wrong base.

--=20
Alex Benn=C3=A9e

