Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FAF447C99
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 10:14:53 +0100 (CET)
Received: from localhost ([::1]:43692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk0js-0002O0-J8
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 04:14:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mk0Zf-0002M1-1E
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:04:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mk0Zd-0002bK-I2
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:04:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636362256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d1TFhuyQ+QFzFlrdYoF+3bZ2JnQxmQhiPgBOLbMoH3U=;
 b=A3JN04utMOqBWoZ0U4g8yStUniXb0j1MOlpDpLpcuODVEUc3GyLeKdGBqYvestzPsxs0M9
 Yko0tNThOXMdu/HJzay9vv/kqEdZl22LNLNfIAyCStbssZzxC81yEFJIDarmjrf9rcauhm
 PpvItIVnymJ9k9VubF3MneGJ00IjPt4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-ai3OlUJQPPaJwKr2MpzqOg-1; Mon, 08 Nov 2021 04:04:15 -0500
X-MC-Unique: ai3OlUJQPPaJwKr2MpzqOg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71FD087499A
 for <qemu-devel@nongnu.org>; Mon,  8 Nov 2021 09:04:14 +0000 (UTC)
Received: from [10.39.192.185] (unknown [10.39.192.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 391A05D9DE;
 Mon,  8 Nov 2021 09:04:04 +0000 (UTC)
Message-ID: <25cb8822-3b94-17e2-9aa4-70b3688af3a4@redhat.com>
Date: Mon, 8 Nov 2021 10:04:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/4] configure: preserve CFLAGS, CXXFLAGS and LDFLAGS in
 config.status
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211108084323.541961-1-pbonzini@redhat.com>
 <20211108084323.541961-3-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211108084323.541961-3-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/11/2021 09.43, Paolo Bonzini wrote:
> CFLAGS, CXXFLAGS and LDFLAGS influence the tests (for example if they include
> -L or -I options), so they should be kept from the invocation of configure
> to the subsequent reinvocations via config.status.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/configure b/configure
> index 369b5455b6..d268f59246 100755
> --- a/configure
> +++ b/configure
> @@ -4057,9 +4057,12 @@ preserve_env AR
>   preserve_env AS
>   preserve_env CC
>   preserve_env CPP
> +preserve_env CFLAGS
>   preserve_env CXX
> +preserve_env CXXFLAGS
>   preserve_env INSTALL
>   preserve_env LD
> +preserve_env LDFLAGS
>   preserve_env LD_LIBRARY_PATH
>   preserve_env LIBTOOL
>   preserve_env MAKE

Oh, we didn't preserve them yet? That's surprising!

Reviewed-by: Thomas Huth <thuth@redhat.com>


