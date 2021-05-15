Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D59FE381ADA
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 21:51:03 +0200 (CEST)
Received: from localhost ([::1]:39430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1li0JS-0005fs-Tg
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 15:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1li0ID-0004Ho-Uo; Sat, 15 May 2021 15:49:45 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:55091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1li0IC-0005RF-7S; Sat, 15 May 2021 15:49:45 -0400
Received: from [192.168.100.1] ([82.142.12.230]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N4vFE-1lIs8f0TIK-010x1w; Sat, 15 May 2021 21:49:41 +0200
Subject: Re: [PATCH 0/2] linux-user: Small fix for copy_file_range
To: LemonBoy <thatlemon@gmail.com>, qemu-devel@nongnu.org
References: <20210503174159.54302-1-thatlemon@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <6aae5fe4-f98b-1f47-8ba1-dede79de4652@vivier.eu>
Date: Sat, 15 May 2021 21:49:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503174159.54302-1-thatlemon@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bZ0MqAVLDNwQCxSeTC3/wNGWd/z5jRuKoY/HdH5KkdMT04P+pYg
 pAiaHx3YTyKMNYJuN14AxKIHz67JqAmwp94fdWcESo3ybqB4pRhorMPU5EsGqdaLwvtnyP4
 klTizmMUSSQrvVAu0V2i7A/6XefSvJxHXfsFtsRzA09DK9uBb4dRr88cdvFkwYbI4x6D2xO
 sMN0ErMyh5gcwvkqyfxkA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qN6aaDXLjcU=:ZFDg/kc6SPuMlX87Mn2PHf
 +mqlHo8knP8BmVJVT/09F4OMAyTAnUiexaZzbJNBzaoXxhHnJ5pSzG3xAxb9yFsFLgL3g1zx4
 CxxsIVWz8pUVirKWtRfIdqqTDKWETrptFFuu+kvg4HgSYI/keAq3vgnvKP1EeHFujxpFGz/nR
 jQJtOniggjfK2yZMZAHbZHiedp32C1H9wCNt4muT3mXZT3spijl7saMNkRQQhRgA4qbScA9/u
 p4yp0UwuiUtLZ31ZgnEJlSNmE5Rx7Uy7PvNVS9F8N2qf9bUVSgAejpvmw6dTGXzagTkvpnkQJ
 M405dCmUZ1SkCT8Jf6Z9WVrXr31u1b/3wW3QQr2bdvEbFx4XQzE0I/D85qGrHSa40MB+9rvkl
 sgpi8WBDOYm7W0lhaYjBKYZKNxr0Zh+oSdjVM2Hz6Lt0G+pjYfoerVaHTea4rvuPcecf0n1Pe
 KgwCk9NA+OH7viLiq0C4kAZOOwzOQI2aqD4fVTKi5xmWdXcFpr7/5ZKzkgdjTGHjHGaLv6hTn
 SmDWdAYBmY11yYLrclRBS0=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 03/05/2021 à 19:41, LemonBoy a écrit :
> From: Giuseppe Musacchio <thatlemon@gmail.com>
> 
> An unwanted sign-extension is currently making the host kernel return EOVERFLOW
> when calling copy_file_range with a count of 0xffffffff, despite the host being
> a 64bit platform.
> 
> The fix is only affecting 32bit targets on 64bit hosts, it's a no-op when the
> target bitness matches the host one.
> 
> As a bonus add a pretty-printer for copy_file_range syscall.
> 
> Giuseppe Musacchio (2):
>   linux-user: Add copy_file_range to strace.list
>   linux-user: Fix erroneous conversion in copy_file_range
> 
>  linux-user/strace.list | 3 +++
>  linux-user/syscall.c   | 3 ++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 


Applied to my linux-user-for-6.1 branch.

Thanks,
Laurent

