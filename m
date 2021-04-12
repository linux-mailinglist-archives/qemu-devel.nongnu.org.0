Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C9B35CA42
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 17:41:52 +0200 (CEST)
Received: from localhost ([::1]:43708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVyh9-0005OH-Qf
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 11:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lVyfd-0004mK-Si
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 11:40:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lVyfb-0003ok-PF
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 11:40:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618242010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vOW4PVqMJKdcBAzWp1g+Fy9K12jHI9GysQwYO9VuGp4=;
 b=O54WdnMOlshOMhn/ig8uwALkPD+N/ojU1Z1kPYnZwUoX4TPd0llrIgyhDY6wk8TTXv8jlI
 voEAmqTkbrcJ7eBB9zeDu+T0rnG+inkW4iKc4Dp4Fc5V2eegLcFSUZLPSjTv2s9mWGQQoc
 0pCstSuIHt9ESiZzQF+ft8UKaFT8j64=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-bnoLOIqnMliZrxqakr-RBw-1; Mon, 12 Apr 2021 11:40:08 -0400
X-MC-Unique: bnoLOIqnMliZrxqakr-RBw-1
Received: by mail-wm1-f69.google.com with SMTP id
 j187-20020a1c23c40000b0290127873d3384so1813251wmj.6
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 08:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vOW4PVqMJKdcBAzWp1g+Fy9K12jHI9GysQwYO9VuGp4=;
 b=nluv0NiQBk+i/6r1A4hGa/a0GdCx05dmqunQbvtKXzkG9mLDjKnKH94hJYT/VlTjqY
 vgG6t9HLOm6e4FvRkWjqKpBzx2Qcyt/5x7yv0kXv1ESL6QGEDwZJKLtINGVfF560OF6r
 zj2BZV/ySj9bUV9tuzi47/w0xidamvPTw8Ho19X9G/npbJFl5WgofEuJ3tNlHV4zRESt
 htxBZ+AKGDS8OLMof0J0SXsjoukJPWgLbbhhaZGEHh+qQangB2CQhMkWs1CzAB3/7Dbh
 I0votxsT5sAR0Vy/kipQhGHsK70ts9BuVTOp330rq8d0A1sk3mktp+YE8p/kfPJ9puXM
 1Tcw==
X-Gm-Message-State: AOAM530LccctUK0MQcxWWKmi+vNmQGWAblcfAPV+uy9+v83U9GULxXyA
 N3Yoi3MbdrQ5K34IFfG5Y6UvyiqYEOKE75BydNyduFeBGx663HRlZ9dlrastQy24yc55Zqf1DZU
 Rbj5wGw17FeggKuo=
X-Received: by 2002:adf:e50d:: with SMTP id j13mr5148763wrm.80.1618242006804; 
 Mon, 12 Apr 2021 08:40:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPzfB5oEUR/sGUrSzNOXvu0S7SQqT7mF6lbMm38jc46ZLIvYgffxeBXtX8IG2m48uPzXX2MA==
X-Received: by 2002:adf:e50d:: with SMTP id j13mr5148744wrm.80.1618242006641; 
 Mon, 12 Apr 2021 08:40:06 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.111])
 by smtp.gmail.com with ESMTPSA id b1sm16787327wru.90.2021.04.12.08.40.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Apr 2021 08:40:05 -0700 (PDT)
Subject: Re: [PATCH v3] libqtest: refuse QTEST_QEMU_BINARY=qemu-kvm
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210412143050.725918-1-stefanha@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <28f58815-e810-789a-7beb-4783f440a351@redhat.com>
Date: Mon, 12 Apr 2021 17:40:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210412143050.725918-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qin Wang <qinwang@rehdat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/04/2021 16:30, Stefan Hajnoczi wrote:
> Some downstreams rename the QEMU binary to "qemu-kvm". This breaks
> qtest_get_arch(), which attempts to parse the target architecture from
> the QTEST_QEMU_BINARY environment variable.
> 
> Print an error instead of returning the architecture "kvm". Things fail
> in weird ways when the architecture string is bogus.
> 
> Arguably qtests should always be run in a build directory instead of
> against an installed QEMU. In any case, printing a clear error when this
> happens is helpful.
> 
> Since this is an error that is triggered by the user and not a test
> failure, use exit(1) instead of abort(). Change the existing abort()
> call in qtest_get_arch() to exit(1) too for the same reason and to be
> consistent.
> 
> Reported-by: Qin Wang <qinwang@rehdat.com>
> Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> v3:
>   * Add newline to wrap error message output at 80 columns [Thomas]
>   * Drop information about working around this using a symlink [Thomas]
>   * Use exit(1) instead of abort() [Thomas]
> 
>   tests/qtest/libqtest.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 71e359efcd..825b13a44c 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -907,7 +907,14 @@ const char *qtest_get_arch(void)
>   
>       if (!end) {
>           fprintf(stderr, "Can't determine architecture from binary name.\n");
> -        abort();
> +        exit(1);
> +    }
> +
> +    if (!strstr(qemu, "-system-")) {
> +        fprintf(stderr, "QTEST_QEMU_BINARY must end with *-system-<arch> "
> +                "where 'arch' is the target\narchitecture (x86_64, aarch64, "
> +                "etc).\n");
> +        exit(1);
>       }
>   
>       return end + 1;
> 

Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>


