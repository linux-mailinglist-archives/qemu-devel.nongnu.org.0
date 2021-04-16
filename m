Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0645336191A
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 07:08:18 +0200 (CEST)
Received: from localhost ([::1]:49088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXGiH-0006VJ-4A
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 01:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXGhD-00062O-9M
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 01:07:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXGhA-0004LF-V9
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 01:07:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618549628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J5p4FOlHOgs6YUCQKI5VHIApCFubnCbs7NHt71pbeGw=;
 b=dcpqMWdAbc6SQSOj8QsRW+1RBOMi+OPsKsZuLFEeBumLWHE6T6o3CcCYfYdLXxzKRvFmcx
 nuvkze5MVSCpBqip42SqmEuA7FJx8+bbZ4exj0R/p9l9iydU53dnFlhQtr+mL9H1F5Ffgz
 kKpehdb4d/2aETyfo0Ap1snDLKPAHvs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-fZCdCXDoN8KjT-Oh4IPQIA-1; Fri, 16 Apr 2021 01:07:06 -0400
X-MC-Unique: fZCdCXDoN8KjT-Oh4IPQIA-1
Received: by mail-wr1-f72.google.com with SMTP id
 91-20020adf92e40000b029010470a9ebc4so2774970wrn.14
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 22:07:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J5p4FOlHOgs6YUCQKI5VHIApCFubnCbs7NHt71pbeGw=;
 b=DxTWKDRXhWw8qVhDy6JyV2F6vtj/auP0Rbduz6KRxqnP1qzTJGFNjyJWkLN2AX1MNZ
 Kv9XbxxIbXhQ+ZCEbeScdQ11W7AeNoOBAJdKLkYXGjuMUD8crecOdk4merkrS6ylOhfF
 FZDNIzg+ckFqLlaDAfRo5hiz65BWd2BvT1mHmYA/QjvRwaZgQ+z4pUTSUC0K9DaoyGtG
 sCMziEMQDBs1k6MBEvN0FKxQXohAQTFv0Vqfiafjv1u2s4dkc5eFzlDHKG9Zaho3Ch0d
 lja32PPxJzbxdt3l2V5RTxNvi9h03r6qdHEsIp2cp7HEC0ox2vNVKNol0IEYlrt0soxT
 bZJA==
X-Gm-Message-State: AOAM5331NZAuMNWP9EErkYumXzzHSP0JFJqPmP5qpiV6R7kiQIjTcy6K
 3gB7PwLPumuHKuvDUi6IC91vBhVnIxiljt5lZ4vVKDrp3bLNKkNTYhsS33V1n6ek14P6CUEE2QV
 WjDclANcXefz52dg=
X-Received: by 2002:a5d:6852:: with SMTP id o18mr6708416wrw.426.1618549625535; 
 Thu, 15 Apr 2021 22:07:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyS4IVIhcAy3rMP/5UazqQkmND1TSFQn0g0BocffisCUUcxsLIRu7eLPR8cf0jaNK4qAOV0Q==
X-Received: by 2002:a5d:6852:: with SMTP id o18mr6708383wrw.426.1618549625285; 
 Thu, 15 Apr 2021 22:07:05 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id 24sm7458880wmk.18.2021.04.15.22.07.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 22:07:04 -0700 (PDT)
Subject: Re: [PATCH 2/8] Acceptance tests: do not try to reuse packages from
 the system
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210415215141.1865467-1-crosa@redhat.com>
 <20210415215141.1865467-3-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <edda2d8e-bc35-337a-d990-4c5678a45f64@redhat.com>
Date: Fri, 16 Apr 2021 07:07:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210415215141.1865467-3-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/21 11:51 PM, Cleber Rosa wrote:
> The premise behind the original behavior is that it would save people
> from downloading Avocado (and other dependencies) if already installed
> on the system.  To be honest, I think it's extremely rare that the
> same versions described as dependencies will be available on most
> systems.  But, the biggest motivations here are that:
> 
>  1) Hacking on QEMU in the same system used to develop Avocado leads
>     to confusion with regards to the exact bits that are being used;
> 
>  2) Not reusing Python packages from system wide installations gives
>     extra assurance that the same behavior will be seen from tests run
>     on different machines;
> 
> With regards to downloads, pip already caches the downloaded wheels
> and tarballs under ~/.cache/pip, so there should not be more than
> one download even if the venv is destroyed and recreated.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/Makefile.include | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


