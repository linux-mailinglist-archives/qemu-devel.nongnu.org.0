Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CABA05AD606
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 17:17:50 +0200 (CEST)
Received: from localhost ([::1]:33958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVDrB-000390-FL
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 11:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVDpR-0001kW-Pz
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 11:16:01 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:37665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVDpP-0007qX-Sx
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 11:16:01 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 o2-20020a17090a9f8200b0020025a22208so5235297pjp.2
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 08:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=VSEO83ka7nAzDC+mhrit8jtZFN0wIDMg5gDYuq0mR38=;
 b=Jcz2HAlvb+WDkEKzxctgddSBTXuqOD71BYaofV/tcl7qlLGt4/hL+1u7nnh0m6IjHp
 uV7CUDMl8W+py4NE9ZjfURT3EiNuWVYoQAwq0EL+kG58rbsMEf8wAyPUUqCUeiXD5atw
 uRLlSAMgkVkjWm7+qJjrbhNL8UhPO9Ge5C7DG2h2Qa+hcmJH+fRhDQg6RZwaX41nyiBb
 oVFY/kWeJSS6Q74PgdCsxjkioBSKKFgk6OHHDoY3YkrCYLVUZ0tpEupAAllGygi7NJOq
 SUOFDUjYalg9ZPHOQbzMCvVqnk25OKYIPVloIiJouvk2e0tzeeW+lrgsBln5JRo5tNpI
 CNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=VSEO83ka7nAzDC+mhrit8jtZFN0wIDMg5gDYuq0mR38=;
 b=kNzBJTF5ZJ51SlykLwPkAnVJyLxyEujsg9PTZMmobt9/oZZInntGh7UoiU5FeqcBqt
 crpiqUvbv2eWgAWaRMBwMbKsBl1hiiI4BeQ9zHpnKqbwUMBx6wWTk4keSsOt3tYtxHtY
 KxuIjW4+tY9UkI5X9FwxZXDhMOg+zHveylooQMWgXsPanT34wh0/ALK/vchi/qyI0y5S
 qS6Q8JuySSheO+4VBDvtToikSmjQEGfYVR4x0X5CpsKLW1323t/dbD6/GZDhITqF0DyZ
 mL9u/Aon0wJMwJudcmfah/otnfQEKHH+8ams6xJTs8mfsjxey0g/pyuangsamlsKrhxc
 jX6g==
X-Gm-Message-State: ACgBeo3glGqQW6Rye714efKhCvGtzyGJwmcdTo6lDWmMf2pDEMIszLT1
 o3JIrnlJevac3Pa8gVDKAfE=
X-Google-Smtp-Source: AA6agR42U4wiLnwlrGLoK3uC7Dd+Ulf4hg4VB4WOgooNDqLhMEJAr4RDIrVvRvH3ahiapWa4oaa00Q==
X-Received: by 2002:a17:90b:3912:b0:1fe:34a0:e74c with SMTP id
 ob18-20020a17090b391200b001fe34a0e74cmr20451143pjb.233.1662390958523; 
 Mon, 05 Sep 2022 08:15:58 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 cp10-20020a170902e78a00b00173368e9dedsm7610340plb.252.2022.09.05.08.15.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 08:15:57 -0700 (PDT)
Message-ID: <26416dce-d677-81c4-209a-2e3d318d6339@amsat.org>
Date: Mon, 5 Sep 2022 17:15:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v2] 9pfs: use GHashTable for fid table
Content-Language: en-US
To: Linus Heckemann <git@sphalerite.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220903150327.2780127-1-git@sphalerite.org>
 <20220905150300.3794196-1-git@sphalerite.org>
In-Reply-To: <20220905150300.3794196-1-git@sphalerite.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.716,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 5/9/22 17:03, Linus Heckemann wrote:
> The previous implementation would iterate over the fid table for
> lookup operations, resulting in an operation with O(n) complexity on
> the number of open files and poor cache locality -- for every open,
> stat, read, write, etc operation.
> 
> This change uses a hashtable for this instead, significantly improving
> the performance of the 9p filesystem. The runtime of NixOS's simple
> installer test, which copies ~122k files totalling ~1.8GiB from 9p,
> decreased by a factor of about 10.
> 
> Signed-off-by: Linus Heckemann <git@sphalerite.org>
> ---
>   hw/9pfs/9p.c | 130 +++++++++++++++++++++++++++------------------------
>   hw/9pfs/9p.h |   2 +-
>   2 files changed, 69 insertions(+), 63 deletions(-)

Watch out to iterate the version when respining patches:

"Send each new revision as a new top-level thread, rather than burying 
it in-reply-to an earlier revision, as many reviewers are not looking 
inside deep threads for new patches."
https://www.qemu.org/docs/master/devel/submitting-a-patch.html#when-resending-patches-add-a-version-tag
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

