Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 642C9514EA8
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:03:47 +0200 (CEST)
Received: from localhost ([::1]:44446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkS9q-0004W2-HA
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1nkRvj-0005ME-0n
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:49:15 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:58125)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1nkRvd-0000tD-Lz
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:49:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651243745; x=1682779745;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=h5nIFNX3bxZ2V3uSQbTdgeVjA5pQ/mLhS6eBLSCuYjg=;
 b=dBEjPg5LPQTtxoLESHBSzL5O1rq3xLWs9nNiTeQ2OmYN/0Jwk0YQ6+Ag
 4KX1w2CH5I9ZvVJ+o2ikjAdw5ZLQw1HzuqMufyG5WhvbVFvUBOJHb8x9O
 r3v0l5HpWekQqfRnENsOgQ6GPQZD8Cvyf+3BFnLRLntR/Y4YAMTzLJOJI w=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 29 Apr 2022 07:49:01 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 07:49:01 -0700
Received: from qc-i7.hemma.eciton.net (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 29 Apr 2022 07:49:00 -0700
Date: Fri, 29 Apr 2022 15:48:57 +0100
From: Leif Lindholm <quic_llindhol@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] MAINTAINERS/.mailmap: update email for Leif Lindholm
Message-ID: <Ymv62Vtzs8tAWqeQ@qc-i7.hemma.eciton.net>
References: <20220427181335.26613-1-quic_llindhol@quicinc.com>
 <CAFEAcA_RRy+bR=hixmmmhSMsX6SRGPFK1z4H9EXZU9-h0FPEOg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFEAcA_RRy+bR=hixmmmhSMsX6SRGPFK1z4H9EXZU9-h0FPEOg@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.47.97.222)
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=quic_llindhol@quicinc.com; helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Leif Lindholm <leif@nuviainc.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 28, 2022 at 13:46:36 +0100, Peter Maydell wrote:
> On Wed, 27 Apr 2022 at 19:13, Leif Lindholm <quic_llindhol@quicinc.com> wrote:
> >
> > NUVIA was acquired by Qualcomm in March 2021, but kept functioning on
> > separate infrastructure for a transitional period. We've now switched
> > over to contributing as Qualcomm Innocation Center (quicinc), so update
> > my email address to reflect this.
> >
> > Signed-off-by: Leif Lindholm <quic_llindhol@quicinc.com>
> > Cc: Leif Lindholm <leif@nuviainc.com>
> > Cc: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  .mailmap    | 1 +
> >  MAINTAINERS | 2 +-
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/.mailmap b/.mailmap
> > index 2976a675ea..6b28c98a90 100644
> > --- a/.mailmap
> > +++ b/.mailmap
> > @@ -63,6 +63,7 @@ Huacai Chen <chenhuacai@kernel.org> <chenhc@lemote.com>
> >  Huacai Chen <chenhuacai@kernel.org> <chenhuacai@loongson.cn>
> >  James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
> >  Leif Lindholm <leif@nuviainc.com> <leif.lindholm@linaro.org>
> > +Leif Lindholm <quic_llindhol@quicinc.com> <leif@nuviainc.com>
> 
> Do you also need to update the previous line ? I'm not sure
> whether git will do multiple passes through the mailmap chasing
> A -> B -> C remappings...

I thought I checked that, but on verifying, I clearly didn't do a very
good job at it if I did. Will fix.

Best Regards,

Leif


