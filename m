Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D32D5EB365
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 23:44:24 +0200 (CEST)
Received: from localhost ([::1]:46356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocvtn-0006fS-MG
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 17:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1ocvoZ-0007NZ-VQ
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 17:39:02 -0400
Received: from outgoing-exchange-7.mit.edu ([18.9.28.58]:34225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1ocvoT-0005d9-5i
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 17:38:57 -0400
Received: from oc11exedge1.exchange.mit.edu (OC11EXEDGE1.EXCHANGE.MIT.EDU
 [18.9.3.17])
 by outgoing-exchange-7.mit.edu (8.14.7/8.12.4) with ESMTP id 28QLcTR5003030;
 Mon, 26 Sep 2022 17:38:29 -0400
Received: from w92expo31.exchange.mit.edu (18.7.74.43) by
 oc11exedge1.exchange.mit.edu (18.9.3.17) with Microsoft SMTP Server (TLS) id
 15.0.1497.38; Mon, 26 Sep 2022 17:37:53 -0400
Received: from oc11expo31.exchange.mit.edu (18.9.4.104) by
 w92expo31.exchange.mit.edu (18.7.74.43) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Mon, 26 Sep 2022 17:38:28 -0400
Received: from oc11expo31.exchange.mit.edu ([18.9.4.104]) by
 oc11expo31.exchange.mit.edu ([18.9.4.104]) with mapi id 15.00.1497.023; Mon,
 26 Sep 2022 17:38:28 -0400
From: "Andrew S. Fasano" <fasano@mit.edu>
To: =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "erdnaxe@crans.org"
 <erdnaxe@crans.org>, "ma.mandourr@gmail.com" <ma.mandourr@gmail.com>
Subject: Re: [RFC 4/4] tcg/plugins: Add example pair of QPP plugins
Thread-Topic: [RFC 4/4] tcg/plugins: Add example pair of QPP plugins
Thread-Index: AQHYvjCp2QIQkobX1E2SnPckUFL7O63qZoKAgAf9rAU=
Date: Mon, 26 Sep 2022 21:38:28 +0000
Message-ID: <1664228308340.95534@mit.edu>
References: <20220901182734.2987337-1-fasano@mit.edu>
 <20220901182734.2987337-5-fasano@mit.edu>,<87r10468j5.fsf@linaro.org>
In-Reply-To: <87r10468j5.fsf@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [129.55.200.20]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=18.9.28.58; envelope-from=fasano@mit.edu;
 helo=outgoing-exchange-7.mit.edu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Alex Benn=E9e <alex.bennee@linaro.org>=0A=
> Andrew Fasano <fasano@mit.edu> writes:=0A=
> =0A=
> > The first plugin, qpp_srv exposes two functions and one callback that o=
ther=0A=
> > plugins can leverage. These functions are described in the correspondin=
g=0A=
> > header file.=0A=
> >=0A=
> > The second plugin, qpp_client, imports this header file, registers its=
=0A=
> > own function to run on a qpp_srv-provided callback, and directly calls=
=0A=
> > into the two exposed functions in qpp_srv.=0A=
> >=0A=
> > Signed-off-by: Andrew Fasano <fasano@mit.edu>=0A=
> > ---=0A=
> >  contrib/plugins/Makefile     |  2 ++=0A=
> >  contrib/plugins/qpp_client.c | 42 ++++++++++++++++++++++++++++++++++++=
=0A=
> >  contrib/plugins/qpp_client.h |  1 +=0A=
> >  contrib/plugins/qpp_srv.c    | 33 ++++++++++++++++++++++++++++=0A=
> >  contrib/plugins/qpp_srv.h    | 17 +++++++++++++++=0A=
> =0A=
> Oh and I forgot this toy case should probably be in test/plugins/qpp with=
 an=0A=
> explicit test in tests/tcg/multiarch/Makefile to exercise it during=0A=
> "make check-tcg". This should hopefully avoid having to mess with=0A=
> PLUGINS in tests/tcg/Makefile.target.=0A=
=0A=
Okay, that makes sense. Thanks so much for all the feedback!=0A=
=0A=
> =0A=
> <snip>=0A=
> =0A=
> -- =0A=
> Alex Benn=E9e=0A=
=0A=
Thanks,=0A=
Andrew=0A=

