Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B91B5334242
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 16:56:56 +0100 (CET)
Received: from localhost ([::1]:42246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1Ch-00088J-Pv
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 10:56:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK1AP-0005sI-QZ
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:54:34 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:51799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK1AM-0008Dl-Hu
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:54:33 -0500
Received: by mail-wm1-x334.google.com with SMTP id l22so7428635wme.1
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 07:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=G1qtWMedRTomLyU3uT3iuzbxlUm3O+kNmVt2h8QpFQg=;
 b=qt30fsEsvaFmoAclAWHrffqUVzwdvEs9b+aTw7hMNkFgU4+n7tQ4szcRbbiEG/HcNX
 ASM6XUCLSk+cz7TP1Yc2fH6ET5k4glVOffhuMR0SfmXixY7VpxRg6EI2SdgaQ0R2aELO
 Wqe4sGmjAzjprXT4IMDuxl1G7sW9wJtFPxP2P92+PD5VcEoG8Nd9a1TN43u+tdR8W9P+
 BVshPnv4yHvqTfuGlHcLn5lihNfrOH37irFJEA0eZmp0YNVjya0d0I4Qajqg9pFvSv/7
 feaizj/DZU2UDvBYPfF/dICPiU60Yyg+KH8rv/tPRHGrx16UQKy+F0ms000fHHu0wdqr
 ioDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=G1qtWMedRTomLyU3uT3iuzbxlUm3O+kNmVt2h8QpFQg=;
 b=q/9PgAh+/w8rYjTgCmnerIFNEvXUBLUofzlV78gmLHBHaCnvAutCkplIxWJDs9jynv
 snsqAjeOyd7JlOq7Zav30eWt4fE0kdPaqxH5jO5jyyhiqWchsKYM9kO7EqFBMgK6suSS
 L88SlqO8UpXsqJ8jo9N6Ob9mkkVe6lro3VIqaRk6oJHJdjkPpI58oaUPjCDZrL9JohAH
 GH2L4YGeCpH8MNlkSQlTgALIhGuyZfvSvmXdx7g42RB4sQpZDH+Us+WaOweuyTH4dRgi
 4mG1r++TNAm5upvalA3/lTZFtuNlw5sPSZGHd82gFDtmhUpUlfHn2VGXP0JpLGAPMpeR
 dSsA==
X-Gm-Message-State: AOAM533SlXbJJ1ul7/9mB71eIG4aw8fer15Ofa9FfGiWwq0dKYnWOhmZ
 Y82BhI+3wz67IT9dxJ4CdmS7Bw==
X-Google-Smtp-Source: ABdhPJywQHXdiN7bBAvkNlbJxD51CxsPawbRamDLppG43m/4Lzc7uhwRDR0Uz9L+bmLU9fb0j9VEyQ==
X-Received: by 2002:a1c:f404:: with SMTP id z4mr4097558wma.39.1615391668940;
 Wed, 10 Mar 2021 07:54:28 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n6sm31012313wrt.1.2021.03.10.07.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 07:54:28 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 356131FF7E;
 Wed, 10 Mar 2021 15:54:27 +0000 (GMT)
References: <20210308135104.24903-1-alex.bennee@linaro.org>
 <CAFEAcA9d01LaFRW=NnqivAMCsxPUbRP8kqOuL0i=P3o42tSZEg@mail.gmail.com>
 <87czw78f0d.fsf@linaro.org>
 <CAFEAcA-DmTGgAgpwocj5vO9W0E9RFtbdvO0DVThSa47S=yPJvA@mail.gmail.com>
 <877dmf87az.fsf@linaro.org>
 <92f99bfb-82db-67f2-290c-a7b1ee3d536b@amsat.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PULL 00/18] testing, docs, semihosting move and guest-loader
Date: Wed, 10 Mar 2021 15:47:08 +0000
In-reply-to: <92f99bfb-82db-67f2-290c-a7b1ee3d536b@amsat.org>
Message-ID: <87v99z6m30.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Alessandro Di Federico <ale@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 3/10/21 2:27 PM, Alex Benn=C3=A9e wrote:
>>=20
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>=20
>>> On Wed, 10 Mar 2021 at 10:44, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>>>> And then I get the same failure as you. Can you confirm the docker
>>>> version you have now?
>>>
>>> e104462:bionic:qemu$ docker version
>>> Client:
>>>  Version:           18.09.1
>>>  API version:       1.39
>>>  Go version:        go1.10.6
>>>  Git commit:        4c52b90
>>>  Built:             Wed Jan  9 19:35:23 2019
>>>  OS/Arch:           linux/amd64
>>>  Experimental:      false
>>>
>>> Server: Docker Engine - Community
>>>  Engine:
>>>   Version:          18.09.1
>>>   API version:      1.39 (minimum version 1.12)
>>>   Go version:       go1.10.6
>>>   Git commit:       4c52b90
>>>   Built:            Wed Jan  9 19:02:44 2019
>>>   OS/Arch:          linux/amd64
>>>   Experimental:     false
>>=20
>> I swapped out the snap docker for the docker.io package from the
>> repository but it's still a newer version than yours:
>>=20
>>   13:25 alex@bionic/x86_64  [user.static/testing/next] >docker version
>>   Client:
>>    Version:           19.03.6
>>    API version:       1.40
>>    Go version:        go1.12.17
>>    Git commit:        369ce74a3c
>>    Built:             Fri Dec 18 12:21:44 2020
>>    OS/Arch:           linux/amd64
>>    Experimental:      false
>>=20
>>   Server:
>>    Engine:
>>     Version:          19.03.6
>>     API version:      1.40 (minimum version 1.12)
>>     Go version:       go1.12.17
>>     Git commit:       369ce74a3c
>>     Built:            Thu Dec 10 13:23:49 2020
>>     OS/Arch:          linux/amd64
>>     Experimental:     false
>>    containerd:
>>     Version:          1.3.3-0ubuntu1~18.04.4
>>     GitCommit:
>>    runc:
>>     Version:          spec: 1.0.1-dev
>>     GitCommit:
>>    docker-init:
>>     Version:          0.18.0
>>     GitCommit:
>>=20
>> So I guess somehow we've regressed something that doesn't work on the
>> older version on your system. I can't recreate anything like your
>> failure unless I switch to the snap version (which I think is related to
>> visibility of file-systems from the snap) so perhaps we just need to
>> detect that somehow and disable docker support?
>
> Why is Peter's Docker trying to rebuild the downloaded image?
> Is it something the docker.py script is doing (like final step)
> that invalidate the cache?
>
> Peter, just to remove one variable from the equation, your system
> RTC is correct?
>
> Alex, why not simply remove the 2 Hexagon patches from your pullreq
> until we figure this out?

Yeah I'm going to drop them for now. I think we need to:

 - ensure re-builds aren't triggered normally when they should be cached
   - I think this means the hexagon build should be standalone
   - possible also properly split using multi-stage builds
 - upload a NOUSER variant of the build (--add-user should be a local chang=
e)
 - detect snap versions of docker?=20=20=20

>
> Phil.


--=20
Alex Benn=C3=A9e

