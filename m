Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 130F9513365
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 14:14:26 +0200 (CEST)
Received: from localhost ([::1]:33068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk32O-0002wD-1a
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 08:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1nk304-0001bY-DR; Thu, 28 Apr 2022 08:12:00 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:12722)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1nk301-0002hr-QB; Thu, 28 Apr 2022 08:11:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651147917; x=1682683917;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wFQcIeYD29PvsRbltnxLBOJ3gA8MOkQizno/WrszAWQ=;
 b=TY7cXM/cyAxJbL5Rb+41zDMZOlMuPwjbqfY0pkMNxuln/A8PZXgm45R4
 rrEc466g4TvrYgQ6QtU54IxEEK0/Cr60j/6KP4wOGAbR5QtQb+//hY7bg
 74NI+xCX1MnBAvEGXJKbARR6ogCc8r5KuxFKDFdfa2AlLbwEeX1gwzFDu k=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 28 Apr 2022 05:11:53 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 05:11:53 -0700
Received: from qc-i7.hemma.eciton.net (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 28 Apr 2022 05:11:51 -0700
Date: Thu, 28 Apr 2022 13:11:48 +0100
From: Leif Lindholm <quic_llindhol@quicinc.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] hw/arm: add versioning to sbsa-ref machine DT
Message-ID: <YmqEhFGvef2zKqcH@qc-i7.hemma.eciton.net>
References: <20220427182934.27075-1-quic_llindhol@quicinc.com>
 <8ffebcd4-7036-3998-c224-4841f7f2a5b6@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ffebcd4-7036-3998-c224-4841f7f2a5b6@kaod.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cedric,

On Thu, Apr 28, 2022 at 10:55:54 +0200, Cédric Le Goater wrote:
> > The sbsa-ref machine is continuously evolving. Some of the changes we
> > want to make in the near future, to align with real components (e.g.
> > the GIC-700), will break compatibility for existing firmware.
> > 
> > Introduce two new properties to the DT generated on machine generation:
> > - machine-version-major
> >    To be incremented when a platform change makes the machine
> >    incompatible with existing firmware.
> > - machine-version-minor
> >    To be incremented when functionality is added to the machine
> >    without causing incompatibility with existing firmware.
> >    to be reset to 0 when machine-version-major is incremented.
> > 
> > These properties are both introduced with the value 0.
> > (Hence, a machine where the DT is lacking these nodes is equivalent
> > to version 0.0.)
> 
> This raises a lot of questions. I am talking with my PAPR specs
> experience there, which might be off topic for SBSA, but it's a
> way to clarify my understanding.

That is a reasonable assumption: you may expect the ARM platform
specifications to usefully describe a general platform which sofware
can be developed against. However, they are not. They describe the
absolute minimum that it is even theoretically possible to develop
portable software against.

> If we need to introduce incompatible changes in the sbsa machine,
> that would break existing firmwares, I think we should start versioning
> the sbsa machine like the other do : arm/i440fx/m68k/q35/s390x/spapr
> and add class attributes describing features being activated or not.
> This to make sure that firmware already shipped can always be run.

The versioning I'm introducing here is a separate one from the SBSA
numbering. See this thread for some history:

https://lore.kernel.org/qemu-devel/20211015122351.vc55mwzjbevl6wjy@leviathan/

Without derailing this thread too much, I will add that trying to
align a machine against specific SBSA versions is tricky, since ARM do
not put enough resource into QEMU development to keep up with
architectural feature support. ARM's strategy for that sort of thing
relies on proprietary software models.

It *would* be possible to retroactively add support for older
versions as the qemu feature set catches up, but that would be a
separate versioning scheme, mostly orhogonal with this one.
If ARM *did* start shifting to a focus on getting QEMU enablement done
in sync with architectural evolution, the versioning scheme would
remain mostly orthogonal.

> Regarding the DT changes, we could also expose/advertise the new
> platform features by name with property nodes.

That would defeat the purpose of this platform, which is to serve as a
realistic target for developing SBBR firmware against. That we used a
DT at all to communicate information about the machine configuration
was in hindsight possibly a mistake, since it frequently leads to this
misunderstanding - but I opted for it in order to avoid inventing a
new data encapsulation format *only* for avoiding this topic popping
up at a regular cadence.

> What about the SBSA specs ? Do they need a change ? It is true that
> there are a bit vague regarding the DT, only referencing the Arm

DT is not relevant for ServerReady SR (which is what SBSA got renamed
to). There are embedded profiles defined by the ServerReady documents
that mention DT. Support for those, if anyone is interested in
creating/maintaining them, would be handled by a separate machine type.

Regards,

Leif

