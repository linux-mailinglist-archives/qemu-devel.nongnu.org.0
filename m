Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B4031F741
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 11:22:54 +0100 (CET)
Received: from localhost ([::1]:45684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD2w1-0006F1-B1
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 05:22:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckim@etri.re.kr>) id 1lD2rt-0002Fv-00
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 05:18:37 -0500
Received: from mscreen.etri.re.kr ([129.254.9.16]:34466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckim@etri.re.kr>) id 1lD2ro-0005n2-BH
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 05:18:36 -0500
Received: from unknown (HELO send002-relay.gov-dooray.com) (211.180.235.153)
 by 129.254.9.16 with ESMTP; 19 Feb 2021 19:18:18 +0900
X-Original-SENDERIP: 211.180.235.153
X-Original-MAILFROM: ckim@etri.re.kr
X-Original-RCPTTO: qemu-discuss@nongnu.org,
	qemu-devel@nongnu.org
Received: from [10.162.225.112] (HELO smtp002-imp.gov-dooray.com)
 ([10.162.225.112]) by send002-relay.gov-dooray.com with SMTP id
 8eacb315602f906f; Fri, 19 Feb 2021 19:18:23 +0900
DKIM-Signature: a=rsa-sha256;
 b=eiuWR5Rcl8c/0HWHOmqs3Sep+FHBLTY1xEwHYL2TMn0AF/89lQcx9UpXe2wKUyY9++Q0qXsNLI
 74licR9x7Z/9RyqHTVYglydUTf1ytZsAHoPqFCkQx43+UV1ADma9RMMDXMwftre3KJAQHqGIs/im
 VojkpSWAMYdFFD2IJ7vlfOuj9mcXQyTxpMRIhgW2MYvW+d83tED5qypZvQBQSwRWq/k9xNyp5c+k
 gvIxEjm36qnbsnJ1Xb2DL2Wz7bJHDGCY1hXU4frVYGjctOys2rOSpAbja5pxIA1Qmqy2CauwfzM6
 0cQhEziYCC+eWettY1KhKU+oEkoJkTLM9QcCfVkA==;
 c=relaxed/relaxed; s=selector; d=dooray.com; v=1;
 bh=/OIr/IX7queeNw+ZVvXgegkCoyxSxndC93Df3LwgxRQ=;
 h=From:To:Subject:Message-ID;
Received: from [129.254.132.39] (HELO CHANKIMPC) ([129.254.132.39]) by
 smtp002-imp.gov-dooray.com with SMTP id 3b8bbaff602f906f; Fri, 19 Feb 2021
 19:18:23 +0900
From: <ckim@etri.re.kr>
To: "'Peter Maydell'" <peter.maydell@linaro.org>
References: <027101d7035b$2e94a600$8bbdf200$@etri.re.kr>
 <57e74877-84a4-0157-1407-a67156dc2b6e@redhat.com>
 <023201d70695$72b7a250$5826e6f0$@etri.re.kr>
 <CAFEAcA9GJLr_GX3fHgssE2E=-q6waeN5ZKgWfCrdGAyK0e3C_g@mail.gmail.com>
In-Reply-To: <CAFEAcA9GJLr_GX3fHgssE2E=-q6waeN5ZKgWfCrdGAyK0e3C_g@mail.gmail.com>
Subject: RE: supported machines for aarch64
Date: Fri, 19 Feb 2021 19:18:21 +0900
Message-ID: <025a01d706a8$8d029cb0$a707d610$@etri.re.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH1F+35Sg8yOGj/QGc11V96jX1B8AFlknY7Ae38DuEB1U24Aan52gEg
Content-Language: ko
Received-SPF: pass client-ip=129.254.9.16; envelope-from=ckim@etri.re.kr;
 helo=mscreen.etri.re.kr
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
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
Cc: 'Paolo Bonzini' <pbonzini@redhat.com>,
 =?utf-8?Q?'Philippe_Mathieu-Daud=C3=A9'?= <philmd@redhat.com>,
 'qemu-devel' <qemu-devel@nongnu.org>, 'Markus Armbruster' <armbru@redhat.com>,
 'qemu-discuss' <qemu-discuss@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter Maydell,

Thanks, that made it clearer to me.(actually I was reading the page you =
mentioned)

Chan Kim

> -----Original Message-----
> From: Peter Maydell <peter.maydell@linaro.org>
> Sent: Friday, February 19, 2021 7:04 PM
> To: Chan Kim <ckim@etri.re.kr>
> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>; qemu-discuss =
<qemu-
> discuss@nongnu.org>; Paolo Bonzini <pbonzini@redhat.com>; qemu-devel
> <qemu-devel@nongnu.org>; Markus Armbruster <armbru@redhat.com>
> Subject: Re: supported machines for aarch64
>=20
> On Fri, 19 Feb 2021 at 08:05, <ckim@etri.re.kr> wrote:
> > These are the machine lists that included cortex-a72 when I gave
> > qemu-system-aarch64 --machine xxx --cpu help.
>=20
> Adding '--machine whatever' to your command line does not change the
> output of '--cpu help'. As Philippe says, it happens that QEMU =
processes -
> -cpu before --machine, so it handles '--cpu help', prints the fixed =
list
> of supported CPUs, and ignores whether you passed a valid --machine =
option
> or not.
>=20
> There is no automated way to get QEMU to tell you which CPUs a =
particular
> board model supports.
>=20
> I recommend that you follow the advice given here
> =
https://qemu.readthedocs.io/en/latest/system/target-arm.html#choosing-a-
> board-model
> for how to choose a board model. (Short answer: if you know you want =
to
> run guest code for a specific board type, use that board type. =
Otherwise,
> use 'virt'.) Then, you should stick with the default CPU type (ie, do =
not
> pass --cpu) for that board, for all board types *except* 'virt'. For
> 'virt' you can pass in the CPU type you want (and the documentation =
lists
> which types it supports).
>=20
> -- PMM





