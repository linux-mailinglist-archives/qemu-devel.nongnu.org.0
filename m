Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 051C9284461
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Oct 2020 05:51:05 +0200 (CEST)
Received: from localhost ([::1]:60634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPe0E-0001TV-Ih
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 23:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Fan_Yang@sjtu.edu.cn>)
 id 1kPdh3-0006WB-Pl
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 23:31:13 -0400
Received: from smtp180.sjtu.edu.cn ([202.120.2.180]:41248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Fan_Yang@sjtu.edu.cn>)
 id 1kPdh0-0004bg-S9
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 23:31:13 -0400
Received: from proxy01.sjtu.edu.cn (smtp185.sjtu.edu.cn [202.120.2.185])
 by smtp180.sjtu.edu.cn (Postfix) with ESMTPS id 2E2551008CBC4;
 Tue,  6 Oct 2020 11:31:01 +0800 (CST)
Received: from localhost (localhost [127.0.0.1])
 by proxy01.sjtu.edu.cn (Postfix) with ESMTP id 024A02042423E;
 Tue,  6 Oct 2020 11:31:01 +0800 (CST)
X-Virus-Scanned: amavisd-new at proxy01.sjtu.edu.cn
Received: from proxy01.sjtu.edu.cn ([127.0.0.1])
 by localhost (proxy01.sjtu.edu.cn [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Z4FL2R6RAjCa; Tue,  6 Oct 2020 11:31:00 +0800 (CST)
Received: from [192.168.1.103] (unknown [58.23.236.228])
 (Authenticated sender: Fan_Yang@sjtu.edu.cn)
 by proxy01.sjtu.edu.cn (Postfix) with ESMTPSA id 751DD2042423F;
 Tue,  6 Oct 2020 11:30:34 +0800 (CST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [RFC PATCH 2/2] contrib/gitdm: Add more academic domains
From: Fan Yang <Fan_Yang@sjtu.edu.cn>
In-Reply-To: <20201004204010.2048608-3-f4bug@amsat.org>
Date: Tue, 6 Oct 2020 11:30:33 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <465E4C6C-0B01-4485-8B99-0BAF253DC990@sjtu.edu.cn>
References: <20201004204010.2048608-1-f4bug@amsat.org>
 <20201004204010.2048608-3-f4bug@amsat.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Received-SPF: pass client-ip=202.120.2.180; envelope-from=Fan_Yang@sjtu.edu.cn;
 helo=smtp180.sjtu.edu.cn
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 23:24:19
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Stephen Checkoway <stephen.checkoway@oberlin.edu>,
 Vince Weaver <vince@csl.cornell.edu>, qemu-devel@nongnu.org,
 Xinyu Li <precinct@mail.ustc.edu.cn>,
 Alex Richardson <Alexander.Richardson@cl.cam.ac.uk>,
 Amir Charif <amir.charif@cea.fr>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Alex Barcelo <abarcelo@ac.upc.edu>,
 =?utf-8?Q?Llu=C3=ADs_Vilanova?= <vilanova@ac.upc.edu>,
 linzhecheng <linzc@zju.edu.cn>,
 Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>,
 Dayeol Lee <dayeol@berkeley.edu>,
 Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>,
 Brian Wheeler <bdwheele@indiana.edu>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Christoffer Dall <cdall@cs.columbia.edu>, Colin Lord <cdlord2@illinois.edu>,
 Gabriel Somlo <somlo@cmu.edu>, Alexander Bulekov <alxndr@bu.edu>,
 Fabrice Desclaux <fabrice.desclaux@cea.fr>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Akkarit Sangpetch <asangpet@andrew.cmu.edu>,
 =?utf-8?Q?C=C3=A9sar_Belley?= <cesar.belley@lse.epita.fr>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Nickolai Zeldovich <nickolai@csail.mit.edu>,
 Timothy Edward Baldwin <T.E.Baldwin99@members.leeds.ac.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Acked-by: Fan Yang <Fan_Yang@sjtu.edu.cn>

On Mon, Oct 05, 2020 at 4:40AM +0800=EF=BC=8CPhilippe Mathieu-Daud=C3=A9 =
<f4bug@amsat.org> wrote=EF=BC=9A
>=20
> There is a number of contributions from these academic domains.
> Add the entries to the gitdm 'academic' domain map.
>=20
> Cc: Akkarit Sangpetch <asangpet@andrew.cmu.edu>
> Cc: Alexander Bulekov <alxndr@bu.edu>
> Cc: Alexander Oleinik <alxndr@bu.edu>
> Cc: Alex Barcelo <abarcelo@ac.upc.edu>
> Cc: Brian Wheeler <bdwheele@indiana.edu>
> Cc: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
> Cc: Christoffer Dall <cdall@cs.columbia.edu>
> Cc: Colin Lord <cdlord2@illinois.edu>
> Cc: Dayeol Lee <dayeol@berkeley.edu>
> Cc: Fan Yang <Fan_Yang@sjtu.edu.cn>
> Cc: Gabriel Somlo <somlo@cmu.edu>
> Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>
> Cc: linzhecheng <linzc@zju.edu.cn>
> Cc: Llu=C3=ADs Vilanova <vilanova@ac.upc.edu>
> Cc: Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
> Cc: Mike Ryan <mikeryan@isi.edu>
> Cc: Nickolai Zeldovich <nickolai@csail.mit.edu>
> Cc: Stephen Checkoway <stephen.checkoway@oberlin.edu>
> Cc: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
> Cc: Vince Weaver <vince@csl.cornell.edu>
> Cc: Xinyu Li <precinct@mail.ustc.edu.cn>
> Cc: Zhang Mengchi <zhangmengchi@mprc.pku.edu.cn>
> Cc: Alex Richardson <Alexander.Richardson@cl.cam.ac.uk>
> Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Cc: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
> Cc: Timothy Edward Baldwin <T.E.Baldwin99@members.leeds.ac.uk>
> Cc: Pavel Pisa <pisa@cmp.felk.cvut.cz>
> Cc: C=C3=A9sar Belley <cesar.belley@lse.epita.fr>
> Cc: Amir Charif <amir.charif@cea.fr>
> Cc: Fabrice Desclaux <fabrice.desclaux@cea.fr>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> To the developers Cc'ed: If you agree with the entry of your
> domain, please reply with a Reviewed-by/Acked-by tag. If you
> disagree or doesn't care, please either reply with Nack-by or
> ignore this patch.
> I'll repost in 2 weeks as formal patch (not RFC) with only the
> entries acked by their author.
> One Reviewed-by/Ack-by from someone from a domain should be
> sufficient to get the domain included in the final patch.
> ---
> contrib/gitdm/group-map-academics | 10 +++++++++-
> 1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/contrib/gitdm/group-map-academics =
b/contrib/gitdm/group-map-academics
> index c7b0dd46a3..fd42bb8069 100644
> --- a/contrib/gitdm/group-map-academics
> +++ b/contrib/gitdm/group-map-academics
> @@ -11,9 +11,17 @@ ispras.ru
> pavel.dovgaluk@gmail.com
>=20
> # Columbia University
> -cs.columbia.edu
> cota@braap.org
>=20
> jiaxun.yang@flygoat.com
>=20
> artem.k.pisarenko@gmail.com
> +
> +uni-paderborn.de
> +edu
> +ac.uk
> +edu.cn
> +edu.tw
> +cmp.felk.cvut.cz
> +epita.fr
> +cea.fr
> --=20
> 2.26.2
>=20


