Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1668A49E440
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 15:11:44 +0100 (CET)
Received: from localhost ([::1]:57840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD5V1-0002Ek-5t
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 09:11:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nD5S1-00009M-30
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:08:37 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:39677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nD5Rz-0001Mh-Fu
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:08:36 -0500
Received: from [192.168.100.1] ([82.142.25.174]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MIdaF-1n1Ewe1MOL-00EdHv; Thu, 27 Jan 2022 15:08:33 +0100
Message-ID: <a93526f2-1a08-2026-294e-5be455669ad0@vivier.eu>
Date: Thu, 27 Jan 2022 15:08:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] linux-user: Fix inotify on aarch64
Content-Language: fr
To: Paul Brook <paul@nowt.org>, qemu-devel@nongnu.org
References: <20220126202636.655289-1-paul@nowt.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220126202636.655289-1-paul@nowt.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wXelXxjK46KchcJwhxIg+GJgjgo35SxMV5VcqHl16eaWGlZielE
 /+Hcz0kWMtyv2eCyDCr/2lYEyUfoQJsiAU4pJbkd0nKx7rDK6K+g6E+xTnvAFHz5VipJ1qB
 t7mSuDtYYsiea0krF3Scd0h9eKP7hLcLiNsW/J2EKtE+jXGX5jn6d6vI8hfFing1IDFsKyX
 s0aYrsHBvUFS5WFmLHAJg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sPsiIJTMNQs=:E+IU/sM/6et4lNrJfk7Cfh
 mI57Q8axFMlyH5q3qqEm2aEWHIOjsCbCRMV9aHdiV3m8yQlrz328iFFTf+Yg35xdG+NjasULt
 kmbqIHGyyLebAtkdwgSDehv8OjTza+hhTXuNIPWrgQ95tog07IQxzWPo6CjU4sbXaCHkBIQ3o
 bqRpFDSBR37Nohq2GXQMFstACeKBWT0RE7ZfG93TRXClBZGqPRdDmvwPU+fQboLoghxbGrSYs
 gFB1TV0ueP7JsAr5i/RerYgNF1Zdv3/cLkOZWYKNnRRPCtBrxrI3ugrdMHGOi4tUn/yqmFxDo
 p11AUMqdKLHO+GcgknbCwfwGjIeUVVJXj9Z9KE5c0T8wcpvMEfnYHxGjPhHnWiEeuZDpR85wT
 FONyxna9dhDGYHSRTevzfCy0ZShGnDzw3NGxuICkoIFFPcY0wAIO8TDGkw7+hd5WIemGBlBWb
 DXdjb7AAlJiAPzaQgurZI4sbzZ7oAFfcLJmLl9RukJZl471lraTxzhxnyrTR6gYbTWu4sbI9y
 DwYmL/T/oRrMf06ic5sRvpzHonHlF6nZnUGy0FTCKgSeupSjLCKA5Schn27+HVPssMxzmyTs2
 cbAZYYk4UuHU/3LcyUB2SEH+3IvyI7sDr/4WquQ8KoV28XXvXWhRfQA+U3KnA+arRxtCjbNLl
 Ru3Hn8eQCT0/gRrI74NQ+ELJHTQWkyPjY74KfPRsXAG5IAM2xMmUiD5A8fRiXfMAcPv0=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 26/01/2022 à 21:26, Paul Brook a écrit :
> The inotify implementation originally called the raw host syscalls.
> Commit 3b3f24add0 changed this to use the glibc wrappers. However ifdefs
> in syscall.c still test for presence of the raw syscalls.
> 
> This causes a problem on e.g. aarch64 hosts which never had the
> inotify_init syscall - it had been obsoleted by inotify_init1 before
> aarch64 was invented! However it does have a perfectly good glibc
> implementation of inotify_wait.
> 
> Fix this by removing all the raw __NR_inotify_* tests, and instead check
> CONFIG_INOTIFY, which already tests for the glibc functionality we use.
> 
> Also remove the now-pointless sys_inotify* wrappers.
> 
> Tested using x86-64 inotifywatch on aarch64 host, and vice-versa
> 
> Signed-off-by: Paul Brook <paul@nowt.org>
> ---
>   linux-user/fd-trans.c |  5 ++---
>   linux-user/syscall.c  | 50 +++++++++----------------------------------
>   2 files changed, 12 insertions(+), 43 deletions(-)

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

