Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5965EB37C
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 23:48:01 +0200 (CEST)
Received: from localhost ([::1]:44658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocvxI-0001RN-5Y
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 17:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1ocvob-0007Ne-7j
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 17:39:05 -0400
Received: from outgoing-exchange-3.mit.edu ([18.9.28.13]:50735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1ocvoZ-0005ea-Pm
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 17:39:00 -0400
Received: from oc11exedge2.exchange.mit.edu (OC11EXEDGE2.EXCHANGE.MIT.EDU
 [18.9.3.18])
 by outgoing-exchange-3.mit.edu (8.14.7/8.12.4) with ESMTP id 28QLcqZ7009549;
 Mon, 26 Sep 2022 17:38:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1664228336; bh=hLhIVnar14v7N7+zqm8TIXZuL/TOL7OpY690lX0QdiU=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=bnII2x/Y9oE4uNz4H6uk7LqUQhffIC2sW4UrEBlxHNMV2A9LvWr1Azn4rhx9o8GUg
 vMHsT+PsqdEoh3DuFZU5JpepyK9WC5hvUhMkA30dBhCyRliw82pgMPz9AQpHtZerDm
 Yk/42rFp+NXyf/bFpzHpVtAfoMzJYlYK+9blCEzmS2l5j6pGXO6DLjPMhYSX2AnKlj
 z73j5JbuwdjGiWeqeImmbvXvihbzgRwvcTt1spXdu86SFO5keF8AC2x7ZH/D1JgsKt
 aW49vNsw2IEw/IWqNbWSjYEGrM5YJa5a/5YSBl4so9ugi6mXET6OyQqzN8Z4yRQZFR
 JLFYXx4DVgJqQ==
Received: from w92expo31.exchange.mit.edu (18.7.74.43) by
 oc11exedge2.exchange.mit.edu (18.9.3.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.38; Mon, 26 Sep 2022 17:37:49 -0400
Received: from oc11expo31.exchange.mit.edu (18.9.4.104) by
 w92expo31.exchange.mit.edu (18.7.74.43) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Mon, 26 Sep 2022 17:38:10 -0400
Received: from oc11expo31.exchange.mit.edu ([18.9.4.104]) by
 oc11expo31.exchange.mit.edu ([18.9.4.104]) with mapi id 15.00.1497.023; Mon,
 26 Sep 2022 17:38:10 -0400
From: "Andrew S. Fasano" <fasano@mit.edu>
To: =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "erdnaxe@crans.org"
 <erdnaxe@crans.org>, "ma.mandourr@gmail.com" <ma.mandourr@gmail.com>
Subject: Re: [RFC 4/4] tcg/plugins: Add example pair of QPP plugins
Thread-Topic: [RFC 4/4] tcg/plugins: Add example pair of QPP plugins
Thread-Index: AQHYvjCp2QIQkobX1E2SnPckUFL7O63qYp8AgAgBggc=
Date: Mon, 26 Sep 2022 21:38:10 +0000
Message-ID: <1664228290470.772@mit.edu>
References: <20220901182734.2987337-1-fasano@mit.edu>
 <20220901182734.2987337-5-fasano@mit.edu>,<87v8pg68u1.fsf@linaro.org>
In-Reply-To: <87v8pg68u1.fsf@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [129.55.200.20]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=18.9.28.13; envelope-from=fasano@mit.edu;
 helo=outgoing-exchange-3.mit.edu
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
> =0A=
> I'll just sketch out how I would change the API in this example plugin:=
=0A=
[snip]=0A=
> QEMU_PLUGIN_EXPORT const char *qemu_plugin_name =3D "qpp_client";=0A=
=0A=
This works. Perhaps plugins could (should?) also specify a version number=
=0A=
that other plugins could check before interacting with:=0A=
=0A=
	QEMU_PLUGIN_EXPORT const int qemu_plugin_version =3D 1;=0A=
=0A=
> QEMU_PLUGIN_EXPORT const char *qemu_plugin_uses =3D "qpp_server";=0A=
=0A=
I anticipate plugins could depend on multiple other plugins and they might=
=0A=
want to check the version of these plugins, so perhaps a function call woul=
d=0A=
be better? Something like:=0A=
=0A=
	int qpp_srv_version =3D load_qemu_plugin("qpp_server");=0A=
=0A=
Perhaps returning negative values on error, otherwise the plugin version. O=
r=0A=
the version compatability checks could be standardized into the plugin core=
,=0A=
but that seems less important to me for now.=0A=
[snip]=0A=
=0A=
> QEMU_PLUGIN_EXPORT int qpp_srv_do_add(int x)=0A=
=0A=
I like the change to keep these with the plugin name as a prefix everywhere=
.=0A=
=0A=
Thanks,=0A=
Andrew=0A=

