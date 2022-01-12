Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC51F48C6AB
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 16:04:39 +0100 (CET)
Received: from localhost ([::1]:58684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7fB0-0002hg-JV
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 10:04:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7eJb-0000bK-8s
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 09:09:27 -0500
Received: from [2a00:1450:4864:20::42d] (port=38764
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7eJZ-0004t6-M0
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 09:09:26 -0500
Received: by mail-wr1-x42d.google.com with SMTP id a5so4479081wrh.5
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 06:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=465+avTfDWWat1xJ2NM3BWbE3tC0Rte3IWGOBoacK44=;
 b=HpaVvR4kz4SJkNrIMRSxrmfvkkW6CKFZmhKvevaWVxLwsMNf28Cdf7x62iKKJ3+Pc8
 VBxjWIW6GqjfdKCQ4xm1MGd++K5MyXWybpWarH2AV5hlT0Dw89FBVsR0TeSiSUgFIJ4f
 SHWc1XHZvNGE7fZGPltzZJmvexGPEXdzOACczmZ4NsIbPmDbAmPXI+j+y0tdfmPPLFIz
 4M+mmrISz7AlSAgP2NTCbglRV5ZwAozSLQkxs7yxcPdD4tdZggWkPIGC6gklCip2yMHF
 Gn+J+vFn5Fyv1xZBqtcgERb+yvdgg/z60MDPfTJ+BRlBV4GoyFREoZL5JW8cSNyNzmkR
 xkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=465+avTfDWWat1xJ2NM3BWbE3tC0Rte3IWGOBoacK44=;
 b=2D8DlfCcujDOdO+5yun582Fc9n2cZ/+BVU66nuuyrIw46MAt1Iaeek9rEKq4BsMuJ+
 bcravMazGbu5I1LSDDxoC8UJ2bryGhcIrnYcKZCu/G+uHTx8I4bKAaOSUwkwhHMpPoYD
 oLFmM3XRKQL9xU9ZLdXTRnhJD9345U+YmlggFmGYmQueML7gPFhwwoGpaGe/a07r2RRb
 tIAEgGo3Wz2bRolFhElqZqMmUpYwguAS5/tHQYz8Aqq1Y7yRItqvze6CmQEGUwmRabPL
 5TRhW7UoyX4bKX+Q4RM+G0EVDl5WGnvtuYbnSUELW6G/WNxLh81etmfJOULBVLVKy1rc
 XtKA==
X-Gm-Message-State: AOAM531QXacy8Pbzpst4NZPHHDEcevAuyh3y5QLqxjPjcgLqQS+mY2gc
 h4fnCIpWqVgFsu2zLRg0F8Q=
X-Google-Smtp-Source: ABdhPJyEXlyd5++3Z7d/ukUYu/qzRumJebJdEk6GPtc9ebZwef7xiTpVqP1rEpL60vhrE7Tc7SKszg==
X-Received: by 2002:a5d:64c7:: with SMTP id f7mr8281361wri.300.1641996563602; 
 Wed, 12 Jan 2022 06:09:23 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id f13sm13568657wri.51.2022.01.12.06.09.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 06:09:23 -0800 (PST)
Message-ID: <4492570c-1dd0-cf08-abf3-eabcae706039@amsat.org>
Date: Wed, 12 Jan 2022 15:09:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v3 1/7] configure: Allow passing extra Objective C
 compiler flags
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Roman Bolshakov <roman@roolebo.dev>
References: <20220110131001.614319-1-f4bug@amsat.org>
 <20220110131001.614319-2-f4bug@amsat.org> <Yd27fVx1iHyvA9ng@roolebo.dev>
 <7da4d428-9b9e-e4ee-39af-48a8223df8e6@amsat.org>
In-Reply-To: <7da4d428-9b9e-e4ee-39af-48a8223df8e6@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Emilio G. Cota" <cota@braap.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Emilio

On 1/12/22 14:46, Philippe Mathieu-Daudé wrote:
> Anyway, with your/Akihiko/Christian help during review, this flag
> is not necessary anymore to build softmmu/tools (I still have to
> figure how to silent the "#pragma FENV_ACCESS" warning in tests),
> so let forget about this patch (except if we expect macOS ObjC to
> keep evolving and need a way to pass OBJCFLAGS).

Apparently Clang equivalent of "#pragma STDC FENV_ACESS ON" is
"-ffp-model=strict"

https://clang.llvm.org/docs/UsersManual.html#cmdoption-ffp-model

I'll see if patching tests/fp/meson.build is sufficient.

