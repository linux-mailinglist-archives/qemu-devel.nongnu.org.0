Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D1B3157E4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 21:45:46 +0100 (CET)
Received: from localhost ([::1]:52118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ZtJ-0004x5-3I
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 15:45:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9Zol-00032M-Fa
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 15:41:03 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:54964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9Zoj-000629-Nt
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 15:41:03 -0500
Received: by mail-wm1-x336.google.com with SMTP id w4so4490904wmi.4
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 12:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=2z5OZFNx4Vm8A5YpZwRalneRFe5vOvnz27TZxNAMnnE=;
 b=v5YpfYbEz0VkR12cRtgcn0746Jpsn0MCKyhj2GxyDBotNFfUW0GYGXdO5hNflOH97l
 7shk7dxHIGhE04BxDFpOzZG0S2VUdToo80kHl04htsAFKASKPushQzbs/2gmVP0D6hfJ
 LmmDkDEUuD9JI00uNpgelmpnwhAUHqVnrXhym22neeQigBWI1MLmD9uAP7STDCvV1rxV
 d+mNh2EnAubDMqDKA9oUgycfVq14fdvyGrDjbHc0fG8/x90uQSG77y2NcO4RTPamzTVP
 YsDe4lrv1GTyMh8xHAI3EF5j5NHBrBwz0bxQebXbxUFYKOZ9Mr1dzYhMJi28Ho64iXUG
 hPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=2z5OZFNx4Vm8A5YpZwRalneRFe5vOvnz27TZxNAMnnE=;
 b=KXxp5jxs+D/2kLBlY/Tvbyg5M/y/A8l3GnDSwOIJ6Q0FWVwEtgrD+Y0ZOanIOPr+vA
 cBYy4hzWGYt+jdwp1l4ii01BwF3o968WdqzlZjnrrtGBCaSpfsHf5Jqg1YiD2DSv0Jr8
 coOYhaBvw1ocqTsgh/C5up/9rcARpGkXAzUME20wSIBWzcTmd1VREKqfo2/yvtCe4ohF
 z+YUxRSmDKEmIuF3uudHR3ygFQYeVXeixTbHa/SHko/V8RVOYPSNXq7pk2Ylz/oERl4a
 4iZP70TvZeM7QTfoxQC9H3yirwra/pCoOqsfVI2gfXS+xQvTZT4sfwoGHljMnhH9d8aZ
 NqfQ==
X-Gm-Message-State: AOAM5326eabT/YJM3uhFH83ZIESvJBfLafJLYU5HPQfOYxA7Bw8grWmn
 L3HPXDkDtP917387pSUsTW40VA==
X-Google-Smtp-Source: ABdhPJzoVDj7ZzP90So/dFwLs9HlpACkKiDraaZdH3AnG028fM5E7EujbAATKJjEzylka7au+4eibg==
X-Received: by 2002:a1c:7507:: with SMTP id o7mr5203129wmc.165.1612903260282; 
 Tue, 09 Feb 2021 12:41:00 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a16sm39086044wrr.89.2021.02.09.12.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 12:40:58 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 70ACA1FF7E;
 Tue,  9 Feb 2021 20:40:57 +0000 (GMT)
References: <20210208113729.25170-1-peter.maydell@linaro.org>
 <87czxabs54.fsf@linaro.org>
 <CAFEAcA-=KymVWUsSMn3WBNkmeeiAqj8fUE03BDpcKFo5mDgSoA@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: Add gdbstub.h to the "GDB stub" section
Date: Tue, 09 Feb 2021 20:40:42 +0000
In-reply-to: <CAFEAcA-=KymVWUsSMn3WBNkmeeiAqj8fUE03BDpcKFo5mDgSoA@mail.gmail.com>
Message-ID: <8735y59dpi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 8 Feb 2021 at 13:34, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > The F: patterns in the "GDB stub" section forgot gdbstub.h; add it.
>> >
>> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> > ---
>> > Noticed this because my recent patchset which touched gdbstub.h
>> > didn't cause check-maintainers to add the gdb stub maintainers
>> > automatically.
>>
>> Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>
>> Do you want me to pull these into my tree (with your other set)?
>
> Yeah, that's probably best I guess.

Queued to gdbstub/next, thanks.

--=20
Alex Benn=C3=A9e

