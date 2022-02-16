Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 032EC4B9233
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 21:21:25 +0100 (CET)
Received: from localhost ([::1]:45614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKQnk-0006mO-3a
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 15:21:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nKQlZ-00048t-6z; Wed, 16 Feb 2022 15:19:10 -0500
Received: from [2607:f8b0:4864:20::236] (port=33620
 helo=mail-oi1-x236.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nKQlX-0003Av-7x; Wed, 16 Feb 2022 15:19:08 -0500
Received: by mail-oi1-x236.google.com with SMTP id x193so3743944oix.0;
 Wed, 16 Feb 2022 12:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+rKHKO//sbhgoDlYIZRJ3tVYUv4ocYGhWGPDWWSgeHg=;
 b=nPWkfXgoV4mf/ek0tYEOXEo8IYvm3v08qKzxrFTPrkPGozK81E/4Gx7ZQpJ0Uy/tbB
 gxatyOcdzYKac70b8HlcT06H1QUdf2BsE2tXGraoAGYzSS0V2uMgQW1ucnRePjSUktD5
 qxMCjvOEnZu9blN2jTyYw3U7uzQ8x4Gp1rhsmqrfZHZfyuwE3EZ9qe9tkRtMR/KkqW0p
 ROj8gFZKg+dwUUfko2XSO1P7uoMCtFqo+hAlkZFzRJlwlq4uzntbYUSeSiDUEtb+gd3A
 3qZSVc4fGh9OAoS8ChxQpWSjtNXk9xVzSQdR7V4m1j0Y6EWQECDvd9xqZtP5j3AFvEzU
 21BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+rKHKO//sbhgoDlYIZRJ3tVYUv4ocYGhWGPDWWSgeHg=;
 b=JEYTaVNi/XnCcGunvw6cRsvCMFDA9WrRC3Ui81mK0/ScizaG9CyMNg7lQkVlZNgqxh
 MiUp8PsvnnLU2W2qof3hJs0can4t0JC153pRqhFYTxAAl2q8YULnAmFthQAIH/p2nnAG
 u8qlou2qTqz6i3dKHzSojqemOzZciC13kqcrJ+Ht8ePyQ4upvdfjBSK/Mh1LGspCrKNr
 NZmdof9p0yvXLQ+MaTgV7tUAIoiboEhq80McSeZnBNKyJPGjCKPEcU+ok4CcsAmckuar
 vfTm08VZ2TSm1XiRlI9l5BZu3vEBn9LkS1yvb+8L3AWpHGdEM8gFmvy7srkaq6DpZBr5
 llvQ==
X-Gm-Message-State: AOAM533xDWzsDSocLFXEwhrKJ5Mp9p6jPrZ+0j2a3kABYEhrjQFXpRxF
 aLW5R+KieyvU657Fk/8jpc4yUbgN4mBzJdVjg1Y=
X-Google-Smtp-Source: ABdhPJz+zA2wdIJpqTGECAkkSBN4nA1TxSH1SNdQ7Sm/B8vW7TMKVarT3vpsEEYDPaoo2kwBdftdJe0uwWdeB7+IiZw=
X-Received: by 2002:a05:6808:2220:b0:2d4:1bc7:f955 with SMTP id
 bd32-20020a056808222000b002d41bc7f955mr1538321oib.218.1645042745891; Wed, 16
 Feb 2022 12:19:05 -0800 (PST)
MIME-Version: 1.0
References: <20220216200355.128731-1-dmiller423@gmail.com>
 <20220216200355.128731-4-dmiller423@gmail.com>
 <12b765a8-f443-19de-0ddb-95182debcf3c@redhat.com>
In-Reply-To: <12b765a8-f443-19de-0ddb-95182debcf3c@redhat.com>
From: David Miller <dmiller423@gmail.com>
Date: Wed, 16 Feb 2022 15:18:55 -0500
Message-ID: <CAEgyohVsfrhDWeSbksn5UUObiP+fKjmWEdt-0xtmg7XzM19QTg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] tests/tcg/s390x: Tests for
 Miscellaneous-Instruction-Extensions Facility 3
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::236
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=dmiller423@gmail.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.978,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, farman@linux.ibm.com, cohuck@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

That is strange, if I unstage them show status they are set to be committed:

null@rygar:~/projects/qemu/build$ git reset --soft HEAD~1
null@rygar:~/projects/qemu/build$ git status
On branch t2
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        modified:   ../tests/tcg/s390x/Makefile.target
        new file:   ../tests/tcg/s390x/mie3-compl.c
        new file:   ../tests/tcg/s390x/mie3-mvcrl.c
        new file:   ../tests/tcg/s390x/mie3-sel.c




On Wed, Feb 16, 2022 at 3:13 PM David Hildenbrand <david@redhat.com> wrote:
>
> On 16.02.22 21:03, David Miller wrote:
> > tests/tcg/s390x/mie3-compl.c: [N]*K instructions
> > tests/tcg/s390x/mie3-mvcrl.c: MVCRL instruction
> > tests/tcg/s390x/mie3-sel.c:  SELECT instruction
> >
> > Signed-off-by: David Miller <dmiller423@gmail.com>
> > ---
> >  tests/tcg/s390x/Makefile.target | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
> > index 1a7238b4eb..54e67446aa 100644
> > --- a/tests/tcg/s390x/Makefile.target
> > +++ b/tests/tcg/s390x/Makefile.target
> > @@ -1,12 +1,15 @@
> >  S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
> >  VPATH+=$(S390X_SRC)
> > -CFLAGS+=-march=zEC12 -m64
> > +CFLAGS+=-march=z15 -m64
> >  TESTS+=hello-s390x
> >  TESTS+=csst
> >  TESTS+=ipm
> >  TESTS+=exrl-trt
> >  TESTS+=exrl-trtr
> >  TESTS+=pack
> > +TESTS+=mie3-compl
> > +TESTS+=mie3-mvcrl
> > +TESTS+=mie3-sel
> >  TESTS+=mvo
> >  TESTS+=mvc
> >  TESTS+=shift
>
> 404, tests not found :)
>
> --
> Thanks,
>
> David / dhildenb
>

