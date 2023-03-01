Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7CB6A6B5A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 12:07:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXKHy-00008p-Fz; Wed, 01 Mar 2023 06:06:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXKHv-00008H-KJ
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 06:06:23 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXKHt-00082L-JZ
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 06:06:23 -0500
Received: by mail-wr1-x429.google.com with SMTP id v16so9984189wrn.0
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 03:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677668780;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=364KJQYv/7hi7ZK8tozy54IqNYC0gki7whXXPw86DUY=;
 b=NbnvZ6XfH9jlR3UbCXxEAMGvsmwYUE/RDzVjC6t0uop+D2BstaqT+v2twdm8NQvv7T
 86tIyk3LEtNroLJqkFdv0mUL+QI4nzZl9CZ6Hy+8vRzG4q4cf07JNRi3VMM/XmowOchn
 /tga81XfSgiTI/+FEYEUbilTj8znumDP86FVeXrXFoK5/2jSGdNnPDKbLwimJMVrEVfL
 CycneBsKh6yRngsVrJNQMabjcA8Y9FV+Hep4KKVnN1b8rQiPNBK59SK0+tnniyNsS3x0
 ewtsV4hqb8e7Jo+fkQlHkMC/BqMruLOC0MH2ViiM6zz0eXjJ8dRPn5PcQb3rN+KppSc+
 ei3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677668780;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=364KJQYv/7hi7ZK8tozy54IqNYC0gki7whXXPw86DUY=;
 b=lz1mnBXumfMWS/eCoQ7HITBTGiqQCZ963d9NZbjE+7X72LY4oY7WoZC0CW+gYxRgKT
 OxCDba/iiLCschQ/rgOOx8AGnha5nXm3kkWXg3fJcbLpmkQHdM9WOL8nEYi5fA6fkJ80
 OdqdJinj6CYP5tjph4dVMElpb+xwZFzZcCwm0sWuoJ2PmWTjOoERsBXG3eQmtzRBTFgZ
 wK2fm8KjLa1pJlFXBk7HVR9x/uMgtLbxFEP61kANozdgBsCiveHROoG0ywxKYa41lh0a
 Pvs4cRyqhQ5Iw1zANJoHCG7Bo80knHVtjFEN6sNxYMJHE5fyVc1ARqMs12Ekhj/WtMDK
 rV0w==
X-Gm-Message-State: AO0yUKUjlxCotfO6bcsTpQxt7f6zisW9Pwl5zWaoEjphmOa4k2mgc4uU
 NOGR61UwR3wc1h6ZQu6IFQkW4w==
X-Google-Smtp-Source: AK7set8LI3J60CsMUCHjTk5tbWOP4h6DAFeJlayIzwnzM9djnmC+DCMe1I566amiWy90xS7xAcu0Hw==
X-Received: by 2002:adf:d1c2:0:b0:2c5:483f:1580 with SMTP id
 b2-20020adfd1c2000000b002c5483f1580mr11454881wrd.12.1677668779710; 
 Wed, 01 Mar 2023 03:06:19 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s17-20020adff811000000b002c758fe9689sm12291431wrp.52.2023.03.01.03.06.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 03:06:19 -0800 (PST)
Message-ID: <c2b12748-9e2d-2aa5-2789-9f2a9224fd45@linaro.org>
Date: Wed, 1 Mar 2023 12:06:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 23/24] tests/docker: add zstdtools to the images
 (!AWAITING UPSTREAM)
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
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
 <02a2118a-badf-29a9-716d-44f5a6c2923d@linaro.org> <87k000d9f0.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87k000d9f0.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

On 1/3/23 11:59, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 28/2/23 20:06, Alex Bennée wrote:
>>> We need this to be able to run the tuxrun_baseline tests in CI which
>>> in turn helps us reduce overhead running other tests.
>>> [See https://gitlab.com/libvirt/libvirt-ci/-/merge_requests/361]
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>    tests/docker/dockerfiles/alpine.docker                | 1 +
>>>    tests/docker/dockerfiles/centos8.docker               | 3 ++-
>>>    tests/docker/dockerfiles/debian-amd64-cross.docker    | 3 ++-
>>>    tests/docker/dockerfiles/debian-amd64.docker          | 3 ++-
>>>    tests/docker/dockerfiles/debian-arm64-cross.docker    | 3 ++-
>>>    tests/docker/dockerfiles/debian-armel-cross.docker    | 3 ++-
>>>    tests/docker/dockerfiles/debian-armhf-cross.docker    | 3 ++-
>>>    tests/docker/dockerfiles/debian-mips64el-cross.docker | 3 ++-
>>>    tests/docker/dockerfiles/debian-mipsel-cross.docker   | 3 ++-
>>>    tests/docker/dockerfiles/debian-ppc64el-cross.docker  | 3 ++-
>>>    tests/docker/dockerfiles/debian-s390x-cross.docker    | 3 ++-
>>>    tests/docker/dockerfiles/fedora-win32-cross.docker    | 3 ++-
>>>    tests/docker/dockerfiles/fedora-win64-cross.docker    | 3 ++-
>>>    tests/docker/dockerfiles/fedora.docker                | 3 ++-
>>>    tests/docker/dockerfiles/opensuse-leap.docker         | 3 ++-
>>>    tests/docker/dockerfiles/ubuntu2004.docker            | 3 ++-
>>>    tests/docker/dockerfiles/ubuntu2204.docker            | 3 ++-
>>>    tests/lcitool/projects/qemu.yml                       | 1 +
>>>    18 files changed, 34 insertions(+), 16 deletions(-)
>>
>> You simply ran 'lcitool-refresh', right? (not obvious from the
>> commit desc).
>>
>> If #361 got merged, this patch should also change the
>> tests/lcitool/libvirt-ci submodule to include it, isn't it?
> 
> Yes - I've already done that in my PR branch.

Then:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

If you don't mind, please amend:
"refresh the generated files by running 'make lcitool-refresh'"
to the description.


