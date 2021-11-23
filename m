Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA9945A009
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 11:22:28 +0100 (CET)
Received: from localhost ([::1]:52778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpSwV-00007v-AU
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 05:22:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpSv5-0007K5-Q8
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:20:59 -0500
Received: from [2a00:1450:4864:20::433] (port=33713
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpSv3-0007ZI-46
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:20:58 -0500
Received: by mail-wr1-x433.google.com with SMTP id d24so38113843wra.0
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 02:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w1dN/GFADqVxlO4wCGxnsqIYk3A5mD4gYgLmfR2r7WU=;
 b=FR8K99vpUIRnJFU2eUpHCMOKGZVzKS9ZfFey+3Ph3qGFnMftrHauNrrcA/IFHIyJop
 1x/6hkz3ohzK3Iu7ekuIKsbYLl+qqtmqQE1HUPmO/hxsg6MaORfIti5P8kzQHzRJpyxa
 y4NX6rSrhu1x/aRPjrpL52fAxr0E8TOvPzMHDSe3D3FeZ0c+SkJJzfESIK1r9fPu5L4q
 YTl8PIkK1DKIP/Da3/TMGZ03YkAeb8IH21pTpslBLt6kcZ2ReemT31Y6MkUtthJkVC6t
 80OlZ8TgfDN4JnXusyXxQBHOQtkBfqIaElg6GJKHrWBXAMX4wzomOf4q8RS6nfFolp2S
 JBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w1dN/GFADqVxlO4wCGxnsqIYk3A5mD4gYgLmfR2r7WU=;
 b=i5EWtnvQ1fAbg2TGHp0CO1B2cO0AKzfKwxvQjnEFfGuSbG66VWWlDKB42oxla59RD/
 CudyxYxsVxUriQOHup4dqmc9zvkqjd7UMXXu4rjNOjaTSeVnw0tWYvEdTPGKnwgASxcc
 YeeOqyFRDI/5TEap0g4M65MGr2TStUF8tn53JIHWnmqeEq2AS0OAvv902vLemBoC+lP2
 Y9Y9R96g7YRWbW70ahjWaOPikJltU+qHcbbo2VWtwuvZsTgBdKOGcan6jpT4OFBicoxx
 o86WdXQnpyigstby2V+v3q+DKlv3tXQNZW5P9ixF87oFUsc/MnFY9CDBRQ8f1okA3Vzh
 DfsA==
X-Gm-Message-State: AOAM530nk6F9m6F5GjtpV09Q2LDGGyzDondHcV4XRiVCZ/Kh8Q0bVjGF
 rRsjU3pS1gN/UCK+zj9meINBQA==
X-Google-Smtp-Source: ABdhPJyrH6VOpG+skcDoz/RBas4nT1nBUeC5Tsah1BY93OsrwWPiogxBkIR426p7e2/F2e4GG8avsg==
X-Received: by 2002:adf:fe8b:: with SMTP id l11mr5708713wrr.228.1637662854909; 
 Tue, 23 Nov 2021 02:20:54 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id h18sm12522347wre.46.2021.11.23.02.20.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 02:20:54 -0800 (PST)
Subject: Re: [PATCH v7 31/31] tests/docker: Add gentoo-loongarch64-cross image
 and run cross builds in GitLab
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20211122104201.112695-1-git@xen0n.name>
 <20211122104201.112695-32-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ba910daf-59aa-f0be-82c7-73a08da20a08@linaro.org>
Date: Tue, 23 Nov 2021 11:20:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211122104201.112695-32-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.515,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 XiaoJuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/22/21 11:42 AM, WANG Xuerui wrote:
> Normally this would be based on qemu/debian10 or qemu/ubuntu2004, but
> after a week-long struggle, I still cannot build stage2 gcc with the
> known-good LoongArch toolchain sources, so I chose the least-resistance
> path with Gentoo as base image. As this image is not expected to be
> re-built by CI, like hexagon, it should not take much maintenance
> effort; also it's expected to be replaced as soon as Debian is
> available.

That seems fine.  I'm familiar with gentoo (only remaining distro for alpha), and it's a 
good way to bootstrap a new system.

> +docker-image-gentoo-loongarch64-cross: $(DOCKER_FILES_DIR)/gentoo-loongarch64-cross.docker
> +	$(if $(NOCACHE), 								\
> +		$(call quiet-command,							\
> +			$(DOCKER_SCRIPT) build -t qemu/gentoo-loongarch64-cross -f $< 	\
> +			$(if $V,,--quiet) --no-cache 					\
> +			--registry $(DOCKER_REGISTRY) --extra-files			\
> +			$(DOCKER_FILES_DIR)/gentoo-loongarch64-cross.docker.d/build-toolchain.sh, \
> +			"BUILD", "gentoo-loongarch64-cross"),				\
> +		$(call quiet-command,							\
> +			$(DOCKER_SCRIPT) fetch $(if $V,,--quiet)			\
> +				qemu/gentoo-loongarch64-cross $(DOCKER_REGISTRY),	\
> +			"FETCH", "gentoo-loongarch64-cross")				\
> +		$(call quiet-command,							\
> +			$(DOCKER_SCRIPT) update $(if $V,,--quiet) 			\
> +				qemu/gentoo-loongarch64-cross --add-current-user,	\
> +			"PREPARE", "gentoo-loongarch64-cross"))
> +
> +
>   debian-toolchain-run = \
>   	$(if $(NOCACHE), 						\
>   		$(call quiet-command,					\

Note the addition of debian-toolchain-run, handling the boilerplate for this for 
microblaze and nios2.

(I haven't converted hexagon to this, because I had expected to be able to replace that 
with a pre-built toolchain.  But then the compiler turned out to be buggy, and that patch 
got dropped.  I hope we can revisit this during 7.0.)

> +FROM gentoo/stage3:20211116

If I understand correctly, this should be the fully qualified name: docker.io/library/etc. 
  Alex? Phil?

> +"$CROSS_EMERGE" -1 --onlydeps -j4 gawk
...
> +"$CROSS_EMERGE" -1 --onlydeps -j4 qemu

Why the quotes on CROSS_EMERGE?  Use $J, which you computed earlier.

All minor nits, as it Worked For Me.  Thanks for putting this together.


r~

