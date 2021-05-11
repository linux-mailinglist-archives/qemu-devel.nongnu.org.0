Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9908437A8A1
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 16:12:03 +0200 (CEST)
Received: from localhost ([::1]:54064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgT7C-0005Gp-Mx
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 10:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgT2v-0007Eo-VL
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:07:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgT2o-0008D6-MB
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:07:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620742048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/K+K3n4B8Try6BmCKRpuyAbPm8/hNPq13asQri2xC0s=;
 b=Twdo1Lrv08p4kLdeI40gJpKTDBxwHhSHOoKjhmymOl8yM/wHLQUUHG7c9id1zGaBxhh8TY
 sASvOpayighASgWm53EUlhUVvkQMGqpONNAInKy++u41SNWPUXEcKU8kLhuKOJHQ+zB2K6
 rjRCkOm/K++ngtysOdLUrVM3IBw+y3c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-EUyM_r4PMnSphO16Q6UUJA-1; Tue, 11 May 2021 10:07:25 -0400
X-MC-Unique: EUyM_r4PMnSphO16Q6UUJA-1
Received: by mail-wm1-f71.google.com with SMTP id
 o18-20020a1ca5120000b02901333a56d46eso223946wme.8
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 07:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/K+K3n4B8Try6BmCKRpuyAbPm8/hNPq13asQri2xC0s=;
 b=TCeKqLim+RDw2gz/5pE4Su/CkD+6R1xDjSc9tskF3BepttR/iP8OcX3/OQAiw3Le5k
 y0Luizgw+rH5A8TSXeOZ2OlgHfkmzRd3RzJGL7vKmL7eN6zXVBhLIU5od4AwaS70EdF9
 PubcKjb+iU5ejra5idliDnnCjEcEQ32d/yMMWI2RJu4bjO8GDHINWKHMGqVUuFuD/HpK
 LK4wY/e/K0nI8qtSM9BB9n6At7EM3p4nFBr5AKLD01f1V0bFW5jagPH0kViJjsCPMm/o
 JBqnWXe7uRpI+JgDDERDGzCrx7346ccqvN0mGIePcmTzRw1wUD+9R1gqfled9rwS2mbk
 UgPA==
X-Gm-Message-State: AOAM531DcUQBmft/i4NdG7lUPkiFdbN0zChuxgqgQjRg4Q/peAtPdggt
 SbCioq4A6CWN0jnIDwhQrYPuL4SCOAb4FPDVJ3xtKbL9fnVK1eCSaxqbtQ/snP6dyipp2pc+4it
 j+RYRerzrBz8LOHU=
X-Received: by 2002:a05:600c:4fd0:: with SMTP id
 o16mr5676391wmq.137.1620742044060; 
 Tue, 11 May 2021 07:07:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHol4m6DBhydVSh7D2HFOSx7h0pVsG7pf15TxmCIbkHNht+gvzy+qcCN/RaLNVKkhaJCwfVg==
X-Received: by 2002:a05:600c:4fd0:: with SMTP id
 o16mr5676371wmq.137.1620742043917; 
 Tue, 11 May 2021 07:07:23 -0700 (PDT)
Received: from thuth.remote.csb (pd9e835ac.dip0.t-ipconnect.de.
 [217.232.53.172])
 by smtp.gmail.com with ESMTPSA id t11sm2428829wrz.57.2021.05.11.07.07.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 07:07:23 -0700 (PDT)
Subject: Re: [PATCH 06/12] crypto: bump min gnutls to 3.5.8, dropping RHEL-7
 support
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-7-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <76804b5c-1931-e546-1400-318cb1d36c48@redhat.com>
Date: Tue, 11 May 2021 16:07:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210511132641.1022161-7-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/05/2021 15.26, Daniel P. Berrangé wrote:
> It has been over two years since RHEL-8 was released, and thus per the
> platform build policy, we no longer need to support RHEL-7 as a build
> target. This lets us increment the minimum required gnutls version
> 
> Per repology, current shipping versions are:
> 
>               RHEL-8: 3.6.14
>       Debian Stretch: 3.5.8
>        Debian Buster: 3.6.7
>   openSUSE Leap 15.2: 3.6.7
>     Ubuntu LTS 18.04: 3.5.18
>     Ubuntu LTS 20.04: 3.6.13
>              FreeBSD: 3.6.15
>            Fedora 33: 3.6.16
>            Fedora 34: 3.7.1
>              OpenBSD: 3.6.15
>       macOS HomeBrew: 3.6.15
> 
> Debian Stretch has the oldest version and so 1.7.6 is the new minimum.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.yml | 15 ---------------
>   configure      |  2 +-
>   2 files changed, 1 insertion(+), 16 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


