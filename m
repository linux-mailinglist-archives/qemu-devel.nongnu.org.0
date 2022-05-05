Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E65F651C555
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 18:48:18 +0200 (CEST)
Received: from localhost ([::1]:50574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmeeH-0002lk-RM
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 12:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmeM2-0006Kr-E6
 for qemu-devel@nongnu.org; Thu, 05 May 2022 12:29:27 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:35356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmeLz-0008IG-R5
 for qemu-devel@nongnu.org; Thu, 05 May 2022 12:29:25 -0400
Received: by mail-oi1-x234.google.com with SMTP id m25so4870946oih.2
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 09:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gwkJCDBSgsJNRJyRzJ8I6W2s35I1SuP2n4jEM9X9xXA=;
 b=sJYhr0IpgWe2iyJ5qjILOltXeGAAcI+0US8IHBeDDmMBDrP9GEo2sznt64WMTNRrPJ
 p7307h1jg9dZAkJe7o1BunNbcML6T7LKypr0D6UXiMI+ZEJ0JeD64pOh2jG6z0kwY+Gg
 cvzqxkAhuUKw7BeMkQ0kXmqXfCab14nEfB2drxloTL3MxplI6Km6WOtNqLAvqLXf2Pf0
 2PDWJd5H5wbh7vXMNrgxaxkVFK2P1DSTjUKibyK0FsINYKa9DlK5BJo+er0RDF4KLKjm
 0Wuiu7i2gelFevilwUPSTBZeOcf6EKeClt9toqLML9rmHoAVgvvxf+oo4ugsu2F8PpyL
 HQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gwkJCDBSgsJNRJyRzJ8I6W2s35I1SuP2n4jEM9X9xXA=;
 b=0Ykd9HpUkDg0jrzppWeBT8DCbfFH2996rocnHo8TJ3/bdZtRYNLeATlJtAb/iOGv3x
 tdrCBk5Yrb1bDqFZ9+gCtdGXgHFpuomKp3/rmSXSCMrya44OZLYqmWf+4J8x2U6ayXbd
 snVpMIVu8RbsVpBDhO00uzqGYGCImTBme+4kFR+w1E6S7px+bLaNRRzJcr2+QIla01cz
 703rMP5eSOGe+YFeqae9F5o7L8Ptku9Ffbg5TiY4hJoktpKU0kqKb+UOLxK2/5v46HaY
 C6vm7v7ao23LRqE1EJ8qowyF1lURRvFrFUOf2yBGn3mf1phEJGXPYegaqBNvSFhrMDej
 cRuA==
X-Gm-Message-State: AOAM53149eFktyOGoNDXIHDNUuC+v240aPvl95M3h4ZpxB4JgJ4bv877
 Pci+3nTKLaFCdRD5woQKW9eLzQ==
X-Google-Smtp-Source: ABdhPJxsznH7aB0Ct6B83nxwz7DOHwLPaBSQ2i3slWgDNMwVZwKHVQJwh18e/yMoNJtFnc8kyOXMug==
X-Received: by 2002:a54:4119:0:b0:325:a6dc:efae with SMTP id
 l25-20020a544119000000b00325a6dcefaemr2820669oic.100.1651768162662; 
 Thu, 05 May 2022 09:29:22 -0700 (PDT)
Received: from ?IPV6:2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6?
 ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 x35-20020a4a97e6000000b0035eb4e5a6d2sm904545ooi.40.2022.05.05.09.29.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 09:29:22 -0700 (PDT)
Message-ID: <ae41daa5-4c10-b805-59e5-442c43876036@linaro.org>
Date: Thu, 5 May 2022 11:29:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 0/3] Block patches
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
References: <20220505084208.2338968-1-stefanha@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220505084208.2338968-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/5/22 03:42, Stefan Hajnoczi wrote:
> The following changes since commit 9cf289af47bcfae5c75de37d8e5d6fd23705322c:
> 
>    Merge tag 'qga-pull-request' of gitlab.com:marcandre.lureau/qemu into staging (2022-05-04 03:42:49 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/stefanha/qemu.git tags/block-pull-request
> 
> for you to fetch changes up to bef2e050d6a7feb865854c65570c496ac5a8cf53:
> 
>    util/event-loop-base: Introduce options to set the thread pool size (2022-05-04 17:02:19 +0100)
> 
> ----------------------------------------------------------------
> Pull request
> 
> Add new thread-pool-min/thread-pool-max parameters to control the thread pool
> used for async I/O.
> 
> ----------------------------------------------------------------
> 
> Nicolas Saenz Julienne (3):
>    Introduce event-loop-base abstract class
>    util/main-loop: Introduce the main loop into QOM
>    util/event-loop-base: Introduce options to set the thread pool size
> 
>   qapi/qom.json                    |  43 ++++++++--
>   meson.build                      |  26 +++---
>   include/block/aio.h              |  10 +++
>   include/block/thread-pool.h      |   3 +
>   include/qemu/main-loop.h         |  10 +++
>   include/sysemu/event-loop-base.h |  41 +++++++++
>   include/sysemu/iothread.h        |   6 +-
>   event-loop-base.c                | 140 +++++++++++++++++++++++++++++++
>   iothread.c                       |  68 +++++----------
>   util/aio-posix.c                 |   1 +
>   util/async.c                     |  20 +++++
>   util/main-loop.c                 |  65 ++++++++++++++
>   util/thread-pool.c               |  55 +++++++++++-
>   13 files changed, 419 insertions(+), 69 deletions(-)
>   create mode 100644 include/sysemu/event-loop-base.h
>   create mode 100644 event-loop-base.c
> 

This appears to introduce a new error on msys2-64bit:


14/85 qemu:unit / test-aio                                          ERROR           2.14s 
   exit status 3
 >>> MALLOC_PERTURB_=82 G_TEST_SRCDIR=C:/GitLab-Runner/builds/qemu-project/qemu/tests/unit 
G_TEST_BUILDDIR=C:/GitLab-Runner/builds/qemu-project/qemu/build/tests/unit 
C:/GitLab-Runner/builds/qemu-project/qemu/build/tests/unit/test-aio.exe --tap -k
------------------------------------- 8< -------------------------------------
stderr:
(test program exited with status code 3)

https://gitlab.com/qemu-project/qemu/-/jobs/2418935125

Are you in a position to test this yourself locally?


r~

