Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A463903B5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 16:16:29 +0200 (CEST)
Received: from localhost ([::1]:50132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llXr9-00034i-Uq
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 10:16:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llXoM-00079N-1I
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:13:34 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llXoK-0006yj-1y
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:13:33 -0400
Received: by mail-wr1-x433.google.com with SMTP id z17so32419885wrq.7
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 07:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=s4upRj+HtSmGsM3VsRIU7c20kSBJyhtkVvqD3VHIxs4=;
 b=U0S+vfrj8p0Nm1XbWY4CxlGGTzORKVKb0MS8UGPjIAd0YmaJxaPWizFW5vo6H++2xP
 n/9r+EtAWlJXCB4kr5IyuiwB+JNMX8TFUlLwxSjoR8MK1dmd4zsvGlKT15fMxp4DBkRv
 mznOYirf83yE6v+7vub7+mNgpVcCOrbHwerXjKhleY6eMFPWjJDa54adKdqn6FyQtOM+
 brTKtv9AUsBNjFEg9XoG+IHEPGSioPA2NxkR4KKqdV5g7ZycE1MUAbJylpa3fNTrQzpQ
 lV0JwjxOgkuNIr8rfxcgYZsMPTJg2bEg1FDd5jqdF4rUBRLhgk4yQ4Y4ylSz5LHx7mth
 /TOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s4upRj+HtSmGsM3VsRIU7c20kSBJyhtkVvqD3VHIxs4=;
 b=LugnHHQW1rU/1TcTEiuOfMhDPQI7zTiCvH/P6oRJVjGglfSQrGMXagTfs91uE5tTH3
 f1ZBOR8EryFM5uFWu63R4Nk7v5wqQc7F4tf64WKM3Ql3JArenI2TzqmuNf9yFFpQeWlD
 pc1SFWB+vDsA7kta24QUOK9/NHMMraw1OBqdWxIhkhxJ3miYPK1x2/IpxLTidZX7pOHr
 FDSOfm6lTlTuwZX6ZQGbGZM0NiSfcbN5gJy4zzsFRTBIEN9Yj1B9vp8BAvKdN/PeiUeH
 VrgPy9v6rP4lnbG+D9b69yB2y2fQRlCKt6KGo7xANIG8rDnu5ZguceR5lW3W8rc61QrZ
 tkmg==
X-Gm-Message-State: AOAM531dKTSvNwvnfuDZ/NQbRmx/zBaaxfx6xxZla6HZs/GkSsBtTnT4
 QHfPJFKUQLlbaCEBS9NaKzs=
X-Google-Smtp-Source: ABdhPJw45gexYfQNGDg3v2uQ83XHlPlLIiFsvWH/T0Y2nBNRF09jD9TmropW/SBqoMtnf8qfajFy/A==
X-Received: by 2002:adf:f309:: with SMTP id i9mr28302266wro.307.1621952010578; 
 Tue, 25 May 2021 07:13:30 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id g5sm11595041wmi.8.2021.05.25.07.13.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 07:13:30 -0700 (PDT)
Subject: Re: [PATCH 00/11] exec: Restrict various system emulation specific
 headers (to sysemu)
To: qemu-devel@nongnu.org
References: <20210517111111.1068153-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5574cf42-8b21-b3aa-4d91-45643129c200@amsat.org>
Date: Tue, 25 May 2021 16:13:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210517111111.1068153-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping for review? :)

On 5/17/21 1:11 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> This series restricts various system emulation specific headers
> by moving them under sysemu/ and adding #error if included from
> user emulation.
> We could avoid the sysemu/ rename if too much churn, but enforcing
> error of headers that must not be included in user emulation allows
> further cleanups (to be sent later).
> 
> I had to split the ioport.c file to cpu-io (generic to any target
> having access to I/O bus, but I haven't checked the TCG implementation
> details for user emulation) VS ioport (system specific, access to
> hardware).
> 
> Many files are changed, but this is mostly one-line mechanical
> updates of old path to new path using sed.
> 
> Regards,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (11):
>   NOTFORMERGE target/arm: Restrict KVM files to softmmu
>   exec: Restrict hwaddr.h to sysemu/
>   exec: Restrict cputlb.h to sysemu/
>   exec: Restrict memory.h to sysemu/
>   exec: Restrict memory-internal.h to sysemu/
>   exec: Restrict address-spaces.h to sysemu/
>   exec: Extract CPU I/O instructions to "cpu-io.h"
>   exec: Restrict ioport.h to sysemu/
>   exec: Restrict ram_addr.h to sysemu/
>   exec: Restrict ramblock.h to sysemu/
>   exec: Restrict confidential-guest-support.h to sysemu/

>  275 files changed, 491 insertions(+), 409 deletions(-)
>  create mode 100644 include/exec/cpu-io.h
>  rename include/exec/{ => sysemu}/address-spaces.h (80%)
>  rename include/exec/{ => sysemu}/cputlb.h (86%)
>  rename include/exec/{ => sysemu}/hwaddr.h (81%)
>  rename include/exec/{ => sysemu}/memory-internal.h (94%)
>  rename include/exec/{ => sysemu}/memory.h (99%)
>  rename include/{exec => sysemu}/confidential-guest-support.h (95%)
>  rename include/{exec => sysemu}/ioport.h (86%)
>  rename include/{exec => sysemu}/ram_addr.h (99%)
>  rename include/{exec => sysemu}/ramblock.h (92%)
>  create mode 100644 softmmu/cpu-io.c
> 

