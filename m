Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC99443397
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:45:48 +0100 (CET)
Received: from localhost ([::1]:47392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwux-0005LH-T1
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mhws4-0002cf-1o
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:42:48 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mhws1-0003mD-SG
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:42:47 -0400
Received: by mail-wr1-x430.google.com with SMTP id d24so3688219wra.0
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 09:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=j8MK2hLCOXSrAv9KPHQPzZOJI2JFNJjT5VUrqg+Fpoc=;
 b=MngnIxlJB6eyK/ct9+hSTkJNpYy/KO30LF65rEUKC0orB665K/eg31cLg8sVcuL8JH
 RGgwIUseRqx9UXtzUIWQ6O8BS2nXvYIQyXu0SyUrH3mHWAwXxpx4G3ZhE3X5TMlMk6mc
 N0SnC2553paA9Hv4T0FwlWR5VVAxPvHWZduf/AuNANLuYEQF2lR4FRjDieki5GOf1RIQ
 MaVGTLLvpxCu1VqeapejWCtCQ8bINKj5OqWHjeB9OHzf3QVeJqSyp9ABroLVYdF9JsFS
 bw6v/STEPCRG1/xjaic+ja5PUzHVPAqAf0ZiRW5GLG7UdPF+cN9Mz8PikpiYsCy2RQzD
 I3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=j8MK2hLCOXSrAv9KPHQPzZOJI2JFNJjT5VUrqg+Fpoc=;
 b=hzSdADtFgZ8HgB58kG6X6cif4xGC/xdEwct0twytOWpG17Vu7cRK8uT0vHnzveXU0D
 8U0gaShYDBJe8TlCw2w3Dhva3HrozT122d7t3rjGHFHBimKr+gSXbLwv6nWiYLOap16u
 94DcEt64TwrFZuyzfrAi0iaB6S3Ud3lMVcHkQTRWnLpxl6i2ecPzeX4uchIyysYd87g4
 JddFE5f7FkxcThlMi6AfA0S+VA2gNjZhNVN6Xb47cYyfdTd0o37KtXMxD/aCaziGcMEK
 61T8i2NLq3c1oDVUPkczgx/2Tx8pxtHS5Ggt2eH9GQgmxRJtwMpD2AxE29oKFlQGVHr8
 YVTA==
X-Gm-Message-State: AOAM533IWPbkiFbrMG11NXuTQBrWkkR2G9HntnnapwroTzJr4gPfivDm
 yccIObOlEzCWhULPEJR6VV4D2w==
X-Google-Smtp-Source: ABdhPJwh0JIoaOd90kNZ5c/IUhjC5iacCg/PpN2NVaXXFwJJBEU0xkgh4oo4spzwKTHHwMSOT9MDmQ==
X-Received: by 2002:adf:d091:: with SMTP id y17mr36738002wrh.418.1635871363259; 
 Tue, 02 Nov 2021 09:42:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p12sm6581717wrr.10.2021.11.02.09.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 09:42:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 749641FF96;
 Tue,  2 Nov 2021 16:42:41 +0000 (GMT)
References: <1635698589-31849-1-git-send-email-tsimpson@quicinc.com>
 <1635698589-31849-29-git-send-email-tsimpson@quicinc.com>
 <e1d3d003-f287-7f82-d604-6f43b0d9c55c@amsat.org>
 <2f35d0c6-0ba7-b911-56db-c1ed9ae4afbc@linaro.org>
 <SN4PR0201MB8808814113CBE84889CD5234DE8A9@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <3e93e507-da92-0a1c-346b-ebfde27168fc@amsat.org>
 <d2395c92-4ece-31a3-8bd6-24345c946780@linaro.org>
 <SN4PR0201MB8808870B218F0DFCE1AE4B20DE8B9@SN4PR0201MB8808.namprd02.prod.outlook.com>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Taylor Simpson <tsimpson@quicinc.com>
Subject: Re: [PULL 28/30] Hexagon HVX (tests/tcg/hexagon) hvx_misc test
Date: Tue, 02 Nov 2021 16:41:44 +0000
In-reply-to: <SN4PR0201MB8808870B218F0DFCE1AE4B20DE8B9@SN4PR0201MB8808.namprd02.prod.outlook.com>
Message-ID: <87zgqmjypq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?M?= =?utf-8?Q?athieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Taylor Simpson <tsimpson@quicinc.com> writes:

>> -----Original Message-----
>> From: Richard Henderson <richard.henderson@linaro.org>
>> Sent: Monday, November 1, 2021 10:03 AM
>> To: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>; Taylor Simpson
>> <tsimpson@quicinc.com>; qemu-devel@nongnu.org; Alex Benn=C3=A9e
>> <alex.bennee@linaro.org>
>> Cc: peter.maydell@linaro.org
>> Subject: Re: [PULL 28/30] Hexagon HVX (tests/tcg/hexagon) hvx_misc test
>>=20
>> On 11/1/21 10:17 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> > On 11/1/21 15:09, Taylor Simpson wrote:
>> >> Plan-A should be to update the container with the new toolchain.
>> >
>> > IIUC Richard is going with Plan-A: wait Alex queue get merged, then
>> > retry merging this pull request.
>>=20
>> Correct.
>
> Agreed.  Just let me know if Alex isn't going to get the new toolchain
> merged in time, and I can go to plan B.

The PR has been a pain to get working but it should be in soon. Just
need to work out why the signals test has broken between master and my
PR:

 https://gitlab.com/qemu-project/qemu/-/jobs/1739288510#L1318

vs

 https://gitlab.com/stsquad/qemu/-/jobs/1740048034#L1316

Could it be a toolchain thing?

>
> Thanks,
> Taylor


--=20
Alex Benn=C3=A9e

