Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0E637A11C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 09:46:49 +0200 (CEST)
Received: from localhost ([::1]:52356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgN6P-0006Cb-2F
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 03:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgMwV-0006YD-Ci
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:36:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgMwT-0003N0-5A
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:36:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620718592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f+E5cjdkec03dL8N1z8hc2UHY+pJxUD6SE2uzlxn1zY=;
 b=GJ5Yefxq/EMHC/JwAWrVANit2Tb6xAg9aan5Hoht+RQS0hm5KIjsYG1onXPAn7IOR4xdby
 tHD4xxgU3H5U1luzEWGl2aCtjs+1O7cAzK0anIm9aL3bwWXVIYIdpZTHgGMSUCynb1mCYU
 kBNcYJfkNKjJF0sbz7dh0xRiEos93kY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-JKtFGkwKOgieQyr-x2V9NA-1; Tue, 11 May 2021 03:36:28 -0400
X-MC-Unique: JKtFGkwKOgieQyr-x2V9NA-1
Received: by mail-ed1-f71.google.com with SMTP id
 g17-20020aa7dd910000b029038843570b67so10451181edv.9
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 00:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=f+E5cjdkec03dL8N1z8hc2UHY+pJxUD6SE2uzlxn1zY=;
 b=rUoBkn4hyKHg345RT0esdNhABw9YBTrBx30IN1Ofep9yxaX//vA9/cjarjydteQRbz
 vMtewnBWf5WPT3BI79ZpZz4QlZl4ZPBIZIDVbuE4k2DoXDtFzzunxmfMl33nxBsYKKVS
 fFlH2+zlz+jTUMiDVCy3h3MXK8hC3htwgJQMY3UlnQZIUphlLkbRtWqeK4uymQF+m+1x
 ipETn4Hvcq06FYqER891GfcwKjX7HBievkrrwf63P9zh0Fsbp/58HtqEZNqruahGnDas
 L18qIITJ6yxDIEkzvyhIdZ5tMmy6qz+0xzvZaUTht4D/av3clkfadfpgqZ8Qa/qOnzEh
 33HQ==
X-Gm-Message-State: AOAM530Uq09JzT+y9tuR+ObHQ4XxZ/jjl2YZvtl6YcXvRcCswBk6GduX
 R8mmscNSrcEnPfJDWGuHHUnYh0vBE0JgmDZxL8q/B+4Ta+NXQj++Hb11nCRO0P+CP56MR4s/fUl
 r0WI4sfFcdwp6Ab/czQQMPtFLdAIuL4k=
X-Received: by 2002:a05:6402:8da:: with SMTP id
 d26mr34531717edz.161.1620718587211; 
 Tue, 11 May 2021 00:36:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFN6DWg4kMD1LDTcFlE2mLHmfoh7GfRuw3yV5/YozB56WTDPM38xNs50um2JakRbN6Mr+7dYX/sdZFdMEweXQ=
X-Received: by 2002:a05:6402:8da:: with SMTP id
 d26mr34531695edz.161.1620718587029; 
 Tue, 11 May 2021 00:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210218151633.215374-1-ckuehl@redhat.com>
 <cd383ad9-21c6-340d-8821-c151e1b9714e@redhat.com>
 <bde95e1b-86ef-18d4-6864-7bc034d41688@redhat.com>
 <3644aa5f-ee80-358c-f563-faa15c2c8a9f@redhat.com>
 <20210322164327.GX3139005@habkost.net>
In-Reply-To: <20210322164327.GX3139005@habkost.net>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Tue, 11 May 2021 09:36:15 +0200
Message-ID: <CAP+75-UEA3ZeL10SwyG8k9C2BTwfTHPJ1oQ=NGJC54GW5gg1qw@mail.gmail.com>
Subject: Re: [PATCH 0/2] SEV firmware error list touchups
To: Eduardo Habkost <ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Connor Kuehl <ckuehl@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 22, 2021 at 5:43 PM Eduardo Habkost <ehabkost@redhat.com> wrote=
:
> On Mon, Mar 22, 2021 at 09:09:44AM -0500, Connor Kuehl wrote:
> > On 3/22/21 5:18 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> > > On 3/15/21 3:08 PM, Connor Kuehl wrote:
> > > > On 2/18/21 9:16 AM, Connor Kuehl wrote:
> > > > > Connor Kuehl (2):
> > > > >     sev: use explicit indices for mapping firmware error codes to=
 strings
> > > > >     sev: add missing firmware error conditions
> > > > >
> > > > >    target/i386/sev.c | 48 ++++++++++++++++++++++++---------------=
--------
> > > > >    1 file changed, 25 insertions(+), 23 deletions(-)
> > > > >
> > > >
> > > > Eduardo, Paolo, Richard: ping
> > >
> > > Looks too late for 6.0 now.
> > >
> > > Can you repost/ping after QEMU 6.0 is release?
> >
> > Sure.
>
> My apologies for not replying before and not reviewing or merging
> this in time for 6.0.

FYI there is a RESEND:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg803017.html


