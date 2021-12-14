Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A17054743A6
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 14:39:31 +0100 (CET)
Received: from localhost ([::1]:39156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx81g-00007z-Sb
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 08:39:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx7mk-0001Me-Ls
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:24:04 -0500
Received: from [2a00:1450:4864:20::436] (port=42791
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx7mg-0002Pn-L0
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:24:01 -0500
Received: by mail-wr1-x436.google.com with SMTP id c4so32332827wrd.9
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 05:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=p6rZ7lC8vGzB9OtFisolrxFFnsJ0zFSYzbQX9ex5coE=;
 b=OVbmhuqC8fP+LeCq7WUnYHtxlx4UAW46N0a19+B/wk8HHSv1Lx1jVYxmS8GaSKgdat
 wYDh+GA+1ivrUtz27YpIVF2BZnXIvAZUzUKhMMR8IBulWmzpTCdzuK+iY0LqvxwnS1NH
 Z92uud2y6JdFToWk1WM+2mayFpgpR8JQxxr4o00v9hlgNrhOIn7d/j7URXRwnLGr6qE3
 fyof66tTaHvYfoC3uSgwEy+Cye/eRAL0FpZ6UrdYILj40tsNHlSAPyztclt9YHCNDHeH
 J2FTpyu0nSdawO8YrChG+0HRaOIdjke7G16en3u/8pNLZIyGQQz/BJtCWNAWBXtNBExY
 4unw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=p6rZ7lC8vGzB9OtFisolrxFFnsJ0zFSYzbQX9ex5coE=;
 b=amiX7Xko27xeUTcM1AxGe5+ifRcg8LLJlXcE1EQQXn/lzdtw8Bohm6GwFQsct6oKvn
 5UPcY3C/u/5bHfWQUujwHi4JdZ/gQSyzR8arOAAQUtSGcnRY+HUnpQ6zoCbm9Y9NqHMm
 +9mEhymIWtFk+fG8m74mylt30V6dJE5ezba40ljq+GKkZhaBGrju0MEdx9vzugE0tiOy
 DDNklMqAjN1fSQHRxoly4o+0yKnsWuYteKayfmGamVr5+Nuaq7o7s+4Q++fHGAhw4Nzs
 truMUPrsWXc137Oy7bOyb0uy9Qcm66+xEZTsC/th9klRlBi0DyFm6GobmMVehcQ7ewSQ
 VAEQ==
X-Gm-Message-State: AOAM530w9RgIatd8EJyHI4Ms9zei+fVThp+hlKWLoF3/iGpE2H/b3raN
 ab3R0Gajs5ifn4D5U1MfqKQ=
X-Google-Smtp-Source: ABdhPJydrNL8a73vXwA+zC5oaQrxLDzDcETW6caOqrvXF73hVF3XG0jsttzfXZzCzR9FEwgkBENRBw==
X-Received: by 2002:a05:6000:18a7:: with SMTP id
 b7mr5647990wri.308.1639488237087; 
 Tue, 14 Dec 2021 05:23:57 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id h27sm2329030wmc.43.2021.12.14.05.23.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 05:23:56 -0800 (PST)
Message-ID: <f90f2171-d416-be35-d42a-7a37d245dbd6@amsat.org>
Date: Tue, 14 Dec 2021 14:23:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v9 31/31] tests/docker: Add gentoo-loongarch64-cross image
 and run cross builds in GitLab
Content-Language: en-US
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20211214080154.196350-1-git@xen0n.name>
 <20211214080154.196350-32-git@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211214080154.196350-32-git@xen0n.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.962,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/21 09:01, WANG Xuerui wrote:
> Normally this would be based on qemu/debian10 or qemu/ubuntu2004, but
> after a week-long struggle, I still cannot build stage2 gcc with the
> known-good LoongArch toolchain sources, so I chose the least-resistance
> path with Gentoo as base image. As this image is not expected to be
> re-built by CI, like hexagon, it should not take much maintenance
> effort; also it's expected to be replaced as soon as Debian is
> available.
> 
> As the LoongArch target has not been merged yet, a check-tcg job is not
> added at the moment, but cross builds with the TCG port are already
> possible, and added to CI matrix.
> 
> Due to constant flux of the toolchain sources used (especially that of
> glibc), the binaries built with this image could currently segfault when
> run on actual hardware. This image is expected to be updated once a
> known-good combination is again verified.
> 
> As a reference, the image takes about 27 minutes to rebuild on a
> Threadripper 3990X system with Docker operating on HDD; YMMV but it
> probably wouldn't become significantly shorter, as everything needs to
> be built from source in our case.
> 
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>  .gitlab-ci.d/container-cross.yml              |  27 ++++
>  .gitlab-ci.d/crossbuilds.yml                  |  19 +++
>  MAINTAINERS                                   |   2 +
>  tests/docker/Makefile.include                 |  21 +++
>  .../gentoo-loongarch64-cross.docker           |  19 +++
>  .../build-toolchain.sh                        | 125 ++++++++++++++++++
>  6 files changed, 213 insertions(+)
>  create mode 100644 tests/docker/dockerfiles/gentoo-loongarch64-cross.docker
>  create mode 100755 tests/docker/dockerfiles/gentoo-loongarch64-cross.docker.d/build-toolchain.sh

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

