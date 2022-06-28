Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D8455BF84
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:40:37 +0200 (CEST)
Received: from localhost ([::1]:49360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66lw-00034C-Mq
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o65yn-0002q7-FB
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 03:49:49 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:33713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o65yl-0006u8-Hs
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 03:49:49 -0400
Received: by mail-ed1-x52b.google.com with SMTP id n8so2362101eda.0
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 00:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vYJFosQ3cHmapD4UWGx8nteay8cv6GVRTINJH23gdPw=;
 b=dy/c3/T12jNUfwOqfmaaOrUVv3gqAQUNO7buthWvnjxwlljqY05daaDZasQZsn6mtT
 KvWGrO3PKmnZGYNvIcCtV8G7VMn6nZ5vbXfNjygXr88YauvHpsucuCUQQY5+2mPIef1Q
 Sn6WALQiAqeIeAkai19nw3hw/Kx8dB5QNcbTSowybuSOUqDiwK6NYUhJcfrdxKYuok6V
 P9XoD49npOGWt7GhQGGqycQeYohN6/Tvo7pVff+GJQoMKDFHglQtG/z2JT8gcT+79P7Z
 KrnkfvFHug8PitusiIAfpdhxNNtG9LukTu6t87yqd5MOtOAzGSaFflt+Op8Op89mmb4b
 uMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vYJFosQ3cHmapD4UWGx8nteay8cv6GVRTINJH23gdPw=;
 b=xx2NUqkqUlOhj4BJ96NJw67Be7X+YWG9o7ETtf02HrWa1Uu94LrS6S8z2NbJmJ6I/P
 RC/27h/6+WydpmTLwoCa6YuzUn0gw34sBYlPZxPdrf86KOv1Ylp7WgqBIkwdCo5fWOzy
 fN6OYXQMWbdEuQVkgNsRPwv0pcpH6yy7eT4tdbSxRpSuDATwg+AI9SYNIDnlIj9tiki7
 vRKL/i29QTalS80bmJMQryEDll45Xe+qq386al0kKOtuJeF7fEzpXMdIdCnMA2vl2hQq
 ETv5tYs6opOWeQyHc0eVPkFkCDPd9Br1j3r4cHHogXrEeKBwSGeGni1ILTdWRWKQYyZF
 l/Bw==
X-Gm-Message-State: AJIora/YR8fNv8nogVIJ0883mRWKLWK5kCLR1nfpkGLHIgVReYoaaps2
 PDZgFe93J2nM46kxWUpvAFGzq5oinfBY81hZotp+mg==
X-Google-Smtp-Source: AGRyM1sT0ivl7ohCMxrSRqgakLY5sXXJihN6qNSDoh0FoElWTKBUQ61mvsbGPThlYeBGytLGnUOsiONBd71BGBYxZdg=
X-Received: by 2002:a05:6402:26d5:b0:435:aba2:9495 with SMTP id
 x21-20020a05640226d500b00435aba29495mr21627519edd.133.1656402585566; Tue, 28
 Jun 2022 00:49:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220627072856.1529357-12-ani@anisinha.ca>
 <20220627182027-mutt-send-email-mst@kernel.org>
 <CAARzgwznJUrO-7kjZ+58qj=UG6V9wojP=ZfW7FePyvb6GxdNtA@mail.gmail.com>
 <20220628020017-mutt-send-email-mst@kernel.org>
 <CAARzgwwf_WRWzbwPorpa-4XN7T6f6D7CRo70+07Z8LgZO+5Spg@mail.gmail.com>
 <20220628021757-mutt-send-email-mst@kernel.org>
 <CAARzgwyWK2HNbz=9=uoA+DDTpnn2q3CRmYVyjLwfMs1wi24-LA@mail.gmail.com>
 <20220628024810-mutt-send-email-mst@kernel.org>
 <CAARzgww9KKx7fTw7WMMTb3PCQgdwJwS34X0jHhQ+41OrMWZazg@mail.gmail.com>
 <4e1c2a45-eb53-e210-1ce1-05837bf1e7c3@redhat.com>
 <20220628030749-mutt-send-email-mst@kernel.org>
 <7bf5976e-8277-7c78-f412-44f7be8754f4@redhat.com>
In-Reply-To: <7bf5976e-8277-7c78-f412-44f7be8754f4@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 28 Jun 2022 13:19:34 +0530
Message-ID: <CAARzgwzumnYN5LggnfEzoy19nQHv-vhVtQZnHZ=MhiP9+xUfeQ@mail.gmail.com>
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
To: Thomas Huth <thuth@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 imammedo@redhat.com, "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::52b;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 28, 2022 at 12:55 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 28/06/2022 09.10, Michael S. Tsirkin wrote:
> > On Tue, Jun 28, 2022 at 09:03:33AM +0200, Thomas Huth wrote:
> >>>>>>>> No problem with that. So that's venv. But do we need pip and pulling
> >>>>>>>> packages from the net during testing?
> >>>>>>>
> >>>>>>> We do that too. See requirements.txt in tests/
> >>>>>>> Following two are downloaded:
> >>>>>>> avocado-framework==88.1
> >>>>>>> pycdlib==1.11.0
> >>>>>>>
> >>>>>>> Also see this line in Makefie.include:
> >>>>>>>
> >>>>>>> $(call quiet-venv-pip,install -r $(TESTS_VENV_REQ))
> >>>>>>
> >>>>>> Right but that's avocado since it pulls lots of stuff from
> >>>>>> the net anyway.
> >>>>>> Are the libraries in question not packaged on major distros?
> >>>>>
> >>>>> Currently I only need this:
> >>>>> https://github.com/python-tap/tappy
> >>>>> which is the basic TAP processing library for python.
> >>>>>
> >>>>> It seems its only installed through pip:
> >>>>> https://tappy.readthedocs.io/en/latest/
> >>>>>
> >>>>> I do not think this is packaged by default. It's such a basic library
> >>>>> for parsing test output that maybe we can keep this somewhere within
> >>>>> the python src tree? Not sure ...
> >>>>
> >>>> It's pretty small for sure. Another submodule?
> >>>
> >>> Unlike BITS, this one is likely going to be maintained for a while and
> >>> will receive new releases through
> >>> https://pypi.org/project/tap.py/
> >>> so forking is OK but someone has to keep this updated.
> >>>
> >>> I am open to anything. Whatever feels right is fine to me.
> >>
> >> John Snow is currently working on the "Pythonification" of various QEMU
> >> bits, I think you should loop him into this discussion, too.
> >>
> >>   Thomas
> >
> > submodule does not mean we fork necessarily. We could have
> > all options: check for the module and use it if there, if not
> > use one from system if not there install with pip ..
> > But yea, I'm not sure what's best either.
>
> submodules create a dependency on an internet connection, too. So before you
> add yet another submodule (which have a couple of other disadvantages), I
> think you could also directly use the venv here.

Not sure what you mean by directly using the venv.

>
>   Thomas
>

