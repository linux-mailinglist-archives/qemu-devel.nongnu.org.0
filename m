Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B11321478
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 11:52:47 +0100 (CET)
Received: from localhost ([::1]:46726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE8pa-0001P5-CY
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 05:52:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lE8o6-0000EM-Ic
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 05:51:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lE8o4-0004lq-Je
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 05:51:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613991071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Dvmm0Yo1fK/A9gmEGMYvqTA8glRcRfbUDMXtyeaxGdw=;
 b=bodf7NQFP81nLj1VZ1XiqDId1iDxUBwKYPpse/BPkmS2PrYig9jGuKl63Vf9dKZlN9+FN5
 wRwfJjOJUjkQFENmEstSflToPcTF34KK8AvlLzKnumNDZ6Gq29+CWc8araCpukr0oqzPo6
 rC3V96CXkNUU3MO54koJmNl36Z52200=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-JRwzGkC6Ndq5KZHDLJJVcQ-1; Mon, 22 Feb 2021 05:51:09 -0500
X-MC-Unique: JRwzGkC6Ndq5KZHDLJJVcQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76B8F80196E;
 Mon, 22 Feb 2021 10:51:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 52E301346F;
 Mon, 22 Feb 2021 10:51:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B46661800399; Mon, 22 Feb 2021 11:51:00 +0100 (CET)
Date: Mon, 22 Feb 2021 11:51:00 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v2] ui/console: Pass placeholder surface to displays
Message-ID: <20210222105100.idqhislns33etne7@sirius.home.kraxel.org>
References: <20210219144848.wy7wmel4lixaqkyb@sirius.home.kraxel.org>
 <20210220113810.78371-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210220113810.78371-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

>  #define QEMU_ALLOCATED_FLAG     0x01
> +#define QEMU_PLACEHOLDER_FLAG   0x02

> +static inline int is_placeholder(DisplaySurface *surface)
> +{
> +    return surface->flags & QEMU_PLACEHOLDER_FLAG;
> +}

Interesting idea.  That approach makes sense too.

> +        if (!placeholder) {
> +            placeholder = qemu_create_message_surface(640, 480, placeholder_msg);
> +            placeholder->flags |= QEMU_PLACEHOLDER_FLAG;

I think we should set the placeholder flag in
qemu_create_message_surface() because every surface created with that
function is some kind if placeholder.

Also when replacing an existing surface we should make the placeholder
the same size, to avoid pointless ui window resizes.

> -    if (!new_surface) {
> +    if (is_placeholder(new_surface)) {

We should check whenever this is the primary or a secondary window here
and only destroy secondary windows.  qemu hiding all windows but
continuing to run has great potential for user confusion ...

> -    if (!new_surface) {
> +    if (is_placeholder(new_surface)) {

Same here.

take care,
  Gerd


