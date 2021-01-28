Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E6B3074AB
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 12:27:00 +0100 (CET)
Received: from localhost ([::1]:53246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l55Rx-0006PN-PA
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 06:26:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l55PY-0005yS-Ub
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:24:28 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l55PW-0008RJ-BW
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:24:28 -0500
Received: by mail-wr1-x435.google.com with SMTP id 7so5030393wrz.0
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 03:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=trO7BEeK5PT/KLW53+xjXZX3b4C5nPIzYtsLh86ws6o=;
 b=BwQeS4F6Vih9thYQsxNoeU6HCdMh937KW8UPXxBolM94lg4XOLy7S76OtmKTAXTf91
 OEIi4yPT3Lns6+ridpz/WCkITOX9lJW57x6+UuhgplDkNIUhSlBHfg/rYf0hum/7uQkf
 VXZVlzlygBTczytkv5GwyYmqc3EeYcsWWLs5WDXkW4lWcEHtwJrOWZI98CPRC2jx8u5q
 IeXcoJc22X0qBp6mDlNM+dLddlDLwf2QYPlKz4/771Ijt6YZ0mRxlrpFz7qA4D3nb635
 cQRYgQeeDnQxEJn8EuRBa/9+bWeuygbg5aHYL04HExudHWJnicR5I4lxdqgNJ8mqnut1
 AQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=trO7BEeK5PT/KLW53+xjXZX3b4C5nPIzYtsLh86ws6o=;
 b=p+zlE93rLYY0jRk+R2r5t3ZiIeFkaUQ8N8E7RP1C3JlnLLbvtg24Zy5We2UI301oyZ
 Apb6lKhxbNHVbLkduAtmNlr+cNW28Q7ua1/ct3xUkqlHuEaVLibaw3NXVOitTyIkH0CG
 aksua+lsUY6JqSsuyhGZvoEAak88O4TxQNOVxx7HqEJyVZ9LgXyoJEgGBgzyrDH+R3aa
 BNnQz1pvMgSj22wypJJPNYIRvPcO53/Jg8FlHYA+fxsPwWMa1rFC1YmFmUKUnqNaTgyG
 /WEncvR+oDWLIUL7gkv4CAFRIUMydpq7APClhEKVgDQ52V5k6gUWaIoPGmmkNqVnWyTj
 WyqA==
X-Gm-Message-State: AOAM53307BRbo/1N24ozDnHi7pVekjBe3YZPGQhXol7r/TMxBbcrzopj
 zss3CglP8Fti9cwjCUNXLRiqFw==
X-Google-Smtp-Source: ABdhPJzqt3lCbJmv32SOmuVyAYKIbApuKL4X47jMafV4MRu+4gnGY2OTbd4zo8/uSJRIICXJoLP3tA==
X-Received: by 2002:adf:80d0:: with SMTP id 74mr16138356wrl.110.1611833064569; 
 Thu, 28 Jan 2021 03:24:24 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d17sm1526760wma.2.2021.01.28.03.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:24:23 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 81C901FF7E;
 Thu, 28 Jan 2021 11:24:22 +0000 (GMT)
References: <CAAQ-SiP8G28ade0jHbhTcv0jtGQb4OSgL5p3mAr0MU_FH8vZ3w@mail.gmail.com>
 <87a6tm2sxb.fsf@linaro.org>
 <CAAQ-SiOW8OnWEb0sHUEeS139-Tw0RO2YD1Tx-1s9iuy3ZVQFgw@mail.gmail.com>
 <878s941x85.fsf@linaro.org>
 <20210108083433.pfzhxrd4rezk6yxe@sirius.home.kraxel.org>
 <CAAQ-SiO4VvVTo77J2ga1FmUZ9yrwopeASweO6-AFaakrAUZ80w@mail.gmail.com>
 <CAAQ-SiPiq5NQN=2mvP3isZ9PtYO2Bu64kVEvE6T+3OJd5B-U5A@mail.gmail.com>
 <CAAQ-SiMkJGBnxWSnybJqMD0LSASMtvA_wbrPDQcg-S+Y1ddjJA@mail.gmail.com>
 <878s8zptrf.fsf@linaro.org>
 <CAAQ-SiNKXhJcT1XEodQT6kojqppq37Kg8F8igipQ-HVYOU0=zA@mail.gmail.com>
 <87ft33l8an.fsf@linaro.org>
 <CAAQ-SiMY8W9TS7eXgWuHY0m4yjaRbqqsZ+41Xyhxm+gW0sYakg@mail.gmail.com>
 <CAAQ-SiM8_XnW1Ar5xocR7pUG_WW4SrQSnaKhqr1rY62ti2pw7Q@mail.gmail.com>
 <CAAQ-SiPcBeGGgYcPHn7WSnz4jLAza+hE7tSMYSHJ-caC66D48A@mail.gmail.com>
 <CAAQ-SiPPk9EfrEq7ja0X2E7gq5x9dH9C3LBDNc4frNi8Ssijug@mail.gmail.com>
 <CAAQ-SiMsrkDYzqqqRXONw_HCdORqssw-yL9dFGF32y7aG68iCQ@mail.gmail.com>
 <87v9blmf1x.fsf@linaro.org>
 <CAAQ-SiNRykBeMFRvjumJ1hbcT3vjuL2bcGU=RBLpksNJNGYm+Q@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Subject: Re: Fwd: VirtioSound device emulation implementation
Date: Thu, 28 Jan 2021 10:42:21 +0000
In-reply-to: <CAAQ-SiNRykBeMFRvjumJ1hbcT3vjuL2bcGU=RBLpksNJNGYm+Q@mail.gmail.com>
Message-ID: <87o8h9wbh5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com> writes:

> Thanks a lot Alex!
>
>> All QEMU devices have two parts, a frontend (which the guest sees) and a
>> backend (which is how the data gets to somewhere in the host). Some of
>> the command line options in QEMU elide the details for convenience (-nic
>> and -drive are examples). The -netdev device is all about configuring
>> the backend of the network part for a paired -device front end. There is
>> a similar setup for audio (-audiodev) although I'll defer to Gerd's
>> expertise on how the two interact.
>
> This helped me understand a bit more about how the devices work. In the
> source
> code, I found the `virtio-net-pci.c` and `virtio-net.c` files, I think the
> pci device is what is visible to the guest.
> So `virtio-net-pci.c` should be the front end?

No - they are both front-ends. In VirtIO you have two transports. The
first is virtio-mmio which is a simple set of memory mapped IO
registers. There is no discovery (well there is some but the guest needs
to find where in memory the mmio bus is via some method like hardcoded
address or DTB).

The second is virtio-pci. Here the virtio devices are encapsulated in a
PCI bus so you get the benefits of discovery and bus enumeration.

> For the realize function, I saw that the `virtio_net_device_realize`
> function initializes
> the `net_conf` for the device. So I am guessing that the
> `virtio_snd_device_realize` function
> should initialize the number of jacks and streams a device has, along with
> the configuration
> for all these jacks and streams?

No those are all front-end configuration knobs.=20

> The thing is I do not understand `net` devices all that well so I get a b=
it
> confused with
> what is specific to a net device and what should I actually be worried
> about :)
>
> The device initalization step mentions that the jack and streams should be
> read and
> a query should be made for the config of all jacks and streams. What shou=
ld
> be the
> default values of these configurations? I think the realize function is
> responsible
> for setting these up.

Gerd?



--=20
Alex Benn=C3=A9e

