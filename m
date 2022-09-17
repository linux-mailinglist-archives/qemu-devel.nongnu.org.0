Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 634915BBA22
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 21:33:54 +0200 (CEST)
Received: from localhost ([::1]:40212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZdZY-00084Q-Uf
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 15:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZdXP-0006de-Lu
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 15:31:39 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:44004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZdXN-0002j0-SS
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 15:31:39 -0400
Received: by mail-pg1-x52a.google.com with SMTP id v4so23310906pgi.10
 for <qemu-devel@nongnu.org>; Sat, 17 Sep 2022 12:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=PjGqcCLyTYRul6d3IpZzlUcIFkEhqkcsCbb7Iu+Tm2w=;
 b=ikuw4L1atbVP0bBsSTYx1TP1++OFSOozHN10Ugj9hGLhoSamczvJzMZ0TcWFw+SGVy
 FfJMnOQ194CVLxqmYPJ176jjFFEUNopRrOmN9R0lvZlKudGYT0w/vhkpaX5PmH+8YEZi
 4wVmZWT2sU25ZmzeZW6DjcdVa/bjgn/923tKVv/SanQ8gdVO3l8mHeE/RFvngqMR2BtH
 IO1VvSRkILHRvjRcwMjeHN4tZQoT99Ma8Zx6iF5kKC9rB1ug78AyzstZg+cZXA4OiAiE
 TZyfjPAKyxrDcGtoWdTndIylJ5hEzRg6xm0UxSmGc+YNttCJCpOLxL7PjEcNF8y/y6O9
 f/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=PjGqcCLyTYRul6d3IpZzlUcIFkEhqkcsCbb7Iu+Tm2w=;
 b=OUQBuhr+qI9X9tvsBc58HyZxB02nl82xJTIStpV4bhX4NpzAlwxWREN+VWErYVU8eB
 CLQCiAXtBLJBWttiLnPHPw39qTn38I1RyzvsbO6zFfGhNv9eG9xlMm8iuw0xDRz8KCP0
 FtX6+VYRudmGZnnI4WrTyGOtk2/TyuPTAh26c5/JAZlaKephq9tftavl/TOkbdR5RUm6
 Rq9bpdTPuRMtj5u62QYjbMqOwEsY89DV6cvwJbwSgI3ktZBxizRtD/QcyMQBjP1g0mgk
 q8WTBb1Aw7FxC67hurI4B1GMQ+Drk/56KPspaKuxbDiu0emqLeO2RnEdM3vGKWOl7i8X
 ae7w==
X-Gm-Message-State: ACrzQf0+myChOjtNQqOHYUYMw0ZPeTwbiQhzMjlI4H7gKGakJXwqB2hc
 dBhAPPuvbXo+c85WBKwQx3w=
X-Google-Smtp-Source: AMsMyM7cUXOZ8twnkJfTyrmXAug4FZDn/wyElaxjG719IhQTUc2k3XYqjYBKOARms43uMY+ZaPWk2A==
X-Received: by 2002:a05:6a00:ad4:b0:547:8ed2:e41e with SMTP id
 c20-20020a056a000ad400b005478ed2e41emr11531825pfl.3.1663443096235; 
 Sat, 17 Sep 2022 12:31:36 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k29-20020aa7973d000000b00537ff911a89sm16846685pfg.105.2022.09.17.12.31.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 12:31:35 -0700 (PDT)
Message-ID: <467e4795-31ea-54b7-1735-ef5c2857ca5f@amsat.org>
Date: Sat, 17 Sep 2022 21:31:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PULL 00/12] linux-user patches
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>, Helge Deller <deller@gmx.de>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>
References: <20220913191321.96747-1-deller@gmx.de>
 <CAJSP0QWfUhRVhRJ7og1ntfbrjdpcuU31xRnUNWTOBhshpP8cTQ@mail.gmail.com>
In-Reply-To: <CAJSP0QWfUhRVhRJ7og1ntfbrjdpcuU31xRnUNWTOBhshpP8cTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.529,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 17/9/22 16:26, Stefan Hajnoczi wrote:
> The close_range(2) man page says:
> close_range() first appeared in Linux 5.9.  Library support was added
> in glibc in version 2.34.
> 
> The qemu-user GitLab CI jobs are failing. For example, see
> https://gitlab.com/qemu-project/qemu/-/jobs/3043629417:
> 
> ../linux-user/syscall.c:8734:26: error: implicit declaration of
> function 'close_range' is invalid in C99
> [-Werror,-Wimplicit-function-declaration]
> return get_errno(close_range(arg1, arg2, arg3));
>                             ^
> 
> There is a second issue with this pull request:
> ../linux-user/syscall.c:357:16: error: ‘pidfd_getfd’ defined but not
> used [-Werror=unused-function]
> 357 | _syscall3(int, pidfd_getfd, int, pidfd, int, targetfd, unsigned
> int, flags);
>         | ^~~~~~~~~~~
> ../linux-user/syscall.c:251:13: note: in definition of macro ‘_syscall3’
> 
> See https://gitlab.com/qemu-project/qemu/-/jobs/3043629434.

Hmm apparently this PR hasn't been reviewed (although the patches were
on the list for 2 weeks).

The 'check DCO' job - looking for S-o-b tags -  is green: 
https://gitlab.com/qemu-project/qemu/-/jobs/3043629425.
Should we complete it by a R-b/A-b check over the commit range?

