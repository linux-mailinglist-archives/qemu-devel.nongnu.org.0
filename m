Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1F3320936
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 09:40:30 +0100 (CET)
Received: from localhost ([::1]:51172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDkI1-0006I0-JY
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 03:40:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDkH2-0005rz-Si
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 03:39:28 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDkH1-0007uj-Fa
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 03:39:28 -0500
Received: by mail-wr1-x42a.google.com with SMTP id v15so15714880wrx.4
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 00:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S1+DkCA5S/irQ6FRkZjcZpaqdo9DPZpR7PNj/Rtr6gA=;
 b=k2UmOJY0/3D0oxDKsLfXgvLtfHjAAIAEjtcKMUdoLJW2nIkDf+wAXlpCJ5ETB02m3p
 GeHn2Uysurr1VYTerSeauq6V7FilS5sOeMsi+Ql34qvzCYPWLk9+Wft6HYsQYLrQcwny
 pSRcV6Hb89KnyBsEy+2uJfY9IZc32XoOGiuKNr5xwGZ2ipATCLM8msUzjzTtsmH+M7bJ
 Ep/d60VcaNmF21mAVcd/giw4Ow5ISXJE8xiZM2lX/k2uVI7uZdkFjICSZJGrAuxaB3dh
 QkYswZWO/SzYK6iV71Yzwe8Y50pGKVlLutKuL1nfK3JD0ntFlUtQreesqKxLBhe0alPg
 RFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S1+DkCA5S/irQ6FRkZjcZpaqdo9DPZpR7PNj/Rtr6gA=;
 b=iO3CY/H719tdC3tDccf1HHph572ncUY+xDIgNdkz8VX3iNWxAiqiKF6Fjc8JItzkOg
 tLDPxNPF265giNjU9PzDQNTY0mXMuZvd8UX4FESrVEy052VMuBJqrH1VUPA7OIq4QD+I
 VZlabnjTmrgweOpO1xm/qZxPN9wMT48VIanV8Qn3cL+PEjHJcX8OuVP+sM0/jQN13bfo
 DUgmYVdVC19ZZgUnjVCooWGSh1w+rljf+vXABpHcqrW8gY0heogzqBQAB9nSDNiqI+hN
 7cVgN5LvIEC7cygJ5QHsniX/jrW5ZLK3qBcIjfhLEs2pjX+7gjjslcpsVSnAdkk4n3O2
 tiyA==
X-Gm-Message-State: AOAM533tlL7vOeecuqWJdy8V7+jcHurnzpkurmak2kpS0224UeU1Hio3
 suWY6NWwXgJ9/8n+BbJPVgh+IhnX9hM=
X-Google-Smtp-Source: ABdhPJzvK5HyFyT1sSd8UE2uGzh+KLaL2IL9ZuLrpux2QlWBwwP2yfBXklt0ozDSuu8M6QbMx1DI7w==
X-Received: by 2002:adf:e988:: with SMTP id h8mr17121138wrm.2.1613896764996;
 Sun, 21 Feb 2021 00:39:24 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id p12sm19409659wmq.1.2021.02.21.00.39.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 00:39:24 -0800 (PST)
Subject: Re: [PATCH] gitlab-ci: Remove unused container images
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
References: <20210219110950.2308025-1-thuth@redhat.com>
 <87wnv2jvg3.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8866e3f9-8470-5a03-0044-1e72acadecb1@amsat.org>
Date: Sun, 21 Feb 2021 09:39:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87wnv2jvg3.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/20/21 10:10 PM, Alex Bennée wrote:
> 
> Thomas Huth <thuth@redhat.com> writes:
> 
>> We're building a lot of containers in the gitlab-CI that we never use.

Maybe we should run the check-tcg tests for each target on Gitlab?

>> This takes away network bandwidth and CPU time from other jobs for no
>> use, so let's remove them for now. The individual containers could be
>> re-added later when we really need them.
> 
> They are used - when people run check-tcg their builds are cached via
> gitlab.

Indeed:

$ git grep container_image
tests/tcg/configure.sh:107:  container_image=
tests/tcg/configure.sh:111:      container_image=debian-arm64-test-cross
tests/tcg/configure.sh:115:      container_image=debian-alpha-cross
tests/tcg/configure.sh:120:      container_image=debian-armhf-cross
tests/tcg/configure.sh:124:      container_image=fedora-cris-cross
tests/tcg/configure.sh:128:      container_image=debian-hppa-cross
tests/tcg/configure.sh:132:      container_image=fedora-i386-cross
tests/tcg/configure.sh:136:      container_image=debian-m68k-cross
tests/tcg/configure.sh:140:      container_image=debian-mips64el-cross
tests/tcg/configure.sh:144:      container_image=debian-mips64-cross
tests/tcg/configure.sh:148:      container_image=debian-mipsel-cross
tests/tcg/configure.sh:152:      container_image=debian-mips-cross
tests/tcg/configure.sh:156:      container_image=debian-powerpc-cross
tests/tcg/configure.sh:160:      container_image=debian-ppc64-cross
tests/tcg/configure.sh:164:      container_image=debian-ppc64el-cross
tests/tcg/configure.sh:168:      container_image=debian-riscv64-cross
tests/tcg/configure.sh:172:      container_image=debian-s390x-cross
tests/tcg/configure.sh:176:      container_image=debian-sh4-cross
tests/tcg/configure.sh:180:      container_image=debian-sparc64-cross
tests/tcg/configure.sh:184:      container_image=debian-xtensa-cross
tests/tcg/configure.sh:261:  if test $got_cross_cc = no && test
"$container" != no && test -n "$container_image"; then
tests/tcg/configure.sh:262:    echo "DOCKER_IMAGE=$container_image" >>
$config_target_mak

> 
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  .gitlab-ci.d/containers.yml | 92 -------------------------------------
>>  1 file changed, 92 deletions(-)

