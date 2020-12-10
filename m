Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 094992D5EC7
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 15:58:50 +0100 (CET)
Received: from localhost ([::1]:41446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knNP7-0007pv-0Q
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 09:58:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1knNMI-00064U-Lf
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:55:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1knNMF-0000Qj-F9
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:55:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607612150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mBanhr1fgvfj3a2tbMQ3LSwkRYdL35LLpMiBdo5ibtY=;
 b=WxYd5U4Ff9tE+E073+5PX/y7CjGTSGkqQa/MJomiVGWC38tyMk6VW017HxFiHyxCbNC9S3
 hk9ce+yqIT5If6L1C9lb1q9XfeWATuudf99kFuoAJ5DCl++ooRzYY1YzpNJXc17+cy05sa
 RH24YMveAp+nb6CDbrQhna7iJTXBMbY=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-1jVNkcP9PxKL6Zp7UYdyJw-1; Thu, 10 Dec 2020 09:55:47 -0500
X-MC-Unique: 1jVNkcP9PxKL6Zp7UYdyJw-1
Received: by mail-il1-f200.google.com with SMTP id b18so4636567ilr.7
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 06:55:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mBanhr1fgvfj3a2tbMQ3LSwkRYdL35LLpMiBdo5ibtY=;
 b=gCRx3OXJ+PLmOgmhZ1QxUehr1p4wmSE3jEqkIcpVQN8JIINbOOkgn6VYkQsOnrStCH
 SZUjpB3goA3nvw0enE9ZCJmBFS+Xutf5CLy2ZlyBv3L4iFB88LdEU6F+F2/uiHNZGgb+
 FyYkkbk4AXVujgP0nfRwxXRatCo9+69DNF/Pwq7Uo4nGkNKk1ShXlwZU2MUV5Ny8R6Vl
 EvxpMy88dNUETGrDNGx1fV7pj6ELy2QN1rly9TVvHrsa0vHhyhC2T+htFmw0ZerSiOBO
 etfg8cQpdQ+lgPTA/HMDC5rTv7XjVdOLiCwOUGWPQOB1DkeAHx/6GnwPSaiNqWlgvE4G
 +m8g==
X-Gm-Message-State: AOAM530auKN8m6IZMvpA7j5cUfGO8485DDZqdO/1WJzF3j8g40flhzw0
 iwrGuRiw0tl/OTL2HKvqADVj4I2VXxHoGElWfeetfsnu2mNBn5MyHnSHdL/xA4NshQgkfQnS+FP
 rdooUYMTSyre+Keq6g0WlRaia/fSNawA=
X-Received: by 2002:a6b:b5d2:: with SMTP id e201mr5227613iof.111.1607612146613; 
 Thu, 10 Dec 2020 06:55:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+s9DW2PJte84KZQqjMa29hIrqXHSO4YD2VzYLlS+k4pC7kfrBaKl4ag4krI7jL31ahzBUBxRx9ZK+JFg018M=
X-Received: by 2002:a6b:b5d2:: with SMTP id e201mr5227589iof.111.1607612146364; 
 Thu, 10 Dec 2020 06:55:46 -0800 (PST)
MIME-Version: 1.0
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-4-marcandre.lureau@redhat.com>
 <fead8bf1-7848-8809-c67a-e6354e7b5cf7@redhat.com>
 <CAFEAcA986crbUmJLR2GU5PE9BOq8w9KWKA5obYfY3eSoviMtnw@mail.gmail.com>
In-Reply-To: <CAFEAcA986crbUmJLR2GU5PE9BOq8w9KWKA5obYfY3eSoviMtnw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 10 Dec 2020 18:55:35 +0400
Message-ID: <CAMxuvawzN0oOJJhqHu4dX++O+fAdA8BQ0+yNgoQHf_dL5=rVow@mail.gmail.com>
Subject: Re: [PATCH v3 03/13] compiler.h: remove GCC < 3 __builtin_expect
 fallback
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Thu, Dec 10, 2020 at 6:47 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Thu, 10 Dec 2020 at 14:32, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com> wrote:
> >
> > On 12/10/20 2:47 PM, marcandre.lureau@redhat.com wrote:
> > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > >
> > > Since commit efc6c07 ("configure: Add a test for the minimum compiler
> > > version"), QEMU explicitely depends on GCC >=3D 4.8.
> > >
> > > (clang >=3D 3.4 advertizes itself as GCC >=3D 4.2 compatible and supp=
orts
> > > __builtin_expect too)
> > >
> > > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> > Shouldn't it becleaner to test in the configure script or Meson that
> > likely() and unlikely() are not defined, and define them here
> > unconditionally?
>
> That sounds like way more infrastructure than we need if
> just checking "is it already defined" is sufficient...
>

Eh, I am just removing dead-code "#if __GNUC__ < 3". Further cleanups
can be done after.


