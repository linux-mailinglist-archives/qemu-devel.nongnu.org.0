Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 559EA2B9512
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 15:49:40 +0100 (CET)
Received: from localhost ([::1]:39952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kflFj-00026i-E0
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 09:49:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kflE6-0000ZD-QF
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 09:48:00 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:38052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kflE4-0005x9-1k
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 09:47:58 -0500
Received: by mail-pg1-x533.google.com with SMTP id j19so4396293pgg.5
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 06:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZvAl/CRGnVemBaOR/TTKnegN9zIeeZi5BBLVMIpP/D0=;
 b=WeEGPAtNwD4Qeue3NbcvoUIUabjaHJpAxcRkr8lgW47MM6fzzs01yVHYq5CzAvvYlU
 dTESjefNs8pfGelR+GHS4XeUXaIipom7M8IMSkdXw2BAcV1lPO20JVycmTncA68004gs
 rNZ7SulVfyCI0c4daKXkl3e2fEHFia0dvICyRVinjohCTHe5dyq1xlnd89bHhmScKpo9
 FKklSbYAmPNWncsCfwUdHlGL76A5ikGqh5OjvvSb4a9T065LD8cvE78YUD+gcdt7S/74
 1wF1SL7LSgGMWLRkmD+Wu5TYZ2DtMPlFRdC8aYTC/EJOohji2iGyjHa1nKel5FWleAA5
 fmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZvAl/CRGnVemBaOR/TTKnegN9zIeeZi5BBLVMIpP/D0=;
 b=a/fy+VG18Fq50geLnQCbzFT/rDTYz2mXklL7VkDM2sk25lPRK1tD+YFxI+AMvqXuoM
 kQPGVghTP+fKJXxbfkdVvRHbLNSVJV6x6acKCtoSX0T1FYyj328y3t+O0sMSaL1Mc2qJ
 6F8S5stJ8CIvDmHbxgdJ3B3GQi12SoIV2IqQW3sNTlQNJOZiKEhKfp0+VluPCsb/mntn
 oQRAI3h25U6oLz4TDj7GUf3a2k724Si/6wpt2eRecD68BUd92NP53q0gNjuqXZ4rz6fG
 OVOKLHWg8XIWwVhXGo8fC22HfNxvKqVrfhHE7Ni2Xr2Cs7CyjCo3ZnryunGG6hnSkrE/
 sTIw==
X-Gm-Message-State: AOAM530X68Gn7PpoOYMMclIk79YkcksSQfOCPoVC/kElFMP9Zy9Fobpp
 NTf1CjURn81B7E8F8ewujBkzC7EFNkwgXZwdr14=
X-Google-Smtp-Source: ABdhPJyMp6QLVIO2S86XhXmp2kN5lRU6eIBGabgg2zDWBC/s83NHl0LqGVqDFyXtnNsEkuRqHzz+9G13LTKvWL5gGKI=
X-Received: by 2002:a17:90a:2a49:: with SMTP id
 d9mr4673012pjg.132.1605797274208; 
 Thu, 19 Nov 2020 06:47:54 -0800 (PST)
MIME-Version: 1.0
References: <20201119112704.837423-1-stefanha@redhat.com>
 <fbe8f975-45a7-02e0-4765-b958630f6f2d@redhat.com>
 <CAJSP0QUAFLUT22pos0YVagyCyJ=L-bGkGMgBHEVYnSCVX9Mpng@mail.gmail.com>
 <20201119143822.GC23928@redhat.com>
In-Reply-To: <20201119143822.GC23928@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 19 Nov 2020 14:47:38 +0000
Message-ID: <CAJSP0QUUBErMPLj4Fi8R4XcWLfLmBCcj_zTFWUkPV0-sLve0bg@mail.gmail.com>
Subject: Re: [PATCH-for-5.2 v2] trace: use STAP_SDT_V2 to work around symbol
 visibility
To: "Frank Ch. Eigler" <fche@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=stefanha@gmail.com; helo=mail-pg1-x533.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, "Richard W.M. Jones" <rjones@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 William Cohen <wcohen@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>, ddepaula@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 19, 2020 at 2:38 PM Frank Ch. Eigler <fche@redhat.com> wrote:
>
> Hi -
>
> > > Maybe add a comment? (no need to repost if you agree):
> > >
> > >        # Workaround to avoid dtrace(1) produces file with 'hidden'
> > >        # symbol visibility, define STAP_SDT_V2 to produce 'default'
> > >        # symbol visibility instead.
> > >
> > > > +    QEMU_CFLAGS="$QEMU_CFLAGS -DSTAP_SDT_V2"
>
> Please note that we don't know how long this behavior will persist.
> You are relying on an accident. :-)
>
> Much of the systemtap code doesn't support real STAP_SDT_V2 format,
> and /usr/include/sys/sdt.h cannot generate it at all.  That macro
> tricks only the dtrace-header-generator to suppress the "hidden"
> visibility attribute, but doesn't change probe metadata format to the
> old V2 (in .probes sections rather than .note.* ELF notes).
>
> We'll try not to break it, but please move toward the more proper
> per-solib or per-executable hidden copies of the semaphore objects.

Yes, thanks. Gerd Hoffmann has started working on per-solib semaphore
linking and this workaround will be replaced by it.

Stefan

