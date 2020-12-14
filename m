Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4ED72D992E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 14:48:55 +0100 (CET)
Received: from localhost ([::1]:57062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kooDe-0003oJ-14
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 08:48:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kooB6-0002AN-Hs; Mon, 14 Dec 2020 08:46:16 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:52692 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kooB4-0001gp-P7; Mon, 14 Dec 2020 08:46:16 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id AE29F41364;
 Mon, 14 Dec 2020 13:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-transfer-encoding:content-disposition
 :content-type:content-type:mime-version:references:message-id
 :subject:subject:from:from:date:date:received:received:received;
 s=mta-01; t=1607953569; x=1609767970; bh=LLMvOVs8uPUNwvRgsR3cv7
 CgrcGxjkoeojxcDo73ISo=; b=DA8FcRe/GEk+LQwW/Hv1Rsj/oCAeVUYzJeET2v
 U5JMbcaz3eMpsA+m5ilb0Ju+XNorRLZ+RMgIVBpJE8STX8xoFJpUzclBMi2nkO7E
 41VRd92gPdeLfCKIp83Hj9LeH0XK60Ro29FkQOjQeb2x8tGDoVDLFZBWGlrTEPHC
 9Wwxk=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oEjwrM3kLUp6; Mon, 14 Dec 2020 16:46:09 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 2738841384;
 Mon, 14 Dec 2020 16:46:09 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 14
 Dec 2020 16:46:08 +0300
Date: Mon, 14 Dec 2020 16:46:08 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2 2/4] Makefile: Require GNU make 3.82+
Message-ID: <X9dsoCeCta4501m0@SPB-NB-133.local>
References: <20200825202755.50626-1-r.bolshakov@yadro.com>
 <20200825202755.50626-3-r.bolshakov@yadro.com>
 <1ff85cc3-40dc-98da-fb18-a1b3d134d7dc@redhat.com>
 <bc560d06-2b8d-3ef0-b9e6-ddaeb58daa13@vivier.eu>
 <CAFEAcA_XA1FcQos+m0vv6DVkbaybYwX5ytsM5gMaLAtL0jGGgA@mail.gmail.com>
 <8010190c-6265-2dbb-cb55-25353d9922ec@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8010190c-6265-2dbb-cb55-25353d9922ec@vivier.eu>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Dec 13, 2020 at 11:56:22PM +0100, Laurent Vivier wrote:
> Le 13/12/2020 à 20:04, Peter Maydell a écrit :
> > On Sun, 13 Dec 2020 at 17:22, Laurent Vivier <laurent@vivier.eu> wrote:
> >>
> >> Le 12/10/2020 à 11:47, Thomas Huth a écrit :
> >>> On 25/08/2020 22.27, Roman Bolshakov wrote:
> >>>> QEMU build fails with cryptic messages if make is too old:
> >>>>
> >>>>   Makefile.ninja:2655: *** multiple target patterns.  Stop.
> >>>>
> >>>> To avoid the confusion it's worth to fail the build right away and print
> >>>> a friendly error message.
> >>>>
> >>>> +ifeq ($(filter undefine,$(value .FEATURES)),)
> >>>> +$(error Unsupported Make version: $(MAKE_VERSION). \
> >>>> +        Please use GNU Make 3.82 or above)
> >>>> +endif
> >>>> +
> >>>>  # Always point to the root of the build tree (needs GNU make).
> >>>>  BUILD_DIR=$(CURDIR)
> >>>
> >>> Reviewed-by: Thomas Huth <thuth@redhat.com>
> >>>
> >>>
> >>
> >> Applied to my trivial-patches branch.
> > 
> > Commit 09e93326e448ab4 says that the switch to ninja from
> > ninjatool removed the requirement for Make 3.82. Is this
> > change still required?
> >
> 
> It seems 09e93326e448ab4 has been committed on 17th of October, so after Thomas' review.
> I remove it from my queue.
> 

I can confirm:

./configure --target-list=x86_64-softmmu --enable-trace-backends=dtrace && make -j$(nproc)

Works fine on macOS with the latest qemu HEAD. The patch can be
discarded.

Regards,
Roman

