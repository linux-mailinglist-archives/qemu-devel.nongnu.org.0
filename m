Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D5231F902
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 13:06:52 +0100 (CET)
Received: from localhost ([::1]:57786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD4Yd-0000bY-K2
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 07:06:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lD4SR-00031q-OP
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:00:28 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:56029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lD4SO-0000Xz-RI
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:00:26 -0500
Received: by mail-wm1-x32f.google.com with SMTP id o15so6817646wmq.5
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 04:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1RTAy2sG164bBmthOpXL+Un99QPPb/V8q2L6sjByIoY=;
 b=lpM1eLq36BIZE6WcAc3ngve/b444W2HzZg98qTFJD8yHz5gsKno1FIOfXWuvY4BSGH
 HycgIJZ9lTif+9TVMy7rJFmAMGMs7HtMB9kT5JzLOQUnAUzJO3e5XCJDq9Fi9PTfM9eZ
 LIk3QJIwe6FOWxZBnhkLl53MTnDgA3MKe7T28xASTmYowmWewVC3VRT814/OEKGdzu0I
 3spLRw+cB3rlup1RH88RmYOdFVq/O4I6aHEpjuaqqtEOd71NIoYFttZJ/rrQoWDQ/Ivm
 PfSUWfkqI6ZvU2Ou7yQqJDsb8RRJPEw1cIoxwHq2qO325N2C8UdveruNViwfCBCCKCLk
 BWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1RTAy2sG164bBmthOpXL+Un99QPPb/V8q2L6sjByIoY=;
 b=HaN0gkt87DpCmU484oGCoQCcwMDS9lCzqdDk5yp/ygeD69qwmSfhtSJoe+1/KKhLGO
 j7jksTeyKyJLmgnx0oeKT8tke0mSQx6v9IdLVIfK0M2cZUcuqri7Vs9OWoCNfODkrK9p
 eC98mQxtIExse3pyhRujUAqQM2MM9BH060f1aRbyD9uJVlm7tjEOlVioU2tq4dkF1bA8
 KWW9MVeOTaJlnBUGJEkuXC25Cy+HWJxGL7g8wKLew8d/17kuq3p+xO/VzJJKIGRT6n4e
 YbXFoKH0kJem2mpnEU7KozWiMRFa9EshpSejhnBoBJGKUT19dIF1x2hAXJR+iFNy/7Gu
 TEcA==
X-Gm-Message-State: AOAM531zW/UVRs4mgIHjpWi8Ll099ioSLwMCbyrRmXy1niWxksfYzzeK
 ddn3UwmMs65RQTmVAkO5khI=
X-Google-Smtp-Source: ABdhPJxIaFmKecLHTWLWUbNlHpxgyz2wyUiNBv4yiCsP0QJM/FXqd6e/JNwhFSNbx69WhnTSIhLx4A==
X-Received: by 2002:a1c:dd09:: with SMTP id u9mr6150909wmg.183.1613736022826; 
 Fri, 19 Feb 2021 04:00:22 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u7sm12614049wrt.67.2021.02.19.04.00.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 04:00:22 -0800 (PST)
Subject: Re: [PATCH] gitlab-ci: Remove unused container images
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210219110950.2308025-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ca4a7cf3-c0b8-2074-d288-d402e5900cf9@amsat.org>
Date: Fri, 19 Feb 2021 13:00:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210219110950.2308025-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 12:09 PM, Thomas Huth wrote:
> We're building a lot of containers in the gitlab-CI that we never use.
> This takes away network bandwidth and CPU time from other jobs for no
> use, so let's remove them for now. The individual containers could be
> re-added later when we really need them.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.d/containers.yml | 92 -------------------------------------
>  1 file changed, 92 deletions(-)

I'm not enthusiast with this patch because I use various in this list
from time to time for testing or cross build/disas binaries. Not having
these containers used mainstream probably show the failure of the
project to add good testing coverage on these targets. Most of them are
for hobbyist with little time. Removing them will make it even harder
to add tests. Can't we keep them disabled? Or put them in manual mode?

Why is the CI rebuilding them, shouldn't them be cached or pulled from
the registry?
Maybe this show having all them in the same containers.yml file is not
good enough? Any suggestion for splitting it, so lowly used containers
don't get rebuild every time another often used one change the YAML
file?

Thanks,

Phil.

