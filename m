Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC65F338A8A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:49:18 +0100 (CET)
Received: from localhost ([::1]:60222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKfM5-00005x-Lt
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:49:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKfHX-00044t-Gy
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:44:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKfHV-0003Vh-0A
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:44:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615545871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bSbKkaZs1nOFcr+qd/GhcNxTv296tjvinrJu55ddgxI=;
 b=JnyuQoIuPd8ieSwVJMfL62qaDHtGoXbQIYD0AfNfiDdXhZAE69ZnuFqRj2XbVoIwtRpMRx
 fra4wOMSQKAQWmsAdv9bdo+Rp/r3ORKo5aQRBrg8Q/MyYEbw8+bEGeKe8jgGybnqlrNQi7
 jHNFjkQam9SDGAD0MK+9pdJf7SwbIAA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-9wKkD0XJNpyse3CQWmfa0Q-1; Fri, 12 Mar 2021 05:44:30 -0500
X-MC-Unique: 9wKkD0XJNpyse3CQWmfa0Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 258D91932483
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 10:44:29 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-83.ams2.redhat.com [10.36.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED9CE1002388;
 Fri, 12 Mar 2021 10:44:27 +0000 (UTC)
Subject: Re: [PATCH] tests: remove "make check-speed" in favor of "make bench"
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210310164612.285362-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <97cfa6b7-2941-959b-c354-5efd67f91679@redhat.com>
Date: Fri, 12 Mar 2021 11:44:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210310164612.285362-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: wrampazz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/03/2021 17.46, Paolo Bonzini wrote:
> "make check-speed" has been broken since the removal of ninja2make
> last October.  It was just a backwards-compatibility alias for
> "make bench-speed", which in turn is in principle a subset of
> "make bench".  Advertise the latter and drop "make check-speed"
> completely since no one has noticed.
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Supersedes: <20210310094936.1318317-1-thuth@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   tests/Makefile.include | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)

Thanks, queued to my testing-next branch now:

  https://gitlab.com/thuth/qemu/-/commits/testing-next/

  Thomas


