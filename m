Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B051387A18
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 15:37:51 +0200 (CEST)
Received: from localhost ([::1]:42734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lizuw-0003dJ-Ij
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 09:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lizqq-0006oa-28
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:33:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lizqk-0001lg-4K
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:33:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621344806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kHVcUNCLmvDSRBqgdd3tu/82WnDKtGinqA5DD5BqtLk=;
 b=Yx1eS6ZniIkZfPuH+FtkET92ahIlAG7PnnpOTNg+Mu72HtqRRKyrkZ7ExcCnhyTWxA0JAE
 hqktXAT0gXcwAstKWc2VFAAhD09Ad8C/XMthbcWtdnJQIIRFMraS+mPwd7gtEmvR2ZLXIo
 sQ5eDd4m+Mj0NfgRULUDSQu+GX6kYhI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-vgX8m7FNNDusQplLoOSvHw-1; Tue, 18 May 2021 09:33:22 -0400
X-MC-Unique: vgX8m7FNNDusQplLoOSvHw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E908107ACE3
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 13:33:21 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4357060877;
 Tue, 18 May 2021 13:33:17 +0000 (UTC)
Subject: Re: [PATCH v2 0/6] Python: delint python library
To: qemu-devel@nongnu.org
References: <20210517184808.3562549-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <3a23553c-45cc-e2e2-36a1-5e8e1a8e7040@redhat.com>
Date: Tue, 18 May 2021 09:33:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517184808.3562549-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 2:48 PM, John Snow wrote:
> gitlab CI: https://gitlab.com/jsnow/qemu/-/pipelines/304224309
> branch: https://gitlab.com/jsnow/qemu/-/commits/python-package-pre-cleanup
> 
> This series serves as a pre-requisite for packaging the python series
> and getting the linters running via CI. The first patch fixes a linter
> error we've had for a while now; the subsequent ones fix a new warning
> that was recently added to pylint 2.8.x.
> 
> V2:
>   - iotest bits already handled, dropped here.
>   - Changed patch #3 based on feedback from Wainer.
> 
> John Snow (6):
>    python/console_socket: avoid one-letter variable
>    python/machine: use subprocess.DEVNULL instead of
>      open(os.path.devnull)
>    python/machine: use subprocess.run instead of subprocess.Popen
>    python/console_socket: Add a pylint ignore
>    python/machine: Disable pylint warning for open() in _pre_launch
>    python/machine: disable warning for Popen in _launch()
> 
>   python/qemu/console_socket.py | 11 ++++++-----
>   python/qemu/machine.py        | 28 ++++++++++++++++++----------
>   2 files changed, 24 insertions(+), 15 deletions(-)
> 

Thank you for reviews! Staged to my Python branch.

--js


