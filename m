Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D89B52009AF
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 15:14:25 +0200 (CEST)
Received: from localhost ([::1]:57908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmGqe-0007dB-UD
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 09:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmGob-0005mu-Gu
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 09:12:17 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:42087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmGoZ-00027p-L2
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 09:12:17 -0400
Received: by mail-ot1-x329.google.com with SMTP id t6so7203194otk.9
 for <qemu-devel@nongnu.org>; Fri, 19 Jun 2020 06:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Evp902RZn0HW+odZpGlyAgwHEvfj0JbcxLDEfwg0lfw=;
 b=ueyn8mhUp2o69Nlf4kWS2ibrS+Xv204rAuKWLjtxQ7pOKeyDz3qcynSNQ2mEhl9OL2
 cYueuYvzrtxnMbzC+52jmOKeXVRaZu07UQk3rNCUBCd4FC5+vWBDQD114IkUyNbnDvdn
 bd+Rw2/M0Af/gWOGqPZ0bDBbXErG6NTxFaqfO26Js0tSPMRBFPZNBl/UGbQa+5xppopD
 XdMF9Fy0MW3QRhBkJ/0NkFs/JPe2Pok5Gvt2yZGbWm9SdxuXuvl9l2KSXRugHtvUHjtU
 v4j22xNDn58PL1v4FvnIWeuBfxbfnB74+GcRsUdNmrCBtMorynMkJ5kSIvXOridEUgOP
 rLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Evp902RZn0HW+odZpGlyAgwHEvfj0JbcxLDEfwg0lfw=;
 b=jxL35zn3OUehkwGmXaVBfKguTsUQDzVWg+lVHhFYwKCmnbCSoj9VeQ/k+HoMyCVLF0
 u3vh9jp7enGRsPVPiCfGzLzmAwfwAlYSGJgMniuaZ5z3gBU7Ts8UgTgL0tjfMRDDLD/W
 e+W1p/AnYgBuLE4dAV441Fph2N0EisC2Vw6optgafDN0IhGIwA+pxmb3t+Az4uTsTtxz
 8z/n/iCSfF3s+C9zssQ9d4hHbq2IlSuxegLA2Xtx0EBMF14FPxqNSY4bJcD4BBa5eLNT
 OVE84+4t3nzK8nfcKj0fPSxX+9cPwJHQ28HRsZkwLgRtNKmwWQzg8Qtpx5eY2RTVYXr+
 Wkfw==
X-Gm-Message-State: AOAM531OvwdI33rgHw4lY0cZTkmQrNtddSDKuW2tr11naxG0EVHG06V+
 OS2vak1BStkvXneRtrYk7sTK1AV2JTmTqS51cwp5EQ==
X-Google-Smtp-Source: ABdhPJyo3CaFDMFPik14BzfpUk4NPKSwMhLyKgHD17WWAEbirdHzSTp7aLJxWFlrlq/KshlToNctkuqR69FUIS7olMA=
X-Received: by 2002:a05:6830:8d:: with SMTP id
 a13mr2894556oto.91.1592572334339; 
 Fri, 19 Jun 2020 06:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_HOxdK5rgKVnww6Bum3vGb=TrhDEp7oqDwsd=UbHmC_g@mail.gmail.com>
 <c47e9e4e-49eb-88c5-fdc7-8ebec121c165@ispras.ru>
 <f4fc4a1b-4054-cffd-0272-22c28d656aba@redhat.com>
 <CAFEAcA-=igrJfoiga7b7rcwZDj46nTNMiT2VEj11DKO7OiJpNA@mail.gmail.com>
 <1364f7e8-3283-8ca2-76f8-75e3eb74af7b@redhat.com>
 <CAFEAcA-8aKX=Qa=i5pahhPTWOBx6MOWfo9ezhFFH+89du8Wf7Q@mail.gmail.com>
 <049e21f4-7254-5f59-2207-c01ad8f26916@redhat.com>
In-Reply-To: <049e21f4-7254-5f59-2207-c01ad8f26916@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2020 14:12:03 +0100
Message-ID: <CAFEAcA-DhKYb=C3ES6KcV6o2M1+XAvOktVsQDbfYVSjC_s_OEA@mail.gmail.com>
Subject: Re: what are the requirements on target/ code for -icount to work
 correctly?
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x329.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pavel Dovgalyuk <dovgaluk@ispras.ru>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Jun 2020 at 13:55, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 19/06/20 14:39, Peter Maydell wrote:
> > On Fri, 19 Jun 2020 at 13:37, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >>
> >> On 19/06/20 14:18, Peter Maydell wrote:
> >>> On Fri, 19 Jun 2020 at 12:16, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >>>>
> >>>> On 19/06/20 07:46, Pavel Dovgalyuk wrote:
> >>>>> I think, that we need some efforts from target maintainers to remove all such calls.
> >>>>
> >>>> I'll take care of target/i386 (which does need one of the three
> >>>> gen_io_end calls that are left).
> >>>
> >>> So why does it need it ? Why can't it just rely on "TB going to
> >>> end anyway which will clear the can_do_io flag" ?
> >>
> >> Because the TB is not always going to end in that case that is left.
> >
> > OK, so when is it valid not to end the TB after an IO instruction ?
> > My initial belief was that the TB should *always* end.
>
> You're right, cpu_io_recompile works only for memory accesses so that
> third one has to be fixed.

Cool. This is starting to sound like the right cleanup is going to be:

 * get rid of all the existing callsites in targets (possibly
   including forcing end-of-TB if the code wasn't doing that before)
 * add an assert that the TB really did end (easy for targets using
   the common-translator-loop, would need to go in per-target code
   for the targets that aren't [cris, lm32, microblaze, moxie, nios2,
   tilegx, unicore32])
 * inline gen_io_end into its one remaining callsite in gen_tb_start()

thanks
-- PMM

