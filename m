Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74348423B16
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 11:53:55 +0200 (CEST)
Received: from localhost ([::1]:46252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY3cY-0007Tn-2l
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 05:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1mY3au-0006Ro-Ua
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 05:52:13 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:36461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1mY3as-0006sn-98
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 05:52:12 -0400
Received: by mail-pf1-x429.google.com with SMTP id m26so1904290pff.3
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 02:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/TEy7Ltq8ohpp7GM/CKfVFgOP5X/5LUgJytR/YkGnVA=;
 b=ArBGzSolETdiRbgkF6BN8N4xe7zryhKxB0hL792vYGvLUTzft7F2ySxANy9osyjGzV
 0Lp1hU1Z1+YVucYYCvlYmvq8XbYoNm2iV/UIetPKz3oQ3vkPs1qytp9vjZacrGqVsSTB
 K2Fs7YdLNwq7+7toT1cBHFpKrXscW0jYppN6Bx3rT94HPn/CnQSzYP61a7DfbegZgDio
 7vR4j2UMblru++Zvgw1lLjExeQE2FySFGQtW0T2UmaQSLA0ozr9vry/ZXwNlourAHZsr
 4Z6S3PFHTDTA4d1Ftp9PSwDD36IlKjl7hHMnf29ydg5YWfj6zWhTi5RCSjyWyjSRnuWx
 1whA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/TEy7Ltq8ohpp7GM/CKfVFgOP5X/5LUgJytR/YkGnVA=;
 b=uzi201HV0ybKpQmpYp+h9QcSlY74nNzFIyQhY4c2CxbSdlMNJq4OhQmnP2FwZgHMEX
 qNnLK0Gh+mrvsQCKwz6Yo8ga1rRxN2CSefcCvOpfk0bfUptMQzyG76S1hr4dSAp5I+N7
 OpopN5USRsLQTs2HbFi73sMK+EkPjyuJwAzah2/SxDXw4RMlk2/c6a++hHOOsHAJxAbC
 4XZz3kqvN/QFfnPEyBSbPzqfM1xcnSmZopbvhHUe0EySShTW8A9CPwyoMR/gwWR7nh1k
 JVivIlxfFe5OiFdwnHeU+4MVJ5MksCmSkga4ged9xOoi3j59WAIYs+re6Z4LPHGxIMjS
 +nqw==
X-Gm-Message-State: AOAM5310RW6UjYFX608AMViqQdNlmkZj6DmqbEnVYOMEHsCt5RkhvZux
 0CC/hvPOFJKH0cv2uBM8PEHgqg==
X-Google-Smtp-Source: ABdhPJw6nqSaFcYQO3lWVJvGXltAC24ZzoSKXtQcOh/AnJ86iYEmgRjl+uT8ZIRck/xYle2XqDlR2Q==
X-Received: by 2002:a65:6213:: with SMTP id d19mr19934940pgv.110.1633513927193; 
 Wed, 06 Oct 2021 02:52:07 -0700 (PDT)
Received: from [192.168.10.23] (124-171-108-209.dyn.iinet.net.au.
 [124.171.108.209])
 by smtp.gmail.com with ESMTPSA id j9sm20293642pfi.121.2021.10.06.02.52.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 02:52:06 -0700 (PDT)
Message-ID: <20dda3d9-7830-a67a-3a9f-caa69634dea4@ozlabs.ru>
Date: Wed, 6 Oct 2021 20:52:00 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:93.0) Gecko/20100101
 Thunderbird/93.0
Subject: Re: [PATCH v3 0/7] Reduce load on ppc target maintainers
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <YVUPrnvWT80f7IxR@yekko>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <YVUPrnvWT80f7IxR@yekko>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=aik@ozlabs.ru; helo=mail-pf1-x429.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 dbarboza@redhat.com, mark.cave-ayland@ilande.co.uk, groug@kaod.org,
 wainersm@redhat.com, hpoussin@reactos.org, clg@kaod.org, crosa@redhat.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 30/09/2021 11:15, David Gibson wrote:
> On Mon, Sep 27, 2021 at 02:48:01PM +1000, David Gibson wrote:
>> Greg Kurz and myself have been co-maintainers for the ppc and ppc64
>> targets for some time now.  However, both our day job responsibilities
>> and interests are leading us towards other areas, so we have less time
>> to devote to this any more.
>>
>> Therefore, here's a bunch of updates to MAINTAINERS, intended to
>> reduce the load on us.  Mostly this is marking fairly obscure
>> platforms as orphaned (if someone wants to take over maintainership,
>> let me know ASAP).  Bigger changes may be coming, but we haven't
>> decided exactly what that's going to look like yet.
> 
> Thanks for the feedback and acks on this.  I'm now merging v3 into
> ppc-for-6.2 to go into a pull request shortly.
> 
>>
>> Changes since v2:
>>  * Clarified overly broad TCG CPUs entry
>> Changes since v1:
>>  * Reworked how OpenPIC is listed
>>
>> David Gibson (7):
>>   qemu: Split machine_ppc.py acceptance tests
>>   MAINTAINERS: Remove machine specific files from ppc TCG CPUs entry
>>   MAINTAINERS: Remove David & Greg as reviewers for a number of boards
>>   MAINTAINERS: Orphan obscure ppc platforms
>>   MAINTAINERS: Remove David & Greg as reviewers/co-maintainers of
>>     powernv
>>   MAINTAINERS: Add information for OpenPIC
>>   MAINTAINERS: Demote sPAPR from "Supported" to "Maintained"
>>
>>  MAINTAINERS                          | 51 ++++++++------------
>>  tests/acceptance/machine_ppc.py      | 69 ----------------------------
>>  tests/acceptance/ppc_mpc8544ds.py    | 32 +++++++++++++
>>  tests/acceptance/ppc_pseries.py      | 35 ++++++++++++++
>>  tests/acceptance/ppc_virtex_ml507.py | 34 ++++++++++++++
>>  5 files changed, 121 insertions(+), 100 deletions(-)
>>  delete mode 100644 tests/acceptance/machine_ppc.py
>>  create mode 100644 tests/acceptance/ppc_mpc8544ds.py
>>  create mode 100644 tests/acceptance/ppc_pseries.py
>>  create mode 100644 tests/acceptance/ppc_virtex_ml507.py
I have a bunch of small patches for SLOF - what do I do with those now?
Still send pull requests to you and Greg as usual? Thanks,




-- 
Alexey

