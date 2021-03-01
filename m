Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9932432811C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 15:42:12 +0100 (CET)
Received: from localhost ([::1]:57712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGjkR-0002ey-LL
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 09:42:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lGjJY-0005B8-9f; Mon, 01 Mar 2021 09:14:28 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:53679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lGjJS-0000te-1Q; Mon, 01 Mar 2021 09:14:24 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.58])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 1252E92C203D;
 Mon,  1 Mar 2021 15:14:13 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 1 Mar 2021
 15:14:12 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005416610b5-93ef-4e4c-aec2-6bce2c16a77a,
 479CA1392526D135F52AAC0E93683906E8F354F3) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Mon, 1 Mar 2021 15:14:11 +0100
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 3/5] spapr.c: add 'unplug already in progress' message
 for PHB unplug
Message-ID: <20210301151411.3adaa9d3@bahia.lan>
In-Reply-To: <20210226163301.419727-4-danielhb413@gmail.com>
References: <20210226163301.419727-1-danielhb413@gmail.com>
 <20210226163301.419727-4-danielhb413@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 8efefa4a-1912-40b9-9822-a0ca6f6905c5
X-Ovh-Tracer-Id: 17776833631729129952
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrleekgdeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 26 Feb 2021 13:32:59 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> Both CPU hotunplug and PC_DIMM unplug reports an user warning,
> mentioning that the hotunplug is in progress, if consecutive
> 'device_del' are issued in quick succession.
> 
> Do the same for PHBs in spapr_phb_unplug_request().
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 149dc2113f..6ef72ee7bd 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4030,6 +4030,10 @@ static void spapr_phb_unplug_request(HotplugHandler *hotplug_dev,
>      if (!spapr_drc_unplug_requested(drc)) {
>          spapr_drc_unplug_request(drc);
>          spapr_hotplug_req_remove_by_index(drc);
> +    } else {
> +        error_setg(errp,
> +                   "PCI Host Bridge unplug already in progress for device %s",
> +                   dev->id);
>      }
>  }
>  


