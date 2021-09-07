Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA60340294B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 14:59:01 +0200 (CEST)
Received: from localhost ([::1]:52904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNagm-0001pr-Ny
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 08:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNaHX-0008OA-5v
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:32:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNaHV-0002lB-LO
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:32:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631017972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hg2pKtqLrJezl4eGq/g227PhY2dboARJ1SWK39Vlhog=;
 b=ac8XkU2gaUaTeEhrDaApoPiH+QAZD7/yVREk7Id2hwetWNqHpGAYxoQs0c9DGGLFmYlp12
 dZMIu7bIcVVWpbkJ5daGZVb7KLDHXCRQYTvYZNtLVnb619Rd9BFQVk1WaNm5MLXzy4BB5M
 V7zToPOQ0tVlPzBhZ35A16U0TZ56FZE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-VDBCJbi4Oluwl6XHMsiR-w-1; Tue, 07 Sep 2021 08:32:49 -0400
X-MC-Unique: VDBCJbi4Oluwl6XHMsiR-w-1
Received: by mail-wm1-f69.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so3335884wmj.8
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 05:32:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hg2pKtqLrJezl4eGq/g227PhY2dboARJ1SWK39Vlhog=;
 b=lIxu9CxeAIZmacVbCTsvVTiZAzcdgYUanweABDOMIND+OelZxcZvqn3XAaUJ/LeRqi
 Ouuc1ZqQ4IPNqdHs9Vu7EjgL04qu2fztGVYUdfhpdZcnHx9924ysBXKYs7fncQl5Ij/g
 1+Sl8+vj9VaINw9SOrNGntdzMUdrScIVQe2AgY5t8oBLqfg1UIIyeuNnUPdptBy0xf2n
 gUbnzg28It37jvu0Z7VNGeEFWOwQRGWZZGxCwYgrSy0wFFgCnbCciWF1uC4iSPpDqj6P
 8O6YCzxeL4wR7fufSwsH9irHFYv59MKvACFS471y+ZlDWes003IyyIOJhHJ+xXwEWNRe
 xn9Q==
X-Gm-Message-State: AOAM530H9X2VTtgKtKLEQBVltx4L9feu/c+a2ybdDPaXXj2lLgZBAYAq
 kvUPLFIrFgTDrJFD/HkAbGRx2Imi11Kr8pqVRHa5AciBraCsVZQJFSNjKpCvqY2EOi8tatD/bdb
 nRuBVDW0YGhWFg5A=
X-Received: by 2002:a7b:c405:: with SMTP id k5mr3680763wmi.87.1631017968625;
 Tue, 07 Sep 2021 05:32:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDB5Fy7XU0GhUTSN6vrmv1tjYH+irQZFZmtxeAEWLRua9nZnPylRfO1hed1vTEos+kr+YMcA==
X-Received: by 2002:a7b:c405:: with SMTP id k5mr3680736wmi.87.1631017968385;
 Tue, 07 Sep 2021 05:32:48 -0700 (PDT)
Received: from thuth.remote.csb (pd9e8396c.dip0.t-ipconnect.de.
 [217.232.57.108])
 by smtp.gmail.com with ESMTPSA id x18sm2643023wmj.36.2021.09.07.05.32.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 05:32:47 -0700 (PDT)
Subject: Re: [PATCH] fuzz: fix unbound variable in build.sh
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20210907110841.3341786-1-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8995d50d-dbd5-c37c-6bd0-477e2f58d1aa@redhat.com>
Date: Tue, 7 Sep 2021 14:32:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210907110841.3341786-1-alxndr@bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Qiuhao Li <Qiuhao.Li@outlook.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/09/2021 13.08, Alexander Bulekov wrote:
> /src/build.sh: line 76: GITLAB_CI: unbound variable
> Fix that.
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
> 
> This change is in preparation to revert:
> 7602748c ("qemu: manually build glib (#5919)") on OSS-Fuzz.
> Reverting as-is produces an unbound variable complaint when we try to
> build the fuzzers in the OSS-Fuzz container.
> 
>   scripts/oss-fuzz/build.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
> index 98b56e0521..5ddc769c9c 100755
> --- a/scripts/oss-fuzz/build.sh
> +++ b/scripts/oss-fuzz/build.sh
> @@ -73,7 +73,7 @@ if ! make "-j$(nproc)" qemu-fuzz-i386; then
>             "\nFor example: CC=clang CXX=clang++ $0"
>   fi
>   
> -if [ "$GITLAB_CI" != "true" ]; then
> +if [ -z ${GITLAB_CI+x} ]; then

My bash-foo is really not the best, but shouldn't there be a colon in there, 
i.e. ${GITLAB_CI:+x} ?

  Thomas


>       for i in $(ldd ./qemu-fuzz-i386 | cut -f3 -d' '); do
>           cp "$i" "$DEST_DIR/lib/"
>       done
> 


