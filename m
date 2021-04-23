Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F21F369CAC
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 00:32:18 +0200 (CEST)
Received: from localhost ([::1]:60692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la4LR-0001Dp-2P
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 18:32:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1la4Ja-0000gN-8H
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 18:30:22 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:46608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1la4JY-0007rY-Ka
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 18:30:22 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 k4-20020a7bc4040000b02901331d89fb83so1942703wmi.5
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 15:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=76AWketoc8xempM3KwYM2V6Hw12z5yjXbxiTK//tRFs=;
 b=hrkbtL/h+N3hYOT75PS8u5YK02vND3iRsFXH9BuphrWzH+kc/Of5FoCWTPuM7+ucsc
 hfHf1f2dEfeJfTv87GZVD3oS7AoWjmnU6gfVlit7VPXeikueYcVPxdRIViWEznbgCjXx
 cpudFZv9M6gKhpDhlt9ZkxHq23U+w7leCdm1H/BTQljKywA4eEDlKAWk80oUBXuewQjb
 tt1l4/BoS5v8nEO+NIQGAeHnkrXXpyk1+PAlHnULBPImog5+MgSrKdLpc+UnMNKxpDLZ
 dtRwxGv14OUuyS9CeMt9oTfFIljhIzJMlGuoDHA2OFGwyw8NTWlL8O460gSFEaT1CBE4
 lUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=76AWketoc8xempM3KwYM2V6Hw12z5yjXbxiTK//tRFs=;
 b=LUfuwRXJcEF2jAheWNvikKCiBpcYWDweN35t402DCqmiSplRLuzUBTq0j6QGhmbwvy
 vwN8lJvpUASTb95d/EPfoTBAhGyYihvNA5JxtrIjRfl2Nfyt/voIcBB/bS9Ra4PKQEUV
 XBjQ6meDPEIEcUKlGX4XiNtB+pjZvAgT/RIvbd7GpEwBOSh128+SiBRJvz7R9tZ31D0M
 /UFmnZOFdxoMK89QznXK30bN6H9Pndrh7RAye29OFzdzQGfGX4dMYQ2fzcW+mCTktPHy
 +7KFDxhHmj9fBW7BSmkg6MYN/PsyPEcdaWnnE0eXM4EbEBTrwffDXlMnc5HqL6CR4z9j
 LOPQ==
X-Gm-Message-State: AOAM531vUey6zqUQWLOySyiVQEj0Z/A3hkMqf30f6WKuJm5mArQb3K8g
 Jl5KTYq0+vkLZVfxnr6CXsg=
X-Google-Smtp-Source: ABdhPJwwpAw8VGuHvfM0yvqVxUYDHxtaSlDjO4kTaHDyzEzoKr5w3zYsr77f9s07PLRZszpXaf92dw==
X-Received: by 2002:a1c:f708:: with SMTP id v8mr7946898wmh.133.1619217018728; 
 Fri, 23 Apr 2021 15:30:18 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id g12sm10734474wru.47.2021.04.23.15.30.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 15:30:17 -0700 (PDT)
Subject: Re: [PATCH v1 10/25] tests/docker: Added libbpf library to the docker
 files.
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210419145435.14083-1-alex.bennee@linaro.org>
 <20210419145435.14083-11-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <42247cc3-81b7-e2d9-48a2-32dd8a28b21e@amsat.org>
Date: Sat, 24 Apr 2021 00:30:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210419145435.14083-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: fam@euphon.net, Andrew Melnychenko <andrew@daynix.com>, berrange@redhat.com,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 4:54 PM, Alex Bennée wrote:
> From: Andrew Melnychenko <andrew@daynix.com>
> 
> The series of patches for eBPF RSS adds libbpf dependency for qemu.
> https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg08887.html
> 
> With this patch, libbpf added:
>   Alpine - added libbpf-dev
>   Centos 8 - added libbpf-devel
>   Fedora - added libbpf-devel
> 
> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210406082947.672708-2-andrew@daynix.com>
> ---
>  tests/docker/dockerfiles/alpine.docker  | 1 +
>  tests/docker/dockerfiles/centos8.docker | 1 +
>  tests/docker/dockerfiles/fedora.docker  | 1 +
>  3 files changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

