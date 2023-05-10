Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E66E66FE46A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 21:16:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwpGu-0002V6-Ar; Wed, 10 May 2023 15:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pwpGs-0002Ui-3d
 for qemu-devel@nongnu.org; Wed, 10 May 2023 15:14:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pwpGq-0005wv-5X
 for qemu-devel@nongnu.org; Wed, 10 May 2023 15:14:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683746078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9T9/N8U6TLbvlntMbzGC9sHUswrCFdWNQUO7KozqUlk=;
 b=aO1LgdUyDOfG6BMAhrVONLYSFnP51vJ+8S1YLJq9I9f7dhFm23Dii6V3vI5vPqbWvtEXl3
 qAISGX4REtRuKnQPXkk5My9hkzqCTLU29r0iUGG3GPmzFfw9mwxNgtJXUAQpT5qrb60WN3
 m054HF7jrbT2Qrxl3U0hAX+7P2W6SU8=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-PLXIkyr6Mw2oRLmBmgsdMA-1; Wed, 10 May 2023 15:14:36 -0400
X-MC-Unique: PLXIkyr6Mw2oRLmBmgsdMA-1
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-24e02410140so7315425a91.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 12:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683746076; x=1686338076;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9T9/N8U6TLbvlntMbzGC9sHUswrCFdWNQUO7KozqUlk=;
 b=SvrrTHF4kmrLrGnKeMFZIRAPrVyHqLAGhqsjBiVm4qZmNdPZY5yOqYLx+hlJQaCGKb
 R4Itcr+3uDYmaixylQMtnDMqaL9iZuQb/Vr2xLyDPJnURigT0LJHZTocLI/lXOTPd5y7
 biSRF/rDx01JSxIVUBbYTSBImqhStjDb7h0PWUmp7cBhb3gbRv7KlbfUXorvKcj8MH37
 moSbfbbTUVmlyx1VCakfww1hy1bC9C6rNzD/2UtOAD634wW3/kjwpQmjVC4hQ5zSHNWg
 2YfI10PZphnJrG27zqE561E2QcJ3vjDBCrlLkPePjpAapWTrEMW4tINCpAbq2pV70cj8
 stQw==
X-Gm-Message-State: AC+VfDzYyFGNlziAY0wPJxrs9Q5Hd+d6Ie4Az5nv1nOavoRMsflEGY/6
 7lxsE4yhbxuNyLkEeJNUwSyrTlDXbW6QOqK0HpzGtoXp5X67yYHyEY5/fnGE1RVi1FXm3WdZzaL
 /xZKCKvDuAJfEz8rlgTPNtaybWTGZ3ZM=
X-Received: by 2002:a17:90a:1f4b:b0:252:7cc4:a556 with SMTP id
 y11-20020a17090a1f4b00b002527cc4a556mr1176101pjy.39.1683746075806; 
 Wed, 10 May 2023 12:14:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ510ckTevop0hWhwgoJGRsFzfX3hjbbr7pQl5PfOJ+EC7mgGTbaIaQGv68jZznEWm+aLW98Wi0w2F9pie6cGdU=
X-Received: by 2002:a17:90a:1f4b:b0:252:7cc4:a556 with SMTP id
 y11-20020a17090a1f4b00b002527cc4a556mr1176084pjy.39.1683746075509; Wed, 10
 May 2023 12:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230502092339.27341-1-mads@ynddal.dk>
 <CAFn=p-Zi-YfAeROOt=u3_xke+p7BT1Kt0Q9Vsm_gag5jW4FmGw@mail.gmail.com>
 <8690784A-9AC1-4D4C-B398-CDE0B047064D@ynddal.dk>
 <20230508151607.GE581920@fedora>
In-Reply-To: <20230508151607.GE581920@fedora>
From: John Snow <jsnow@redhat.com>
Date: Wed, 10 May 2023 15:14:23 -0400
Message-ID: <CAFn=p-YPxkzqzNvWCrO5ecY-dc5HEKe1KYmUdGbZHgb=ejyR0A@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] simpletrace: refactor and general improvements
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Mads Ynddal <mads@ynddal.dk>, qemu-devel <qemu-devel@nongnu.org>, 
 Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, May 8, 2023 at 11:16=E2=80=AFAM Stefan Hajnoczi <stefanha@redhat.co=
m> wrote:
>
> On Mon, May 08, 2023 at 03:28:04PM +0200, Mads Ynddal wrote:
> >
> > > A question for you: do you think it's possible to move simpletrace in=
to qemu/python/utils? This requires cleaning up the code to some fairly ped=
antic standards, but helps protect it against rot as we change target pytho=
n versions.
> > >
> > > No problem if that's too much to ask. just want to know if you had lo=
oked into it.
> >
> > Potentially, this would be possible. But `simpletrace.py` imports
> > `qemu/scripts/tracetool/`, so that would have to be moved as well, or i=
nstalled
> > as a package. I haven't touched the `tracetool` code itself, so I'm not=
 sure how
> > feasible it is (i.e. how many other places use `tracetool`).
>
> tracetool is only used by QEMU's build system to generate code from the
> trace-events files. In theory it's possible to move it.
>
> I'm not sure I understand the purpose of moving it to python/. What
> infrastructure does python/ provide that's not available to
> simpletrace.py in its current location?
>
> Stefan

It's just directory-based:

python/qemu/ are formatted as packages, with python/qemu/util/ serving
as a package that houses a bag of scripts. You can install these
things as a package into a venv and use them anywhere.
code in python/ is checked with a linter, type checker, etc while code
in scripts/ is not. It isn't installed anywhere and you may or may not
have to carefully set up PYTHONPATH=3D or choose your CWD carefully to
get the imports correct.

Over time I want to move more python code over under python/ so it
gets checked with the robots. The best stuff to move is stuff with
imports and dependencies. Truly standalone scripts aren't as important
to move.

It's not important for today, so let's not worry about it for this series.

--js


