Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3F03F3602
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 23:28:51 +0200 (CEST)
Received: from localhost ([::1]:47986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHC4H-0006m9-TT
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 17:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mHC0I-0002Mu-Fz
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 17:24:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mHC0E-00025w-OU
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 17:24:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629494674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q4JHg6ZwNcffjYlSgxhRPIcBH/2ytJ99v9AvGZ50c6Y=;
 b=By+0hE+SRmBApJhY3SqyTPooIJRK9xhnUgzetme8ZJLgVoT/2sCTAgcliXqwngGyMKqJqM
 WTKqXQJ6ZoJ/Onp6S1325pTS/L9gMb/T2TceTJDBnqRVyJIQUCP2/YMPMZDE0EkqGiTVh7
 VQkq3MekFvunADSTEZxbsnfBRZ8chVg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-22QpCTEhOSij2Q5DXGG8Pw-1; Fri, 20 Aug 2021 17:24:29 -0400
X-MC-Unique: 22QpCTEhOSij2Q5DXGG8Pw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87BBE93921
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 21:24:28 +0000 (UTC)
Received: from redhat.com (ovpn-113-99.phx2.redhat.com [10.3.113.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 789D81A26A;
 Fri, 20 Aug 2021 21:24:24 +0000 (UTC)
Date: Fri, 20 Aug 2021 16:24:22 -0500
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [qemu-web PATCH] Add a blog post about FUSE block exports
Message-ID: <20210820212422.z6hfoghubmd7pzzl@redhat.com>
References: <20210819102501.69638-1-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210819102501.69638-1-hreitz@redhat.com>
User-Agent: NeoMutt/20210205-733-8f834e
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 19, 2021 at 12:25:01PM +0200, Hanna Reitz wrote:
> This post explains when FUSE block exports are useful, how they work,
> and that it is fun to export an image file on its own path so it looks
> like your image file (in whatever format it was) is a raw image now.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
> You can also find this patch here:
> https://gitlab.com/hreitz/qemu-web fuse-blkexport-v1
> 
> My first patch to qemu-web, so I hope I am not doing anything overly
> stupid here (adding SVGs with extremely long lines comes to mind)...
> ---
...
> +
> +Besides attaching guest devices to block nodes, you can also export them for
> +users outside of qemu, for example via NBD.  Say you have a QMP channel open for
> +the QEMU instance above, then you could do this:
> +```json
> +{
> +    "execute": "nbd-server-start",
> +    "arguments": {
> +        "addr": {
> +            "type": "inet",
> +            "data": {
> +                "host": "localhost",
> +                "port": "10809"
> +            }
> +        }
> +    }
> +}

Rather than using a TCP port, is it worth mentioning that you can use
a Unix socket?  If the point of this is local access to the disk
contents, that feels a bit lighter weight.

> +{
> +    "execute": "block-export-add",
> +    "arguments": {
> +        "type": "nbd",
> +        "id": "fmt-node-export",
> +        "node-name": "fmt-node",
> +        "name": "guest-disk"
> +    }

This defaults to a readonly image; you may want to include
"writable":true in the JSON, especially if the purpose is to show how
to modify guest-visible contents of an at-rest disk image.

> +}
> +```
> +
> +This opens an NBD server on `localhost:10809`, which exports *fmt-node* (under
> +the NBD export name *guest-disk*).  The block graph looks as follows:
> +
> +|![Same block graph as fig. 3, but with an NBD server attached to fmt-node](/screenshots/2021-08-18-block-graph-b.svg)|
> +|:--:|
> +|*Fig. 4: Block graph extended by an NBD server*|
> +
> +NBD clients connecting to this server will see the raw disk as seen by the
> +guest – we have *exported* the guest disk:
> +
> +```
> +$ qemu-img info nbd://localhost/guest-disk
> +image: nbd://localhost:10809/guest-disk
> +file format: raw
> +virtual size: 20 GiB (21474836480 bytes)
> +disk size: unavailable
> +```

If you do choose to rewrite to use a Unix socket, it would change this
to nbd+unix:///guest-disk?socket=/path/to/sock.

> +
> +### QEMU storage daemon
> +
> +If you are not running a guest, and so do not need guest devices, but all you
> +want is to use the QEMU block layer (for example to interpret the qcow2 format)
> +and export nodes from the block graph, then you can use the more lightweight
> +QEMU storage daemon instead of a full-blown QEMU process:
> +
> +```
> +$ qemu-storage-daemon \
> +    --blockdev node-name=prot-node,driver=file,filename=$image_path \
> +    --blockdev node-name=fmt-node,driver=qcow2,file=prot-node \
> +    --nbd-server addr.type=inet,addr.host=localhost,addr.port=10809 \
> +    --export type=nbd,id=fmt-node-export,node-name=fmt-node,name=guest-disk
> +```

And if you favor Unix sockets, you'd want to do it for q-s-d as well.
Okay, keeping it as TCP is easy enough (or maybe just a mention that
Unix sockets can be used, while giving a pointer to other
documentation for the interested reader).

> +
> +## Conclusion
> +
> +As shown in this blog post, FUSE block exports are a relatively simple way to
> +access images in any format understood by QEMU as if they were raw images.
> +Any tool that can manipulate raw disk images can thus manipulate images in any
> +format, simply by having the QEMU storage daemon provide a translation layer.
> +By mounting the FUSE export on the original image path, this translation layer
> +will effectively be invisible, and the original image will look like it is in
> +raw format, so it can directly be accessed by those tools.
> +
> +The current main disadvantage of FUSE exports is that they offer relatively bad
> +performance.  That should be fine as long as your use case is just light
> +manipulation of some VM images, like manually modifying some files on them.
> +However, we did not yet really try to optimize performance, so if more serious
> +use cases appear that would require better performance, we can try.

Overall a nice post!  I hope my comments help in addition to all the
other good reviews you got.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


