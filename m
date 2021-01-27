Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D3430657F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 21:58:38 +0100 (CET)
Received: from localhost ([::1]:55366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4rtd-0004lC-Qx
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 15:58:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4rs6-0004Kc-Dt
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 15:57:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4rs3-00061F-Pl
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 15:57:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611781018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GP+B/Y0GotYwOWTT2+S93qSZfdSN70s2dCeCj+2irwo=;
 b=GfFu7a8d4KYBcTVL/zmEk5A8vqKErruUKh0ItBU+3/fGqrto5OlBQbZ76EkZDN6qdrTLhO
 O4z+vOckCr8MXNrqL43Poy0B/RGKQgHUc8nFM+NxGX5ZHTAwyk1WSJjFn+0s3uLvPAGmMj
 5qplWRNdt2FR2Sbx+TMo0nqfwFlZz+c=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-uU_1jneNNJeOiR0P-Q5cuw-1; Wed, 27 Jan 2021 15:56:54 -0500
X-MC-Unique: uU_1jneNNJeOiR0P-Q5cuw-1
Received: by mail-oo1-f72.google.com with SMTP id u9so1586197oon.23
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 12:56:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GP+B/Y0GotYwOWTT2+S93qSZfdSN70s2dCeCj+2irwo=;
 b=TnQu5Xao3kTMIdqP/6HepDX/89YRvrsOH4f1DXP6LQfncLDond0aT5Y9uIzALCayaD
 XYkamJATgpYczk9xe40wTyXDCllg+bJvMq4ZW5yhYbKjhhmIRSoObs5vmSgyUgwOG3lK
 tRsK5aiR9GgTgOmCo1MpRI6TZrGQWXrEOcQiRiRGWiveeZ14wxFobNpvIyblbPONjFQ0
 4cWCne1JVe4r8GJF3EOwdU0LCVp23NPRHTkmsDXSEU17MgxXdbM7BIba+QPK7zzoIgij
 FhPMefKFPKMETeLDytq2YOK8nK38N63K5RPMO1qqreLmxCB+h7jbJEPQjOv48ZN+sRDg
 0+og==
X-Gm-Message-State: AOAM533tyCgzwLoqCVcD7SDVSOjyfH2X2IjcAedvkGpA3vWGFitsBpXs
 eQNxj8IXAgr3zklo7wjO1CMbS17LbqmyTy5llsZ18niO7fYgEmug/R8ABSugkkOo62sw1mB3iuZ
 uaVO5hU1HYCQOredHhVJUfFGS86LsVZc=
X-Received: by 2002:aca:4508:: with SMTP id s8mr4677177oia.118.1611781014015; 
 Wed, 27 Jan 2021 12:56:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdlkENHHJAQyCC1NzQP8VMf9nSsCANjDGUgDnLwmatW4aB7ThyTFhvKSWCIrgsi14F41k1U7opalrsrbh9E/M=
X-Received: by 2002:aca:4508:: with SMTP id s8mr4677172oia.118.1611781013875; 
 Wed, 27 Jan 2021 12:56:53 -0800 (PST)
MIME-Version: 1.0
References: <20210125110958.214017-1-stefanha@redhat.com>
 <06b6fb5e-cf9b-aa0a-265e-3d523faed814@redhat.com>
In-Reply-To: <06b6fb5e-cf9b-aa0a-265e-3d523faed814@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Wed, 27 Jan 2021 21:56:42 +0100
Message-ID: <CAP+75-U6+qCKtJTEYwf=Tu5Z_Hawzj7ia6WsEMyy2hNEO9ZG-Q@mail.gmail.com>
Subject: Re: [PATCH] trace: add meson custom_target() depend_files for
 tracetool
To: Stefan Hajnoczi <stefanha@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

On Mon, Jan 25, 2021 at 5:40 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:>
> On 1/25/21 12:09 PM, Stefan Hajnoczi wrote:
> > Re-generate tracetool output when the tracetool source code changes. Us=
e
> > the same approach as qapi_gen_depends and introduce a tracetool_depends
> > files list so meson is aware of the dependencies.
> >
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  meson.build       | 28 +++++++++++++++++++++++++++-
> >  trace/meson.build | 21 ++++++++++++++-------
> >  2 files changed, 41 insertions(+), 8 deletions(-)

Please do not merge "trace: make the 'log' backend timestamp configurable"
without this patch -- even better, queue this one directly after it -- as t=
his
gave me troubles with the multiple directories I'm using to build:

In file included from trace/trace-io.c:5:
trace/trace-io.h: In function =E2=80=98_nocheck__trace_qio_channel_command_=
wait=E2=80=99:
trace/trace-io.h:1756:13: error: =E2=80=98message_with_timestamp=E2=80=99 u=
ndeclared
(first use in this function); did you mean =E2=80=98error_with_timestamp=E2=
=80=99?
1756 |         if (message_with_timestamp) {
     |             ^~~~~~~~~~~~~~~~~~~~~~
     |             error_with_timestamp
ninja: build stopped: subcommand failed.


