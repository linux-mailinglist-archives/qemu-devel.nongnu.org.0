Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9593F44A0
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 07:28:00 +0200 (CEST)
Received: from localhost ([::1]:37630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI2V5-0006S8-Fj
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 01:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mI2UG-0005mi-Qt
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 01:27:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mI2UC-0005mh-96
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 01:27:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629696421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nIZEJI5Uh1/3lIRbjWFLkYEQa0XOAEeQsgg36PkeI+M=;
 b=HI+4DqXqkv5gwuAO2g3RY9/2PnvfGhXxbpt9ZSzpvr9Q/nLt/pyQKm4PE61MFST1rrg/GO
 fbA/F4tYfzZC1f1B8S8bNRPiDJYlHgMUD+uTTZJSXcU1Jzhh17R1D8oYPbdox8TfxsQlZh
 37jnwdRR5PLiW2hnMGkXX7DJsngzfA4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221--rgyA2IQP5Wykx21Tz8JSg-1; Mon, 23 Aug 2021 01:27:00 -0400
X-MC-Unique: -rgyA2IQP5Wykx21Tz8JSg-1
Received: by mail-wm1-f72.google.com with SMTP id
 g3-20020a1c2003000000b002e751c4f439so218079wmg.7
 for <qemu-devel@nongnu.org>; Sun, 22 Aug 2021 22:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nIZEJI5Uh1/3lIRbjWFLkYEQa0XOAEeQsgg36PkeI+M=;
 b=gGwoVHGwGOW0aiQjV+BS1KnJPag8ipdHs2J314+R60GvfAxepbdmMCoMeR5UCpsESA
 xbkC1492fqsaH4WLKdRJCDBVyfq2w6aFO2k3HM53Z0WuyVcCCGMGTIrHpaBNoDwHlsFU
 pv2dImxSYUR58BayaN6JsD66qxJq5m2na5EsUk1Ar4k1cMWqyV9sTxfP766iTwI11WZT
 Q/NcaLlRHV7o57hIYd2XKovjfL7WrIzgxZpDmdM4XoZccoirVjkLBcrp+bk771CJMlD/
 tbVIks+iPOOHLEShk7wIHKFgL22l6mgbZyJ81x1/R5xs7rHPUIWb1yBKaDdO0y3UtsVt
 Ly0Q==
X-Gm-Message-State: AOAM531moPZaSe7YNrsaIvlRQPsRwdSJakz149JdrFXWI30dXynlNtSF
 +mTfD6+cZNyvnrhZGz3CbjGQrNnrFF1lghxNS71v90D/YNbIKYH0Ukff6A3MVIbqQjA8IGAheiJ
 t/Jx4yQyDIGrn5VQ=
X-Received: by 2002:a5d:60cd:: with SMTP id x13mr11135565wrt.375.1629696419547; 
 Sun, 22 Aug 2021 22:26:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWeV5VswYbqZjHWXyvm9E4gamsfydc+9+D5j8tzoMCQfFhQ4Kfwtt/B1JUS2mMBh29wznZ+w==
X-Received: by 2002:a5d:60cd:: with SMTP id x13mr11135547wrt.375.1629696419365; 
 Sun, 22 Aug 2021 22:26:59 -0700 (PDT)
Received: from thuth.remote.csb (p5791d4fd.dip0.t-ipconnect.de.
 [87.145.212.253])
 by smtp.gmail.com with ESMTPSA id w14sm13607171wrt.23.2021.08.22.22.26.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Aug 2021 22:26:58 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] docs/about: Remove the duplicated doc
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 libvir-list@redhat.com
References: <20210823030005.165668-1-wangyanan55@huawei.com>
 <20210823030005.165668-2-wangyanan55@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <6adb8073-2cd7-12c0-060d-33d5d78f3eee@redhat.com>
Date: Mon, 23 Aug 2021 07:26:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210823030005.165668-2-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.746,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.959, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/08/2021 05.00, Yanan Wang wrote:
> There are two places describing the same thing about deprecation
> of invalid topologies of -smp CLI, so remove the duplicated one.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   docs/about/removed-features.rst | 13 -------------
>   1 file changed, 13 deletions(-)
> 
> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
> index cbfa1a8e31..6a9c5bb484 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -647,19 +647,6 @@ as ignored. Currently, users are responsible for making sure the backing storage
>   specified with ``-mem-path`` can actually provide the guest RAM configured with
>   ``-m`` and QEMU fails to start up if RAM allocation is unsuccessful.
>   
> -``-smp`` (invalid topologies) (removed 5.2)
> -'''''''''''''''''''''''''''''''''''''''''''
> -
> -CPU topology properties should describe whole machine topology including
> -possible CPUs.
> -
> -However, historically it was possible to start QEMU with an incorrect topology
> -where *n* <= *sockets* * *cores* * *threads* < *maxcpus*,
> -which could lead to an incorrect topology enumeration by the guest.
> -Support for invalid topologies is removed, the user must ensure
> -topologies described with -smp include all possible cpus, i.e.
> -*sockets* * *cores* * *threads* = *maxcpus*.
> -
>   ``-machine enforce-config-section=on|off`` (removed 5.2)
>   ''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>   
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


