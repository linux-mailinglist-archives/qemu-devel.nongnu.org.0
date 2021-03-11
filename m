Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D90F1336D3A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 08:45:47 +0100 (CET)
Received: from localhost ([::1]:48044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKG0w-00012f-CO
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 02:45:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKFzG-0000EQ-Mf
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 02:44:02 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:58329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKFzE-0001om-Sw
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 02:44:02 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.170])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 082948EC50D5;
 Thu, 11 Mar 2021 08:43:46 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 11 Mar
 2021 08:43:45 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G00454e3e928-539b-4daf-936e-a29cd609bbb6,
 58A3AAFCCF725AA0952C8F912993319916779E2B) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 11 Mar 2021 08:43:44 +0100
From: Greg Kurz <groug@kaod.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 8/9] hw/9pfs/9p-synth: Replaced qemu_mutex_lock with
 QEMU_LOCK_GUARD
Message-ID: <20210311084344.68a99bc3@bahia.lan>
In-Reply-To: <20210311031538.5325-9-ma.mandourr@gmail.com>
References: <20210311031538.5325-1-ma.mandourr@gmail.com>
 <20210311031538.5325-9-ma.mandourr@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 464b48d2-c568-43c8-a903-700766e6d962
X-Ovh-Tracer-Id: 14569426270663055837
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudduledguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhupghoshhssegtrhhuuggvsgihthgvrdgtohhm
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Mar 2021 05:15:37 +0200
Mahmoud Mandour <ma.mandourr@gmail.com> wrote:

> Replaced a call to qemu_mutex_lock and its respective call to
> qemu_mutex_unlock and used QEMU_LOCK_GUARD macro in their place.
> This simplifies the code by removing the call required to unlock
> and also eliminates goto paths.
> 
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---

Nice cleanup. Thanks !

Acked-by: Greg Kurz <groug@kaod.org>

>  hw/9pfs/9p-synth.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
> index 7eb210ffa8..473ef914b0 100644
> --- a/hw/9pfs/9p-synth.c
> +++ b/hw/9pfs/9p-synth.c
> @@ -79,11 +79,11 @@ int qemu_v9fs_synth_mkdir(V9fsSynthNode *parent, int mode,
>      if (!parent) {
>          parent = &synth_root;
>      }
> -    qemu_mutex_lock(&synth_mutex);
> +    QEMU_LOCK_GUARD(&synth_mutex);
>      QLIST_FOREACH(tmp, &parent->child, sibling) {
>          if (!strcmp(tmp->name, name)) {
>              ret = EEXIST;
> -            goto err_out;
> +            return ret;
>          }
>      }
>      /* Add the name */
> @@ -94,8 +94,6 @@ int qemu_v9fs_synth_mkdir(V9fsSynthNode *parent, int mode,
>                        node->attr, node->attr->inode);
>      *result = node;
>      ret = 0;
> -err_out:
> -    qemu_mutex_unlock(&synth_mutex);
>      return ret;
>  }
>  
> @@ -116,11 +114,11 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode *parent, int mode,
>          parent = &synth_root;
>      }
>  
> -    qemu_mutex_lock(&synth_mutex);
> +    QEMU_LOCK_GUARD(&synth_mutex);
>      QLIST_FOREACH(tmp, &parent->child, sibling) {
>          if (!strcmp(tmp->name, name)) {
>              ret = EEXIST;
> -            goto err_out;
> +            return ret;
>          }
>      }
>      /* Add file type and remove write bits */
> @@ -136,8 +134,6 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode *parent, int mode,
>      pstrcpy(node->name, sizeof(node->name), name);
>      QLIST_INSERT_HEAD_RCU(&parent->child, node, sibling);
>      ret = 0;
> -err_out:
> -    qemu_mutex_unlock(&synth_mutex);
>      return ret;
>  }
>  


