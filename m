Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FE0346791
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:27:00 +0100 (CET)
Received: from localhost ([::1]:50636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOlk3-0008Qd-OW
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOldd-000067-Gk; Tue, 23 Mar 2021 14:20:23 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOldX-00070W-LC; Tue, 23 Mar 2021 14:20:20 -0400
Received: by mail-wr1-x433.google.com with SMTP id o16so21811690wrn.0;
 Tue, 23 Mar 2021 11:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2hC54mf4EyR8O3U29Ed6FSvueUI11Uo9PSOfZ/4SH2E=;
 b=Moy63FN/CTm7UAcB4hs0NEtdnoYPUoTVpPGaOoNMDjj+khqw0aTvrVkUoKDKj0mP0R
 SNfNM1MwuZT2T/+CbAhAk8MYa6IKZjJCjeBmyyygPWNAN0vH5MOVDFBi3j8ai7hIWDeW
 7Q6wHMj6BsElShI6ETjpTcRriWz9oWxAUaMOTSRthCICIRxX1/f5oiM3BCoJV4tR+0Jx
 QO3WeZ2NXCrYojJ4aal0CKiUH8LyrgwOiqObQXLKI2sgx+iTZShrXAV5FuYUX+9S4XxL
 aPBX47BFrKc4Q7Af6Y7bQJeBUEehfTxwan0tWgiMbs2FKP4Ub1XFJetiimtZLwc1G9Vl
 /NWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2hC54mf4EyR8O3U29Ed6FSvueUI11Uo9PSOfZ/4SH2E=;
 b=KKblwQl+2LOCH9+mYpZeWMjx1LATQF1O6VIW/gweatrxLtqejSPc/6+VQgQ3MHB+47
 cOp71iZjctBYt01K6/o0mFmkc69CWaqvjO7BnIIBoQxhD7woDWdBnTeUL62sGI7Qo5B6
 15rGWgt+v24/4t/pi55zn5aGrE4BS3YwJ9MKUNoeEydJB2cWoCyKUGbsEtMCy35j9t3L
 FLOvLQoYqaqQ1e2NNMvqCLakSS2LWNWc9xC6thDoA2G85XBUJYlIUH6dYO5MYtsBm8EI
 xwDRHK5aFAdvxXYLkDXzRREmn5ujhfeKrQQNImkmMEd85jgprZj2Ery4clXSffXWAeqk
 1L3A==
X-Gm-Message-State: AOAM531KsnvbB0qJfe3S3VJtU4ddD+hp1x1ie5Z24JCj7/KxZfI90aWE
 VUlxUpjrwyRfEgQGcfTaRmeExqwuvi+4yw==
X-Google-Smtp-Source: ABdhPJwdOq/KGVa6syIR9O1zPrD62rgjVpEOUX3K3k9qBGAVPdoTDvkFLBEbJd388c5QftqlDVmclg==
X-Received: by 2002:adf:8341:: with SMTP id 59mr5215354wrd.130.1616523612828; 
 Tue, 23 Mar 2021 11:20:12 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j14sm24141157wrw.69.2021.03.23.11.20.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 11:20:12 -0700 (PDT)
Subject: Re: Crashes with qemu-system-ppc64
To: Thomas Huth <thuth@redhat.com>, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
References: <1e4835a5-b785-5d0d-64d8-bb01afeea432@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <51f7f433-fadc-fbfe-3cb5-5a41facafd5d@amsat.org>
Date: Tue, 23 Mar 2021 19:20:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1e4835a5-b785-5d0d-64d8-bb01afeea432@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Mark

On 3/23/21 5:48 PM, Thomas Huth wrote:
> 
> In case anyone is interested in fixing those, there are two regressions
> with qemu-system-ppc64 in the current master branch:
> 
> $ ./qemu-system-ppc64 -M ppce500 -device macio-oldworld
> qemu-system-ppc64: ../../devel/qemu/softmmu/memory.c:2443:
> memory_region_add_subregion_common: Assertion `!subregion->container'
> failed.

I wonder if this is a side effect of using
object_resolve_path_component().

> 
> $ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
> /home/thuth/devel/qemu/include/hw/boards.h:24:MACHINE: Object
> 0x5635bd53af10 is not an instance of type machine
> Aborted (core dumped)
> 
>  Thomas
> 
> 


