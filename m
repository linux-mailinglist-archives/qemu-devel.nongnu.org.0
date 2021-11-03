Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 370214440D0
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 12:52:02 +0100 (CET)
Received: from localhost ([::1]:35950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miEoC-00031m-U4
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 07:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miElK-0001CD-4J
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 07:49:02 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:46837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miElG-0004px-Ps
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 07:49:01 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so1592589wmb.5
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 04:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=n3WMCj3XHdpl9m3J23NMyQGUhsCZR4SB8NRHkE0BCcU=;
 b=sZCsJLfDK6i9qIK0ZO+LNIjlgK6cborExchjrnrCZnyVN2NLsxtsXEreg+xQh+OK0C
 ItaSw3rX2KZ1XSKSMlNhctb7uFb1j99hKtYttJBVK5utN285sy0BfMvEipUAUrsnjtwd
 jVa5/vGrkQBMLYmFKTXYnqhBHo81hIYHNUJ01/lPYQxuQmXjmBifw9Y/bskpxHbaitiV
 kIi4ffQDQT3HpAP7kYbyW7+U4J45/LrewktRi+N2f3+H+SVCPMcGAfJxTz3C4byY3lBb
 gwYX6q1IFqSaDsIWEUXJ4a48b1swX0vytYYWMmYkYdFhFnzFliKVuD1rsqZvFnkEWRNU
 7reA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=n3WMCj3XHdpl9m3J23NMyQGUhsCZR4SB8NRHkE0BCcU=;
 b=B80Lv1qUPPGTmDiR0MLs2fMtEL5tGtgoR3nMvc/cbTdz/7eKk+vjhzcpUJiLWI2zoc
 yil06BXtOtFSi1jsXhBle7HfzcQcRcKgiOTQ5EhpZ4Pybbh2veZgBYxXy9QFIsJtu1s2
 h5u8f8FHJfTssXx9N0hU1TifG1W45l9FvbwQ2NX3NwFavS0Gxxyq7hi/g5Y4fznLo610
 JJmNSzwmvByCE+oCOGzEMSX4El0d8OwZ3GQex/t0YuqSWWb8KzELlveqBfZ3xhAhwpQd
 3EszL4T+UW7Ra+0VNKUWvRvqFjB/jRdN6jPb8ZDda2F9OkWJvpE5DFfZt38+MZ0mNz/K
 nqYQ==
X-Gm-Message-State: AOAM533PGS1AZy/64IkfHftWKghCsrSDvcr23HoZ9iuJaSnmG+w8mNVe
 7GVKwmPQHB/bD+AsdNPMuTiaPg==
X-Google-Smtp-Source: ABdhPJzg819Uczc0Eg6YxyOiZ4rANOhNdBl9GHX8C4peTFKgD9TDvGQLZWAscs/tIB4WtGUXMNyYcg==
X-Received: by 2002:a05:600c:ad0:: with SMTP id
 c16mr14039180wmr.176.1635940136748; 
 Wed, 03 Nov 2021 04:48:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z1sm1776304wre.21.2021.11.03.04.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 04:48:55 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B3D061FF96;
 Wed,  3 Nov 2021 11:48:54 +0000 (GMT)
References: <20210926183410.256484-1-sjg@chromium.org>
 <CAFEAcA8S2=7rOKxeqcW+kw0BVPO3PUJGSUH-ioN7=c=U7zQxvg@mail.gmail.com>
 <CAPnjgZ2NCRVxKULWR1JjZU+D9saJ7fbZ=yHmWTSr3ufHxLYg-g@mail.gmail.com>
 <CAFEAcA9n+2JDFv8BezeEMA4e2Zhr0ENAvzLjBS6YXRoW9P-JXQ@mail.gmail.com>
 <CAPnjgZ1AO8575LYbwmuouNR5=dgNam6EFDC1_bai=8xAHdw7-Q@mail.gmail.com>
 <CAFEAcA8FsPcBELEZxiRMuFbKtmKTFgDHABePQ33hdxYRq0C0ig@mail.gmail.com>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/arm/virt: Allow additions to the generated device tree
Date: Wed, 03 Nov 2021 11:39:32 +0000
In-reply-to: <CAFEAcA8FsPcBELEZxiRMuFbKtmKTFgDHABePQ33hdxYRq0C0ig@mail.gmail.com>
Message-ID: <87ilx9jw7t.fsf@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?utf-8?Q?Fran=C3=A7ois?= Ozog <francois.ozog@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Simon Glass <sjg@chromium.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 27 Sept 2021 at 16:18, Simon Glass <sjg@chromium.org> wrote:
>> On Mon, 27 Sept 2021 at 02:48, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>> > So what is missing in the QEMU-provided DTB that it needs?
>>
>> Quite a lot. Here are some examples:
>>
>> U-Boot has limited pre-relocation memory so tries to avoid
>> binding/probing devices that are not used before relocation:
>>
>> https://u-boot.readthedocs.io/en/latest/develop/driver-model/design.html=
#pre-relocation-support
>
> It's up to u-boot to decide what it wants to touch and
> what it does not. QEMU tells u-boot what all the available
> devices are; I don't think we should have extra stuff saying
> "and if you are u-boot, do something odd".
>
>> There is a configuration node (which is likely to change form in
>> future releases, but will still be there)
>>
>> https://github.com/u-boot/u-boot/blob/master/doc/device-tree-bindings/co=
nfig.txt
>
> I think u-boot should be storing this kind of thing somewhere
> else (e.g. as part of the binary blob that is u-boot itself,
> or stored in flash or RAM as a separate blob).
>
>> Then there are various features which put things in U-Boot's control
>> dtb, such as verified boot, which adds public keys during signing:
>>
>> https://github.com/u-boot/u-boot/blob/master/doc/uImage.FIT/signature.tx=
t#L135
>>
>> More generally, the U-Boot tree has hundreds of files which add
>> properties for each board, since we try to keep the U-Boot-specific
>> things out of the Linux tree:
>>
>> $ find . -name *u-boot.dtsi |wc -l
>> 398
>
> If any of this is actual information about the hardware then you
> should sort out getting the bindings documented officially
> (which I think is still in the Linux tree), and then QEMU can
> provide them.
>
>> Quite a bit of this is to do with SPL and so far it seems that QEMU
>> mostly runs U-Boot proper only, although I see that SPL is starting to
>> creep in too in the U-Boot CI.
>>
>> So at present QEMU is not able to support U-Boot fully.
>
> My take is that this is u-boot doing weird custom things with
> the DTB that aren't "describe the hardware". You should be able
> to boot u-boot by putting those custom DTB extra things in a
> separate blob and having u-boot combine that with the
> actual DTB when it starts.

It's not entirely without precedent - for SPL (which I hope is secondary
program loading) we have things like the guest loader which expands the
plain HW DTB with some information needed by the bootloader and the
primary OS to load additional blobs which have been put into memory.

In effect the DTB is being expanded as a signalling mechanism similar to
things like fw_cfg and other things we use to control boot up. Whether
this affects the "purity" of DTB as a "just the HW" description is
probably a philosophical question.

I agree with Peter that just allowing the merging of arbitrary data into
the QEMU generated DTB is going to lead to confusion and breakages.
Indeed I wrote the guest-loader because instructions for booting Xen up
until that point involved dumpdtb and hand hacking the data which was
silly because this is stuff QEMU already knew about.

>
> -- PMM


--=20
Alex Benn=C3=A9e

