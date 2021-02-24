Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 753BF323883
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 09:23:29 +0100 (CET)
Received: from localhost ([::1]:42296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEpSC-0008SR-EC
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 03:23:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lEpPT-00076y-QM
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 03:20:45 -0500
Received: from 4.mo52.mail-out.ovh.net ([178.33.43.201]:39247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lEpPR-000830-KU
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 03:20:39 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.217])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 852122454EA;
 Wed, 24 Feb 2021 09:20:22 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 24 Feb
 2021 09:20:21 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0014f7df7e5-866c-461a-9b21-2421b7366e77,
 4492215E884D8EB0206D6A0B23EE6B50DB014786) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 24 Feb 2021 09:20:20 +0100
From: Greg Kurz <groug@kaod.org>
To: Jeremy Kerr <jk@ozlabs.org>
Subject: Re: who's using the ozlabs patchwork install for QEMU patches ?
Message-ID: <20210224092020.269ab775@bahia.lan>
In-Reply-To: <4023a93314e1ae69c19a4a93e87b65c8bfaac619.camel@ozlabs.org>
References: <CAFEAcA8h8QVoGsfJCLTYnbk3yzmrtphsWdSsDUrgQkB=vGh3zw@mail.gmail.com>
 <20210223123943.06d23a56@bahia.lan>
 <CAFEAcA9mgE5t5KpkGac7ABaVy3gK11PbpNMfO3p-gcVhSN51tQ@mail.gmail.com>
 <2915273.dLz0rCdnKo@silver>
 <e79d7306-c0d8-fbd2-9582-bfa169dd6289@ozlabs.ru>
 <4023a93314e1ae69c19a4a93e87b65c8bfaac619.camel@ozlabs.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 41b95554-65a9-4200-8d59-3e28da30bab5
X-Ovh-Tracer-Id: 884394379145025839
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrkeeigdduudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruh
Received-SPF: pass client-ip=178.33.43.201; envelope-from=groug@kaod.org;
 helo=4.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Feb 2021 08:29:17 +0800
Jeremy Kerr <jk@ozlabs.org> wrote:

> Hi Alexey,
> > Jeremy or Stephen (cc-ing) do definitely know if there is a better
> > way.
> 
> The standard process is to send me an email :)
> 

Is this standard process mentioned somewhere ?

> You're wanting to add user 'groug' to the qemu project, is that
> correct?
> 

Yes. Thanks !

--
Greg

> Cheers,
> 
> 
> Jeremy
> 


