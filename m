Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A897300A18
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 18:46:17 +0100 (CET)
Received: from localhost ([::1]:37874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l30Vk-0000SC-2x
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 12:46:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l30Ui-0008Rt-PR
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 12:45:12 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:42333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l30Ug-0003M6-LW
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 12:45:11 -0500
Received: by mail-ej1-x633.google.com with SMTP id r12so8803223ejb.9
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 09:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2tszo79LpZc4QWeyE2QrIMSwgDhGVf6FgaUY2xlm2P4=;
 b=cKP4b7imOGKW9C9XUe4rQgwVhHIDXZaafBc7yr3D7eEOixjxEjbsiJfTAsOJs+SkNw
 zoPYaG+lCs1yO6jcgdnkZPPjS97RMWgGG2N1ErfO2oMKSbQ3g+Cfe4cxNp+CysRuf4b9
 /DvRWCoyUVC1ReKVOte3PnrZKBeY63ojaKEvDSuVoqtKHi6DZ/xXw/cpcir0TR86cSmd
 OwpLEv20uyAPGzTTQ6ufCvU4oaHBP+jIW3bEYIrLUAT8tMbViM4GqGf+H1mA3mXBDrTR
 GxZ1IW95vLoNU0DStF3qzXq7Isr23MDw/eF8ZRvG4i9pCd/maFG6ZIMped/x3RQOTWxa
 cxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2tszo79LpZc4QWeyE2QrIMSwgDhGVf6FgaUY2xlm2P4=;
 b=cnlNQW3L2mkrtuUAvcATYnueteVPcE6iyVQz8gvtrImJJRTyJ0hz0zJf5DROYpWc7q
 AGqfski7aZMMIgcD3h4g9jxLlJVVhyvDA7S95I6jS7G3hfXIWB/BaarJQJwgnIuoQEAC
 BiQlXv1FpS2HhHpSqkL8n4oqI8H6axJeXsamweHnu/ucI2o7bkjzHVPAq+BOBbR4bpad
 a4BJXewAM1yFSdt56DmovfGrSrLvZplMo9a7wAC2otlOio4BiwNOdgFOnqLK+LDfs5J2
 iTvn9i1PEFA8707WWbaN5AtH9t37o0d8oBlP6/MV5VvYf9YRjDVkZaF0nWO5WNfQnuFm
 G5mA==
X-Gm-Message-State: AOAM532Q8W+yFmcU2cLK9/GNpzFUigWHAAxD2I8HYZ0CNg21Z6vZfhWR
 ed7DWhzQxaOntGGYTGU3bk0=
X-Google-Smtp-Source: ABdhPJzpiKBtEzFYQ2E2NZRd1Pbs0lTZTmEE+2aztVoN76+sTpH73RPHiQUqX5mi8l7zMGNzrLA1CA==
X-Received: by 2002:a17:906:36da:: with SMTP id
 b26mr3651911ejc.28.1611337508676; 
 Fri, 22 Jan 2021 09:45:08 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id t9sm4881319ejc.51.2021.01.22.09.45.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 09:45:06 -0800 (PST)
Subject: Re: hexagon sysemu - library loading path feature
To: Brian Cain <bcain@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <SN6PR02MB420590EF08DD9FFA5DC81EB6B8C60@SN6PR02MB4205.namprd02.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <68c3529b-9710-0d78-13eb-608ff2ed2c2f@amsat.org>
Date: Fri, 22 Jan 2021 18:45:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <SN6PR02MB420590EF08DD9FFA5DC81EB6B8C60@SN6PR02MB4205.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.221,
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
Cc: Michael Lambert <mlambert@quicinc.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Sid Manning <sidneym@quicinc.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Laurent and Alex.

On 12/17/20 6:14 AM, Brian Cain wrote:
> My team is working on sysemu support for Hexagon.  We've made some good progress so far and we'll work on upstreaming after Taylor’s hexagon linux-user patch series lands.
> 
> The only use case we have focused on with sysemu is booting/running elf programs.  Both "-device loader,file=..." or "-kernel" are effective and work similarly.  We have implemented "angel calls" (semihosting) to do host I/O.  We have not yet tried using the QEMU semihosting features/cmdline args, but may explore that option.
> 
> One feature we'd like to integrate is a guest library search path feature.  The existing hexagon simulator program distributed in the Hexagon SDK has a command line option, “--usefs".  The manual states that it “Cause[s] the simulator to search for files in the directory with the specified path. It is used for accessing shared object files that are loaded during program execution.”  If the guest OS has a loader that tries to resolve an executable or library's DT_NEEDED shared object libraries, we would want QEMU angel calls to be able to search a user specified host-path for the toolchain language support libraries.
> 
> This feature is like the functionality in QEMU’s “QEMU_LD_PREFIX” environment variable used by linux-userspace.  So, one idea was to just (ab)use this interface to mean the same thing for sysemu.  We could make it a target-specific hexagon feature, if it doesn’t make sense to have it as target-independent.  And if it makes sense we could qualify it like HEXAGON_QEMU_LD_PREFIX.
> 
> If not this environment variable, is there an existing QEMU feature that maps well here?  Or is there a better interface that we should consider instead?
> 
> -Brian
> 


