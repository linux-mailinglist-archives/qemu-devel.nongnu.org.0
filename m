Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF96534DE6
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 13:14:37 +0200 (CEST)
Received: from localhost ([::1]:46044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuBRs-0003rI-LG
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 07:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nuBGp-0005t5-0S
 for qemu-devel@nongnu.org; Thu, 26 May 2022 07:03:11 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:40945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nuBGm-0002PT-7D
 for qemu-devel@nongnu.org; Thu, 26 May 2022 07:03:10 -0400
Received: by mail-ed1-x52d.google.com with SMTP id c93so39731edf.7
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 04:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=vIjGDqv3kd5GgiiXVscGdyi1WsUWAezY2PE55poQ3gU=;
 b=DxZQ8ebzBXP/uvzIZscq49HupQmFNH8XF8ZHsKjKIqetvxW1hSNU8LkTJGOtkFi9Tv
 MdCwD0O6dk81se7p37QOOwB12WfiLWuDNZZ0ZdJ5/wyNtNLedDBihxejpTp1IuoYtDLt
 b2TwqnHsvGg/b1dS5+dMD/ordqYd5iiM5BlPMG/grzA9ylHcmkSObBPxVn6Ws1zQiXEU
 C+PLQXnKVfoHIxSihbgb6xu1X15l7t50klFSH6eJ3dfbj3sneMLAGJ1HLcnDEIOpluSg
 X/ZtGsnu48Tvzy0ijo4lgzD4bBUOmLt35O9khPFQREVsbw+n7p4CExE1mTVupZcn6m9A
 TRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=vIjGDqv3kd5GgiiXVscGdyi1WsUWAezY2PE55poQ3gU=;
 b=zWQwKWQFQlfgxeP0bzdb2kcZ7EFZMWX0T8zKGEcYdZGbcXaBAAEzUvr7C2do5BoNMe
 Ona/EjUVowukQz3pE5FCdLLhFzN7FV2wtVTKf3qNIjPuw0aRwHRw1VgDPFcknuwY3huz
 fvylibaiMJQFNJYC1XwFx+xvn1Hg62gpo8Dg7ynX1GwatJ0JGlxD8bTjYL1i8/aoOfQv
 wi0YjEbYDVIU6v96pD17D3HkLxC0PtHpudxGG3jnclolcDTEL/jS64gNDgR+trjSx657
 vPJgDIYjF9Es0DcmhyCIghT1eJmMt8Oi5vkCzpl3O1byWfhW903OJ50XMo/x+rkToELf
 Nchg==
X-Gm-Message-State: AOAM533EwSSfIEIjFd0mmA2izVTjM8lr78vKmMXd6cRysKeuzq+6JQV7
 /7he6odBiCRF0rp9ZK7RcSHJoQ==
X-Google-Smtp-Source: ABdhPJzR/0owGDQjwxnH4Rup0NiUw7WhQcdrou74aZ2JkBFE05Sc+VQG5vEZXGHlJe0L6+K/KJHnyA==
X-Received: by 2002:a05:6402:cad:b0:42a:bf29:a023 with SMTP id
 cn13-20020a0564020cad00b0042abf29a023mr38295303edb.174.1653562985225; 
 Thu, 26 May 2022 04:03:05 -0700 (PDT)
Received: from smtpclient.apple ([86.121.23.37])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a05640240d400b0042aad9edc9bsm668898edb.71.2022.05.26.04.03.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 May 2022 04:03:04 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: AArch64 semihosting?
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <CAFEAcA_beHgi7pg+ByW4ufG5qfz5n7o4ZP22WuayTtdGSQ_EQQ@mail.gmail.com>
Date: Thu, 26 May 2022 14:03:03 +0300
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0B956505-BFF3-4ACD-AAF9-7F939F426274@livius.net>
References: <AADD58D2-C3BE-40DF-8EE5-3A901F4F8F04@livius.net>
 <CAFEAcA-n4GMq1_SCdTDp6sQmHzyyzTk5hav4QqOY3-j3Sr86Jg@mail.gmail.com>
 <EA9AEE55-A416-4819-98FF-E51B2317390F@livius.net>
 <CAFEAcA_beHgi7pg+ByW4ufG5qfz5n7o4ZP22WuayTtdGSQ_EQQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
Received-SPF: none client-ip=2a00:1450:4864:20::52d;
 envelope-from=ilg@livius.net; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 26 May 2022, at 13:01, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
> Yes, I can reproduce this.

Ok, it seems you diagnosed it pretty quickly, great!

> Did you intend to pass '-s' (allow gdbstub connection) but not
> '-S' (wait on startup for gdb to connect and say "continue"),
> by the way?

Oops! I forgot about this. I'll switch to -S.

> The failure to honour the 'target=3Dnative' option ... you can work =
around it

> by always providing just one --semihosting-config option, like this:
> --semihosting-config =
enable=3Don,target=3Dnative,arg=3Dsample-test,arg=3Done,arg=3Dtwo

Right, thank you for the suggestion.

> I don't think any of this ought to be target-specific, so perhaps
> the command line you use for 32-bit arm is slightly different
> and avoided the bug by good fortune ?

If I think again, this might explain some previous weird behaviours that =
I experimented a while ago.

For production tests I do not use the gdb server configuration, and =
semihosting was functional even with two options.

So yes, it was good fortune.

If you fix the bug, could you notify me when ready, to make a new xPack =
release?


Thank you,

Liviu


