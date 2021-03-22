Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9800A343820
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 06:05:54 +0100 (CET)
Received: from localhost ([::1]:43770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOClD-0008VT-Gy
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 01:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lOCiL-0007i4-K1
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 01:02:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lOCiC-0006mX-9I
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 01:02:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616389362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V2K5r2CXvbaymNlSh1dl3at0NWxqXqZKU79JmXtmBL8=;
 b=LxzKD3h2vApNxFrJ2sbRZt7HWpxwwI7RuoAqywUBcB5fxT+b04rmRcByx6LE1P0By50dOe
 nPsscH9mjx1fb6DC3W2+viZk8fAeibs9drSH1NqvKcYCE79h2/AW+2ZB5ih/K9IoizvzTJ
 ibP3uy96ruLIn5n3fH2fSDyuj7Ozcd8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-8TRk2E2KMWSzqd9vgwbSrg-1; Mon, 22 Mar 2021 01:02:38 -0400
X-MC-Unique: 8TRk2E2KMWSzqd9vgwbSrg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABD848A2A08;
 Mon, 22 Mar 2021 05:02:37 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-79.ams2.redhat.com [10.36.112.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8774F1F7;
 Mon, 22 Mar 2021 05:02:36 +0000 (UTC)
Subject: Re: [PULL 0/8] Misc bugfixes for QEMU soft freeze
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210319143924.2173798-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <76ea5ddb-fc93-c9bf-df87-9d89e92b7d79@redhat.com>
Date: Mon, 22 Mar 2021 06:02:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210319143924.2173798-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/03/2021 15.39, Paolo Bonzini wrote:
> The following changes since commit cf6b56d4f2107259f52413f979a1d474dad0c1e1:
> 
>    Merge remote-tracking branch 'remotes/philmd/tags/pflash-20210318' into staging (2021-03-18 23:04:41 +0000)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to af05ffffd7fa28010d4df9f5744514b16e71055d:
> 
>    tests/qtest: cleanup the testcase for bug 1878642 (2021-03-19 10:37:46 -0400)
> 
> ----------------------------------------------------------------
> * fixes for i386 TCG paging
> * fixes for Hyper-V enlightenments
> * avoid uninitialized variable warning
> 
> ----------------------------------------------------------------
> Paolo Bonzini (5):
>        qom: use qemu_printf to print help for user-creatable objects

The qemu_printf patch that hit the master branch looks very funny. I think 
it should get reverted since that header file now gets included twice there?

  Thomas


