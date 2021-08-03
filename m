Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 388EF3DF15C
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 17:25:50 +0200 (CEST)
Received: from localhost ([::1]:42166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAwIe-0002kx-OD
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 11:25:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>) id 1mAwHP-00024n-Vm
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:24:32 -0400
Received: from mout.gmx.net ([212.227.15.18]:42217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>) id 1mAwHO-0000eZ-7d
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:24:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1628004267;
 bh=jizjRrdQX7yheUTww8yuDgRSc5OftqQPSXACo0WDE3Q=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=Z1vfpKeVf/klRGDZ8mpVhvT77RtawQ6tkzYr6wKekTHkSDPnw9CYix2s7rwmPlY+E
 yIOmHiPepO60th/gpHkyQpyp73Ny1e/YFQOidHAoFghmqIMMm4Je3/1LAP2kPnbxb/
 5670HGxH3px7ZgXFsrLY65+IA+Y8pUF2wJ7ykGA0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.82.103] ([87.129.254.130]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MOA3P-1mUMqI32pF-00OaZR; Tue, 03
 Aug 2021 17:24:27 +0200
Subject: Re: [PATCH 2/2] doc: Remove trailing spaces
To: Peter Maydell <peter.maydell@linaro.org>
References: <005fe0a5-10cd-aa47-d649-0a296283a4eb@gmx.de>
 <CAFEAcA_EmJ9R73RE_oMqoE7hvz1ALJdKhrWpOy7U6=74xXnzwQ@mail.gmail.com>
From: Axel Heider <axelheider@gmx.de>
Message-ID: <4635c699-d733-3673-9f14-9d05e6193e14@gmx.de>
Date: Tue, 3 Aug 2021 17:24:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_EmJ9R73RE_oMqoE7hvz1ALJdKhrWpOy7U6=74xXnzwQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pDIasANsI0e3ddKElumm1hhYxB7rFgLw8T5Z+5W139nB24Rt9HW
 ZUqly5DOe5KRgBMAX2ag5UIOcE/yGIEWdl1l01/bkNwxkLT2FhpQeA4j+Ny9Qb5HcarmJud
 qDb3D9wcZGTvx47bO6h9pPXSklYr86Rou3SP7IeXxk0WnQSlnw4FF40i3wqBTOeFNLD34zS
 Qn7GvrQo3Vuuu0X+kByKQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZybvN5Btjew=:qj+mLt2dzwdU6JVAg/8m5Q
 RYLSu3NzzunMvmafqIjRZS4qzACwEeF81Cm3jq9ugoLU/f+I77Ga+a5q3/9JCEg0F3y2Zo2hN
 xLMf2wT78i8D5g1AzbT3AaCo1vkZ5OCj00M8g6N1+oBTTlE19loFmP7JJJ1pCUe7gYV7DDZej
 1uJ3u264e8tg7CoQjawsRklsbGxmwsyza6l7R018ptJsh0G4/Npeuq0Lit0MCOS6KrX9PRDuH
 n5nM+YEb2CWGNhn8xM3TdwDNhvXztdtAQsGI/gBjL9hkRoi/rRDiJY8egD4rYO0Uw0yCbzfUx
 4LAQIfggSsnf+JommdaT2aNS+6xJrtWZpRD6euOkRdZnXUK2OiMvmvQmSIAt1PmTPwX7xpNwr
 mg/sT3lNyOLmAPKcn68alvROVitl2ksuaKV+CfR6eKagf8vosrTnh0GHHb3stHriWXz4fl59Z
 /hK/QRAEsmYutFaWcRaAjAApuJg+UI5sQEZlV1e8k7jgwR/afVzM8AopilrlWzFj5BbkN+QUP
 D4xYIaJfMckGKfONBMf0E0eo4lKrBIjxxsSssavPDJ9YFM3daN+eGpHaF0IlbQoxhdg5d0WWL
 vQ6ESxVtE/dua+D+McFugzpITAqMCT3bnizkW2YWBF/phXk0Qsyidk69paJ+gFtWmT/pPk179
 APVT7iKH6qrD8q9d5Li4lviapDjHJF80XGzU1WlsfNleBmq2PeOGDV/OOAiXfjuY7vLDQhklu
 1BNqbC2aVdnvL1e5Jpg7NKl1bSzcW25nxs59Zng+DvNn5a/81pCdl8XSaIGCTZisVdxMExXG3
 +NBHd1cwvMXSVLFwYM+3JXrUSpHDZh1eNkeZ6QZ3DBazny0r2DCaym0biPZmc/frljnWdOE67
 oW5oFMqK/cU3DgpuGEGuPGCHMZIPcsIBlfy1HiSkjufyl1vC5pdOc+6Z8zWMKkNDA+TJP7Joa
 kDhH4fbOzpciuwH3OOThEfs8lGNdFmVto1Vv1AJJVW+cEoSQ3CI65GdH63hQrLgkyPbQi8FKg
 mXvKmXGM+OibUn7RkDGnylFK6qdYBwcec0XSs+IwvNvlMk431suux2fgEBZZBJ04Gu+rCcNnU
 V1m1U3AbvlMw4xoR0Fe9l0Uvg6E6JJTjU/xPX6QyF1VHv21FbYBQQFKKA==
Received-SPF: pass client-ip=212.227.15.18; envelope-from=axelheider@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter,

> Also, did you check that the docs still build without warnings
> from a range of Sphinx versions and that the rendered HTML still
> looks the same ? These trailing spaces were largely added deliberately
> in commit 09ce5f2d6bd6739144, with the comment
>    * rST does not like definition list entries with no actual
>      definition, but it is possible to work around this by putting a
>      single escaped literal space as the definition line.
>
> so we should be careful not to delete them again unless we've
> confirmed that we definitely don't re-introduce the issue that
> we put them in to avoid...


Then please drop the patch 2/2 for now and just keep 1/2. I will run
more tests about this and see if I can find a way to avoid the need
for having traling spaces in the file. They are a bit dangerous as
most editors are set up to remove them, whch creates annoying changes
all the time then.

Axel

