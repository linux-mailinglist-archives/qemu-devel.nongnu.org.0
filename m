Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D61793155D9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 19:27:40 +0100 (CET)
Received: from localhost ([::1]:53548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Xjf-00013A-Di
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 13:27:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9Xhk-0007kr-PJ
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:25:43 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:46799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9Xhb-000752-TR
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:25:36 -0500
Received: by mail-ed1-x535.google.com with SMTP id y18so25072574edw.13
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 10:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NV0mv1iXGyXGr/s89L/GjujJyUs7pUW2/CSa56k59OA=;
 b=ktxNsLszGtqyYErmt5zHHgF5rgg62MbXgriFEfuA5RKzYaDB7ZJAmjbWT2KvcO/0fE
 +7l8zdcLYeY0Ol+NjHAw91a4nk8qv7+my9RC9QRuWBFKFkcJEeR+Zo7oedBHOhCNn18u
 FOzs3WK77vbmpbc2JI7W4I2RP0f8HpGB+WuEt7YEhENG3ppAmqgurBtAzsjrilh2wt78
 fAJx5rZTFgAQkCs43PuBH7yDAnVyqNAGU+nyIuGM4dNpaF5r9yWgPFelA4DGXtLD07y1
 YpO5ej3yh+NQ+RA9h88SADaZE4Xz8MdGgyh/jKZoZR7eJ40p2UI0RvIemwMfHD/bXV9m
 fJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NV0mv1iXGyXGr/s89L/GjujJyUs7pUW2/CSa56k59OA=;
 b=Yh/Tsafx5qms5couPbozJOJGxYura0n38eYeEsQ2VLoxJ1DN6QwGm6nVUQQbpKh57Z
 iR/OZHUkcKQ+npV+lWxuxPFJnflbEUSgCCPl+NeYXZMHLjUHMAj0eZSdi/0QZbSylkso
 KRMNb1YVBf+6ILpsfd+g124W5wyAikNaQ6wb7fOQZ7e0RBE8Vois5Q94/UjJzylHRuHU
 qxbXp06CGRSAQAIdJi3nC218yAqRYqlpw83d2NBKDDoWYDGaBHnNkS0qIQBLRR71WKzc
 elDfG9/dyu3ZAXVJKVjqa5Uc3WdoZ6hOQmLyIEhwDsA6zVSFEv3Kn/XmW4NQiBmJAYZF
 aVkg==
X-Gm-Message-State: AOAM531OQGuGLBAzJjvv1fvqOgOY4A7Uj4MgcezuoGPrenJDZpNFHP65
 L519qpmYpwBNf1JYSTSDy+i6BWt2dbKwkls2e1efcg==
X-Google-Smtp-Source: ABdhPJySF9/p1C0IG/S5EwVt3JnW8nTx72tzwkd5ZKjmPK6gZUAtC+HuKOM1WsuLmv03R4i/1EUMz/0akCbde7SYfzo=
X-Received: by 2002:a05:6402:541:: with SMTP id
 i1mr15716207edx.36.1612895130170; 
 Tue, 09 Feb 2021 10:25:30 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8=vG-2Vzrdark8VC5NANe5Fb3qGTpSFk8X94KvXszTbA@mail.gmail.com>
 <c98d4f43-5a29-afcc-fe7d-a3d92063df3a@redhat.com>
 <CAFEAcA8q1ewJ4F-pijt81Qc_rO0xNpy6jJY2DrW0ggTzg27aEQ@mail.gmail.com>
 <5213f033-19dc-bc40-bfd7-10b8c676539b@redhat.com>
 <CAFEAcA-va8hY3tHrhK_UV0bniF=VhietM2Y8ovZt57wWkg8f_w@mail.gmail.com>
 <CAFEAcA_JLx6NAd_YPzKy6iXWqP_c1jkW42bscK+Q=zKN4xAbzQ@mail.gmail.com>
 <20210209181009.7f2cb328.cohuck@redhat.com>
 <CAFEAcA_u7eKMyKKLf1sdMOgW7OPRt9hXiv5aDkfyfJcOfM6XFA@mail.gmail.com>
 <20210209182400.4fe15232.cohuck@redhat.com>
In-Reply-To: <20210209182400.4fe15232.cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Feb 2021 18:25:18 +0000
Message-ID: <CAFEAcA99CxOv9UnzS7sehHhB5mi9P5CtchopqhwyAv=are1y7A@mail.gmail.com>
Subject: Re: getting the console output for s390 cdrom-test?
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Feb 2021 at 17:24, Cornelia Huck <cohuck@redhat.com> wrote:
>
> On Tue, 9 Feb 2021 17:17:19 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > On Tue, 9 Feb 2021 at 17:10, Cornelia Huck <cohuck@redhat.com> wrote:
> > >
> > > On Tue, 9 Feb 2021 14:58:53 +0000
> > > Peter Maydell <peter.maydell@linaro.org> wrote:
> > > > This change significantly reduces the frequency with which I see
> > > > the hang; but it doesn't get rid of it altogether. Also I couldn't
> > > > really figure out from the virtio spec exactly where barriers
> > > > were required: I think I would need to read the whole thing in
> > > > more detail rather than trying to fish out the information by
> > > > just reading small pieces of it.
> > >
> > > The Linux virtio-ccw code uses 'weak barriers', i.e. the heavy bcr15
> > > should not be needed. We might well miss other (lightweight) barriers
> > > in other parts of the code part, though.
> >
> > Is that the version the Linux kernel has as
> >   /* Fast-BCR without checkpoint synchronization */
> >   #define __ASM_BARRIER "bcr 14,0\n"
> >
> > ?
>
> No, just a simple memory barrier in most places (bcr15 and bcr14 do
> serialization).

OK; if you let me know how that's written for s390 I can give
it a test...

thanks
-- PMM

