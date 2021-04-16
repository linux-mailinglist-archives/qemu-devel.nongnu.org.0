Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAB0361E69
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 13:07:13 +0200 (CEST)
Received: from localhost ([::1]:55250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXMJd-0001rb-1N
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 07:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lXMID-0001M2-DH
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 07:05:45 -0400
Received: from 1.mo52.mail-out.ovh.net ([178.32.96.117]:32874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lXMIA-0002hG-Q5
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 07:05:45 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.55])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 1E74C25A73E;
 Fri, 16 Apr 2021 13:05:39 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Apr
 2021 13:05:38 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002557004ef-56f0-4e47-92ee-abe4c59c47b1,
 138CDC1FF09234587CE5031F2EFAB81617CD6BEF) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Fri, 16 Apr 2021 13:05:37 +0200
From: Greg Kurz <groug@kaod.org>
To: Carlos Venegas <jose.carlos.venegas.munoz@intel.com>
Subject: Re: [Virtio-fs] [PATCH 1/2] virtiofsd: Allow use "-o xattrmap"
 without "-o xattr"
Message-ID: <20210416130537.2046bd26@bahia.lan>
In-Reply-To: <20210414201207.3612432-2-jose.carlos.venegas.munoz@intel.com>
References: <20210414201207.3612432-1-jose.carlos.venegas.munoz@intel.com>
 <20210414201207.3612432-2-jose.carlos.venegas.munoz@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: f56a448b-4039-49e0-abce-fd3d9dbc75be
X-Ovh-Tracer-Id: 8034984689266104800
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudelhedgfeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepvhhgohihrghlsehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=178.32.96.117; envelope-from=groug@kaod.org;
 helo=1.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 14 Apr 2021 20:12:06 +0000
Carlos Venegas <jose.carlos.venegas.munoz@intel.com> wrote:

> When -o xattrmap is used, it will not work unless xattr is enabled.
> 
> This patch enables xattr when -o xattrmap is used.
> 
> Signed-off-by: Carlos Venegas <jose.carlos.venegas.munoz@intel.com>
> ---
>  tools/virtiofsd/passthrough_ll.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index ddaf57305c..2337ea5a58 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -3939,6 +3939,7 @@ int main(int argc, char *argv[])
>      }
>  
>      if (lo.xattrmap) {
> +        lo.xattr = 1;
>          parse_xattrmap(&lo);
>      }
>  

This seems reasonable. I'm just wondering if we should also
add an explicit error if the user tries something silly
like -o xattrmap=MAPPING,no_xattr instead of silently
ignoring no_xattr...

