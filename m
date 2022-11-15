Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 221136296B7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 12:04:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1outjH-00049N-AJ; Tue, 15 Nov 2022 06:03:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1outir-000498-GB
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 06:03:21 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1outip-0008OW-Hu
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 06:03:21 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id F1C48402AA;
 Tue, 15 Nov 2022 14:03:16 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 39DF910C;
 Tue, 15 Nov 2022 14:03:16 +0300 (MSK)
Message-ID: <890c858f-a83e-187e-f1d9-b05569561de5@msgid.tls.msk.ru>
Date: Tue, 15 Nov 2022 14:03:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2] capstone: use <capstone/capstone.h> instead of
 <capstone.h>
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, "Daniel P. Berrange" <berrange@redhat.com>
References: <20221113200942.18882-1-mjt@msgid.tls.msk.ru>
 <CAFEAcA_aGiukDWQBAjj=Ln_u02wEbMNxOsHRZcBOm+jOz6HU2Q@mail.gmail.com>
 <ba8aee1e-4b53-4c28-d77d-41782b56a5e0@msgid.tls.msk.ru>
 <CAFEAcA9z564UNPqaMyuAemp_ctmh6eTZbSi5zR6w46Ndkq4u3Q@mail.gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <CAFEAcA9z564UNPqaMyuAemp_ctmh6eTZbSi5zR6w46Ndkq4u3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

15.11.2022 14:00, Peter Maydell wrote:
..
> https://mesonbuild.com/Reference-manual_returned_compiler.html#compilerhas_header
> 
> "dependencies dep | list[dep]
>   Additionally dependencies required for compiling and / or linking."

Oh sh**t.. I mistypoed it initially :)

It looks like I "un-learned" to do stuff right.. :(
Another version of this trivial thing is coming...

/mjt

