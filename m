Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B583260DB
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 11:06:31 +0100 (CET)
Received: from localhost ([::1]:57302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFa10-00075T-Jc
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 05:06:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lFZpy-0003yl-Pb
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:55:06 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lFZpw-0007iM-Mm
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:55:06 -0500
Received: by mail-wr1-x430.google.com with SMTP id u14so7973233wri.3
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 01:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=r5jcZTmqlSd+oeYZnRxCWTjcAaunqTxnFiJOOSDv9ho=;
 b=AYIoqi/8+CdwRP7ieblQ0gSwFlBbcNfcfqNhzb0qYXj+Dx5Wy6LSYnYTNpvJ0AR/fL
 lbqYrDeTmeimamt/v7CJ3gl/S/Pxk0/qLM/knZrLx5sQBCM0onKW09wUTwRMMHXO1iMv
 H3gt+EFrTEe6B23fxF8ziZFxijN/kK4pnxTtnJW+7INYUUqpBmHRyUV+PD//aihVF1FG
 3+hOqpg+zyWd4/BRmeUgWutQewN2aVm7XtxI06ViGclQBxNCsdwKuN/4qFw48XOQOLM9
 atkI/Ku7S7lWn25Zug4sVG66Z5sYzbuAz1bmG9KlWWhspHuA6alAifzE4SzPqQkAXFtA
 84cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=r5jcZTmqlSd+oeYZnRxCWTjcAaunqTxnFiJOOSDv9ho=;
 b=HzxNp9isi0ScpdNszurCIPOnLk80PMyfCyDohNvjBrcA704NzrpnJS6eXoOeaY5gQI
 W4Sr4PTOTBP2hEC8ToK1EoJ7W7dr7l2vi7s6bUh3hO6xxQ+/Roi0QXFnQnaaNtK1M450
 dG2erlval4STn/b1KmR0FXnNf5H9vP+HqNjI1N36rijqR6lup87sR84cgzM7FWBSmXtp
 nH+GBbwIklPY27nban1Tfa8VBWw7kKdAib/OT6ait+UYzlVWDXCzDk5TfwTD+FfRf1fe
 Pilp4sfYFmnHlBSWrAyqLTuXT4Aym07WACf8inD6YR+ZGEg+PCynXvg+NPCTDBtzMY4N
 Qixw==
X-Gm-Message-State: AOAM5310F1qbT93HfD4hGqAP1PmavvwYgYy/q5xbuskdEsuMoTvPW9jv
 hk2iuCu1uz7SIdTHyw5uH6ViUw==
X-Google-Smtp-Source: ABdhPJzD7gm4i6NjKnTIG6Yog4Uvk8md4rpt8aaD9pLu4gcj013IR4HIxPGUKhQjpD8K3EH+CdLsuQ==
X-Received: by 2002:adf:e4c3:: with SMTP id v3mr2349412wrm.210.1614333303029; 
 Fri, 26 Feb 2021 01:55:03 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 36sm13966204wrj.97.2021.02.26.01.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 01:55:02 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 39D911FF7E;
 Fri, 26 Feb 2021 09:55:01 +0000 (GMT)
References: <CAJGDS+F0Mtv+XFXeR4wOP35UjmfKt+fiMAfraT7mg9J-4t+SiA@mail.gmail.com>
 <e4677d3d-b221-3bba-185c-5a43faf6aab7@redhat.com>
 <ffdcad8a-389a-ed22-0991-940ddeb3c8ed@ispras.ru>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Subject: Re: QEMU Clock record and replay
Date: Fri, 26 Feb 2021 09:54:25 +0000
In-reply-to: <ffdcad8a-389a-ed22-0991-940ddeb3c8ed@ispras.ru>
Message-ID: <87pn0n9mru.fsf@linaro.org>
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
Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Arnabjyoti Kalita <akalita@cs.stonybrook.edu>,
 qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> writes:

> On 25.02.2021 18:43, Philippe Mathieu-Daud=C3=A9 wrote:
>> Cc'ing Pavel/Alex.
>>=20
>> On 2/25/21 4:09 PM, Arnabjyoti Kalita wrote:
>>> Hello all,
>>>
>>> I am trying to understand how the clock values are recorded and replayed
>>> in QEMU (when it runs in TCG mode). I have been specifically following
>>> the document that has been provided here -
>>> https://github.com/qemu/qemu/blob/master/docs/replay.txt
>>> <https://github.com/qemu/qemu/blob/master/docs/replay.txt>
>>>
>>> I have the following 4 questions to ask-
>>>
>>> - Why are clock values being replayed off a cache and not directly off
>>> the file as seen here -
>>> https://github.com/qemu/qemu/blob/stable-5.0/replay/replay-time.c#L45?
>>> <https://github.com/qemu/qemu/blob/stable-5.0/replay/replay-time.c#L45?=
>?
>
> The cache was needed when replay does not follow the record behavior.
> E.g., included additional deadline calculations or timer checks.
> I'm not sure, that it is still needed, and I'll check it during future
> refactoring session.
>
>>> - I have a requirement to record and replay host clock values. Can it so
>>> happen that if incorrect values of the host clock are replayed, then the
>>> timers in the guest start expiring incorrectly, during replay?
>
> This is a bug, when the host clock is replayed incorrectly.

When you say host clock what do you mean? Surely all the cycle counters
are VIRTUAL? Or do you mean things like the RTC?

--=20
Alex Benn=C3=A9e

