Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA69D9565
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Oct 2019 17:21:12 +0200 (CEST)
Received: from localhost ([::1]:44412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKl6t-0002SF-C0
	for lists+qemu-devel@lfdr.de; Wed, 16 Oct 2019 11:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50598)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sameid@google.com>) id 1iKl5Y-0001eY-E2
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 11:19:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sameid@google.com>) id 1iKl5X-0007eS-7C
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 11:19:48 -0400
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:42857)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <sameid@google.com>) id 1iKl5X-0007e2-0n
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 11:19:47 -0400
Received: by mail-qt1-x844.google.com with SMTP id w14so36615984qto.9
 for <qemu-devel@nongnu.org>; Wed, 16 Oct 2019 08:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3Gk91n7d6Dp/D3FfwJd+ABNnwpZcqVP7gxqtwvlCrxk=;
 b=HIt7w7qZFbdL5Q7qJI5X0WnOUrGXmAL9FnH0OXmcWnAkOsqK01tcm1iAodZyocz5B4
 A5Ql0PqJG/Ql9ubx4JC8JnsQb2pQbxRhprDZ8sADfKXPRE212A6a1nlpKfmfurG7N1R2
 cZzZKmwlBoKCsqdfKLMS0GzoQI16Aih7dRjBW1lcM8y/sRdHagepGDMaJPBrgScpyTRl
 QM1MMiEBpUuqjKho5/py49TzDcAIaYi8qPVir5KRLqPb2mecazhJIVu2IC1OK4BIXDr9
 pKfw/F286mOpsCEr+6Pzh1JYhxS9vs1T8tBmN1oZVHSS0VvKqq/9kYNFs5fkX2ES2+Nz
 uARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Gk91n7d6Dp/D3FfwJd+ABNnwpZcqVP7gxqtwvlCrxk=;
 b=Hyb1eMalYnnpNWc4FbePFBfQgfeq4cTaQAMSHiBMinJR9lScWLVHHBUUVRM896Pd9s
 Q8oZtOeZafJ0xendBPJvOw4mevfn9I75RToANDCA7y7rNIpBASL0JSYvDrdY+lmlfBMA
 U98Jd9D0dxCpcA4viQyZGVYDMWkqiBtiY4+50Qpq93HapPWGmQw9M/jaujS/Jg6ud+Jb
 s+5b6t8X3tPFFUpZVxnsn1XFyr4vzIndmDuqYb907fIxiXde7NSTAv1qFcelTmDaK3a8
 RGc5SPd6qNFA8CklKjN+XJ4NCVwLrpptAUk3Vv4XMktaI6OOc6mfnfVwffz4UKSXEAHB
 jbhQ==
X-Gm-Message-State: APjAAAWwAajvdKCVjXDr42Sl73tpjhWflwEWkbGDMxtTVCxJXnE+DGsR
 THpTRFms60YPLN7pCF1ubdyH54QDOy2TkoEq8GFgYQ==
X-Google-Smtp-Source: APXvYqx+4TlvphA34N4EOOXeqVSrgadY/2q0Uoszcp2ZVexAc1GG2wwJZbPsH+ASKDiToLfiMbTlVyN5Oo1pOtbV1gI=
X-Received: by 2002:ac8:28c4:: with SMTP id j4mr46600378qtj.303.1571239186108; 
 Wed, 16 Oct 2019 08:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190925110639.100699-1-sameid@google.com>
 <20190925110639.100699-8-sameid@google.com>
 <ffff9a59-3cbf-8b04-f4e5-8a01dad8d381@redhat.com>
 <7dc7b14c-8e89-4851-6d05-d69b1bf36e3e@redhat.com>
 <92b719a7-3838-b019-cd51-5f5b2120a431@redhat.com>
 <1d863ce2-0e45-63e4-ceb2-d2eb2d9aa03a@redhat.com>
 <CAFr6bU=2B9JcmfJZ25BTYkhnw2V+YAghyAyK9YHto18KRptPAg@mail.gmail.com>
 <1dc0c7cd-cf9f-0c33-04f5-ed8d89119c9f@redhat.com>
 <CAFr6bUnsxhqBqHgRdw3dtv0rEvfCVn0oM4XD8Vb1xv_UGKvepg@mail.gmail.com>
 <CAFr6bUm53A+gBVBRr00XKDkt=GiJ5QSOEEXPFfuUJ2PcLeG04w@mail.gmail.com>
 <bf6ff260-f8ca-a593-dd3e-e78fa0551101@redhat.com>
 <eb3cc776-b8d9-f8da-269a-2fc0f8c21662@redhat.com>
 <CAFr6bUkQZP7ks4odRBpKGOSrzwe2VWSD47JGBUx-DuwBVNOmiA@mail.gmail.com>
 <5a5f7f62-bc3c-f260-933f-2605d3c67b36@redhat.com>
In-Reply-To: <5a5f7f62-bc3c-f260-933f-2605d3c67b36@redhat.com>
From: Sam Eiderman <sameid@google.com>
Date: Wed, 16 Oct 2019 18:19:34 +0300
Message-ID: <CAFr6bUmKr4_9Jn=6rGAF162pNMMsnUFSQ6OHuBKNaW59sEzPJQ@mail.gmail.com>
Subject: Re: [SeaBIOS] Re: [PATCH v7 7/8] bootdevice: FW_CFG interface for
 LCHS values
To: John Snow <jsnow@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org, kwolf@redhat.com, 
 qemu-block@nongnu.org, arbel.moshe@oracle.com, seabios@seabios.org, 
 kraxel@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::844
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sure!

Philippe withdrew his R-b on 7/8, as I explained 7/8 is fine (only
need to remove a bad comment) the problem was in the tests 8/8 -
should I include the original R/b?

I guess all other 1-6 are fine to add R/b...

On Wed, Oct 16, 2019 at 6:07 PM John Snow <jsnow@redhat.com> wrote:
>
>
>
> On 10/16/19 10:55 AM, Sam Eiderman wrote:
> > Thanks for the detailed comment Laszlo,
> >
> > Indeed my e-mail has changed and I only received replies to the
> > commits where I added this new mail in the S-o-b section, should of
> > added in all of them.
> >
> > So as you said it, the problem was actually in using qfw_cfg_get_u32
> > which assumes the value is encoded LE and has an additional
> > le32_to_cpu, should have used qfw_cfg_get directly like
> > qfw_cfg_get_file does.
> >
> > Regarding qfw_cfg_get_file - I wrote this code when this function did
> > not exist yet, I think it was added 6 months ago. In any case, I will
> > use it instead.
> >
> > Thanks for this.
> >
> > I will resubmit this entire commit series:
> > * I will only change code in the last commit (tests)
> > * I will remove a comment which is now not true anymore
> > * I will add my new email in S-o-b
> >
> > Sam
> >
>
> Philippe gave me a verbal tut-tut for not including his review tags in
> my last pull request; when you re-spin could you be so kind as to
> include any that still apply?
>
> --js

