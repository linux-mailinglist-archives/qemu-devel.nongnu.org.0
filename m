Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 912DAFDDB0
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 13:26:30 +0100 (CET)
Received: from localhost ([::1]:38276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVagH-0004vQ-Jb
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 07:26:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44163)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iVaez-0003s1-VO
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 07:25:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iVaez-0007tC-09
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 07:25:09 -0500
Received: from 10.mo173.mail-out.ovh.net ([46.105.74.148]:44852)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iVaey-0007se-QE
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 07:25:08 -0500
Received: from player746.ha.ovh.net (unknown [10.108.42.82])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 1254E1224FC
 for <qemu-devel@nongnu.org>; Fri, 15 Nov 2019 13:25:06 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player746.ha.ovh.net (Postfix) with ESMTPSA id 6183CC3DB2F8;
 Fri, 15 Nov 2019 12:25:02 +0000 (UTC)
Subject: Re: [PATCH for-5.0 8/8] ppc/pnv: Link "chip" property to
 PnvXive::chip pointer
To: Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
References: <157381880498.136087.3775284829737989585.stgit@bahia.lan>
 <157381884958.136087.2386559512465741955.stgit@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d13e444c-78b0-bb7b-09db-088f63fcfbe9@kaod.org>
Date: Fri, 15 Nov 2019 13:25:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <157381884958.136087.2386559512465741955.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 11034382039767878483
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudefhedggedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejgeeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedu
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.74.148
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index 5ecd3ba6ed24..d82484ecf669 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -87,9 +87,9 @@ typedef struct Pnv8Chip {
>  typedef struct Pnv9Chip {
>      /*< private >*/
>      PnvChip      parent_obj;
> +    PnvXive      xive;
>  
>      /*< public >*/
> -    PnvXive      xive;
>      Pnv9Psi      psi;
>      PnvLpcController lpc;
>      PnvOCC       occ;
> 

Why this change ? 

C.

