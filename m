Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B76AF21385B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 12:03:21 +0200 (CEST)
Received: from localhost ([::1]:58762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrIXQ-0000JD-Qd
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 06:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jrIWN-0007wt-2y
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 06:02:15 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jrIWH-0003nR-PM
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 06:02:14 -0400
Received: by mail-wr1-x430.google.com with SMTP id s10so31988955wrw.12
 for <qemu-devel@nongnu.org>; Fri, 03 Jul 2020 03:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=Ow2CEyJPWeDcGxMgDuMV/P/xDv+B6i0AdMKyiegAeIQ=;
 b=p+fHoRWOis99eZwbeP6nJqCBBtWwA9+a9CnwpgjKCyaR0nJRgr2apRZX0C2SMKL27D
 CWThFSo+DVytbTrBQQJCZtP3350r+VnLDJG7tVuZvL0YhjQ+JnlUYyFTpgZYRgnYUJKL
 WCmBxUPucbc0IdoHWOKGVtofYFewe3aUdRwFtPv18gpEHd7MRgHHtx+UJ96pYL+HTDK6
 kFmP1udHU7GP48Wz0qiWwnP/G/awzeSSnAJkT+/HOqYf54P4GJJ/GXDeRi48tVOGW/Yy
 t366sWXF3Svy6LV+7jJ4XLXn1UY+KX76gtgMU+XDJyKbV3zHClqv+/vKDUg/9ivDEjSX
 CAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=Ow2CEyJPWeDcGxMgDuMV/P/xDv+B6i0AdMKyiegAeIQ=;
 b=S6gLKm4112k/tY+INgXjttJTnLxrbtcXFh/M+yw5fL99IjTMVlXfheOuTArqOFZmIY
 E3jDFGF02nbHAhUwGr170SmEp0TlKb3utl30aNANp2+ORwJYWXTWtaz9T//jwSacIuCR
 336cgNOYRLPkO5dEtOm+qbETH7MCaeJJrCvEZz4VjbZ10UdxVlXs4BfY9VLKivOM1FnT
 i94vALd2GR/kgh8RTf9CJq549XnIvfQscXafozxY9Ri9/mQcqZaiPemyW0xuruUnUIC8
 HWhnHZMNtlenKLm/++wY8K/SoOC8aWPl22FmhaZItmDC8rjlIXCAWggVnSjRQVQUgYuk
 lsgg==
X-Gm-Message-State: AOAM530SFEbUBABsG89oOhZm4w5Cc5os+LuKOcOfGCVWJkJVuvh/5PDs
 SODFUP1iPgydxkAFFzoJVSicKg==
X-Google-Smtp-Source: ABdhPJzjsY4qEa6QtGCJhQh4+bDs5wZlpaLURpaCjECBQSNgGVBccA5DR5Q4RbI8wKLNAgecJYw4uw==
X-Received: by 2002:a5d:6a04:: with SMTP id m4mr35188510wru.418.1593770527999; 
 Fri, 03 Jul 2020 03:02:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v6sm1124511wrr.85.2020.07.03.03.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 03:02:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 012BC1FF7E;
 Fri,  3 Jul 2020 11:02:05 +0100 (BST)
References: <20200624140446.15380-1-alex.bennee@linaro.org>
 <20200624140446.15380-2-alex.bennee@linaro.org>
 <20200703080728.GC5285@linux.fritz.box>
 <b91984af-ca2f-1cb2-905a-ba26212df208@redhat.com>
User-agent: mu4e 1.5.3; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v2 01/25] iotests: Fix 051 output after
 qdev_init_nofail() removal
In-reply-to: <b91984af-ca2f-1cb2-905a-ba26212df208@redhat.com>
Date: Fri, 03 Jul 2020 11:02:05 +0100
Message-ID: <87d05cq5lu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, fam@euphon.net,
 Thomas Huth <thuth@redhat.com>, berrange@redhat.com, "open list:Block layer
 core" <qemu-block@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 John Snow <jsnow@redhat.com>, cota@braap.org, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Max Reitz <mreitz@redhat.com> writes:

> On 03.07.20 10:07, Kevin Wolf wrote:
>> Am 24.06.2020 um 16:04 hat Alex Benn=C3=A9e geschrieben:
>>> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>>
>>> Commit 96927c744 replaced qdev_init_nofail() call by
>>> isa_realize_and_unref() which has a different error
>>> message. Update the test output accordingly.
>>>
>>> Gitlab CI error after merging b77b5b3dc7:
>>> https://gitlab.com/qemu-project/qemu/-/jobs/597414772#L4375
>>>
>>> Reported-by: Thomas Huth <thuth@redhat.com>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> Reviewed-by: John Snow <jsnow@redhat.com>
>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>> Message-Id: <20200616154949.6586-1-philmd@redhat.com>
>>=20
>> Thanks, applied (this individual patch) to the block branch.
>
> Hm, I=E2=80=99ve already included it in my pull request from last week:
>
> https://lists.nongnu.org/archive/html/qemu-block/2020-06/msg01159.html
>
> Unfortunately, the request got no response so far.

I think Peter's been on holiday this week so I guess there will be a
pile of PRs to process next week. I'll probably cut mine Monday
afternoon to post on Tuesday.

--=20
Alex Benn=C3=A9e

