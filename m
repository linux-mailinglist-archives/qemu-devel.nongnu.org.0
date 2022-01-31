Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF234A5305
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 00:13:39 +0100 (CET)
Received: from localhost ([::1]:43980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEfre-0006Yk-FO
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 18:13:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nEfoz-0005hE-1z
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 18:10:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nEfow-0005fj-Nn
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 18:10:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643670650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GvtwTsGH0jXeDg/+2BB828FEP5DE9jSkFiaw92KSob8=;
 b=A2V5jP1PyV2GBb2pxFQdDdEuxa9nFHewZZDDPOKYYyoStFXzndhiBFRJG/YxxyF0YoFrik
 laMKS1p5V3r7OJxA7Ol+6iE1HzcqRxoUo57U3mux4+W366/0JgSGgOj+Eng4FbQajNyIc7
 GSBL+mPNWZw2/qT+QRH64y7V7IppeVc=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-KRnUcOHfOsiUZiTS0KgMEA-1; Mon, 31 Jan 2022 18:10:47 -0500
X-MC-Unique: KRnUcOHfOsiUZiTS0KgMEA-1
Received: by mail-ua1-f71.google.com with SMTP id
 s9-20020ab04a89000000b003033d9b18ccso8156044uae.12
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 15:10:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GvtwTsGH0jXeDg/+2BB828FEP5DE9jSkFiaw92KSob8=;
 b=O574sFeqyw01kvp0FgUltoG6CGdxP0j33ZL/8lXEqflRXadiB6NWGpebGLBgoNUGqe
 NRr1OrXsz0bb84tIgmuhg4p0+Ir6QhS8QKTMfqEruiSVgOu6VQjoqsNhP3S4PaCffDRW
 mUYCZ96FCTjO5uN+qU7aA+xcAtOBPd9d7EqNgJr4Kr4WwQxVWPaH/dF8OEP0dCrEmmTF
 YY/mGnxOf+EDfd60hudtnCyiXdxSgPITDbdA24xJmcqYh1iyP2wMHbEcPAmh7KWPRbGK
 LqWE2w2LC08TkZiufm3DUkApfVrEQ2/qMMoNAg5iSIegkSowlgMlzpRXxLItlS/1L+w0
 BSWw==
X-Gm-Message-State: AOAM530IchmS36RB+p58jASurpganX446kwqU65N9DdEYsN2CSVrzSw9
 hk35NrVX0omqFffn/tx6nyVhPwnAZxqqwjC3bs6UIA5HKyyGjO9luDHkG3Wb52CzTPyOLfa0uFe
 LX2IVfcZjoCgxk56e71UmS31XdZDDrlI=
X-Received: by 2002:a1f:e745:: with SMTP id e66mr8914990vkh.24.1643670647201; 
 Mon, 31 Jan 2022 15:10:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYTYQEKNqndFue0C0sBgOSreIUMWq5F+MbhK9sOvtD3ARc9tBbZpvZ3lIAqjOPGy8sXZYIgzYSuHZKcWLhuk0=
X-Received: by 2002:a1f:e745:: with SMTP id e66mr8914985vkh.24.1643670646960; 
 Mon, 31 Jan 2022 15:10:46 -0800 (PST)
MIME-Version: 1.0
References: <20220124180626.627718-1-jsnow@redhat.com>
 <20220124180626.627718-5-jsnow@redhat.com>
 <7fdc4464-5083-5726-61da-26214759b471@redhat.com>
In-Reply-To: <7fdc4464-5083-5726-61da-26214759b471@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 31 Jan 2022 18:10:36 -0500
Message-ID: <CAFn=p-Yb_=T2dvHvdUNLfu51kfUT665-RmDX_iCycN==Qdbrew@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] python/aqmp: add socket bind step to legacy.py
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 27, 2022 at 10:50 AM Hanna Reitz <hreitz@redhat.com> wrote:
>
> On 24.01.22 19:06, John Snow wrote:
> > The synchronous QMP library would bind to the server address during
> > __init__(). The new library delays this to the accept() call, because
> > binding occurs inside of the call to start_[unix_]server(), which is an
> > async method -- so it cannot happen during __init__ anymore.
> >
> > Python 3.7+ adds the ability to create the server (and thus the bind()
> > call) and begin the active listening in separate steps, but we don't
> > have that functionality in 3.6, our current minimum.
> >
> > Therefore ... Add a temporary workaround that allows the synchronous
> > version of the client to bind the socket in advance, guaranteeing that
> > there will be a UNIX socket in the filesystem ready for the QEMU client
> > to connect to without a race condition.
> >
> > (Yes, it's a bit ugly. Fixing it more nicely will have to wait until ou=
r
> > minimum Python version is 3.7+.)
>
> I mean.  Looks good to me?  Not quite enough for an R-b, I=E2=80=99d say,=
 and
> you don=E2=80=99t really need an A-b from me on this, but looks good to m=
e! O:)
>

Works for me, thanks!


