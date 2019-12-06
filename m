Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 429CF115781
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 20:02:33 +0100 (CET)
Received: from localhost ([::1]:44126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idIs3-0007YG-UL
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 14:02:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43927)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1idIIM-0000Kv-Kb
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 13:25:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1idIIL-0005sA-8b
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 13:25:38 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:33742)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1idIIK-0005nl-TB
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 13:25:37 -0500
Received: by mail-wm1-x341.google.com with SMTP id y23so10365044wma.0
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2019 10:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=APhVKom77qZGDibg0Juh23y4l2Jl1d2AiYktXpeIw6Y=;
 b=vRoMSD6R0Kc5lAanIW38Evq8wrkrM7ARkTTtI3DeM9DG69IleJg+miO+Lx46gHJN0z
 bZwCKbjsx7aDVKhqWkchUGI+0N1Ml9fznc7FaKmr+gyE0sdRuVqwC/3oIAXIrb8NlVNn
 8hHy/fSrM+4F78wfMtVnDSyiHroIQ00O3gZrtqidv7mNNKWLSkSVqd1F59eovZ4p3g22
 bVTsQNFnRVIqG2IEulVogKZonogY94sshaqzPaszleODRAAjxMuXiUk9SdPrOnd7uUxr
 pDwqZbxs4OthxpO4pPMvQg0uxdx90W4kDGGz96O7Ul8LYTHPAuT/EkWwmwwKa/lNOXml
 TpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=APhVKom77qZGDibg0Juh23y4l2Jl1d2AiYktXpeIw6Y=;
 b=UkD/TN1rPKXgdoMHETtHdrejs1/bIvH5+or7AoQ7TRdiMoudAGjM8xEKsUFXdVR4/m
 dW/GN4U8RbLCn7FYAp0Tplpc0GUtTyLGfdYR6wnnP+T6Qf3fo8rlDyuaxNyLIcDXQmbG
 JdqGKF82oW2S613kMw9ren8gUdEITwz0NgBPIITQjlmT3xKEnPnwsJ0O0xgXTD6OflYA
 +K4PalN7I+O4+YCljbV0q4AnRY2etQrQSoLiC3COK0PFZ/Q7V2jgUa91uooMoDwwm1KY
 SDVe51P7x1hqZDE6lOld2aVYugZq+Ej5U4ueWd1XvicHqiJ3cj8xEljFtJ+BtUR6OQZr
 FtXg==
X-Gm-Message-State: APjAAAVddlVR6k6muUY6ZVHaMD4AFDfDD7+6XSdySow6mPxUFOkIJBLO
 Jn/VizuYZuokDnW+gZ83HU7l+w==
X-Google-Smtp-Source: APXvYqydT2m3OORgjPTrHjMhPqPtP9A9V+teolod7UMttktevBJuUVnyaFe6lUNp+CAr7jdScaU6Bg==
X-Received: by 2002:a05:600c:30a:: with SMTP id
 q10mr11449304wmd.84.1575656735535; 
 Fri, 06 Dec 2019 10:25:35 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j12sm6285903wrt.55.2019.12.06.10.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2019 10:25:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 978951FF87;
 Fri,  6 Dec 2019 18:25:33 +0000 (GMT)
References: <20191206122247.7507-1-alex.bennee@linaro.org>
 <CAFEAcA9S51DWqysHbO42CjOhZBMA4qwN2zT+isOmWFtH5G8N3Q@mail.gmail.com>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] target/arm: don't bother with id_aa64pfr0_read for
 USER_ONLY
In-reply-to: <CAFEAcA9S51DWqysHbO42CjOhZBMA4qwN2zT+isOmWFtH5G8N3Q@mail.gmail.com>
Date: Fri, 06 Dec 2019 18:25:33 +0000
Message-ID: <87d0d171lu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 6 Dec 2019 at 12:22, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>> For system emulation we need to check the state of the GIC before we
>> report the value. However this isn't relevant to exporting of the
>> value to linux-user and indeed breaks the exported value as set by
>> modify_arm_cp_regs.
>>
>> [AJB: the other option would be just to set reset value anyway and not
>> ifdef out the readfn as the register will become const anyway]
>
> If you want it to be const it would be clearer to define it
> with ARM_CP_CONST... I'm not sure what an ARM_CP_NO_RAW without
> a readfn or a fieldoffset will do on reads.

Well the modify_arm_cp_regs ensures it is ARM_CP_CONST when it changes
the definition. It's just ensuring the reset value is set so it can be
masked/fixed.

However the ifdef approach does reduce the amount of unused stuff in the
linux-user build.

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

