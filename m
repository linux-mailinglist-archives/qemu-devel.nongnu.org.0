Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E65E4592933
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 07:54:53 +0200 (CEST)
Received: from localhost ([::1]:47482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNT3s-00016Y-HM
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 01:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dz4list@gmail.com>)
 id 1oNSxA-0007N7-C7; Mon, 15 Aug 2022 01:47:56 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:36370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dz4list@gmail.com>)
 id 1oNSx8-0002Dd-Ff; Mon, 15 Aug 2022 01:47:56 -0400
Received: by mail-qk1-x735.google.com with SMTP id n21so4925342qkk.3;
 Sun, 14 Aug 2022 22:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=LQdwDoFdhJiFRqQAFor/83pFe9z3RF/99jVQ2ACLxCg=;
 b=GTq8RElGHIL5kxdS8o1ZJeF9QRRGl7Olt1wdrO99gdfCs0IFjZLrM3CHF+AHb3OdoC
 ncYiCZHFRmRpeFsTHev0ETg8G13QLr5Q6UB+6vLT+fKDJ3qFXJ+d3JwjGKlXlaqtf5kS
 iYj/ipXd0VS8ja25NJYS0lXYcO6BP90h97RUC86S7XN8dasQxB6gw1DSdbIljReVYrBq
 3L1H2OErTlnIafBCJIDjhMvopL2s2Cn28s5/uPBrlNeswUxdByl7G0Qo4I1Wz05stnTo
 Fz6muLZbIukzS24EH6tCoB4GIQWOIabkuJHN7IvAvUw/fxXxke0jsdkzYY8ryu9qir2N
 qlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=LQdwDoFdhJiFRqQAFor/83pFe9z3RF/99jVQ2ACLxCg=;
 b=5xcFU/BcUCI98J/6VkgGbuAMDu/hIGtX3HlHFn9pmKRhptF0rzzojs6oSTLPZTtJBU
 oag+zXZsgtFwEMagJmSXNV1qy8c8VLi3VrDc4tkh//u08QfBB6ArEU5dQYR+VQ1VuZ5s
 A0Q7VABK4Vu9ZqtgkuIctX1W9crIsVcDAqUPJSy5li//gk2+HzKADioy0R56Ch0cG7rX
 OzhVAmtPhPEHNxi9zsdKVs8yZMRth5yfEUmeQ4NzzJE9L94LnqxBvgFGhAHF6IuBw23A
 tiInhtpgfQ1xrglgTMJ8HJjf5GsnrSyxX09czANLC+MfBpQL1wh917KGvb+SVnwQVOQb
 1gMw==
X-Gm-Message-State: ACgBeo017xKZlhK23xuNXKwZy6cO2RyPqOFnfgeM9866nSQsld4ZYc5U
 UDA94xttP2Ml6dU4dgEQFezTFsEP0Bp8nzbX/xo=
X-Google-Smtp-Source: AA6agR70bPY02MS4VW5VOyJAKJFkHeq6wR7HmGal872eLW07bOYCdHnPUak6YB88UNK/qxve9chSvspKVZTYNPF3hpw=
X-Received: by 2002:a05:620a:573:b0:6bb:2865:e3cc with SMTP id
 p19-20020a05620a057300b006bb2865e3ccmr2606459qkp.15.1660542472802; Sun, 14
 Aug 2022 22:47:52 -0700 (PDT)
MIME-Version: 1.0
References: <BY5PR12MB38917595B0306085EEBB1921B4629@BY5PR12MB3891.namprd12.prod.outlook.com>
 <CACPK8XfjXq6RW=M++UebfiGeij=GDSk5f6ZftNaL+2oeyCGnHw@mail.gmail.com>
 <ec20d3af-5f99-8e56-9352-75562c4548de@kaod.org>
In-Reply-To: <ec20d3af-5f99-8e56-9352-75562c4548de@kaod.org>
From: Dan Zhang <dz4list@gmail.com>
Date: Sun, 14 Aug 2022 22:47:41 -0700
Message-ID: <CAJxKyLf1jUvx6m=0u3cf+vEfj6j4t6L7g7cowxKpNx-Xhh+xyQ@mail.gmail.com>
Subject: Re: AST2600 support in QEMU
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Joel Stanley <joel@jms.id.au>, Shivi Fotedar <sfotedar@nvidia.com>, 
 Peter Delevoryas <peter@pjd.dev>, Jeremy Kerr <jk@ozlabs.org>,
 Klaus Jensen <its@irrelevant.dk>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Andrew Jeffery <andrew@aj.id.au>, 
 "Amit Kumar (Engrg-SW)" <asinghal@nvidia.com>,
 Prasanna Karmalkar <pkarmalkar@nvidia.com>, 
 "Tim Chen (SW-GPU)" <timch@nvidia.com>, Newton Liu <newtonl@nvidia.com>, 
 Deepak Kodihalli <dkodihalli@nvidia.com>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=dz4list@gmail.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 9, 2022 at 10:51 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hello,
>
> On 8/10/22 04:37, Joel Stanley wrote:
> > Hello Shivi,
> >
> > I've added others to cc who may have some input.
> >
> > On Tue, 9 Aug 2022 at 21:38, Shivi Fotedar <sfotedar@nvidia.com> wrote:
> >>
> >> Hello, we are looking for support for few features for AST2600 in QEMU=
, specifically
> >>
> >> PCIe RC support so BMC can talk to downstream devices for management f=
unctions.
Normally the RC is the host CPU, BMC and the devices to be managed,
which support MCTP-over-PCIe will be the endpoint (downstream) device
as BMC.  The MCTP message Peer transaction between BMC and managed
device will using route-by-Id to RC(host) then down to endpoint.  I am
referring to DMTF DSP0238 spec. section 6.4

So what does the "PCIe RC support" means? the BMC will be the PCIe RC?
or BMC will be PCIe-Endpoint connect to host PCIe RC.

> >
> > I haven't seen any PCIe work done yet.
>
> I haven't either. There is clearly a need now that we are moving
> away from LPC.
>
> >> MCTP controller to run MCTP protocol on top of PCIe or I2C.
> >
> > What work would be required to do this on top of i2c?
>
> I think Jonathan and Klaus worked on this. See :
>
>    https://lore.kernel.org/qemu-devel/20220525121422.00003a84@Huawei.com/
>
> >> I2C slave so BMC can talk to host CPU QEMU for IPMI
> >
> > Some support for slave mode was merged in v7.1.
>
> yes.
>
> Peter D. experimented with IPMI. See :
>
>    https://lore.kernel.org/qemu-devel/20220630045133.32251-14-me@pjd.dev/
>
> We also merged a new machine including a BMC ast2600 running OpenBMC
> and an ast1030 SoC running OpenBIC. Work to interconnect them on the
> same I2C bus is in progress.
>
> Thanks,
>
> C.
>

