Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8762243E62E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 18:34:59 +0200 (CEST)
Received: from localhost ([::1]:53804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg8Mk-0005mm-Fd
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 12:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mg7ur-0006Wb-Dj
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:06:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mg7um-0005lG-PM
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:06:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635437163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FMERGUqeUt52ebxAYURvgr1Oy33Urr8xeGzPmQoPvNY=;
 b=A+tR07WevAQACgvM1T+FWqeLJsJmAQvX4zZ/Ck2VdV83or3zX49NdVp4Kx2e/uukDqZRPl
 fOyjRusLYM15HVS5x6HLIDfVoTqC7BCxwznWlbu2YSKrfeJzgD2UhzDs7f7XtPwLGNyivH
 vxZSIhtoploj4DyLBxeefMIgWtP5HxQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-ojGgFHoKMBuufPOLl2sxUg-1; Thu, 28 Oct 2021 12:06:02 -0400
X-MC-Unique: ojGgFHoKMBuufPOLl2sxUg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 370161018F60
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 16:06:01 +0000 (UTC)
Received: from thuth.remote.csb (unknown [10.39.193.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3089F26DC4;
 Thu, 28 Oct 2021 16:05:51 +0000 (UTC)
Subject: Re: [PATCH 1/2] meson: bump submodule to 0.59.3
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211028142826.57327-1-pbonzini@redhat.com>
 <20211028142826.57327-2-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <82dda139-9811-7fc8-0dcf-07a7508a7945@redhat.com>
Date: Thu, 28 Oct 2021 18:05:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211028142826.57327-2-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/10/2021 16.28, Paolo Bonzini wrote:
> This gains some bugfixes, especially:
> 
> - it fixes the introspection of array options.  While technically we
> still support Meson 0.58.2, this issue only appears when adding a new
> option and not if the user is just building QEMU.  In the relatively
> rare case of a contributor using --meson to point to a 0.58 version,
> review can catch spurious changes to scripts/meson-buildoptions.sh
> easily.
> 
> - it fixes "meson test" when it is not the process group leader.  Make is
> the process group leader when "make check" invokes "meson test", so this
> is a requirement for using it as a test harness.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure                     |  2 +-
>   meson                         |  2 +-
>   scripts/meson-buildoptions.py | 16 ----------------
>   3 files changed, 2 insertions(+), 18 deletions(-)

Seems to work:

Tested-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>


