Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD57316886
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 14:59:23 +0100 (CET)
Received: from localhost ([::1]:40012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9q1Z-0001C7-3w
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 08:59:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l9q0Z-0000kL-UA
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 08:58:19 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:33064 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l9q0Y-0005lB-2j
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 08:58:19 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id F20424127C;
 Wed, 10 Feb 2021 13:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-transfer-encoding:content-disposition
 :content-type:content-type:mime-version:references:message-id
 :subject:subject:from:from:date:date:received:received:received;
 s=mta-01; t=1612965494; x=1614779895; bh=81YJnfdCHX72E6R2MznQD+
 sKaFru3owMbDmjkKbMIGY=; b=OcCgIvFmXnGXGEqL9CitHwO8duwmnygUsMt09r
 E2ik5jQpEOr5jJ3AwBhk2VBYuIYw20EJkfpYa5ffVFzc4npgZUozeP3x0OfTvp5B
 GuWmZtnrvVBTW/QZn6sLm4J2S8BywNUITle4vzQLrubbh6iHZTuVTcqOcX07fbb6
 C+lIA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QFe5E22QyN5s; Wed, 10 Feb 2021 16:58:14 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id C2A1C404AD;
 Wed, 10 Feb 2021 16:58:13 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 10
 Feb 2021 16:58:13 +0300
Date: Wed, 10 Feb 2021 16:58:12 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v16 01/23] cpu: Introduce TCGCpuOperations struct
Message-ID: <20210210135812.gz5fwn6jadbictit@SPB-NB-133.local>
References: <20210204163931.7358-1-cfontana@suse.de>
 <20210204163931.7358-2-cfontana@suse.de>
 <20210210122151.bgxtonwy4lvtajj3@SPB-NB-133.local>
 <20210210123255.GA1420762@habkost.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210210123255.GA1420762@habkost.net>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 10, 2021 at 07:32:55AM -0500, Eduardo Habkost wrote:
> On Wed, Feb 10, 2021 at 03:21:51PM +0300, Roman Bolshakov wrote:
> > On Thu, Feb 04, 2021 at 05:39:09PM +0100, Claudio Fontana wrote:
> > > From: Eduardo Habkost <ehabkost@redhat.com>
> > > 
> > > The TCG-specific CPU methods will be moved to a separate struct,
> > > to make it easier to move accel-specific code outside generic CPU
> > > code in the future.  Start by moving tcg_initialize().
> > > 
> > > The new CPUClass.tcg_opts field may eventually become a pointer,
> > > but keep it an embedded struct for now, to make code conversion
> > > easier.
> > > 
> > > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > > 
> > > [claudio: move TCGCpuOperations inside include/hw/core/cpu.h]
> > > 
> > > Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> > > ---
> [...]
> > > diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
> > > index b3fd6643e8..d66f0351a9 100644
> > > --- a/target/alpha/cpu.c
> > > +++ b/target/alpha/cpu.c
> > > @@ -231,7 +231,7 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
> > >      dc->vmsd = &vmstate_alpha_cpu;
> > >  #endif
> > >      cc->disas_set_info = alpha_cpu_disas_set_info;
> > > -    cc->tcg_initialize = alpha_translate_init;
> > > +    cc->tcg_ops.initialize = alpha_translate_init;
> > 
> > Hi,
> > 
> > Would it be cleaner if the file had:
> > 
> > static
> > TcgCpuOperations alpha_tcg_ops = {
> >     .initialize = alpha_translate_init,
> > };
> > 
> > CPUClass definition would be:
> > struct CPUClass {
> >   ...
> >   TCGCpuOperations *tcg_ops;
> >   ...
> > }
> > 
> > And class init would be:
> > 
> > cc->tcg_ops = &alpha_tcg_ops;
> 
> That's exactly what's done by:
> 
>   Subject: [PATCH v16 15/23] cpu: tcg_ops: move to tcg-cpu-ops.h, keep a pointer in CPUClass
>   https://lore.kernel.org/qemu-devel/20210204163931.7358-16-cfontana@suse.de/
> 

Great, thanks!

-Roman

> > 
> > And you would grow arch_tcg_ops as you convert them?
> > I'm sorry if I missed similar comment and it was already discussed.
> > 
> > Regards,
> > Roman
> > 
> 
> -- 
> Eduardo
> 

