Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5505B30F496
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 15:10:03 +0100 (CET)
Received: from localhost ([::1]:53922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7fKc-00064g-A4
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 09:10:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7fIT-0004EW-PW
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:07:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7fIR-0002v9-Gh
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:07:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612447666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JXLrg6FXTUJmEczswkO6b1Db2hBqTGiq4h34WsTDn2Q=;
 b=ZRJT8voT1yHEN6icN65WfoBUSeeW6doS3m4FMNljCry970bFu3uBvEAKty0JqTmlyWqf5t
 dJNTCmClY7HL7vBQ+PJTgd3bCAWaxJFhZ3DXfodDaqxq2NRrBWUIxmlj76S6KULU6EsvcT
 +SG2Yx8mWDt5rZN5sDXBNOouIC/dk0M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-fE2a5MV8OFyMWXyTI6yLqw-1; Thu, 04 Feb 2021 09:07:42 -0500
X-MC-Unique: fE2a5MV8OFyMWXyTI6yLqw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9072C80402C;
 Thu,  4 Feb 2021 14:07:41 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-90.ams2.redhat.com [10.36.112.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8017E5D9C9;
 Thu,  4 Feb 2021 14:07:40 +0000 (UTC)
Subject: Re: [PATCH] README: Add Documentation blurb
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20201104193032.1319248-1-jsnow@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <16d9f8d6-170d-633e-6c52-a6f3ee1de6fb@redhat.com>
Date: Thu, 4 Feb 2021 15:07:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20201104193032.1319248-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/11/2020 20.30, John Snow wrote:
> Add it in a prominent place: Right after figuring out what QEMU is,
> users may wish to know how to use it more than they want to know how to
> build their own version of it.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   README.rst | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/README.rst b/README.rst
> index 58b9f2dc15c4..758ea8fd2ff0 100644
> --- a/README.rst
> +++ b/README.rst
> @@ -31,6 +31,17 @@ QEMU as a whole is released under the GNU General Public License,
>   version 2. For full licensing details, consult the LICENSE file.
>   
>   
> +Documentation
> +=============
> +
> +Documentation can be found hosted online at
> +`<https://www.qemu.org/documentation/>`_. The documentation for the
> +current development version that is available at
> +`<https://www.qemu.org/docs/master/>`_ is generated from the ``docs/``

That URL is now redirecting to https://qemu.readthedocs.io/en/latest/ ... 
could you maybe update your patch and resend?

  Thanks,
   Thomas


