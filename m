Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BF5383B68
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 19:37:20 +0200 (CEST)
Received: from localhost ([::1]:39296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lihB9-0008Kr-Fi
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 13:37:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lih80-0005rd-JK
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:34:06 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lih7t-0005CE-Pt
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:34:04 -0400
Received: by mail-wr1-x434.google.com with SMTP id z17so7273724wrq.7
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 10:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=FRN5NxbdVzdG4FkLQJDpZhdofz87tsYGeQhczznfpjM=;
 b=f2N0XhYrFoSX8E/PfJJt1zc5yhbCXM+xnVD4gGNkpoxPvT2Uh7Tsr1BPuRckvqgFzp
 QBYAT8sRtHkSHfpwTzKdcG8C6i1iSf2O8Kdsc7pwGp4YR3pyJAEiazr8gPGU2NGUDoOA
 GzgeLtHy+IQJB5cPKqBYN2ad7NuKe5qFw/eQooaMTfkldtBro3aGtIf/zsF7EsCQqdy0
 4CeB3wocQQzojINq7/fPCaUk5If3/+zgeuyfud9vMISl+0A5ywlFkd05iYHt5j8GlGJP
 NbJneSjPdqrVIDtf6mTNRxVZTD9RbchknIsNHrxlvw0G0TAQpzb1qWFnRAUyTMaFgERQ
 TKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=FRN5NxbdVzdG4FkLQJDpZhdofz87tsYGeQhczznfpjM=;
 b=eV7r0CHCxe1Lh/dGjDi2woagLIWP7cUPci0ftTtRNDPCN47RZgESDL4IKJGBznwD0a
 q5syUT6cZrF1QRGYcOBpY4PZOYvS57kGquBd8K+o6CMqRoZ679yzPrYUV1HVKcu+u7cZ
 U1EXFIjo/ylEwMZNZdq7TU57wDtwFNAsn/Rz9tdS4pHxWMA97Jsgt//YQ/sMPhF5nVG1
 71TqrUPovSR7RXU4Lmh6s7XDo3ECYBlUBBkTXCpACCBJLXGvBzMvV50FSa1ZWi4eJwGY
 23Iherz0myGuKHzSnJ3nDgfat6WkygqI6NvmIrzTjDcuS/bd6K+6O2hnDM4zjASGJhw2
 N58w==
X-Gm-Message-State: AOAM5316ksxYqIQV+ygLjltpAyUuz6pJwIjjcj/YcwZPGscw6Hnwiso7
 77fvqOH5VTUGhxL5Uil50gjhIg==
X-Google-Smtp-Source: ABdhPJzWvTjBvBU1ZdvcrckUSWVhw1RQvbZ7GiRjcS+Zk09s+QDP53D8ItjsDarglYJ8L9jft5lAIw==
X-Received: by 2002:a5d:4536:: with SMTP id j22mr918289wra.329.1621272833883; 
 Mon, 17 May 2021 10:33:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c22sm15458574wmb.10.2021.05.17.10.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 10:33:53 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 64E2D1FF7E;
 Mon, 17 May 2021 18:33:52 +0100 (BST)
References: <87y2chjmsf.fsf@linaro.org>
 <6c8845b7-cc60-c8ba-3ada-6d0c6e65d8a5@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Luis Machado <luis.machado@linaro.org>
Subject: Re: Best approach for supporting snapshots for QEMU's gdbstub?
Date: Mon, 17 May 2021 18:27:06 +0100
In-reply-to: <6c8845b7-cc60-c8ba-3ada-6d0c6e65d8a5@linaro.org>
Message-ID: <87bl99e03j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, gdb@gnu.org,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Luis Machado <luis.machado@linaro.org> writes:

> Hi,
>
> On 5/14/21 1:06 PM, Alex Benn=C3=A9e wrote:
>> Hi,
>> I've been playing around with QEMU's reverse debugging support which
>> I have working with Pavel's latest patches for supporting virtio with
>> record/replay. Once you get the right command line it works well enough
>> although currently each step backwards requires replaying the entire
>> execution history until you get to the right point.
>> QEMU can quite easily snapshot the entire VM state so I was looking
>> to
>> see what the best way to integrate this would be. As far as I can tell
>> there are two interfaces gdb supports: bookmarks and checkpoints.
>> As far as I can tell bookmarks where added as part of GDB's reverse
>> debugging support but attempting to use them from the gdbstub reports:
>>    (gdb) bookmark
>>    You can't do that when your target is `remote'
>> so I guess that would need an extension to the stub protocol to
>> support?
>>=20
>
> Right. We don't support reverse step/next/continue for remote targets.
> I think this would be the most appropriate way to implement this
> feature in GDB. But it is not trivial.

You do because ";ReverseStep+;ReverseContinue+" is part of the gdbstub
negotiation handshake.

Out of interest how is rr implemented? It presents a gdb interface so I
thought it was some implemented using some remote magic.

<snip>

>> We could of course just add a custom monitor command like the
>> qemu.sstep=3D command which could be used manually. However that would be
>> a QEMU gdbstub specific approach.
>
> That would be an easy and quick way to allow GDB to control things in
> QEMU, but I wouldn't say it is the best. Monitor commands are
> basically a bypass of the RSP where GDB sends/receives commands
> to/from the remote target.

We have some underlying commands we can set via the monitor including:

  monitor info replay
  monitor replay_seek <N>
  monitor replay_break <N>

>
>> The other thing would be to be more intelligent on QEMU's side and
>> save
>> snapshots each time we hit an event, for example each time we hit a
>> given breakpoint. However I do worry that might lead to snapshots
>> growing quite quickly.
>
> GDB would need to be aware of such snapshots for them to be useful.
> Otherwise GDB wouldn't be able to use them to restore state.

What does GDB need to know about them? Does it include something like
the icount at a particular point.

I'm curious at how a break and reverse-continue is meant to work if that
breakpoint is hit multiple times from the start of a run. You need to
know if the last time you hit a particular breakpoint was in fact the
last time before where the user was when they hit reverse-continue.

>
>> Any thoughts/suggestions?
>>=20


--=20
Alex Benn=C3=A9e

