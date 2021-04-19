Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 474BD364CB7
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 23:02:22 +0200 (CEST)
Received: from localhost ([::1]:37896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYb2D-0006MF-2H
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 17:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lYa3x-0007JP-Nk
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:00:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lYa3u-0001cP-Uu
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:00:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618862401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ut2RNpWs+JrFuqbsXvPjtk/a2CcslYKBYD0MumwQSuw=;
 b=gfE1eCHtfjf3LhDCBytxgr1JQYdmiKz0Is8G6eR3vtb2UUrfsEDefwL05K5JJ6aBfFFmpo
 HLVJfaOb1SCNYxkWm8Z+glrBO8eNp3sCdI1p+2qV8du2zY11D/tsaJGLBGVRKSfxpab2Pl
 2OeQD36KlBGiP1zHreK5dWf/L3tfqM4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-YPyrc67UONWn2IAJjs74Ag-1; Mon, 19 Apr 2021 15:59:59 -0400
X-MC-Unique: YPyrc67UONWn2IAJjs74Ag-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B9789F931;
 Mon, 19 Apr 2021 19:59:58 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-35.rdu2.redhat.com [10.10.116.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16D885C1CF;
 Mon, 19 Apr 2021 19:59:50 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 9ED3B22054F; Mon, 19 Apr 2021 15:59:49 -0400 (EDT)
Date: Mon, 19 Apr 2021 15:59:49 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: [Virtio-fs] [PATCH 2/2] virtiofsd: Add help for -o xattr-mapping
Message-ID: <20210419195949.GF1472665@redhat.com>
References: <20210414201207.3612432-3-jose.carlos.venegas.munoz@intel.com>
 <CANRX0ORJA43.22ADKWIJW7DI0@redhat>
 <20210419190753.GE1472665@redhat.com>
 <81c49957-0287-37f9-e310-5f9f21d03062@redhat.com>
MIME-Version: 1.0
In-Reply-To: <81c49957-0287-37f9-e310-5f9f21d03062@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: virtio-fs@redhat.com, Carlos Venegas <jose.carlos.venegas.munoz@intel.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 19, 2021 at 02:21:11PM -0500, Connor Kuehl wrote:
> On 4/19/21 2:07 PM, Vivek Goyal wrote:
> >> This is a helpful note, but it doesn't tell the whole story. I think
> >> it'd be helpful to add one last note to this option which is to
> >> recommend reading the virtiofsd(1) man-page for more information on
> >> xattrmap rules.
> > 
> > Is there a virtiofsd man page as well? All I see is
> > docs/tools/virtiofsd.rst.
> 
> Yes, it's generated from that file. Should be located in
> qemu/build/docs/virtiofsd.1 after building QEMU.

Ok thanks. I guess that gets build only if I pass option --enable-docs. 

Thanks
Vivek


