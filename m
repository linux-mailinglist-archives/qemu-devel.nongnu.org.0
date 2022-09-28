Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA7D5EE889
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 23:44:57 +0200 (CEST)
Received: from localhost ([::1]:55404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oderJ-0005Wt-Tl
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 17:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <msuchanek@suse.de>) id 1odepi-0003tt-1h
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 17:43:10 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:42592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <msuchanek@suse.de>) id 1odepg-0002o0-2v
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 17:43:09 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 7E04D21A4E;
 Wed, 28 Sep 2022 21:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664401384; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uGuOxDSCWrbYBVGREVMKGk6Q8/+C7GGulMAyhlbpYNQ=;
 b=RleTyAjBT9MUkJJ1etadtjNeuJZQO4cJv3tzGeoPrwqnSTK45RlQ/LFfd59FTFiqE4rBKl
 fxLl1YOq2zXmA+rheNJkv8KHxJuuqDn8kV9zY15pZhc7eYjDZygAo8YYT020I7FViWix7A
 t9ixrN9cbExeQFVsdnlOC5b0Dz5uQY4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664401384;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uGuOxDSCWrbYBVGREVMKGk6Q8/+C7GGulMAyhlbpYNQ=;
 b=lm76ImISLtK7LXvf2O3725KmcDK8+ey7LgsqYsHB8CX8I3sDrJBCSRrUFUqOMq7hwt16K+
 SX+TheziqAZ9cqDA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 3706D2C141;
 Wed, 28 Sep 2022 21:43:04 +0000 (UTC)
Date: Wed, 28 Sep 2022 23:43:03 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: Why we should avoid new submodules if possible
Message-ID: <20220928214302.GT28810@kitsune.suse.cz>
References: <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
 <20220628060210-mutt-send-email-mst@kernel.org>
 <d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com>
 <20220628062551-mutt-send-email-mst@kernel.org>
 <CAFEAcA985ardY5zWkrZYgWjj+tdVNUnRcaBUChGFX0-o99cjQA@mail.gmail.com>
 <20220628064831-mutt-send-email-mst@kernel.org>
 <20220928204803.GS28810@kitsune.suse.cz>
 <20220928170234-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220928170234-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=195.135.220.28; envelope-from=msuchanek@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Sep 28, 2022 at 05:07:48PM -0400, Michael S. Tsirkin wrote:
> On Wed, Sep 28, 2022 at 10:48:03PM +0200, Michal Suchánek wrote:
> > Hello,
> > 
> > On Tue, Jun 28, 2022 at 07:00:59AM -0400, Michael S. Tsirkin wrote:
> > 
> > > 
> > > git submodules are awkward basically because they are an automated wget.
> > > I don't think an explicit wget is much better ... but
> > > looks like I'm alone in this. Oh well.
> > > So it will be a weird dance of wget a tarball, unpack, generate
> > > ISO and run. God help you if you need to patch the test - it's
> > > wget all the way down.
> > 
> > That's the problem - the submodules are not automated. They are
> > half-automated, and the rules for when the automation works and for when
> > the automation falls apart are not intellibible for the general Joe
> > Developer.
> > 
> > You might spend a few days studying how they behave exactly, and then you
> > will know. But unless you will use them every day you will forget again,
> > because the rules do not lend themselves to some abstraction easily
> > understood by humans.
> > 
> > Thanks
> > 
> > Michal
> 
> But why would learning a different tool be easier?

a) it's working lends itself to explaining in human-intelligible
concepts

b) it's used elsewhere as well

Thanks

Michal

