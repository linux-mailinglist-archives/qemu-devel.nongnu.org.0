Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC516A6AE9
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 11:38:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXJpI-0000y4-Od; Wed, 01 Mar 2023 05:36:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXJp9-0000x8-Cn
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:36:40 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXJp5-0002kF-2n
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:36:38 -0500
Received: by mail-wm1-x32b.google.com with SMTP id j3so8215363wms.2
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 02:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677666992;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2Azoh8xSU5TJ2zojXyKIHJjeHgyY2Otsjeo2O616Z/E=;
 b=MomJXPLw6+iDG4sN17aGuvICmyfpwP31iyI5zx6XY5gqQQhf/8wJt3wlkPK2hzzX9R
 if+afbT5jmbXAkEBFgk4mR6ALEIQ+TKygiBgSaZoA8i/5h9J1IS5eKgtYKNgM2OTk2EC
 htZM4Qp+Jpt+5OhxyHFWjUvKSMgCJ6xM9JjI1JJ9skacX7jiMfi1GLxUoYbpYvJVW811
 poAxvaMy3BdG/sJMY1noHRfmtxj81KsBQBB/ePgIJWxVRv6FSknW6R7U6/mykRLUKi9H
 74Dt/ThY48ExkGh2Aho+fW46PJQ4cULf+9Zc9MkteZ2CCbmJ0sKu3fXTmI3E08re8YgZ
 nlZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677666992;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2Azoh8xSU5TJ2zojXyKIHJjeHgyY2Otsjeo2O616Z/E=;
 b=nU+azCj3+UgiyyGTtk4sJXO2ACAY61AMIz7Gf7zeaINOE1X8UY8NGA3OZoIfXxa2pU
 v2wonNu/cw2RDdI5pacznb/uracvKbOlbkEvR3zig3IfwFRVzyEGxqoxcK7LSt3XKYNP
 TkxKtuEeLVt+op2dDrkTGtZpt8ndqyDsmQzfg1ifdYIbSdtYYNHD+nnAi4iqwqN/ptHN
 HxrJqn2b3bRD0KiWIUo7Z4EPal6b7sIFNCAAS5X8b+A5psTlg0layR6TYaBYp1PQQnPt
 bNfazBXEp35HsqvUNhF9Xr/30WM7hruSEcJ3Giw40CzdQeSxq1Q+RMHpitQP4I3INY5l
 6LDw==
X-Gm-Message-State: AO0yUKWBlticxKH3gN7Ywxb246wpCmbuh1yVjHEmy40BCMb4+/urf0zL
 eogVbvnW/e++d5xL1th/6GBljA==
X-Google-Smtp-Source: AK7set8g/7p+t7QJoU73e1BpHuSpVY4QWxYvgCy8MekatUiMFjrnBeNyJGweicw0Xa5AOL2Ipn7oxA==
X-Received: by 2002:a05:600c:3495:b0:3de:a525:1d05 with SMTP id
 a21-20020a05600c349500b003dea5251d05mr4832350wmq.8.1677666992518; 
 Wed, 01 Mar 2023 02:36:32 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v20-20020a1cf714000000b003db03725e86sm15236841wmh.8.2023.03.01.02.36.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 02:36:31 -0800 (PST)
Message-ID: <02a2118a-badf-29a9-716d-44f5a6c2923d@linaro.org>
Date: Wed, 1 Mar 2023 11:36:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 23/24] tests/docker: add zstdtools to the images
 (!AWAITING UPSTREAM)
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Peter Maydell
 <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>, Markus Armbruster
 <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-24-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230228190653.1602033-24-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/2/23 20:06, Alex Bennée wrote:
> We need this to be able to run the tuxrun_baseline tests in CI which
> in turn helps us reduce overhead running other tests.
> 
> [See https://gitlab.com/libvirt/libvirt-ci/-/merge_requests/361]
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/docker/dockerfiles/alpine.docker                | 1 +
>   tests/docker/dockerfiles/centos8.docker               | 3 ++-
>   tests/docker/dockerfiles/debian-amd64-cross.docker    | 3 ++-
>   tests/docker/dockerfiles/debian-amd64.docker          | 3 ++-
>   tests/docker/dockerfiles/debian-arm64-cross.docker    | 3 ++-
>   tests/docker/dockerfiles/debian-armel-cross.docker    | 3 ++-
>   tests/docker/dockerfiles/debian-armhf-cross.docker    | 3 ++-
>   tests/docker/dockerfiles/debian-mips64el-cross.docker | 3 ++-
>   tests/docker/dockerfiles/debian-mipsel-cross.docker   | 3 ++-
>   tests/docker/dockerfiles/debian-ppc64el-cross.docker  | 3 ++-
>   tests/docker/dockerfiles/debian-s390x-cross.docker    | 3 ++-
>   tests/docker/dockerfiles/fedora-win32-cross.docker    | 3 ++-
>   tests/docker/dockerfiles/fedora-win64-cross.docker    | 3 ++-
>   tests/docker/dockerfiles/fedora.docker                | 3 ++-
>   tests/docker/dockerfiles/opensuse-leap.docker         | 3 ++-
>   tests/docker/dockerfiles/ubuntu2004.docker            | 3 ++-
>   tests/docker/dockerfiles/ubuntu2204.docker            | 3 ++-
>   tests/lcitool/projects/qemu.yml                       | 1 +
>   18 files changed, 34 insertions(+), 16 deletions(-)

You simply ran 'lcitool-refresh', right? (not obvious from the
commit desc).

If #361 got merged, this patch should also change the
tests/lcitool/libvirt-ci submodule to include it, isn't it?

