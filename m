Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 971F42AFB9B
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 00:08:22 +0100 (CET)
Received: from localhost ([::1]:47424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kczDx-00074S-3U
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 18:08:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1kcz9P-0006Fh-KR
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 18:03:44 -0500
Received: from relay.felk.cvut.cz ([2001:718:2:1611:0:1:0:70]:35612)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pisa@cmp.felk.cvut.cz>) id 1kcz9L-0007Lz-LW
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 18:03:39 -0500
Received: from cmp.felk.cvut.cz (haar.felk.cvut.cz [147.32.84.19])
 by relay.felk.cvut.cz (8.15.2/8.15.2) with ESMTP id 0ABN22Hm059456;
 Thu, 12 Nov 2020 00:02:02 +0100 (CET)
 (envelope-from pisa@cmp.felk.cvut.cz)
Received: from haar.felk.cvut.cz (localhost [127.0.0.1])
 by cmp.felk.cvut.cz (8.14.0/8.12.3/SuSE Linux 0.6) with ESMTP id
 0ABN22s6020480; Thu, 12 Nov 2020 00:02:02 +0100
Received: (from pisa@localhost)
 by haar.felk.cvut.cz (8.14.0/8.13.7/Submit) id 0ABN21O7020479;
 Thu, 12 Nov 2020 00:02:01 +0100
X-Authentication-Warning: haar.felk.cvut.cz: pisa set sender to
 pisa@cmp.felk.cvut.cz using -f
From: Pavel Pisa <pisa@cmp.felk.cvut.cz>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2 08/12] can_host: Use class properties
Date: Thu, 12 Nov 2020 00:02:01 +0100
User-Agent: KMail/1.9.10
References: <20201111183823.283752-1-ehabkost@redhat.com>
 <20201111183823.283752-9-ehabkost@redhat.com>
In-Reply-To: <20201111183823.283752-9-ehabkost@redhat.com>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <202011120002.01584.pisa@cmp.felk.cvut.cz>
X-FELK-MailScanner-Information: 
X-MailScanner-ID: 0ABN22Hm059456
X-FELK-MailScanner: Found to be clean
X-FELK-MailScanner-SpamCheck: not spam, SpamAssassin (not cached,
 score=-0.099, required 6, BAYES_00 -0.50, KHOP_HELO_FCRDNS 0.40,
 NICE_REPLY_A -0.00, SPF_HELO_NONE 0.00, SPF_NONE 0.00)
X-FELK-MailScanner-From: pisa@cmp.felk.cvut.cz
X-FELK-MailScanner-Watermark: 1605740544.87274@tjUu56IAl0hocFSNJouRWQ
Received-SPF: none client-ip=2001:718:2:1611:0:1:0:70;
 envelope-from=pisa@cmp.felk.cvut.cz; helo=relay.felk.cvut.cz
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 18:03:30
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vikram Garhwal <fnu.vikram@xilinx.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Ondrej Ille <ondrej.ille@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Eduardo,

thanks for contribution.

On Wednesday 11 of November 2020 19:38:19 Eduardo Habkost wrote:
> Instance properties make introspection hard and are not shown by
> "-object ...,help".  Convert them to class properties.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> This was originally submitted as part of the series:
> Subject: [PATCH 00/12] qom: Make all -object types use only class
> properties Message-Id: <20201009160122.1662082-1-ehabkost@redhat.com>
> https://lore.kernel.org/qemu-devel/20201009160122.1662082-1-ehabkost@redhat
>.com ---
> Cc: Pavel Pisa <pisa@cmp.felk.cvut.cz>
> Cc: Vikram Garhwal <fnu.vikram@xilinx.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: qemu-devel@nongnu.org
> ---
>  net/can/can_host.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
>
> diff --git a/net/can/can_host.c b/net/can/can_host.c
> index be4547d913..bec88b9620 100644
> --- a/net/can/can_host.c
> +++ b/net/can/can_host.c
> @@ -72,21 +72,16 @@ static void can_host_complete(UserCreatable *uc, Error
> **errp) can_host_connect(CAN_HOST(uc), errp);
>  }
>
> -static void can_host_instance_init(Object *obj)
> -{
> -    CanHostState *ch = CAN_HOST(obj);
> -
> -    object_property_add_link(obj, "canbus", TYPE_CAN_BUS,
> -                             (Object **)&ch->bus,
> -                             object_property_allow_set_link,
> -                             OBJ_PROP_LINK_STRONG);
> -}
> -
>  static void can_host_class_init(ObjectClass *klass,
>                                  void *class_data G_GNUC_UNUSED)
>  {
>      UserCreatableClass *uc_klass = USER_CREATABLE_CLASS(klass);
>
> +    object_class_property_add_link(klass, "canbus", TYPE_CAN_BUS,
> +                                   offsetof(CanHostState, bus),
> +                                   object_property_allow_set_link,
> +                                   OBJ_PROP_LINK_STRONG);
> +
>      klass->unparent = can_host_unparent;
>      uc_klass->complete = can_host_complete;
>  }
> @@ -97,7 +92,6 @@ static const TypeInfo can_host_info = {
>      .instance_size = sizeof(CanHostState),
>      .class_size = sizeof(CanHostClass),
>      .abstract = true,
> -    .instance_init = can_host_instance_init,
>      .class_init = can_host_class_init,
>      .interfaces = (InterfaceInfo[]) {
>          { TYPE_USER_CREATABLE },

I have rerun successfully my basic test (1x SJA1000 CAN FD tolerant, 2x CTU 
CAN FD and 1x host interface) based on actual updated sources
with Peter Maydell coverity fixes. You can add my

Tested-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>

I cannot confirm that this is the right direction because I do not have
knowledge about long term intentions of core developers. But change
and description look good.

Somebody with a commit rights need to push patch to the mainline direction.

Best wishes,

Pavel Pisa

