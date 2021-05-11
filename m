Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF8237A6C9
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 14:34:52 +0200 (CEST)
Received: from localhost ([::1]:48596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgRb9-0001ID-A4
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 08:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1lgRY9-0007vF-7p
 for qemu-devel@nongnu.org; Tue, 11 May 2021 08:31:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1lgRY1-0007jQ-RF
 for qemu-devel@nongnu.org; Tue, 11 May 2021 08:31:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620736287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BP9KHD+W1HIDDROuTRJrR9O7xFxTR83BEOhAgDnRXzk=;
 b=I7BC7ireE6cbQJ/KKqzy01yJS/fG8I6gwwRwP6MdDv4excJgMMGbVyfkDSjYNO/hl5bEM2
 RNNVXG24tRMY6oyvIcoAAek+L5sRRMSfcQ6vxBg5C/RmAeYvL5m+le4pDAPAK8p9gxnoQh
 TLFf+KGDB3A/8Wd0Yip+3PaXfHG1H+w=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-PvMHshB0M_uX0fzX39YFdQ-1; Tue, 11 May 2021 08:31:25 -0400
X-MC-Unique: PvMHshB0M_uX0fzX39YFdQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 d201-20020ae9efd20000b02902e9e9d8d9dcso14231213qkg.10
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BP9KHD+W1HIDDROuTRJrR9O7xFxTR83BEOhAgDnRXzk=;
 b=RplWqrkZvYYi3wZqSKmfBt+uqyV6zPgpRd5Bx3zM6c7wgLM7hB5bQMzX9ph/mXyn7d
 vRIdcFQ1t5xOlOAX05WJW9zxHRkqGZ1dx8+F8Nx0cNnZ+3fvIiE9EcL/Qt9AgMM6lrBg
 OYILNqnhPvSTTux2t3Tt3+/MN8ShLFHSRS8X/XyJrrXm3FUuZ2Bndj2FbYXaW/R6pn8V
 X6F4KCteK0/I1DHt+POhquiWMH/B2PmAsrHspk3S2YjylvrXJ0LCVfoCj514Kw36t8bZ
 Vzrez/7aXe8lw/W4039gXDBmNSnQj703WhS1A3ZX/y4zH6S2RAlcguzrSY6O8WETkVXn
 3Ydg==
X-Gm-Message-State: AOAM533dwFIuE9qRKH6j2nX6riPx6YkEwV1AUJEsEg2XKNL5xedgAgeJ
 Tc6g5S9RFKbwuppmzC0y/KTj4M8RJOzhCn2GpHAHDEJdkT8AHrxRs3CJtXcl7S80sBXRSg4Riwm
 XHa3uRf1ufRzhekwGILzIMb35tqG8NBM=
X-Received: by 2002:ac8:7f13:: with SMTP id f19mr1961246qtk.237.1620736285206; 
 Tue, 11 May 2021 05:31:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSg7riSENq1MAenapEWP79PIP+9MrQL8SnAYKC+cTw4sAkxGqMbcnp6TuzMOo5awgtHC7Y4XKudYMK9nsdgy0=
X-Received: by 2002:ac8:7f13:: with SMTP id f19mr1961226qtk.237.1620736285046; 
 Tue, 11 May 2021 05:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210510155539.998747-1-groug@kaod.org>
 <20210510155539.998747-4-groug@kaod.org>
In-Reply-To: <20210510155539.998747-4-groug@kaod.org>
From: Miklos Szeredi <mszeredi@redhat.com>
Date: Tue, 11 May 2021 14:31:14 +0200
Message-ID: <CAOssrKfbzCnpHma-=tTRvwUecy_9RtJADzMb_uQ1yzzJStz1PA@mail.gmail.com>
Subject: Re: [Virtio-fs] [for-6.1 v3 3/3] virtiofsd: Add support for
 FUSE_SYNCFS request
To: Greg Kurz <groug@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mszeredi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mszeredi@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: kvm@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>,
 Cornelia Huck <cohuck@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 virtio-fs-list <virtio-fs@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 10, 2021 at 5:55 PM Greg Kurz <groug@kaod.org> wrote:
>
> Honor the expected behavior of syncfs() to synchronously flush all data
> and metadata on linux systems. Simply loop on all known submounts and
> call syncfs() on them.

Why not pass the submount's root to the server, so it can do just one
targeted syncfs?

E.g. somehting like this in fuse_sync_fs():

args.nodeid = get_node_id(sb->s_root->d_inode);

Thanks,
Miklos


