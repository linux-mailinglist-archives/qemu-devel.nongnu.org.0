Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C385238C895
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 15:46:14 +0200 (CEST)
Received: from localhost ([::1]:36536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk5Th-00051k-Qh
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 09:46:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lk5SK-0003e2-Tm
 for qemu-devel@nongnu.org; Fri, 21 May 2021 09:44:48 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:41630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lk5SJ-00079w-Ad
 for qemu-devel@nongnu.org; Fri, 21 May 2021 09:44:48 -0400
Received: by mail-ej1-x630.google.com with SMTP id gb17so12525802ejc.8
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 06:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q7PNiwNoHCthhohK2nlZun7o9OOPlQ3srXDsQsOOV98=;
 b=HhCwJi1f2deeyrVEdnty8yd3a5wdIfFVThem0VdRMM9s/peAhyemzP016bcg7xXjpN
 cdky2AhCoGmqbXF0sM8z4RR9Mnt5Cz6ntdMaATQM35Bl1EKVPsYwYNYT+wkAggycxlWL
 NAZywQuYzDnQldO3ZSxfChbaCPspAMyshRpAybwMb4a34igtyq6GBnAdAeQbLUNzwdYm
 EcjF8JphPFzh8QS0o2o57FR573y1b3gWm6QCztwpHY2w//9TgTBZX+2hE6lsOkA4x7ww
 xXHa0laBg6Pmn1rPAzI5KQKz+c2H3iJ2oa9bUStAgAYVi92liX1A7KQ4s8QvrBgh+YQ3
 EWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q7PNiwNoHCthhohK2nlZun7o9OOPlQ3srXDsQsOOV98=;
 b=GDKTxpwO28Adt71PhCy3dnVcqLj8TsayoHxuPxmBz4h2M+o9OE29m9X7o5AnOjCiYB
 ZMw2saCxlSdie13qq21/YfP6klRYbmzycvxcPY/iYLceEsnkjhPyN1rymbfAvkAEqQji
 wVUY++A23w0tYC80WFIpQ3k+0U7DAuMTW3iuVI9JSC+tJq4SIIVHqGBlrHIAKPbioEmx
 ChX9II9iO/RJ31WKr4YhUox1Eylh5QuRbwt4lQMBrjqbiyQRcPKY/VrjXZT0mvZddN1C
 mx0kIsoDo7Xv5xMCbO6zF2eBzFSPp4C+8BeSoVl8e+N7MvoK7wLqxYooHfHY7qChrLKi
 9Ohw==
X-Gm-Message-State: AOAM5312aa8pMdGk58DkHCWggwHEg49PFjPWZn6730M4tcT7lc3m2EGm
 k6OJE1d9ZWGAiTRJLCfgMKZkZ5aVo3df+8V4XF36ng==
X-Google-Smtp-Source: ABdhPJxnlgByxoLNNyeF6Vd2yTXogMymEDbUiCvtXtTofXLyiwk0rWsWVMaBawomIG57njxKB2bF5B919uGm3x3P3qc=
X-Received: by 2002:a17:906:d8cb:: with SMTP id
 re11mr10445249ejb.482.1621604685784; 
 Fri, 21 May 2021 06:44:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210520082257.187061-1-pbonzini@redhat.com>
 <CAFEAcA_MV=UiHW4Kp3Zb4iT_5BHgqVwj9Qem1xjmp1AJ++K=sQ@mail.gmail.com>
 <7775729e-e217-f469-429b-a966996a1ef3@redhat.com>
In-Reply-To: <7775729e-e217-f469-429b-a966996a1ef3@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 May 2021 14:44:25 +0100
Message-ID: <CAFEAcA8CbJyJaooT9xS+Tg+omPCz+w_6rSJER49_MMhHt8h7rw@mail.gmail.com>
Subject: Re: [PULL 00/26] Misc patches for 2021-05-20
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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

On Fri, 21 May 2021 at 14:27, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 20/05/21 15:26, Peter Maydell wrote:
> > WARNING: Project specifies a minimum meson_version '>=0.55.0' but uses
> > features which were added in newer versions:
> >   * 0.57.0: {'test() timeout <= 0'}
> >
> > ERROR: Could not detect Ninja v1.8.2 or newer
> >
> > (This system has ninja-build 1.7.2.)
>
> What OS is it, and is there any chance of updating it?  ninja 1.7 was
> released in 2017, and I checked that all the supported OSes for QEMU
> have 1.8 before sending the pull request.

It's the gcc compile farm's ppc64 box, whose /etc/redhat-release
says it's running "CentOS Linux release 7.9.2009 (AltArch)".
I don't have control over system upgrades for it.

I do notice that there's a newer ppc64 box in the farm running
Debian 11 (bullseye), so maybe we could just switch to using that.

> > Also, my OSX build which I configure with
> > ../..configure --extra-cflags='-fdiagnostics-color=never -Werror
> > -Wno-error=deprecated-declarations'
> >
> > now triggers a meson.build warning:
> >
> > ../../meson.build:118: WARNING: Consider using the built-in werror
> > option instead of using "-Werror".
> > ../../meson.build:120: WARNING: Consider using the built-in werror
> > option instead of using "-Werror".
> > ../../meson.build:122: WARNING: Consider using the built-in werror
> > option instead of using "-Werror".
>
> Which makes sense since we have --enable/--disable-werror.

Mmm. I think I started using cflags for that back when configure
never enabled Werror for anything except Linux. I'll check that
there isn't some subtle issue with -Werror and -Wno-error=foo
needing to be in a particular order in the command line, but otherwise
I'll just update the configure rune for that build box.

thanks
-- PMM

