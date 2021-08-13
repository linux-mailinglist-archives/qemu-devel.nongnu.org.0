Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CAE3EBC2B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 20:39:43 +0200 (CEST)
Received: from localhost ([::1]:38906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEc5m-0002QV-GK
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 14:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mEc4i-0001Sv-87
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 14:38:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mEc4g-0006eP-ST
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 14:38:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628879914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zMZ1xk72RiUgF6o976XT9tx7bH9W82IaXahQobxbWrc=;
 b=Mf3zhqOCnemzKuvik8+oGuIeSW7+Y85+qDLCWwoXbKgiLqfgwZBRMqBuMJ1Sg4JUPLrRmf
 BtzTk4D7i0ZxLDEZeYQviIeH7NDTcUJ1eobULIdgBQuAzOPxjFNfitxrHE0KEihmlFmb34
 kbnwnfDfFkYHxsvFoJWt2alJyLNhWjw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-tiDVGbKVN_CXi9mD6v1fVQ-1; Fri, 13 Aug 2021 14:38:32 -0400
X-MC-Unique: tiDVGbKVN_CXi9mD6v1fVQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E91C180124F;
 Fri, 13 Aug 2021 18:38:31 +0000 (UTC)
Received: from redhat.com (ovpn-112-138.phx2.redhat.com [10.3.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 677FA1AC18;
 Fri, 13 Aug 2021 18:38:30 +0000 (UTC)
Date: Fri, 13 Aug 2021 13:38:28 -0500
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.2 3/4] tests/qtest/ipmi-bt-test: Zero-initialize
 sockaddr struct
Message-ID: <20210813183828.tj6ukge5rmbliq4z@redhat.com>
References: <20210813150506.7768-1-peter.maydell@linaro.org>
 <20210813150506.7768-4-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210813150506.7768-4-peter.maydell@linaro.org>
User-Agent: NeoMutt/20210205-687-0ed190
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Corey Minyard <minyard@acm.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 13, 2021 at 04:05:05PM +0100, Peter Maydell wrote:
> Zero-initialize the sockaddr_in struct that we're about to fill in
> and pass to bind(), to ensure we don't leave possible
> implementation-defined extension fields as uninitialized garbage.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  tests/qtest/ipmi-bt-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/tests/qtest/ipmi-bt-test.c b/tests/qtest/ipmi-bt-test.c
> index 8492f02a9c3..19612e9405a 100644
> --- a/tests/qtest/ipmi-bt-test.c
> +++ b/tests/qtest/ipmi-bt-test.c
> @@ -378,7 +378,7 @@ static void test_enable_irq(void)
>   */
>  static void open_socket(void)
>  {
> -    struct sockaddr_in myaddr;
> +    struct sockaddr_in myaddr = {};
>      socklen_t addrlen;
>  
>      myaddr.sin_family = AF_INET;
> -- 
> 2.20.1
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


