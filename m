Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 752CE341B46
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 12:18:21 +0100 (CET)
Received: from localhost ([::1]:40876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lND92-0006fU-Av
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 07:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lND7m-00067o-3M
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:17:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lND7h-0004Tq-KR
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616152615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Up9BXL0B0xC/RhxD5mhQ9fgFjaX6tUf//ev3yXAsbg8=;
 b=AupiHfFfjCmmdnb7y3MO4fPP0YqENhpOJuC2sJI7ItlbHgHJdX+7Y/xfadRKfCK3Praqkg
 az2XWr5lNO/8/HjezBYMC0NGsvGicTWcw0FFlUiTlR+O4c4ubS71nZp0FedDEeF3NJ2t6b
 xsTyu15VwB2LHOdKHJ3O+LGFcUVVdfo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-MjUipNRjP0igLT5CRxjY8Q-1; Fri, 19 Mar 2021 07:16:53 -0400
X-MC-Unique: MjUipNRjP0igLT5CRxjY8Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E21421052A17;
 Fri, 19 Mar 2021 11:16:52 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-49.ams2.redhat.com [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B2E960BF1;
 Fri, 19 Mar 2021 11:16:48 +0000 (UTC)
Subject: Re: [PATCH v2] docs/devel/testing.rst: Fix references to unit tests
To: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
References: <20210318174407.2299930-1-wainersm@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <ce26a5db-ab79-695d-9fec-36f1b186296b@redhat.com>
Date: Fri, 19 Mar 2021 12:16:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318174407.2299930-1-wainersm@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/03/2021 18.44, Wainer dos Santos Moschetta wrote:
> With the recent move of the unit tests to tests/unit directory some
> instructions under the "Unit tests" section became imprecise, which
> are fixed by this change.
> 
> Fixes: da668aa15b99 ("tests: Move unit tests into a separate directory")
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---

Thanks, queued to my testing-next branch:

  https://gitlab.com/thuth/qemu/-/commits/testing-next

  Thomas


