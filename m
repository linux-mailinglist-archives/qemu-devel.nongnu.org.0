Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F308382A2F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 12:50:42 +0200 (CEST)
Received: from localhost ([::1]:48018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liapb-0002dT-NO
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 06:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1liaoA-0001wE-QJ
 for qemu-devel@nongnu.org; Mon, 17 May 2021 06:49:10 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1liao7-00047d-2G
 for qemu-devel@nongnu.org; Mon, 17 May 2021 06:49:10 -0400
Received: by mail-wr1-x432.google.com with SMTP id q5so5874518wrs.4
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 03:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=y6l3j5PJ3ijBfURf0r4bHTAU9mgigk0E9BRT1thrkjE=;
 b=I0eUZu6UhzxoKqDMQQVh6xuJ4Jt6GPQ1KsDDT9+c2ef80kaR8ihgSINDVaJeiCASNf
 SCBO+sB7hBFqBw5Eo9mfGuc/IiNP32GvP1CW64yIgpGZGQI3bBDEOfCq8GeFGp/Jkn4q
 5Eb1Pb2ZXJh5LGSDA+ymCMGK8Zj/SLAkdsd8YTDKX7lCdw84KL2cfXXIUCAtJMSoCWa/
 1Jtd59c5SHMZZ68MIiDUGBZIOrJEGBBA0Z76NOLdAr0t6ckB+h+4sTa4st8ck+40BT4C
 Ico+nEM/0MvCyIEfkfMQjgY7/fQG9cwtXwLf0eXsfPpcvn+yAhWn8l+lTM+L9cCFKwi9
 jrIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=y6l3j5PJ3ijBfURf0r4bHTAU9mgigk0E9BRT1thrkjE=;
 b=gg2KnURozaDWoIUD0Wt+KPXnfl5sSuDy4/IpbcdOhixfydFJzq9wj8pBCBj4LOr9fD
 hZdQScf5Q5fUtc1WLsmOkv3qZC6uPvcVKemia8Zd0shVBFCHe2AmcTetZVXVtraNpBkM
 VlJ/+hBFzrnJsyJooPPVX/0OHcc6XI5KVGK3I7KZvqD1kF6IzNbyX5hC2XWGf6yZ1je0
 7ubRWbDvEtx8xsgemN9Vsu6lsiGQpMAzR2rFDKraZ/ZnWA957nBHfGXc+YR1OepjYCKD
 AJ1U+012WWLp93IhUDUCJw5BXvRR0TlAkjzUoU0t2yv2TGtFIdOsQQE1zNRpwPdJEBBi
 h0/A==
X-Gm-Message-State: AOAM530/toQlsg4TO7zBSd2Tfnd1qTiRNqjMD4kp5sf7G5F4EZPcmFhz
 qTgyJ255oO+7LH76aJgbLHERtg==
X-Google-Smtp-Source: ABdhPJy4h5PHT6Wa/dHvkgVYTOzVYm5hfMiGWjzg2OTwnx7HC5TtRUPEkzlApjWr1d26FGHUR7ri6A==
X-Received: by 2002:a05:6000:1084:: with SMTP id
 y4mr74151306wrw.309.1621248544438; 
 Mon, 17 May 2021 03:49:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b10sm4221895wrn.9.2021.05.17.03.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:49:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CB2031FF7E;
 Mon, 17 May 2021 11:49:01 +0100 (BST)
References: <20210505092259.8202-1-alex.bennee@linaro.org>
 <20210505092259.8202-6-alex.bennee@linaro.org>
 <YJJmYOWDl0UzziW7@redhat.com> <87lf8to49d.fsf@linaro.org>
 <87im3xo3zv.fsf@linaro.org> <YJJ41bUEY+Gfkw/Z@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v1 5/7] docs: mark intention to deprecate TCG tracing
 functionality
Date: Mon, 17 May 2021 11:47:11 +0100
In-reply-to: <YJJ41bUEY+Gfkw/Z@redhat.com>
Message-ID: <87eee5eiua.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 qemu-devel@nongnu.org, robhenry@microsoft.com, aaron@os.amperecomputing.com,
 vilanova@imperial.ac.uk, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, stefanha@redhat.com, mohamad.gebai@gmail.com,
 kuhn.chenqun@huawei.com, matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Wed, May 05, 2021 at 11:41:46AM +0100, Alex Benn=C3=A9e wrote:
>>=20
>> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>>=20
>> > Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>> >
>> >> On Wed, May 05, 2021 at 10:22:57AM +0100, Alex Benn=C3=A9e wrote:
>> <snip>
>> >>> +TCG introspection features
>> >>> +--------------------------
>> >>> +
>> >>> +TCG trace-events (since 6.1)
>> >>> +''''''''''''''''''''''''''''
>> >>> +
>> >>> +The ability to add new TCG trace points has bit rotted and as the
>> >>
>> >> When you say this "has bit rotted", just how bad is the situation ?
>> >>
>> >> Is the TCG tracing still usable at all, or is is fully broken
>> >> already ?
>> >
>> > Well patches 6/7 got it working for generic TCG things. I haven't been
>> > able to get the architecture one working but I suspect that is some so=
rt
>> > of interaction between the per-arch trace header generation that I
>> > haven't quite figured out yet.
>>=20
>> Ahh it's since 7609ffb919 (trace: fix tcg tracing build breakage) which
>> limited tcg/vcpu events to the root trace-events file.
>
> That commit is from release 2.10.0.
>
> The other commit mentioned in patch 6 (73ff061032) is from 2.12.0.
>
> So no one has been able to use this feature for 3+ years already.
>
> Is it actually worth fixing and then deprecating for 2 releases before
> deleting, as opposed to just deleting the broken code today on basis
> that it can't have any current users ?

Well I can get it up and running with the aforementioned patches and it
seems reasonable to give some notice. I'm happy to defer to Stefan here
though as it's his sub-system.

>
> Regards,
> Daniel


--=20
Alex Benn=C3=A9e

