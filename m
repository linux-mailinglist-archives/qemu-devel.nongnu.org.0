Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 586F03D6ECD
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 08:09:46 +0200 (CEST)
Received: from localhost ([::1]:41062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8GHh-0004sp-Dy
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 02:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m8GGs-0004AR-3Y
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 02:08:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m8GGo-0008J5-Va
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 02:08:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627366129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5JA/drTRG6TJPryqszUuYU4KzTIW4U1VpMgqWT+IhCw=;
 b=a3cHJItGq7g3aOtBlW51/qSxHSU39QLFkdPRo4EaoU0ViMsaMDPZ4seLZcCE5IgErp+Mqf
 NLE5+jGgt1eVC0Zcpw3FT30HBmHtbcyNPYrduNJzYRaaufWucBCfGkjqMtwjmQicA8J6g7
 nHDJC2Xq6uEBfUOyg0+4jJ3ZuG9Ub2s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426--UmezTsJN3SGfakMOGrF7A-1; Tue, 27 Jul 2021 02:08:48 -0400
X-MC-Unique: -UmezTsJN3SGfakMOGrF7A-1
Received: by mail-wm1-f69.google.com with SMTP id
 a25-20020a05600c2259b02902540009f03cso53064wmm.4
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 23:08:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5JA/drTRG6TJPryqszUuYU4KzTIW4U1VpMgqWT+IhCw=;
 b=j16o543BbcKHX6DxzLoSZ5zOzVd82ulkconLI6S1QTHEdo0nITwfEiXoyAXoRWKW9O
 g0E1OnqApX6SusZi7TrGPw1n5G9sDJgG8WKvKx6kgk41etTlQCLkhpXIfxZ/okceKrKj
 BP+3tf3+PUxfI/GRCBM/ofy7IC5XB1GkmhoPot7QzdwGzJwzKgeHHCsHKNHhFKL5p1Gq
 htbooJnRAAtyIAG4/NDtre0x5nF6sUMmYjuFEVDAEydYxf0wf/ihTNsrXm0EOtb93ynU
 XxNtBaYxaIt/djabuZRKx7VqdlAtlDaW/F1AoE4JonSpLeti8HnUZjAVFLrsGm1OgwJV
 DtMA==
X-Gm-Message-State: AOAM530I+5EciOvp4HxHFTDcVF52CR/p53jzGSNX5FPay+2lEf0D3gX1
 uVcDinrKEgV595CZ+orGlky0mK8oqKo3kA5mGVBFluU9+Tla3TdPlYx2kURMZXLlCXY0JqzTuRY
 MenoUWKS1YbC2gdA=
X-Received: by 2002:a05:6000:184c:: with SMTP id
 c12mr13118611wri.52.1627366127013; 
 Mon, 26 Jul 2021 23:08:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtguqZdW1AWxa80CKKPIcypNvSSNc6XaDAI3USGtc5eyIjQJ812VjMpq2BD+nzf8tqaowMiw==
X-Received: by 2002:a05:6000:184c:: with SMTP id
 c12mr13118601wri.52.1627366126871; 
 Mon, 26 Jul 2021 23:08:46 -0700 (PDT)
Received: from thuth.remote.csb (pd9575250.dip0.t-ipconnect.de. [217.87.82.80])
 by smtp.gmail.com with ESMTPSA id l3sm1592489wmq.2.2021.07.26.23.08.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 23:08:46 -0700 (PDT)
Subject: Re: [PATCH-for-6.1 v4 3/4] gitlab-ci: Fix 'when:' condition in EDK2
 jobs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210726150429.1216251-1-philmd@redhat.com>
 <20210726150429.1216251-4-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c1caf8a1-e630-17a7-385c-8a3b24db0f94@redhat.com>
Date: Tue, 27 Jul 2021 08:08:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210726150429.1216251-4-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/07/2021 17.04, Philippe Mathieu-Daudé wrote:
> Jobs depending on another should not use the 'when: always'
> condition, because if a dependency failed we should not keep
> running jobs depending on it. The correct condition is
> 'when: on_success'.
> 
> Fixes: 71920809cea ("gitlab-ci.yml: Add jobs to build EDK2 firmware binaries")
> Reported-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   .gitlab-ci.d/edk2.yml | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/.gitlab-ci.d/edk2.yml b/.gitlab-ci.d/edk2.yml
> index aae2f7ad880..62497ba47fb 100644
> --- a/.gitlab-ci.d/edk2.yml
> +++ b/.gitlab-ci.d/edk2.yml
> @@ -8,11 +8,11 @@
>      - .gitlab-ci.d/edk2/Dockerfile
>      # or roms/edk2/ is modified (submodule updated)
>      - roms/edk2/*
> -   when: always
> +   when: on_success
>    - if: '$CI_COMMIT_REF_NAME =~ /^edk2/' # or the branch/tag starts with 'edk2'
> -   when: always
> +   when: on_success
>    - if: '$CI_COMMIT_MESSAGE =~ /edk2/i' # or last commit description contains 'EDK2'
> -   when: always
> +   when: on_success
>   
>   docker-edk2:
>    extends: .edk2_job_rules

Reviewed-by: Thomas Huth <thuth@redhat.com>


