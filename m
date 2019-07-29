Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B61B77914C
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 18:44:13 +0200 (CEST)
Received: from localhost ([::1]:55116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs8ku-0006Vj-Pc
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 12:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33361)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hs8kE-0005rX-9D
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 12:43:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hs8kD-0007Um-7b
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 12:43:30 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:45692)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hs8kD-0007UP-2B
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 12:43:29 -0400
Received: by mail-ot1-x342.google.com with SMTP id x21so24764072otq.12
 for <qemu-devel@nongnu.org>; Mon, 29 Jul 2019 09:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=at2A23AIjKAgLw9cNO/+MGIthwu97faP/vDsygfwRzo=;
 b=JSIifFtfFT1ZKE3yvXBqtv6GggICQoLWjXrfbgGkJbbvcWFnzlFZARgpogXFJDbrdI
 iNS0a0rEDzsz6traNgr4ZK02rCTJrNwV/enay3NTplH8VPEF2gz/pcKcJLjA65y6moUI
 IwUifnBZFZkRwFUf1kyzStsvr21dvEI3DPUANVPgRudGIzHdPKHXGHreM6i/H698nVFF
 Gdz+w7MKoeepdOQY8TqWrbVvXT4PGCofqjdpHz1QP/S88WL8lUf12IPFM8QXawkVR7fK
 SlyZirCkqZiGU8h5qMMv1Y3H6KqHt6LJxcGTgLPAHen45Q/Rvz6EtFISyFAkA0r5WrlC
 qMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=at2A23AIjKAgLw9cNO/+MGIthwu97faP/vDsygfwRzo=;
 b=GJ0Ahm3BCvoj0D0m5sMhOD7fu+EiBgeVCZkV5RC74lDd9VRVzZTbdiQjJ7zdopqb+a
 O+g+aktuYskBYM2J+Q297v6FXhmMxPgAs98VdiKqxgpt/mbWvQv1WMksiIR9OK6fszY0
 UBTsHFP6nI1F2mXzGtTSuNJFvMn09Z/gGunyWyChhrh0nwzGNBELvOX19a0N+gmtBbTQ
 ZHFM6zekYwVoqfmQ13ZDcAD6KWqtk0amgKnXVz+H6M80/liurpgiVZw9AczrOww68Rkh
 6HAv+en6fh37vRehHVsK63uGj15ZMVklRRSRU0s8dMFViKYCtaKNUyNZSmMgzrszabwX
 N3nw==
X-Gm-Message-State: APjAAAWJ/LWB2gbmXCuRrTOoSctKWrrjrqTIJi7hco1yAxUhB6b3Xhb9
 bLU/bOuwnEHC7VErRzHkdcCXgk7AO/wjYm0qkjJgEA==
X-Google-Smtp-Source: APXvYqxWx1srCK+++/KbvMHRzP+ao8yWc3Ez9S4nVaRcc4rUKfnAeLZECncmlDPl+awaEt/STneyvZXm3Hep1gUYQCA=
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr23776037oti.91.1564418608239; 
 Mon, 29 Jul 2019 09:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190729162903.4489-1-dgilbert@redhat.com>
 <20190729183232.22bcbb26.cohuck@redhat.com>
 <20190729163541.GJ2756@work-vm>
In-Reply-To: <20190729163541.GJ2756@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jul 2019 17:43:17 +0100
Message-ID: <CAFEAcA-LG+z7=4P488Rg3=p73+kNYVy6abaZRBE97=Q==esFaQ@mail.gmail.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [For 4.1 PATCH v2 0/2] Reversions to fix PCIe in
 virtio
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
Cc: Cornelia Huck <cohuck@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 29 Jul 2019 at 17:36, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Cornelia Huck (cohuck@redhat.com) wrote:
> > On Mon, 29 Jul 2019 17:29:01 +0100
> > "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:
> >
> > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > >
> > > Revert a couple of patches that break PCIe capabilities in virtio
> > > devices. The 'optional' revert is just reverted to make the main
> > > reversion trivial.
> >
> > Don't want to spoil the party here; but wasn't the optional stuff
> > removed because it was deemed to be a bad idea?
>
> I'm perfectly happy to go either way with this; it maybe a bad idea
> but it's harmless I think.

It seems like the original commits were:
 * patch that does something
 * patch that removes no-longer used functionality (optional globals)

so it makes sense to me that if we want to revert the 'patch that
does something' we should first revert the patch that cleaned
up unused-functionality (because now we need it again). Is
that right?

If optional-globals are a bad idea then we should take another
run at this for 4.2, but as a "revert stuff for 4.1" strategy
it seems fine to me.

thanks
-- PMM

