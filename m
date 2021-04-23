Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BD4369C8E
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 00:27:06 +0200 (CEST)
Received: from localhost ([::1]:58168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la4GP-0008IS-Se
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 18:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1la4F1-0007i5-Af
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 18:25:39 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1la4Ez-0004jY-QY
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 18:25:38 -0400
Received: by mail-wr1-x435.google.com with SMTP id s7so49676158wru.6
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 15:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ptwUp30/1T4hPHhfSM03QEOf2tBVnnwmS5lXPjY3H9A=;
 b=qKP+PO6g4XZQ8R05kjllox2x5QcULqMrKR7wnRim2YzB2/5hdxFuXeVen4KQABqjOR
 XGl/acKwh8oekyzIlHMp6GC76/TfJS++/Gm4TYS4Zy1F8fQ9DywimBf1/tPOtSEMP7Bm
 sAo/Z2YbEnTdveZy5qgTYEMwM6VJ/xcXmkmq0n65HFaHWZgYsuYNV+VZfQFPATfaewuj
 hZrYSmmgFhGSsjbRag54aqqwvKSIc0mbE0/89zbTWDaugLi7GqcIi4J+tLesy2rMCynq
 nY3DvpjOs0VmVZYEpqb5Pl2gyhf/tJceKOlTmX03Hilmcbqav8DtQ4+79ABfDSTOeUDF
 g61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ptwUp30/1T4hPHhfSM03QEOf2tBVnnwmS5lXPjY3H9A=;
 b=C9PYQDLSsLSCMS2IGnSEJAGjQX11djhl6M7TYg00OUp+qjZ8N+Hnhvv+gbD4VrKxL2
 unONiNDlm4FuQntppN+agupB43FfI+Sqhf7qryNiuGuCaW7HHYXZsqRznlFlr1xSp2dG
 5PTNSUaZiuAPhqFyIFXsvXdSgyEWQGuLUn4e2OL93LWN62x3eAFlHlEgUo3tPvq4Jujf
 ud3Ad2iFy8yFeY7J2hAVUUuLbplUBdRCE+2IUCdfaOWzCH+srqYfG7r9ULR2EVw6PzTF
 WoBW4NvPG3QOkrdXkgiwOuJPbZ+G34CZoHyKp4e4JHMxbjYEytQp1Sd1NIdgWIeOe6w1
 VqYg==
X-Gm-Message-State: AOAM5313F4/v05nslPIkHzmFs/XJUqLGagimVkBzfY+MxVbZA2mAap0A
 gQS0df6WwkIBE9FAWUfyUpE=
X-Google-Smtp-Source: ABdhPJzxoPCoIfkacdA4NG/dkqqcDxe9cQqw34B+IFkgYIC6MbnNk9kv39TLxnzULSYXks1naHFifg==
X-Received: by 2002:a05:6000:8:: with SMTP id h8mr7496147wrx.106.1619216736348; 
 Fri, 23 Apr 2021 15:25:36 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u2sm11691095wmm.5.2021.04.23.15.25.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 15:25:35 -0700 (PDT)
Subject: Re: [PATCH v1 06/25] docker: Add Hexagon image
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210419145435.14083-1-alex.bennee@linaro.org>
 <20210419145435.14083-7-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <130f9538-f9b3-40f5-f569-5c96a79d730a@amsat.org>
Date: Sat, 24 Apr 2021 00:25:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210419145435.14083-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: fam@euphon.net, Alessandro Di Federico <ale@rev.ng>,
 Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Brian Cain <bcain@quicinc.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 4:54 PM, Alex Bennée wrote:
> From: Alessandro Di Federico <ale@rev.ng>
> 
> This image is a little special because it takes a long time to build.
> As such most users don't want to be doing that and just pull random
> binaries from the ether as intended by the container gods. This
> involves someone with credentials and a beefy machine running:
> 
>   make docker-image-debian-hexagon-cross V=1 NOCACHE=1 J=30
>   docker tag qemu/debian-hexagon-cross registry.gitlab.com/qemu-project/qemu/qemu/debian-hexagon-cross
>   docker push registry.gitlab.com/qemu-project/qemu/qemu/debian-hexagon-cross
> 
> With a suitable binary in the "cloud" a normal user will run:
> 
>   make docker-image-debian-hexagon-cross
> 
> or have it run for them through the dependency mechanism of our
> over-engineered makefiles and get the binary they wanted. There are a
> few wrinkles of course including needing to tweak the final image to
> have the credentials of the user so we can actually do our cross
> compiles.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Alessandro Di Federico <ale@rev.ng>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: Brian Cain <bcain@quicinc.com>
> 
> ---
> vAJB:
>   - dropped all r-b/sob due to rewrite
>   - split into a multi-stage dockerfile
>   - make dockerfile standalone
>   - play fugly make games
> v2
>   - update LLVM version per BN7PR02MB4194DF5752EF3BADE858018DB8799@BN7PR02MB4194.namprd02.prod.outlook.com
> ---
>  MAINTAINERS                                   |   2 +
>  tests/docker/Makefile.include                 |  22 +++
>  .../dockerfiles/debian-hexagon-cross.docker   |  44 ++++++
>  .../build-toolchain.sh                        | 141 ++++++++++++++++++
>  4 files changed, 209 insertions(+)
>  create mode 100644 tests/docker/dockerfiles/debian-hexagon-cross.docker
>  create mode 100755 tests/docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

