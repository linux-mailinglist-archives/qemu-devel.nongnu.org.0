Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C752ED58F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 18:29:00 +0100 (CET)
Received: from localhost ([::1]:33802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxZ5n-0000fo-PG
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 12:28:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxYwJ-0006x0-9P
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:19:11 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:51265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxYwH-0003lZ-HI
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:19:11 -0500
Received: by mail-wm1-x329.google.com with SMTP id v14so5820399wml.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 09:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=JBveBuaaZVld4gPwHfIvBBi65NIyb69ljKVImvzrXyQ=;
 b=a8r4BQx0DJ3itgSxAIUWxLbNDfItWIb0bxpHrBKAvj/wTfopF83gRC/NObHuupc2ay
 ZM5zpJJpjpfGAMjz7VaQP140MF4KV0EDf6WeQQVTPtxU+4jP7Ijhng3d+Q6pLQDnOPDx
 QrYl8k3mDTGv1I7+jYFMG76U1eh/FktLa1REBR+jFy04VcA8F1GxillJSLQFgfOkotu8
 26ltdSWs0u7pVC5UDZqRUSSJ29a28ZTiA+jHCPrejyPlILSYozkOq5lUPaZ9+tK29a/c
 xnDH4EMuGEVEoHLzWywiFaO49ARLXy86ULhJXc9UDfAoCkPWH/NHUEk8ux4VxTMn0cUJ
 JUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=JBveBuaaZVld4gPwHfIvBBi65NIyb69ljKVImvzrXyQ=;
 b=k1xNCgD1LZeMLW9/h64t58UWQ7UYaTdtLhrOkHCwgJnkXziEfg3wYUn/w28X49xam0
 oqg3/1e4U2Vg8tc8dzpKIrt2lcEgckW949hs5Q3up/PMykRBvmJkM3szLbMXrW5VgdSE
 pTd1ko6+0cEpjXxrin87id7AY3lPeg4at5v71kYIpWs+KLpuv2EFzM9TxY5x5Z/LlBzG
 wFA7Pv8flVgNyvXt5wxceMbfqgalDhuT4uZBLBBd0K0btYLB3fKDVLyz1R90YjY+a3uH
 7dwGM2aMavzKw31qwlUgMw6FbPsxankSAuhXcLaJYJA/UehcTfVmmx8cNVDlKIxK8h5g
 vtwg==
X-Gm-Message-State: AOAM531oUVj5TO4d6ZrlqBKc9YkBb1JF8QYhNTLAy/L+jm0We5J55C75
 iDB6yVwJMOoprMUa0N/TQMgfRg==
X-Google-Smtp-Source: ABdhPJyL2f0wv+rKE6UJvSOx+81F3Z8chNnSdoTBB796NysvUwvEzHFUHzPlKW8t4AE7MNcVBgjvSw==
X-Received: by 2002:a7b:c930:: with SMTP id h16mr8885676wml.175.1610039947864; 
 Thu, 07 Jan 2021 09:19:07 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 67sm9234968wmb.47.2021.01.07.09.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 09:19:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0DF161FF7E;
 Thu,  7 Jan 2021 17:19:06 +0000 (GMT)
References: <CAAQ-SiP8G28ade0jHbhTcv0jtGQb4OSgL5p3mAr0MU_FH8vZ3w@mail.gmail.com>
 <87a6tm2sxb.fsf@linaro.org>
 <CAAQ-SiOW8OnWEb0sHUEeS139-Tw0RO2YD1Tx-1s9iuy3ZVQFgw@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Subject: Re: VirtioSound device emulation implementation
Date: Thu, 07 Jan 2021 17:17:50 +0000
In-reply-to: <CAAQ-SiOW8OnWEb0sHUEeS139-Tw0RO2YD1Tx-1s9iuy3ZVQFgw@mail.gmail.com>
Message-ID: <878s941x85.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com> writes:

> On Wed, 6 Jan 2021 at 17:12, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
>>
>> Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com> writes:
>>
>> > Hey everyone!
>> >
>> > I want to work on implementing the emulation for the VritioSound devic=
e.
>> I
>> > contacted the mentor for the project, (Greg), who said it's fine and
>> that I
>> > should declare it on the mailing list in order to find out if someone
>> else
>> > is already working on this project. That is what this mail is for. I
>> tried
>> > searching for "Virtio", "Sound", and "VirtioSound" in the qemu-devel
>> > mailing archives but couldn't find anything. If someone is already
>> working
>> > on it, please let me know, and if not then I'll start working on it ri=
ght
>> > away.
>>
>> I'm not working on it but please feel free to CC me on discussion and
>> patches. I have a general interest on Virtio IO implementations at the
>> moment.
>>
>
> Sure! (Though I should mention that I do not know a lot about the virtio
> architecture yet. I am still reading up about it. So most of my mails mig=
ht
> be (silly) queries. Though I hope to learn about it soon and send in
> some patches and tests :)
>
>
>> Are you planning to make it an in-QEMU device or maybe a external
>> vhost-user daemon?
>
> The project page states that we need to use the QEMU audio subsystem
> for playing and capturing audio samples.

Is this one of the QEMU internship projects?

> I am not entirely sure if this implies that the device should be an
> in-QEMU device or if it could be an external daemon.

I think it implies having the entire emulation in-QEMU.

> What do you suggest?
>
> cc Gerd Hoffman
>
>
>
>
>>
>> --
>> Alex Benn=C3=A9e
>>


--=20
Alex Benn=C3=A9e

