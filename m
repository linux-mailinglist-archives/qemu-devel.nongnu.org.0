Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A940C361924
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 07:16:28 +0200 (CEST)
Received: from localhost ([::1]:59632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXGqB-0002yg-Qs
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 01:16:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXGp4-0002Fi-G2
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 01:15:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXGp0-00010t-M9
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 01:15:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618550114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aQaLQxLWKAKM5qt5BjLLriNNXQbbf7Lz+gWMLsjOGiw=;
 b=fPlWcYcApgqXWc/jO9+7dYejKViYSEqKk/OcBTgqK7Dkowp1UJbUXzsOpM9wrRa2wvFPMQ
 WJoYuHEELjfaA+lxqWolh3LFDrZAj7ysVsklL4BlTcHY7RqD1l99IeOTnwCVlftPqeSBxh
 L6J91KN3tZxzKW3LgoUCDBe+THzkG50=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-SPVlOJjOMjC_NREXNNWenQ-1; Fri, 16 Apr 2021 01:15:10 -0400
X-MC-Unique: SPVlOJjOMjC_NREXNNWenQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 v2-20020a0560001622b0290106e28f8af8so1315464wrb.9
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 22:15:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aQaLQxLWKAKM5qt5BjLLriNNXQbbf7Lz+gWMLsjOGiw=;
 b=NrwBRy5RIv7yCQNmQfCScqqEYLwvRlvevQN6RxzmOj4ZK8DHEh2ex7B2Dpuy5ITea8
 UESBinyeJVaSaPsqMI74g+KHIxoqKGPPqOTRfN42w0BGXRTknrGj+ExgkWq0wCq+5O88
 hwq7gUqunGjkREU7Mj82v1EdgucAlI7+72tjrWGy5686K4XlnZv/DdSbzlC6/WTE/K3P
 fvRUdmOWWo8u5s7M1vGOg3FDMtw12yoEd9V6jPTrx47aBsJQfZBKTAEza8bTmzY/yN+Y
 Sqd9J/K4XqMIAfJcGEFwzNokLXFNs4vZdye7b1MlfBOXv3ceyOEWrfgX7ZjjG8sjtFKW
 Hqfg==
X-Gm-Message-State: AOAM531hF4iFj5UxES/GOmMWvaIJCwKsq9RsRWzPClQB6bsOMGL5d3wF
 S2I8II+1UivWnc6d2nR2sQE5oB8Hmv0E2ZUV5KD3ujh+101zpzwdeW0fJgXEuDhnAj/CI/34rLQ
 DcNyXsQywkvpoulA=
X-Received: by 2002:a1c:9853:: with SMTP id a80mr6248342wme.44.1618550109277; 
 Thu, 15 Apr 2021 22:15:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzN0b+DGFYZvZt5cAnrQv9Uv7+s5x7NH8tF1RRZALQiC6AwzioyE9kxQbYm2CJdwoVOoljLZg==
X-Received: by 2002:a1c:9853:: with SMTP id a80mr6248318wme.44.1618550109101; 
 Thu, 15 Apr 2021 22:15:09 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u7sm6594776wmq.36.2021.04.15.22.15.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 22:15:08 -0700 (PDT)
Subject: Re: [PATCH 5/8] tests/acceptance/cpu_queries.py: use the proper
 logging channels
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210415215141.1865467-1-crosa@redhat.com>
 <20210415215141.1865467-6-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <28f2fd45-4ccd-2c9c-29d6-2de5f52bbc4c@redhat.com>
Date: Fri, 16 Apr 2021 07:15:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210415215141.1865467-6-crosa@redhat.com>
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
> The test contains methods for the proper log of test related

"The Test class ..."?

> information.  Let's use that and remove the print and the unused
> logging import.
> 
> Reference: https://avocado-framework.readthedocs.io/en/87.0/api/test/avocado.html#avocado.Test.log

This test predates Avocado 87.0 :) Maybe mention this is an update
to the recent API?

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/cpu_queries.py | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/tests/acceptance/cpu_queries.py b/tests/acceptance/cpu_queries.py
> index 293dccb89a..cc9e380cc7 100644
> --- a/tests/acceptance/cpu_queries.py
> +++ b/tests/acceptance/cpu_queries.py
> @@ -8,8 +8,6 @@
>  # This work is licensed under the terms of the GNU GPL, version 2 or
>  # later.  See the COPYING file in the top-level directory.
>  
> -import logging
> -
>  from avocado_qemu import Test
>  
>  class QueryCPUModelExpansion(Test):
> @@ -27,7 +25,7 @@ def test(self):
>  
>          cpus = self.vm.command('query-cpu-definitions')
>          for c in cpus:
> -            print(repr(c))
> +            self.log.info("Checking CPU: %s", c)
>              self.assertNotIn('', c['unavailable-features'], c['name'])
>  
>          for c in cpus:
> 


