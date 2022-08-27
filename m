Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB8A5A34F0
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 07:57:09 +0200 (CEST)
Received: from localhost ([::1]:39048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRooc-0000fL-V3
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 01:57:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRoic-0004oK-Hv
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 01:50:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRoia-00051v-RO
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 01:50:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661579451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MGY3B1HWKvSrt9saKn2dSo/as8jy8e9u7wPIxRxHJpY=;
 b=ESdd9z81vwuIL8z3K6jXvZvP1vS0yFn7RzUCgp5zKT5l/kQ/OWJRlpHfmTvFm6XX9cIgER
 jpt9lakVRlRLT0EaT6bVB/lnR9BtvSvn8Q8aaY0prrNPi7cdaRwpGBNskIO2mkGqS+fB1V
 iBjWhx1YCzgCbKoTNreDpBjekK1H6WQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-438-Wca7Z6nYMM-lZJvreWIxpQ-1; Sat, 27 Aug 2022 01:50:50 -0400
X-MC-Unique: Wca7Z6nYMM-lZJvreWIxpQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 j36-20020a05600c1c2400b003a540d88677so1823784wms.1
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 22:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=MGY3B1HWKvSrt9saKn2dSo/as8jy8e9u7wPIxRxHJpY=;
 b=TcKGpS0B5wyMkpLUhs8wmsjcCNoGaz+o/u2QHDLJfP//DVMaWYMu86VlQQgkfQugLw
 j/VOgiC1/OD8a1CKsIAYwhup3eSNUPBKHFdeZhHykDhUpeGmkD/K3Le/mCUgo61saqhk
 TtxSizeuDaKuxZdK6ZiHRFaloXo2iTwkuLRs1V/EGnUfRCpXcpfwwZOSIOLOa2a2bVNU
 g5UTqNS9BTGOMCUuvP3YsjkWlSgDNESIvpLz6LXmMBzAq9ZFp4aHW8SaOyn1htu1TTXR
 uSprV/m1zWVOdAWaZRSObwjb2plMO+uvYtqGsv9tvubkmm+/iiGeAIm83qufnFQWBBcp
 ylvA==
X-Gm-Message-State: ACgBeo2vir0v06gqnoO7f0DCh6RJ+8wyGyHWif5iD+eoRGeWzalQcGdg
 da7LhH3zM5JPSRENNymCV4/vVD2pgHFGodhfunYT/kkDpVgpSkgGCzwK8kNzy10jLkhjsRO/nkp
 lGmxki52emsrRuCk=
X-Received: by 2002:a05:600c:3b92:b0:3a6:5645:5fc7 with SMTP id
 n18-20020a05600c3b9200b003a656455fc7mr1347539wms.148.1661579449239; 
 Fri, 26 Aug 2022 22:50:49 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5k7iRLbevjpxdGh5C7WUUPQrz/lDsSqwanGbXadcpn+JuJteuNMLZlMbKmqWxOpnGyAz/czA==
X-Received: by 2002:a05:600c:3b92:b0:3a6:5645:5fc7 with SMTP id
 n18-20020a05600c3b9200b003a656455fc7mr1347526wms.148.1661579449032; 
 Fri, 26 Aug 2022 22:50:49 -0700 (PDT)
Received: from [192.168.8.101] (tmo-097-69.customers.d1-online.com.
 [80.187.97.69]) by smtp.gmail.com with ESMTPSA id
 da8-20020a056000408800b002250fa18eb6sm1419928wrb.71.2022.08.26.22.50.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 22:50:48 -0700 (PDT)
Message-ID: <2eeacf02-b36d-6919-72ab-38582ef1e92a@redhat.com>
Date: Sat, 27 Aug 2022 07:50:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 23/25] tests/docker: remove FROM qemu/ support from
 docker.py
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-24-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220826172128.353798-24-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/08/2022 19.21, Alex Bennée wrote:
> We want to migrate from docker.py to building our images directly with
> docker/podman. Before we get there we need to make sure we don't
> re-introduce our layered builds so bug out if we see FROM qemu/ in a
> Dockerfile.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/docker/docker.py | 38 ++++++++++----------------------------
>   1 file changed, 10 insertions(+), 28 deletions(-)

Acked-by: Thomas Huth <thuth@redhat.com>


