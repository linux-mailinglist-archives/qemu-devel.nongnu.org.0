Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8514C1884
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 17:23:55 +0100 (CET)
Received: from localhost ([::1]:45926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMuQk-0004pr-K6
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 11:23:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=pbN1=TG=zx2c4.com=Jason@kernel.org>)
 id 1nMuN9-0002gh-IP
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 11:20:11 -0500
Received: from [2604:1380:4601:e00::1] (port=42816 helo=ams.source.kernel.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=pbN1=TG=zx2c4.com=Jason@kernel.org>)
 id 1nMuN4-0006qI-6c
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 11:20:08 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F296EB820CC
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 16:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78468C340EB
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 16:20:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="UStiHDap"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1645633199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mnNQghKSAwgVNaMKLb/7Trnd/MlpODo5RAJNJEkv+10=;
 b=UStiHDapBFGqlKj1XnAopIV0s/o4/wZAQt9kfn6UaRkkAF7dlnJ3QqN5tRoz/ZORj1iyB8
 vZrQhcosPVD9IGzkANuD0g+v6mzrFASmeIaYq1MLaU1R7pw64al2PYmaHQo/tzRlnilQV3
 twyhhu3J7BJ8itNYnKzpSPL2yJlYi2o=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4911cbc0
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Wed, 23 Feb 2022 16:19:58 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-2d68d519a33so215812517b3.7
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 08:19:58 -0800 (PST)
X-Gm-Message-State: AOAM532Lm4kXq8GmaTAjx/PNbMAVHQNdyT4L+sHzrs5CkyhwEJiLsdNr
 tD0gcSQfhLmUBv1AMxst3u/3Jl2XsPPKdaCJniU=
X-Google-Smtp-Source: ABdhPJzwqPvYWBp9LmD+Jha02PrV5WLBK/ki8ek/2uyVWgeaMR+4EcGUKMupw6bI8EUKZpQFGjPwDZfx/kujcdtLLBc=
X-Received: by 2002:a81:5c83:0:b0:2d2:c136:70f3 with SMTP id
 q125-20020a815c83000000b002d2c13670f3mr401327ywb.404.1645633196792; Wed, 23
 Feb 2022 08:19:56 -0800 (PST)
MIME-Version: 1.0
References: <20220223131231.403386-1-Jason@zx2c4.com>
 <CAHmME9ogH_mx724n_deFfva7-xPCmma1-=2Mv0JdnZ-fC4JCjg@mail.gmail.com>
In-Reply-To: <CAHmME9ogH_mx724n_deFfva7-xPCmma1-=2Mv0JdnZ-fC4JCjg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 23 Feb 2022 17:19:45 +0100
X-Gmail-Original-Message-ID: <CAHmME9o9-eBCcjJMrJSdr23VfUEfvx12e4qRdtE5Sv3+Qcf-Bg@mail.gmail.com>
Message-ID: <CAHmME9o9-eBCcjJMrJSdr23VfUEfvx12e4qRdtE5Sv3+Qcf-Bg@mail.gmail.com>
Subject: Re: [PATCH RFC v1 0/2] VM fork detection for RNG
To: LKML <linux-kernel@vger.kernel.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 KVM list <kvm@vger.kernel.org>, linux-s390@vger.kernel.org, adrian@parity.io
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2604:1380:4601:e00::1
 (failed)
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=pbN1=TG=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Theodore Ts'o <tytso@mit.edu>, ehabkost@redhat.com, ben@skyportsystems.com,
 Jann Horn <jannh@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Weiss, Radu" <raduweis@amazon.com>,
 lersek@redhat.com, "Catangiu, Adrian Costin" <acatan@amazon.com>,
 graf@amazon.com, Igor Mammedov <imammedo@redhat.com>,
 Colm MacCarthaigh <colmmacc@amazon.com>, "Singh, Balbir" <sblbir@amazon.com>,
 "Woodhouse, David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 23, 2022 at 5:08 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Wed, Feb 23, 2022 at 2:12 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > second patch is the reason this is just an RFC: it's a cleanup of the
> > ACPI driver from last year, and I don't really have much experience
> > writing, testing, debugging, or maintaining these types of drivers.
> > Ideally this thread would yield somebody saying, "I see the intent of
> > this; I'm happy to take over ownership of this part." That way, I can
> > focus on the RNG part, and whoever steps up for the paravirt ACPI part
> > can focus on that.
>
> I actually managed to test this in QEMU, and it seems to work quite well. Steps:
>
> $ qemu-system-x86_64 ... -device vmgenid,guid=auto -monitor stdio
> (qemu) savevm blah
> (qemu) quit
> $ qemu-system-x86_64 ... -device vmgenid,guid=auto -monitor stdio
> (qemu) loadvm blah
>
> Doing this successfully triggers the function to reinitialize the RNG
> with the new GUID. (It appears there's a bug in QEMU which prevents
> the GUID from being reinitialized when running `loadvm` without
> quitting first; I suppose this should be discussed with QEMU
> upstream.)
>
> So that's very positive. But I would appreciate hearing from some
> ACPI/Virt/Amazon people about this.

Because something something picture thousand words something, here's a
gif to see this working as expected:
https://data.zx2c4.com/vmgenid-appears-to-work.gif

Jason

