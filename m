Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3275EE369
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 19:47:18 +0200 (CEST)
Received: from localhost ([::1]:41708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odb9R-0002zh-HM
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 13:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1odaVw-0007WR-DY; Wed, 28 Sep 2022 13:06:28 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:38483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1odaVu-00058n-Po; Wed, 28 Sep 2022 13:06:28 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so3140600pjq.3; 
 Wed, 28 Sep 2022 10:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=16HaHZvB0vxg8Znv7gEtKphkz2MuTWpphkvN7xiG+1w=;
 b=U6yP/4Nx8IdlntrMACtfh3yeSpvabOZFEQe4OCt46cUq3fHNJsUDg0/4CANx/IiUbR
 OyKTOmOygCckgiqglpq5nJ/qw5+LbXABsgGsm+bvX+3f1vqZ8AyQk7+JggyBIUEw9l40
 o3M1VSGB7iIT+qyJXRX5ui5INFyeFR+x1fd/DDCgsdU8bAfOmAORAdCoekwzsJVD5irk
 JAilhzh9SXBjL1PLtRW5jJAZvyWWs5fqUo1t3qxRkFq/XEmaErbQEC+uCp0mYPjVMwMk
 ORWgSjpyywll6Yl8NHMtwm8iSzYwNjEb+JxCrymTj/9KCy7L/seBzrniWvnJ8/93tK44
 AEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=16HaHZvB0vxg8Znv7gEtKphkz2MuTWpphkvN7xiG+1w=;
 b=7nm0AyYu5RmNbrXvkQkMw8lbYUls8Ky1+Y6+DEpffUsNLoB4z8KVH5weeVfhS1bvKp
 jZipQFR7ub94s+84ofE6ItZR3lTMjmwWnPi301tZNJn9+jgUJQyccQVYALkoQ+stpNai
 NB6KHtbS6olFoLmvmIhS9qkQQIaIz+ZjmKhsTlSfaQkZwj5u3vB8tkdoXiPm0QQlhf96
 5ZY2g7rQng6RPnGXc0jyYtBmjm9ml/5fK9Xys/CDEf8O69VE3huD+fPU4lb5MB91+eK9
 22zlfVIbsCZo2YsXcJqDc04Nlt/YdeSx1AeLxVUoZx2xiUXsw1yheAsY6Mge454UjQSf
 WQbQ==
X-Gm-Message-State: ACrzQf1BAAhi82MZxoySLWT4Xgtfdsx7YbJj2tgxWAAUNF7gAZqb5YnC
 VrEkwDkQzTxguKK755bX5ec39Nd8/5I=
X-Google-Smtp-Source: AMsMyM4nDuBiiRBw3T2qqQ9z+05M1KgFtp1fKRdjhnN+yrpf5u3IedW8L//GV7mnp2kAeqhRdvxycw==
X-Received: by 2002:a17:90b:364e:b0:205:d43a:f5ef with SMTP id
 nh14-20020a17090b364e00b00205d43af5efmr11431516pjb.60.1664384784317; 
 Wed, 28 Sep 2022 10:06:24 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 13-20020a170902c20d00b00177e5d83d3esm4014261pll.88.2022.09.28.10.06.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 10:06:23 -0700 (PDT)
Message-ID: <93033078-221d-23d2-23e7-13eab59cd439@amsat.org>
Date: Wed, 28 Sep 2022 19:06:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: If your networking is failing after updating to the latest git
 version of QEMU...
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-discuss <qemu-discuss@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <a7da7e40-6f7b-79a4-709b-da0e71def650@redhat.com>
In-Reply-To: <a7da7e40-6f7b-79a4-709b-da0e71def650@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.319,
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

On 28/9/22 10:27, Thomas Huth wrote:
> 
> ... it might have happened due to the removal of the "slirp" submodule 
> from the git repository. For example if you see an error message like this:
> 
>   Parameter 'type' expects a netdev backend type
> 
> this likely means that the "user" mode backend type is not available in 
> your binary anymore. To fix it, simply install "libslirp-devel" (or 
> libslirp-dev or however it is called) from your OS distribution and 
> recompile.

Thanks for the hint Thomas. I'm afraid many developers will miss your
email.

Jason, Marc-André, could we improve the buildsys check or display
a more helpful information from the code instead?

Thanks,

Phil.

