Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBC536F85B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:15:19 +0200 (CEST)
Received: from localhost ([::1]:49390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQB4-0001bs-3E
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcQ9Y-00014V-U0
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:13:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcQ9W-0005sG-3G
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:13:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619777620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A5OE50+JvBviOwFkKuzFVBRMdRAVcs+QQxSwv7BNZL8=;
 b=Z2BT9jvbkvZ9kUhkiozWzP1ufqalOC7lxw0Q9D4w4HlM/KIYOfyUrbkLVg1WjqA3uxdGeR
 q2qGRFUrWXjceJSFC/pxuzBdUrarmUHPicLaDxb+U2B3Brt/0+EoKZoa+v/jeyI1WfXH6N
 Vh0tUeUdPbJqW74sDmMwPtkxCBCWp/k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-q0S2YrciNMGmJTOPtasytA-1; Fri, 30 Apr 2021 06:13:38 -0400
X-MC-Unique: q0S2YrciNMGmJTOPtasytA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DA1718397E6;
 Fri, 30 Apr 2021 10:13:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 178845D9D5;
 Fri, 30 Apr 2021 10:13:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 735991800380; Fri, 30 Apr 2021 12:13:32 +0200 (CEST)
Date: Fri, 30 Apr 2021 12:13:32 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Subject: Re: [RFC PATCH 13/27] virtio-snd: Add VIRTIO_SND_R_JACK_INFO handler
Message-ID: <20210430101332.aywzdoarkkg34m3v@sirius.home.kraxel.org>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
 <20210429120445.694420-14-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210429120445.694420-14-chouhan.shreyansh2702@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> +    virtio_snd_query_info req;
> +    size_t sz = iov_to_buf(elem->out_sg, elem->out_num, 0, &req, sizeof(req));
> +    assert(sz == sizeof(virtio_snd_query_info));

This assert looks like the guest can trigger it by sending broken
messages.  This should be avoided, the guest should not be able to
kill qemu that way.

> +        jack_info[i - req.start_id].hdr.hda_fn_nid = jack->hda_fn_nid;
> +        jack_info[i - req.start_id].features = jack->features;
> +        jack_info[i - req.start_id].hda_reg_defconf = jack->hda_reg_defconf;
> +        jack_info[i - req.start_id].hda_reg_caps = jack->hda_reg_caps;
> +        jack_info[i - req.start_id].connected = jack->connected;

Disclaimer: didn't check the structs.

If any of these fields is larger than a byte you need to take care of
byte ordering here.  virtio is little endian, so cpu_to_le{16,32}() will
do the job here (if needed).

Same thing elsewhere I suspect.

>          } else if (ctrl.code == VIRTIO_SND_R_JACK_INFO) {
> -            virtio_snd_log("VIRTIO_SND_R_JACK_INFO");
> +            sz = virtio_snd_handle_jack_info(s, elem);
> +            goto done;

Ah, you add the actual command handing here.  Hmm.  I guess a tracepoint
in virtio_snd_handle_jack_info() would be good for debugging.  You could
also log the jack id then.

Also: I'd suggest using "switch(ctrl.code)" here.  Is more readable than
else-if chains (personal opinion though).  Also has the advantage that
gcc will warn in case you forget to handle one of the enums in the
switch.

take care,
  Gerd


