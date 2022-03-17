Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 943054DCC23
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 18:13:09 +0100 (CET)
Received: from localhost ([::1]:48122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUtgS-0001by-6K
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 13:13:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUtea-0008T1-3e
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 13:11:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUteT-0002uZ-Up
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 13:11:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647537064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IsxvVOIbndERWiC+iBrp1VY+S4+h/wd7B9qrjKIicgQ=;
 b=AwcDLhYlJi54fHMqFKVb3QDHJZBpWP3egZ3z7sagTJTdKFANJAnOp+EV7+wdwdIXQIVFMw
 y6jDbg0Zasie4Yeqa+i+1ec7CJFnRKq1FOSeI8SOCNGV4vMeooSdW0zdG67WnoXcSQrCnv
 5r5bkTJs2OUPmJkrrbts6xofPfYAtaI=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-vo3vWGNxM0WKQgvJytJuqQ-1; Thu, 17 Mar 2022 13:11:03 -0400
X-MC-Unique: vo3vWGNxM0WKQgvJytJuqQ-1
Received: by mail-ua1-f72.google.com with SMTP id
 m17-20020ab061d1000000b00353a3a7c6aeso848207uan.4
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 10:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IsxvVOIbndERWiC+iBrp1VY+S4+h/wd7B9qrjKIicgQ=;
 b=mBRFKw2kgtqRnfpPoCCd4ZJ9z/1et//fjHHRrEHxR1v+uox2awrlyOYYOG5m9lUHXJ
 0MR2fVmSVmShpTduGgaSTDFghpfJys7SXywaW+8OpZ5fUnt3mEE7oAT3y45cLpl/7UfD
 fVnbNtBxPmTfeoBHkDfufKuhNw0sYZdoeV+X/Hs5b0JPfUPuWdVyrSM230drJs4MGWbc
 czy2sY5zxAl3DSYTHp6m66/gC8JO9Hyimr3XvzBOlfPXvl10efwBG4zDI66zhqZO5spS
 ag+sw4Jcs3fHcPZDZWIpxS1Sx+OA0E7Ac2kHCrzTHb53DWUxFmY6ssXpeZBjemJ9oTDm
 Imyw==
X-Gm-Message-State: AOAM531qdEp3zPQdxjf0S5c9FShAECpqlNiYoBPoUx8UxFDUWxCLBd0/
 9HJHEnf3EMW+OPKa6YIgTQjf3DV1evE35L+cZ/iS9T10z3kbJ5RlSQgPSdpd935fncjmQjb1ttL
 xRC8bXOYFUwxUBIydu4eZmALdD19Lmlk=
X-Received: by 2002:a1f:3244:0:b0:332:2037:83b1 with SMTP id
 y65-20020a1f3244000000b00332203783b1mr2375433vky.24.1647537062467; 
 Thu, 17 Mar 2022 10:11:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwu/mpeMlBI4t2zk478wD3sfNFmPk9GSEhnLO8EGqV6SF37qoGeFiHH42RD+eWe0DQIC22kR/DO13+0muZ90AQ=
X-Received: by 2002:a1f:3244:0:b0:332:2037:83b1 with SMTP id
 y65-20020a1f3244000000b00332203783b1mr2375414vky.24.1647537062168; Thu, 17
 Mar 2022 10:11:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220309035407.1848654-1-jsnow@redhat.com>
 <20220309035407.1848654-13-jsnow@redhat.com>
 <71c3d99f-f273-ac32-d644-4b2d3eee6ffb@redhat.com>
 <CAFn=p-ZpoF+QVZv0Quq8NmYVSvXOtVMxPmynDFSr7hG54aV-CA@mail.gmail.com>
 <1683432d-771e-2ffa-accd-916aaf3801dd@redhat.com>
In-Reply-To: <1683432d-771e-2ffa-accd-916aaf3801dd@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 17 Mar 2022 13:10:51 -0400
Message-ID: <CAFn=p-aewz0u3ePQEC0-RjGU3XEGaybnE=z_WPy_x0ye2aZocg@mail.gmail.com>
Subject: Re: [PATCH 12/14] iotests: remove qemu_img_pipe_and_status()
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 17, 2022 at 12:04 PM Hanna Reitz <hreitz@redhat.com> wrote:
>
> On 17.03.22 16:58, John Snow wrote:
> > On Thu, Mar 17, 2022 at 11:28 AM Hanna Reitz <hreitz@redhat.com> wrote:
> >> On 09.03.22 04:54, John Snow wrote:
> >>> With the exceptional 'create' calls removed in the prior commit, chan=
ge
> >>> qemu_img_log() and img_info_log() to call qemu_img() directly
> >>> instead.
> >>>
> >>> In keeping with the spirit of diff-based tests, allow these calls to
> >>> qemu_img() to return an unchecked non-zero status code -- because any
> >>> error we'd see from the output is going into the log anyway.
> >> :(
> >>
> >> I=E2=80=99d prefer having an exception that points exactly to where in=
 the test
> >> the offending qemu-img call was.  But then again, I dislike such
> >> log-based tests anyway, and this is precisely one reason for it...
> >>
> >> I think Kevin disliked my approach of just `assert qemu_img() =3D=3D 0=
`
> >> mainly because you don=E2=80=99t get the stderr output with it.  But y=
ou=E2=80=99ve
> >> solved that problem now, so I don=E2=80=99t think there=E2=80=99s a re=
ason why we
> >> wouldn=E2=80=99t want a raised exception.
> >>
> >> Hanna
> >>
> > I thought you and Kevin actually preferred diff-based tests, maybe I
> > misunderstood. I know that there was a strong dislike of the unittest
> > based tests,
>
> Oh gosh not from me.  I really like them, because they allow skipping
> test cases so easily (and because reviewing patches for such tests tend
> to be easier, because the code is explicit about what results it expects)=
.

Oh! Today-I-Learned. Yeah, the ability to skip cases is nice indeed.

>
> > and that the new script-style was more preferred. I
> > thought inherent to that was an actual preference for diff-based
> > itself, but maybe not?
> >
> > I'd say negative tests are easier with the diff-based as one benefit.
> > I'm a little partial to that kind of test. (I noticed that bitmap
> > tests were the most habitual user of negative tests involving
> > qemu-img, haha.) Otherwise, I guess I don't really care what the test
> > mechanism is provided that the error output is informative. Happy to
> > defer to consensus between you and Kevin.
>
> I don=E2=80=99t think we have a consensus. :)
>
> But AFAIU the main disagreement was based on what each of us found more
> important when something fails.  Kevin found it more important to see
> what the failing process wrote to stderr, I found it more important to
> see what call failed exactly.  Since your exception model gives us both,
> I believe we can both be happy with it.
>

Yeah, I like having both. Knowing which call failed exactly is helpful
for fixing the test and/or reproducing it on your own. Seeing the
output can give extremely important clues about the nature of the
failure.

> > Anyway, this patch (and the ones that follow it, I haven't read your
> > feedback on 13-14 yet) doesn't close the door on making everything
> > Except-by-default, it would just be further work that needs to happen
> > after the fact. How do you want to move forward?
> >
> > - Replace calls to qemu_img_log() with qemu_img()
> > - Make qemu_img_log() raise by default, but log output on success cases
> > - Something else?
>
> Second one sounds good to me for this series, because I=E2=80=99d expect =
it=E2=80=99d
> mean the least amount of changes...?
>

Alright, I'll see what I can do. Thanks for the review, I know churn
like this isn't the most fulfilling thing.

> Hanna
>


