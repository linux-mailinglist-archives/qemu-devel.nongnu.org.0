Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D263D52B8
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 07:03:57 +0200 (CEST)
Received: from localhost ([::1]:38538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7smS-0005yE-33
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 01:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <benh@kernel.crashing.org>)
 id 1m7slh-0005J3-TH
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 01:03:09 -0400
Received: from gate.crashing.org ([63.228.1.57]:46773)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <benh@kernel.crashing.org>) id 1m7slf-00075V-5O
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 01:03:09 -0400
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 16Q4wa1i002375;
 Sun, 25 Jul 2021 23:58:37 -0500
Message-ID: <1ad8269eded2d93fccc46c5f46209d5e87c22caf.camel@kernel.crashing.org>
Subject: Re: [PATCH for-6.1? v2 7/9] hw/pci-hist/pnv_phb4: Fix typo in
 pnv_phb4_ioda_write
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Richard
 Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Date: Mon, 26 Jul 2021 14:58:36 +1000
In-Reply-To: <ddbabd5d-9dba-6f3e-b0b2-d770730fa427@amsat.org>
References: <20210725122416.1391332-1-richard.henderson@linaro.org>
 <20210725122416.1391332-8-richard.henderson@linaro.org>
 <ddbabd5d-9dba-6f3e-b0b2-d770730fa427@amsat.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=63.228.1.57;
 envelope-from=benh@kernel.crashing.org; helo=gate.crashing.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, T_SPF_HELO_PERMERROR=0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 2021-07-25 at 23:27 +0200, Philippe Mathieu-Daudé wrote:
> +Cédric/Benjamin
> 
> On 7/25/21 2:24 PM, Richard Henderson wrote:
> > From clang-13:
> > hw/pci-host/pnv_phb4.c:375:18: error: variable 'v' set but not used
> > \
> >     [-Werror,-Wunused-but-set-variable]
> > 
> > It's pretty clear that we meant to write back 'v' after
> > all that computation and not 'val'.
> > 
> 
> Fixes: 4f9924c4d4c ("ppc/pnv: Add models for POWER9 PHB4 PCIe Host
> bridge")

Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

> 
> > Acked-by: David Gibson <david@gibson.dropbear.id.au>
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  hw/pci-host/pnv_phb4.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> > index 54f57c660a..5c375a9f28 100644
> > --- a/hw/pci-host/pnv_phb4.c
> > +++ b/hw/pci-host/pnv_phb4.c
> > @@ -392,7 +392,7 @@ static void pnv_phb4_ioda_write(PnvPHB4 *phb,
> > uint64_t val)
> >              v &= 0xffffffffffff0000ull;
> >              v |= 0x000000000000cfffull & val;
> >          }
> > -        *tptr = val;
> > +        *tptr = v;
> >          break;
> >      }
> >      case IODA3_TBL_MBT:
> > 


