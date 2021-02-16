Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D4A31CC73
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 15:53:28 +0100 (CET)
Received: from localhost ([::1]:41854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC1jD-0007iL-Dr
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 09:53:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC1hk-0006vq-KC
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:51:56 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:40143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC1hi-0004vw-LL
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:51:56 -0500
Received: by mail-ej1-x62c.google.com with SMTP id b14so11013031eju.7
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 06:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BSAIdYa1Na355P1BQL3NX/5vMdW9WYbKkGaWnI1HUcQ=;
 b=xrjlaETFoQElV5+vkRU1JY+D8xE/lHXOzoOBZyUGpIVuGJYN64Kw+AXOCvmQOqApiz
 8ahHB8eW+tUd7v4w7EaVdWr1eAVQGaSkiwS2Gys+V+dtPd48B9n5Kr+Jb3afMIEYa3r9
 Wnc2SudB453OaxUD6mJzbcBljrWTMrVcPH9qWhwHoiVXOboEKLyy/k6zTFjllOYKDjyT
 NnKx/JP7nDTN7wOypJM/Z9OhAN7+npktxyW8TH8YS5621Opk3al0pkJ6ckVOSpiQT7qU
 ReGdk1adcEKa200zp7pnwZqizmjI/s9W+A8CsBJgeU55a7IwdlX7IER1+Vhu6PhDsWFE
 X9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BSAIdYa1Na355P1BQL3NX/5vMdW9WYbKkGaWnI1HUcQ=;
 b=EpiVLF/WeRn7hdii5Pw2FBroWs9/LOy51u0EMWk/JNgXayv+KPsQGUopcmTbZodP2U
 EROhZr6j6HSt66tsysZT+pNO/mldLJCTQni4Ll/A3QiN9G1FucJFtv+8XSZHd+aJJb38
 cqRAa56YQIh4290MUufTuNru4x9LZD1Viy8Ad/cH60ovg2wTSd3ejn68Zo4blxXC4aNG
 d75galj3NSTrJbNXDW1f7ESe+rBBWDBn35ruxiVLDFnLCenw2ep23Lx+NKW9kkUeB0HC
 PAjDExw59yLqQj33dVmqO1MtOxhFyvUR2k0dO2cqmAsCSvuhtLTBX2Rtr1AFK1RaVA26
 tLRw==
X-Gm-Message-State: AOAM530HxBTPsxVEjsLfL38fi8wBGADa7CDPM/gSol0N76NEFQSZN4Z5
 LbGwBdLjD9HJ4YCk3mwoT/eXGQFEBatcM6lC7AM33Q==
X-Google-Smtp-Source: ABdhPJwNF6Ei7ax60iA0VHA2lKWNcl2RMp0u34FJ4Y3Drl5hLDaEC/p20Pz9MW2p4URAQN2J1YVrrYib8Fpcs1DnSNU=
X-Received: by 2002:a17:906:1d51:: with SMTP id
 o17mr20957138ejh.85.1613487112965; 
 Tue, 16 Feb 2021 06:51:52 -0800 (PST)
MIME-Version: 1.0
References: <20210123143128.1167797-1-pbonzini@redhat.com>
 <20210123143128.1167797-32-pbonzini@redhat.com>
 <CAFEAcA8R84_-BPG-suKDvkpE1BxG8o1edGv=zfU_CCw27pK4eg@mail.gmail.com>
 <CABgObfZNy_j3DYt3NKKvC1Ou8TW2zACZ2LffnrR7LU8PeS5hww@mail.gmail.com>
 <CAFEAcA_6RiR+ud5U0Y9K3jNmEoQ-Ex8fZN3-o0MkLxpK8PROgw@mail.gmail.com>
 <378df6af-8383-8a51-4286-54739dba99e4@redhat.com>
 <CAFEAcA9-bOggKPjJiZNc3WXD9Uu-TxzDc7NMvUDGgoM7ERg3hg@mail.gmail.com>
 <1a8f0b62-0adf-9360-2365-e9881a6aef94@redhat.com>
 <CAFEAcA8VCGmqbdLFLQ0R9Uun4MzxLTnOZExmYJZ65qZ_fjDUvg@mail.gmail.com>
 <f61447bf-f556-b626-4a6c-f86e724b0f7f@redhat.com>
 <CAFEAcA9G7CQDPb1QNaajwG5wSdND-E5nkTox1yEocdsBDsfc3g@mail.gmail.com>
 <9f9999eb-66a5-3fe4-64fe-41f64edb49ff@redhat.com>
 <CAFEAcA9c01xj0bGcKai-wOeR_c67+Uvcse1Xn=tbYRE7tjwhSw@mail.gmail.com>
 <CABgObfa+0zJdDvJPbX4j2+-cSU=BxVHTd5_U+mnbfYn7ct8qJw@mail.gmail.com>
In-Reply-To: <CABgObfa+0zJdDvJPbX4j2+-cSU=BxVHTd5_U+mnbfYn7ct8qJw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 14:51:41 +0000
Message-ID: <CAFEAcA9G2eVMG3we5E6cyeY-qYt_y5JTt6qeBj+_p9eqLQARMg@mail.gmail.com>
Subject: Re: [PULL 31/31] qemu-option: warn for short-form boolean options
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Feb 2021 at 14:45, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Il mar 16 feb 2021, 15:11 Peter Maydell <peter.maydell@linaro.org> ha scr=
itto:
>>
>> On Tue, 16 Feb 2021 at 13:44, Paolo Bonzini <pbonzini@redhat.com> wrote:
>> >
>> > On 16/02/21 14:36, Peter Maydell wrote:
>> > > Broadly, I think that being able to say 'foo' when foo is a
>> > > boolean option being set to true is obvious and nice-to-use
>> > > syntax, and I don't really want it to go away. 'nofoo' for
>> > > 'foo=3Dfalse' is much less obvious and I'm happy if we only
>> > > support it as a special-case for 'nowait'.
>> >
>> > It really depends on what the default  "-M pc,nographics" arguably mak=
es
>> > sense too (more so than "-M pc,graphics" since true is the default).
>>
>> Is anybody using 'pc,nographics' ? google didn't find any examples.
>
>
> It's just an example that the prevalence of "nowait" over "wait" is simpl=
y because the default of "server" is false while the default of "wait" is t=
rue. Any boolean option whose default is true could benefit from a "no"-pre=
fixed short form. But I am pretty sure that there are users in the wild for=
 noipv4 or noipv6.

I think 'nowait' is special only because for so long our documentation
has recommended 'server,nowait' (and possibly also because inetd
uses 'nowait'?). I don't think it's inherently much better than
"wait=3Doff" or whatever. I just think that if we have a situation
where exactly 1 boolean option has very widespread use of 'nofoo' then
it's worth special casing it. If we had 50 boolean options which all
had about 10% use of 'nofoo' vs 90% 'foo=3Doff' that would be different.

-- PMM

