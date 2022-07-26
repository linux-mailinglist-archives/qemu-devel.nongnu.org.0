Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA03581599
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 16:43:04 +0200 (CEST)
Received: from localhost ([::1]:46874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGLm2-0000dN-LS
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 10:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oGLeO-0000ZM-4N
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 10:35:15 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:36485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oGLeM-0005yO-Af
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 10:35:07 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 t3-20020a17090a3b4300b001f21eb7e8b0so16894991pjf.1
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 07:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qdDHDsFUEcCObBJWQMflbyNuAwS5UdbJN65W4a13RYU=;
 b=k1sC2ijHVobg21vOIYU/9bbksnmcqfWaE8C4Oe3gDDxNGbvrTRB6lGL3bMHvzA9mnY
 8MwIWd75NbWOFz3cbVT0kUaGYx3zRhZr+QXYi18vWWg+EWbhKJa9GEp/4bRVTP2+vgS+
 vLvBvsOdFXVHaDw7MakRuNxyfX6eBX1rhKDC3X+oW5dO20rLS3h23I2Dwr1FzTOy+dVs
 gThJ/dhDddufrVUJr3yRJA7JxK4I7IyZt2lRMV7fRWvASoj/Ti+6l/Ng2+7CXLlJnHGI
 FlPNnyhU2MB8M6rSqEKGVLJQ+6gwdQz6MO08oP/P6MkIPFlHKQUR5pHsxVz/cR6/SGwM
 7/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qdDHDsFUEcCObBJWQMflbyNuAwS5UdbJN65W4a13RYU=;
 b=OQ4Cv9kNMJkfqyrTiDN56zpfQGT9xXdbbc1ZvaQHSKj4wOFlVXd1/0qmHn7fuPF+yd
 lEZ3fhy7PX+fqH5cVw1uRV86KLFpTlp6NE+7qOYUbe/dRXae9MfPP6IFbFDtZ2NJtZzd
 oNmZRt1D//s8tpgizGvqXUnYIb8ywRKooAOwCNhQmzP4K9NV4BfuzD+83UhYoTx/5KEM
 i3JXdtHp8ldSHhfDSkNMdM3CFfqz/FnBRcgnI5p9Bf+1OJbhrP8mIYI7j+NgIgHrhL4c
 uAA7h+/aD0rrDBEbAclwnBE5O2p3P9KjXL7Iy5m0FtHHMXZCSJ3zHm3cpGZvHLDSJUkM
 SJtg==
X-Gm-Message-State: AJIora+72mi0/iH5kglwiJ8iwcp4V7ae4Urs/+oZUc//aw4gRVv29qjQ
 znMQHbRo1wq3XuDlggbcAbg=
X-Google-Smtp-Source: AGRyM1uCjz4dAHCTlnA/s+OLqhIiyjo4fwpgs9cwV7rY0iEzSPbhY4d/oR27yaBpnUAJbrJbBaqacA==
X-Received: by 2002:a17:90a:ea90:b0:1f2:81cd:1948 with SMTP id
 h16-20020a17090aea9000b001f281cd1948mr16609038pjz.172.1658846104791; 
 Tue, 26 Jul 2022 07:35:04 -0700 (PDT)
Received: from [192.168.205.175] (113.red-88-29-182.dynamicip.rima-tde.net.
 [88.29.182.113]) by smtp.gmail.com with ESMTPSA id
 r22-20020a170902be1600b0016c408ce56fsm11400101pls.301.2022.07.26.07.35.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 07:35:04 -0700 (PDT)
Message-ID: <12a26f25-ae1b-de12-4f63-2f16f5e6da84@amsat.org>
Date: Tue, 26 Jul 2022 16:34:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v1 01/13] tests: refresh to latest libvirt-ci module
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220725140520.515340-1-alex.bennee@linaro.org>
 <20220725140520.515340-2-alex.bennee@linaro.org>
In-Reply-To: <20220725140520.515340-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 25/7/22 16:05, Alex Bennée wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> Notable changes:
> 
>    - libvirt-ci source tree was re-arranged, so the script we
>      run now lives in a bin/ sub-dir
> 
>    - opensuse 15.2 is replaced by opensuse 15.3
> 
>    - libslirp is temporarily dropped on opensuse as the
>      libslirp-version.h is broken
> 
>       https://bugzilla.opensuse.org/show_bug.cgi?id=1201551
> 
>    - The incorrectly named python3-virtualenv module was
>      changed to python3-venv, but most distros don't need
>      any package as 'venv' is a standard part of python
> 
>    - glibc-static was renamed to libc-static, to reflect
>      fact that it isn't going to be glibc on all distros
> 
>    - The cmocka/json-c deps that were manually added to
>      the centos dockerfile and are now consistently added
>      to all targets
> 
> Acked-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-Id: <20220722130431.2319019-2-berrange@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/cirrus/freebsd-12.vars                   | 3 +--
>   .gitlab-ci.d/cirrus/freebsd-13.vars                   | 3 +--
>   .gitlab-ci.d/cirrus/macos-11.vars                     | 4 ++--
>   tests/docker/dockerfiles/alpine.docker                | 4 +++-
>   tests/docker/dockerfiles/centos8.docker               | 6 +++---
>   tests/docker/dockerfiles/debian-amd64.docker          | 2 ++
>   tests/docker/dockerfiles/debian-arm64-cross.docker    | 2 ++
>   tests/docker/dockerfiles/debian-armel-cross.docker    | 2 ++
>   tests/docker/dockerfiles/debian-armhf-cross.docker    | 2 ++
>   tests/docker/dockerfiles/debian-mips64el-cross.docker | 2 ++
>   tests/docker/dockerfiles/debian-mipsel-cross.docker   | 2 ++
>   tests/docker/dockerfiles/debian-ppc64el-cross.docker  | 2 ++
>   tests/docker/dockerfiles/debian-s390x-cross.docker    | 2 ++
>   tests/docker/dockerfiles/fedora.docker                | 3 ++-
>   tests/docker/dockerfiles/opensuse-leap.docker         | 7 ++++---
>   tests/docker/dockerfiles/ubuntu2004.docker            | 2 ++
>   tests/lcitool/libvirt-ci                              | 2 +-
>   tests/lcitool/projects/qemu.yml                       | 6 ++++--
>   tests/lcitool/refresh                                 | 4 ++--
>   19 files changed, 41 insertions(+), 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

