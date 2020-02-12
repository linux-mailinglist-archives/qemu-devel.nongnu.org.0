Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C7E15B1FC
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 21:40:04 +0100 (CET)
Received: from localhost ([::1]:43094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1ynj-0006pd-9o
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 15:40:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42747)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j1ymf-0006KW-GC
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 15:38:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j1yme-0000Gv-Do
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 15:38:57 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:49683)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1j1yme-00009V-5I
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 15:38:56 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mq2rM-1jp2qx06hm-00n82H; Wed, 12 Feb 2020 21:38:25 +0100
Subject: Re: [PATCH 6/9] linux-user: sh4: Update syscall numbers to kernel 5.5
 level
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>, qemu-devel@nongnu.org
References: <1580818058-16159-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1580818058-16159-7-git-send-email-aleksandar.markovic@rt-rk.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <5cca58bc-57eb-b3b3-5a97-f2754d9d461f@vivier.eu>
Date: Wed, 12 Feb 2020 21:38:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <1580818058-16159-7-git-send-email-aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:DiDOzXP0Aj0Hy0MhAT4DDA714xqxPYr7VC/MACK/e1qtaaK6lm7
 lpypDLkASNvBnNUmLDHooY/IOug1k7jeW9YqzgCf4axkx/roX+PIwFs3hBqo8UBKjmVjc+E
 WlzGdesIyM4C09tKggmcioK6HF4j+wY/bfep+GxPSXwNT81h32RE5tPFlA0S/QxwOzOcXl6
 +UHSWmbBSLAsoZDpTtaMg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Zd8zjOP0TGk=:MQbuHZhiFA/TBd8rWGwLAW
 IeaB2oHrtz1qeHBC0sgI9TV06xNUWISTpzZAsd57YiqB7HLXikww+afBRRGzgbwXS4xB1jSY5
 KDhVDwZHIPkIbuoq9eTQn7utG66nsCzVc7V/wpDIWQm5EXD/OIKzfo6QqD+jZg/dc+3ukEwzD
 j12kJc04prwbiRpupeR7x0KtEPt1H6bf6213NmLs8UBSKYu9b/R/pHWXnW8KfCanebxTkp+xQ
 9YIZMNTQ1qRyCU2rxoxIoVWo6B165ioS9lRTRucnJiMvshTj3tk15mjUJvoI9nH5mt1BBchPE
 214uyqcpiDaonQqiAGpEY9Xk+ZsDQ9ryylqbhb2uO/1EmF7BoYxxgCf/DOWqMBWFV6mrE4aBc
 TJkR5Yg+1g9ai0JOVK9PVRWQMGDd9L8GgBioFmLgj5v7zEEz9BV9Fv4SXlx7ubjpLsOv12jIj
 kIUx0cgChQqgZodYD1G+vRjAf20IBTvCQfFk2OJCW8FmQh95Bc4clHE+ywDtqRjLi7k0/cKa4
 kn9cQcHEMZHCxgWE4QlZ3RDG/4MGpFM7bjPYG+xGZKO/M8xiZIL/zTB5ZsDl8PHPxn0nTK+Fb
 Y2gHQsU/iw1WFuwRVjLPqU3vEHYxqrJ32E4n9osJzuZ5ov1XWiJ7wXSXgHp0RZjkd+9vsSXgL
 chvOJIZQWOWg+a7PRHq8zfjp9J1F2nmRtGlYrx785gG8Z0uFi5D36K6EmnuUbgg65EXSm2Vw8
 eswjImxMI+m6p0M+IiI6A59lFidrHehKi+m406BgSXEhidifQLeIqm1Ee7QNRFnMcznB9JXZn
 G5Y/uOmzDEn09SBNv60CKUU+eU4elvfDtWnsQ0SGNvwxpcKEJqTG/+oeTKJ6FFktpaELsFJ
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
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
Cc: amarkovic@wavecomp.com, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 04/02/2020 à 13:07, Aleksandar Markovic a écrit :
> From: Aleksandar Markovic <amarkovic@wavecomp.com>
> 
> Update sh4 syscall numbers based on Linux kernel v5.5.
> 
> CC: Aurelien Jarno <aurelien@aurel32.net>
> Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> ---
>  linux-user/sh4/syscall_nr.h | 48 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

