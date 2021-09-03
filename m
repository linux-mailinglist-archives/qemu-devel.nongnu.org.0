Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F6940042C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 19:31:16 +0200 (CEST)
Received: from localhost ([::1]:37122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMD23-0006Xv-1h
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 13:31:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mMD0M-0005ik-Pp
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:29:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mMD0L-0003yh-FI
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:29:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630690168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bQT36m2jXio/3hrd6OIBMX0lfnIDJH/r+ypGErdh8V8=;
 b=Lj4xnNzotrErovpEztXwV74tQUX8pBT1l8xo1USE3sktDi1lmOyXHRrISTlfkJsk19s/uc
 p/VR+1usBkW+iAshrC8PdazfPEAJrSubOWlzTexDqSjj1GoDO94j1b+Cvy++qErPRT2L2j
 EYKh19ddTQSJOMgFtreF9cscEGsvOh0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-fw7ijCtCNJKBUyPvZ3VQnw-1; Fri, 03 Sep 2021 13:29:26 -0400
X-MC-Unique: fw7ijCtCNJKBUyPvZ3VQnw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F15531006C91;
 Fri,  3 Sep 2021 17:29:24 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.phx2.redhat.com [10.3.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FB7261093;
 Fri,  3 Sep 2021 17:29:18 +0000 (UTC)
Date: Fri, 3 Sep 2021 12:29:16 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2] iotests/check: move long options to double dash
Message-ID: <20210903172916.ggu4bcch27xs5v2x@redhat.com>
References: <20210903120039.41418-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210903120039.41418-1-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, eesposit@redhat.com, thuth@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, wainersm@redhat.com,
 f4bug@amsat.org, willianr@redhat.com, hreitz@redhat.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 03, 2021 at 03:00:39PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> So, the change:
> 
>   -makecheck -> --makecheck
>   -gdb       -> --gdb
>   -valgrind  -> --valgrind
>   -misalign  -> --misalign
>   -nocache   -> --nocache
>   -qcow2 (and other formats) -> --qcow2
>   -file (and other protocols) -> --file
> 
> Motivation:
> 
> 1. check scripts uses ArgumentParser to parse options, which supports
>    combining of short options. So using one dash for long options is a
>    bit ambiguous.
> 
> 2. Several long options are already have double dash:
>   --dry-run, --color, --groups, --exclude-groups, --start-from
> 
> 3. -misalign is used to add --misalign option (two dashes) to qemu-io
> 
> 4. qemu-io and qemu-nbd has --nocache option (two dashes)
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


