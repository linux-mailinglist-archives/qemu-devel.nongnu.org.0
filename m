Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E57328AE0
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 19:25:24 +0100 (CET)
Received: from localhost ([::1]:57024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGnER-0003ul-8G
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 13:25:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lGnDO-0003Pm-6n
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 13:24:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lGnDM-0005Cx-T5
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 13:24:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614623056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L6nyi6baZnJclcvugG4znTAhjKTjvMX/KH8adOqcjYA=;
 b=E60HsxgxMKa3JbFE22QVj/A6ynjOSceFIbsD3fdTWhC+3yE8yy+k7phZu2XXFUpYJFw2zL
 DyWn/5MZtsu2Y2pHN8n8fB/uTS5sl5BkKZdgmzLDwTX5RSFkqBaz21I5XVl8h9T4rHGwjy
 OwHm0YI4WvVJW6/yhAQLRG7mQIXsI6U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-gahbRKV4P1GFc59THxRcVw-1; Mon, 01 Mar 2021 13:24:12 -0500
X-MC-Unique: gahbRKV4P1GFc59THxRcVw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 464CC801965;
 Mon,  1 Mar 2021 18:24:11 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-165.ams2.redhat.com [10.36.114.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E7F560BD8;
 Mon,  1 Mar 2021 18:24:10 +0000 (UTC)
Date: Mon, 1 Mar 2021 19:24:08 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 0/2] storage-daemon: include current command line
 option in the errors
Message-ID: <20210301182408.GI7698@merkur.fritz.box>
References: <20210301152844.291799-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210301152844.291799-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 01.03.2021 um 16:28 hat Paolo Bonzini geschrieben:
> Use the location management facilities that the emulator uses, so that
> the current command line option appears in the error message.
> 
> Before:
> 
>   $ storage-daemon/qemu-storage-daemon --nbd key..=
>   qemu-storage-daemon: Invalid parameter 'key..'
> 
> After:
> 
>   $ storage-daemon/qemu-storage-daemon --nbd key..=
>   qemu-storage-daemon: --nbd key..=: Invalid parameter 'key..'
> 
> The first patch tweaks the command line parsing so that argv is
> not reordered by getopt_long and optind is only advanced by one
> option+argument on every call to getopt_long.  This is required
> by loc_set_cmdline.

Thanks, very useful to know about the "-" switch in getopts.

Applied to the block branch.

Kevin


