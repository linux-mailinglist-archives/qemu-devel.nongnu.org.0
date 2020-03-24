Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F9F191557
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 16:51:45 +0100 (CET)
Received: from localhost ([::1]:51122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGlqC-0003o7-7q
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 11:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41221)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jGlpN-0003If-57
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 11:50:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jGlpL-0007nb-T5
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 11:50:52 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:36008)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jGlpL-0007mw-IM
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 11:50:51 -0400
Received: by mail-pj1-x102a.google.com with SMTP id nu11so1619639pjb.1
 for <qemu-devel@nongnu.org>; Tue, 24 Mar 2020 08:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eSVbIg6x3AEUYOba3BSh/q8fW0W+tNUPLoN4le5KbfI=;
 b=x5hXsmn/uSL4L4BL7yV8j+di7L4pj9ae1zY/GaclSCU4XmrcGZp7jhvqs2McLfoREB
 iido2AdxKanYnfK7z9fEki8i736WGEJFNqu2iu53UM5Gg1Oj3byQXiCSgeOILHgscgNC
 KYsHcXr+O2qGN/VCBy4m0Ujrtrfo8GWbPNv1qZCrh0uqsFq3/Y7HizEUZF352v9Nht8c
 sZYWcYTFwO+UZd8wj0HVntHD3fpMubVUu2JjAfR3FjgF9jIZSaf5pDiu6LCYkNMmBGF2
 cpG8bFVA8eeNe6mo5fiTaJQjwSU2Qs89vFYkU2R8J4RiX+Q81MShJG3T2Z6lLDioVEDw
 ZTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eSVbIg6x3AEUYOba3BSh/q8fW0W+tNUPLoN4le5KbfI=;
 b=LdjYLiiy5D3xWP0EWE9ohxZ3Z18tLC+BZ1KMA29QBNrG8q3YR5a4EUIAZdu0dLIoXM
 QroZpR8pQ+Mk19dSQTAk2lstbcuftjbZZtWE8krXG2mumsrA48g28dMf9yunBD43B4Wn
 ca8NAS9G3PK4ICzN1X5VCnYCQH/s8cFDiW++ZllKRSZL4kRRrtqxi+Wbto2TivWAuuDL
 69mwLmbfIkfDu1lKWsQ4mWzmPJUdGIH+h31HBmafGj6NdLx8v6zqRoNQx1VVXvZ4v0Cr
 h8/fjIQfK9uNVJv+WBrsFdwq9q0VX2Y7WMjjBmO5t+hIfRyRPW0lG4z38kT2xI/rxY8N
 9Hmg==
X-Gm-Message-State: ANhLgQ0VOvmwGq2OsIYGjez96u1BFsog1ZwalzzPPE10pPA5A2f3XZB6
 TnAM2DAumvr4Ugei90dLYXSAag==
X-Google-Smtp-Source: ADFU+vtI36Bel1rCSXvPXfi6o1Ov9T00BN8RcBscHZR76Kok1ru4QciJmiHW+cS4mItHDBldAi5lIQ==
X-Received: by 2002:a17:90a:ad45:: with SMTP id
 w5mr6147090pjv.179.1585065050032; 
 Tue, 24 Mar 2020 08:50:50 -0700 (PDT)
Received: from [192.168.1.11] (174-21-138-234.tukw.qwest.net. [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id k5sm2496342pju.29.2020.03.24.08.50.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2020 08:50:49 -0700 (PDT)
Subject: Re: [PATCH for-5.0 0/6] Several error use-after-free
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20200324153630.11882-1-vsementsov@virtuozzo.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6aabd257-d9fd-7511-fd49-6e746a5fd43b@linaro.org>
Date: Tue, 24 Mar 2020 08:50:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200324153630.11882-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::102a
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
Cc: kwolf@redhat.com, zhang.zhanghailiang@huawei.com, qemu-block@nongnu.org,
 quintela@redhat.com, armbru@redhat.com, dgilbert@redhat.com,
 marcandre.lureau@redhat.com, den@openvz.org, mreitz@redhat.com,
 jsnow@redhat.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/20 8:36 AM, Vladimir Sementsov-Ogievskiy wrote:
> Vladimir Sementsov-Ogievskiy (6):
>   scripts/coccinelle: add error-use-after-free.cocci
>   block/mirror: fix use after free of local_err
>   dump/win_dump: fix use after free of err
>   migration/colo: fix use after free of local_err
>   migration/ram: fix use after free of local_err
>   qga/commands-posix: fix use after free of local_err

Whole series:
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

