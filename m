Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CF74EAD3A
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 14:35:13 +0200 (CEST)
Received: from localhost ([::1]:44204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZB44-0003y1-D1
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 08:35:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nZB2J-00038V-3o
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 08:33:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nZB2B-0003RW-Pv
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 08:33:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648557193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XjjqqNMq68oKKhkCwEV6XTV7ryqIByfcCqnl/Lhg92Y=;
 b=OsBDpovTnXLp0qV+kCrYFORFsv5LZS3ZdRG2NkkEqkuQM3Yd2fbXs5eiL7e74q6NPHuXkQ
 vOywhGt6yGTZCzCYVQEAUjj67Fv0WakMesybSOH1Puu0jeyUpml5Lj91AFQj3ULBRkAeAz
 8UkUM2Bhu85wsrQ9u4aJ64BgSbYK6Es=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-YnJjCE25OZagZMsj1q3-Sg-1; Tue, 29 Mar 2022 08:33:12 -0400
X-MC-Unique: YnJjCE25OZagZMsj1q3-Sg-1
Received: by mail-wm1-f70.google.com with SMTP id
 c126-20020a1c3584000000b00380dee8a62cso6753306wma.8
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 05:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XjjqqNMq68oKKhkCwEV6XTV7ryqIByfcCqnl/Lhg92Y=;
 b=RRopwHN+HfUF2eg3UgwoGDSjYOyEY7Z4sQ5Ja82iZ2mA4Cco4BB4kSvr8ni8A/wHp0
 k6eymA8Tk7cTQ5GYzJadstC/YbdZ9csoMVepDHy7BTsGhyboXzzncCFFNNs0g5xP7Rz7
 y6nwSWfLiY9Ml1KtESECqcXDfYWrLq3QnuxZF6p5CnCcjKqbKCc38Vjl7acsZpLJFGNN
 rBfnrfcmH0NNK9yqjDSrLKLojL/XgCODLtAzLkNNEQCgaPDK3dZ7kiin+ot8mvAFhLG5
 eOAd9mpfmDmyB/TjLBNyBp2WBOEZFL1bS+745rejsORERxr1jNFwV4ToJDaU1sFwty7z
 HRpA==
X-Gm-Message-State: AOAM530qKjY75+k4odvlb/BrQfsaBDdzOzJxto8HBthNz1/biM5yPZIl
 1HBsX9CIibk1XOxks4x7Sb3S3NsootRctFbutyw+ppcrvUqgfS1fFaBNdcIkbbT8Ep2uFuiJx+q
 L9tHb64FmmvUuG8s=
X-Received: by 2002:a1c:7302:0:b0:38c:bb21:faf7 with SMTP id
 d2-20020a1c7302000000b0038cbb21faf7mr6577601wmb.31.1648557190894; 
 Tue, 29 Mar 2022 05:33:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcpHBXTEYWUAtDevceyNob+aTj+ssBzZ0YJ9WTFaVSrog7ZawitQDNrPB2tGJdM5+6mjAjRg==
X-Received: by 2002:a1c:7302:0:b0:38c:bb21:faf7 with SMTP id
 d2-20020a1c7302000000b0038cbb21faf7mr6577569wmb.31.1648557190618; 
 Tue, 29 Mar 2022 05:33:10 -0700 (PDT)
Received: from [192.168.149.116]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 i74-20020adf90d0000000b0020373ba7beesm21643331wri.0.2022.03.29.05.33.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 05:33:10 -0700 (PDT)
Message-ID: <84e1a9b9-756f-696f-e34a-3f76362348b6@redhat.com>
Date: Tue, 29 Mar 2022 14:33:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH for-7.0] main-loop: Disable GLOBAL_STATE_CODE() assertions
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20220329093545.52114-1-hreitz@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20220329093545.52114-1-hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 29/03/2022 um 11:35 schrieb Hanna Reitz:
> These assertions are very useful for developers to find bugs, and so
> they have indeed pointed us towards bugs already.  For users, it is not
> so useful to find these bugs.  We should probably not enable them in
> releases until we are sufficiently certain that they will not fire
> during normal operation, unless something is going seriously wrong.
> 
> For example, we have received a bug report that you cannot add an NBD
> server on a BDS in an I/O thread with `-incoming defer`.  I am sure this
> is a real bug that needs investigation, but we do not really have that
> time right now, so close to release, and so I would rather disable the
> assertions to get time to investigate such reports.
> 
> (I am just putting the link as "buglink" below, not "closes", because
> disabling the assertion will not fix the likely underlying bug.)
> 
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/945
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  include/qemu/main-loop.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
> index 7a4d6a0920..3bf8aeb3cd 100644
> --- a/include/qemu/main-loop.h
> +++ b/include/qemu/main-loop.h
> @@ -272,7 +272,8 @@ bool qemu_in_main_thread(void);
>  /* Mark and check that the function is part of the global state API. */
>  #define GLOBAL_STATE_CODE()                                         \
>      do {                                                            \
> -        assert(qemu_in_main_thread());                              \
> +        /* FIXME: Re-enable after 7.0 release */                    \
> +        /* assert(qemu_in_main_thread()); */                        \
>      } while (0)
>  
>  /* Mark and check that the function is part of the I/O API. */
> 

Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>


