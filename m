Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3C453A207
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 12:09:28 +0200 (CEST)
Received: from localhost ([::1]:57678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwLI7-0008I1-GL
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 06:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nwLCR-0002nM-F5
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 06:03:36 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:52047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nwLCP-0004tl-Jk
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 06:03:35 -0400
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-rGNGMXxFOUKcBVieCHC67w-1; Wed, 01 Jun 2022 06:03:29 -0400
X-MC-Unique: rGNGMXxFOUKcBVieCHC67w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1155D833976;
 Wed,  1 Jun 2022 10:03:28 +0000 (UTC)
Received: from bahia (unknown [10.39.192.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B838182894;
 Wed,  1 Jun 2022 10:03:25 +0000 (UTC)
Date: Wed, 1 Jun 2022 12:03:24 +0200
From: Greg Kurz <groug@kaod.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, mopsfelder@gmail.com, "Daniel P .
 =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, Fabiano Rosas
 <farosas@linux.ibm.com>
Subject: Re: [PATCH] target/ppc/cpu-models: Update max alias to power10
Message-ID: <20220601120324.66c77571@bahia>
In-Reply-To: <5076ea8a-428d-5aa2-1a8c-cd38bf67c7f9@redhat.com>
References: <20220531172711.94564-1-muriloo@linux.ibm.com>
 <475c2f40-8c58-8d51-4cc5-da5b9db814f2@redhat.com>
 <20220601103825.498c378f@bahia>
 <5076ea8a-428d-5aa2-1a8c-cd38bf67c7f9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Wed, 1 Jun 2022 11:25:43 +0200
Thomas Huth <thuth@redhat.com> wrote:

> On 01/06/2022 10.38, Greg Kurz wrote:
> > On Wed, 1 Jun 2022 09:27:31 +0200
> > Thomas Huth <thuth@redhat.com> wrote:
> > 
> >> On 31/05/2022 19.27, Murilo Opsfelder Araujo wrote:
> >>> Update max alias to power10 so users can take advantage of a more
> >>> recent CPU model when '-cpu max' is provided.
> ...
> > We already have the concept of default CPU for the spapr
> > machine types, that is usually popped up to the newer
> > CPU model that is going to be supported in production.
> > This goes with a bump of the machine type version as
> > well for the sake of migration. This seems a lot more
> > reliable than the "max" thingy IMHO.
> > 
> > Unless there's a very important use case I'm missing,
> > I'd rather kill the thing instead of trying to resurrect
> > it.
> 
> It's about making ppc similar to other architectures, which
> have "-cpu max" as well, see:
> 
>   https://gitlab.com/qemu-project/qemu/-/issues/1038
> 
> It would be nice to get something similar on ppc.
> 

Problem is that on ppc, given the variety of models and boards,
the concept of "max" is quite fuzzy... i.e. a lot of cases to
consider for a benefit that is unclear to me. Hence my questioning.
If the idea is just to match what other targets do without a specific
use case in mind, this looks quite useless to me.

> By the way, the warnings that you currently get when running with
> TCG are quite ugly, too:
> 
> $ ./qemu-system-ppc64
> qemu-system-ppc64: warning: TCG doesn't support requested feature, 
> cap-cfpc=workaround
> qemu-system-ppc64: warning: TCG doesn't support requested feature, 
> cap-sbbc=workaround
> qemu-system-ppc64: warning: TCG doesn't support requested feature, 
> cap-ibs=workaround
> qemu-system-ppc64: warning: TCG doesn't support requested feature, 
> cap-ccf-assist=on
> 
> Maybe these could get fixed with a proper "max" CPU in TCG
> mode, too?
> 

I don't think so. These warnings are the consequence of pseries
being the default machine for ppc64, and the default pseries
machine decides on the default CPU model and default values for
features (in this case, these are mitigations for spectre/meltdown).
TCG doesn't support them but we certainly don't want to add more
divergence between TCG and KVM.

Cheers,

--
Greg

>   Thomas
> 


