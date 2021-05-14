Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E143809DB
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 14:48:54 +0200 (CEST)
Received: from localhost ([::1]:55196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhXFN-0000ZT-5E
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 08:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWnO-00061S-Uu
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:19:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWnM-0006t6-4R
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:19:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620994795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6D+h1EWO8dHKTotutvK/zytyMJKm3zHZQ0jnfTFHC6Y=;
 b=QbEynG/EbdzDgSNx8PCXn3sUnw/EazYI7iMGL3RE9XyTHde5NeRjSekZ/kOZMS610x8sQ3
 AuVs9iHcSqNx6Juc3muUHiUvsSyZzZRMoAo5dhRlhs+VF5OFkaEZfpMJlGBx0sVQDj+wlY
 lSQ+L8oSrpoumROeqZTL1JvB9ltkRMc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-qK4zG3oVPlm4PJdo6yMUzQ-1; Fri, 14 May 2021 08:19:54 -0400
X-MC-Unique: qK4zG3oVPlm4PJdo6yMUzQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 c138-20020a1c9a900000b0290173dd9788cdso26343wme.4
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 05:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6D+h1EWO8dHKTotutvK/zytyMJKm3zHZQ0jnfTFHC6Y=;
 b=KNhB7IV8kJGZm2wdj6bedZjDF6cRq8mJe2TNzvE9Wt22AIPehCnQ9fgSkGwnD/Ai8T
 T3N40C4DaHxF6G9mSVUeNamP1xdN2Fa05eonABUByQ6x1ClKVmEb/ocUtTf6datTWEs5
 E/TF4XKnsdM7oQHieYTblO0RW2NoMB7F72+caMFPun/GVhhJ2LCnizzfJlz3ut4fc6FE
 vKdO6PLfz3ACRmdcDsYRR5CoezmVS7xVTy43gldGP6MfRZj3XYgMUNyBD9/qPOyK5+6C
 PNqfi1TQTyeblkqf9aJYp00aevDndqjQreTnBW/a/4mnJQwGZGDitPrW07praQCQfzJp
 48/A==
X-Gm-Message-State: AOAM5332hVMUANzYfiXENN3vHdovxb4q+50M6ILApDAGvy3s6KFUMEVm
 M8ciX0VxFZoiviEVT4c0hQaWQfX+k1+iGruZ6Yep0fp2o7yKHJC11Nar12sucgGtsNzXfo+dFO4
 DQ/0uYdgnHvWxVys=
X-Received: by 2002:a7b:c3d6:: with SMTP id t22mr1049024wmj.160.1620994793016; 
 Fri, 14 May 2021 05:19:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxujhbH2pA9dWLI2xWg9vByReVRC4JiaKHbsJRjxR4sU0Tjsf09tq8u8YkmBMJCWPUPih7VtQ==
X-Received: by 2002:a7b:c3d6:: with SMTP id t22mr1049009wmj.160.1620994792886; 
 Fri, 14 May 2021 05:19:52 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83cd9.dip0.t-ipconnect.de.
 [217.232.60.217])
 by smtp.gmail.com with ESMTPSA id v10sm7522177wrq.0.2021.05.14.05.19.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 05:19:52 -0700 (PDT)
Subject: Re: [PATCH v2 03/12] crypto: bump min nettle to 3.4, dropping RHEL-7
 support
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210514120415.1368922-1-berrange@redhat.com>
 <20210514120415.1368922-4-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <08f51c39-839d-9f6b-0d47-06fb4582c681@redhat.com>
Date: Fri, 14 May 2021 14:19:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210514120415.1368922-4-berrange@redhat.com>
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

On 14/05/2021 14.04, Daniel P. Berrangé wrote:
> It has been over two years since RHEL-8 was released, and thus per the
> platform build policy, we no longer need to support RHEL-7 as a build
> target. This lets us increment the minimum required nettle version and
> drop a lot of backwards compatibility code for 2.x series of nettle.
> 
> Per repology, current shipping versions are:
> 
>               RHEL-8: 3.4.1
>        Debian Buster: 3.4.1
>   openSUSE Leap 15.2: 3.4.1
>     Ubuntu LTS 18.04: 3.4
>     Ubuntu LTS 20.04: 3.5.1
>              FreeBSD: 3.7.2
>            Fedora 33: 3.5.1
>            Fedora 34: 3.7.2
>              OpenBSD: 3.7.2
>       macOS HomeBrew: 3.7.2
> 
> Ubuntu LTS 18.04 has the oldest version and so 3.4 is the new minimum.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.yml             | 10 ----------
>   configure                  |  4 +---
>   crypto/cipher-nettle.c.inc | 31 -------------------------------
>   crypto/hash-nettle.c       |  4 ----
>   crypto/hmac-nettle.c       |  4 ----
>   5 files changed, 1 insertion(+), 52 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


