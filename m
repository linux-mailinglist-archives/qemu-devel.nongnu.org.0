Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 453A22F120B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 13:02:58 +0100 (CET)
Received: from localhost ([::1]:52596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyvuT-0001aS-AM
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 07:02:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kyvt8-00019q-Ci
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 07:01:34 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kyvt3-00038R-B9
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 07:01:33 -0500
Received: by mail-wm1-x32b.google.com with SMTP id g185so14813486wmf.3
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 04:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=qmLiGWF6aFMRpI/OI6NYuFaTqvT2DUkAlGt+G2nDphM=;
 b=EmNRzg2MSaiZe9YB9uDuz39990KPW07GO3oDoULlugMqh8MDRymzZZNVZp4IByfRlI
 Fd0q2sA69N3IVLSEkOOduHSyE72I4cS2VW2o9u7vdEw4yuGYeXbNn9MNlj7EUQ0QXbck
 OQa0DZEd4CYFKdjwOR8KV9nrktO0bC34isF8q6RcgrWCFRI8U0+cMZp6ErZl1mrkf6H6
 JmankZP+aqVk3DNng87rBSfW/CQ/UJAryR4/3R8ryC6Ucfa0XmG0UtelvLJeFtlApzEn
 UaBp4Q0+Fgta0nEVEAKClNnTH8pPjzYSJnLLpyF8gSK7tl3zoMXYlFxjSz/P/jERWWdk
 kCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=qmLiGWF6aFMRpI/OI6NYuFaTqvT2DUkAlGt+G2nDphM=;
 b=pGF5Lz7uGHmzbJqbv7v1evDs4kxJi8mkGxlY7ylhgT+jidLWeSu5t3XrDHFxb/39yf
 qHDX+LVC/5E7onkpG32bCCEMydbWBzP7bIuc8UOo+fvaI7N3vwpYFaIx9uxKWg9G0xDO
 USf9DEQfFAghPtwruHSczhM4vXBYhnq+wQt7BfkU+1GHRc15rksN35eo5Um9iNMWYFID
 QlRiEAMfpMAnTg21EepPuQijmOQxZUNnt4Inlr5ntJQYHyrU688IDLWYNNgi1Fnir1rr
 CRK0zZjsYhCFmhzEe4FxHCLvvzU/+MW0VQ91M+kyLprgLct9xaavRGsEDaSpaw2PG4s/
 wzYQ==
X-Gm-Message-State: AOAM531BY8xuCOzfWX168OcTb6LhB1z1+IiVfkjNQYulzNBhCqDNTcjW
 YAVUDGH75s0cfk0SRFPpKCbepw==
X-Google-Smtp-Source: ABdhPJzO+I+BBF0xNZ8/EgDrnCvqJunYSg4TaAnBMJ7IKen/JH4/tougRicHMtuqZLv5lkAKCIJkhg==
X-Received: by 2002:a1c:ba44:: with SMTP id k65mr14364913wmf.188.1610366486882; 
 Mon, 11 Jan 2021 04:01:26 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m14sm23759647wrh.94.2021.01.11.04.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 04:01:25 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8FE8E1FF7E;
 Mon, 11 Jan 2021 12:01:24 +0000 (GMT)
References: <CAAQ-SiP8G28ade0jHbhTcv0jtGQb4OSgL5p3mAr0MU_FH8vZ3w@mail.gmail.com>
 <87a6tm2sxb.fsf@linaro.org>
 <CAAQ-SiOW8OnWEb0sHUEeS139-Tw0RO2YD1Tx-1s9iuy3ZVQFgw@mail.gmail.com>
 <878s941x85.fsf@linaro.org>
 <20210108083433.pfzhxrd4rezk6yxe@sirius.home.kraxel.org>
 <CAAQ-SiO4VvVTo77J2ga1FmUZ9yrwopeASweO6-AFaakrAUZ80w@mail.gmail.com>
 <CAAQ-SiPiq5NQN=2mvP3isZ9PtYO2Bu64kVEvE6T+3OJd5B-U5A@mail.gmail.com>
 <CAAQ-SiMkJGBnxWSnybJqMD0LSASMtvA_wbrPDQcg-S+Y1ddjJA@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Subject: Re: Fwd: VirtioSound device emulation implementation
Date: Mon, 11 Jan 2021 11:59:52 +0000
In-reply-to: <CAAQ-SiMkJGBnxWSnybJqMD0LSASMtvA_wbrPDQcg-S+Y1ddjJA@mail.gmail.com>
Message-ID: <878s8zptrf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com> writes:

> ---------- Forwarded message ---------
> From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
> Date: Mon, 11 Jan 2021 at 11:59
> Subject: Re: VirtioSound device emulation implementation
> To: Gerd Hoffmann <kraxel@redhat.com>
>
>
>
>
> On Sun, 10 Jan 2021 at 13:55, Shreyansh Chouhan <
> chouhan.shreyansh2702@gmail.com> wrote:
>
>> Hi,
>>
>> I have been reading about the virtio and vhost specifications, however I
>> have a few doubts. I tried looking for them but I still
>> do not understand them clearly enough. From what I understand, there are
>> two protocols:
>>
>> The virtio protocol: The one that specifies how we can have common
>> emulation for virtual devices. The front end drivers
>> interact with these devices, and these devices could then process the
>> information that they have received either in QEMU,
>> or somewhere else. From what I understand the front driver uses mmaps to
>> communicate with the virtio device.
>>
>> The vhost protocol: The one that specifies how we can _offload_ the
>> processing from QEMU to a separate process. We
>> want to offload so that we do not have to stop the guest when we are
>> processing information passed to a virtio device. This
>> service could either be implemented in the host kernel or the host
>> userspace. Now when we offload the processing, we map the
>> memory of the device to this vhost service, so that this service has all
>> the information that it should process.
>>   Also, this process can generate the vCPU interrupts, and this process
>> responds to the ioeventfd notifications.
>>
>> What I do not understand is, once we have this vhost service, either in
>> userspace or in kernel space, which does the information processing,
>> why do we need a virtio device still emulated in QEMU? Is it only to pass
>> on the configurations between the driver and the
>> vhost service? I know that the vhost service doesn't emulate anything, b=
ut
>> then what is the difference between "processing" the
>> information and "emulating" a device?
>>
>> Also, from article[3], moving the vhost-net service to userspace was
>> faster somehow. I am assuming this was only the case for
>> networking devices, and would not be true in general. Since there would =
be
>> more context switches between user and kernel space?
>> (KVM receives the irq/ioevent notification and then transfers control ba=
ck
>> to user space, as opposed to when vhost was in kernel
>> space.)
>>
>> For context, I've been reading the following:
>> [1]
>> https://www.redhat.com/en/blog/introduction-virtio-networking-and-vhost-=
net
>> [2]
>> https://www.redhat.com/en/blog/deep-dive-virtio-networking-and-vhost-net
>> [3] https://www.redhat.com/en/blog/journey-vhost-users-realm
>>
>>
> Found the answers in this blog:
> http://blog.vmsplice.net/2011/09/qemu-internals-vhost-architecture.html
> In short, yes, the configuration plane still remains with QEMU. The
> frontend driver interacts with the PCI
> adapter emulated in QEMU, for configurations and memory map setup. Only t=
he
> data plane is forwarded
> to the vhost service. This makes sense since we would only want to
> configure the device once, and hence
> having that emulated in QEMU is not a performance issue, as much as having
> the data plane was.

Also if you are running a pure TCG emulation QEMU can pass along the
signalled events from the guest to the vhost-user daemon as well.

> There is still a little confusion in my mind regarding a few things, but I
> think looking at the source code
> of the already implemented drivers will clear that up for me. So that is
> what I will be doing next.
>
> I will start looking at the source code for in-QEMU and vhost
> implementations of other virtio drivers, and then decide which one I'd li=
ke
> to
> go with. I will probably follow that decision with an implementation
> plan/timeline so that everyone can follow the progress on the
> development of this project.


--=20
Alex Benn=C3=A9e

