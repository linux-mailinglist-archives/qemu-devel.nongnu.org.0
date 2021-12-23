Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE6447E73A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 18:47:24 +0100 (CET)
Received: from localhost ([::1]:34586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0SBW-0005C8-Tb
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 12:47:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n0S9E-0003tq-Q3
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 12:45:00 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:51941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n0S9D-00034C-7d
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 12:45:00 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MILru-1nCUqC2B4W-00EP3F; Thu, 23 Dec 2021 18:44:56 +0100
Message-ID: <58c7cdfc-f315-99d3-0832-e251bee681eb@vivier.eu>
Date: Thu, 23 Dec 2021 18:44:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 2/2] linux-user: call set/getscheduler set/getparam
 directly
Content-Language: fr
To: Tonis Tiigi <tonistiigi@gmail.com>, qemu-devel@nongnu.org
References: <20211223064728.18048-1-tonistiigi@gmail.com>
 <20211223064728.18048-3-tonistiigi@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211223064728.18048-3-tonistiigi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:oEzU04gqnuDaR7bpMZgBU4OZsf4PCMw5odm+tBPrqKADY+W4zYs
 ACaQzUSlshAznpY4c6gFcOmo6g65sjIO3iKVd3k6SNlWl9KHg4ijKJpdsIb/xZS8r9nLaV+
 Y9zIQZdsf6ubcSFOJBfPzUCXMQjXm1AZ486Mn9+AUE65j9PMn1Kx+Ke0B+QeaQJsLH6e5Ps
 ZP67LxswcWQrpq0BZAB4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Upir5f+2T1Q=:Z+hHdB7JeDp2PKKgZx9pCi
 jpaGqJyhiu34MFEcMVCSCgPaPW5QP0qWUc8gxiWsi4c2CHW4emwfU8DIXamup1BB1tYSEDm6B
 qMxQjcX1P3v2trn4qsRSrsOKrK0/Avk+RfGob5lunXxz7STUPBRmv4RHI5sxVUwHJ+3bntiRs
 Z+rqKT3AF3uq4DTUBiQMcmS/pDakigUj3/eQ1GHVn0ikHzEcAmaDp1sRTJu1oZjbK4oHyufBr
 gIPXnxtJqWcXaauCDb0cdSJfq4PshyWslilSNWDyUiUz179VOwgugNe7f1ySduSkOTNMkJNDI
 xqA0jET/aiVqr31ALjj5svER9mdmroBHo441vVKrMcCFTY2x/Prnuj1ovZ55UuDcovb54H9wh
 UhEg3Uf/cOSyjRStUTZmTQW7FTEk6nRKPrXvf/0m2+NKZl4oMPLat9PnsJHSCRcbUKg5GznQp
 kuvfsX1s6kUibnV6oxbQDjk+I3ncLMBzfgBJZRsI5+Se1qQm3ITOpU3QanmcWq+DoeGAdbp91
 eq4QsbROlfXbTqlQffXmV5JZLIZzhxn/Gjnuyfm+pWj0ck7qTjehqJS0AMG/9edMdHK/kvX1s
 j5AwMrjJXv9MJWRysJMg5uA6pC/D2t/IW4VHRQTgrRylNEGKyenfdIetSUaWcIOm4xW5N5Sdf
 64o30/u9mNFp4Xl6bS8P/TDvClshYMh+HeL0QypfERwuPaiNIYts1K2dL4Bo6q+i/CEs=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.264,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Le 23/12/2021 à 07:47, Tonis Tiigi a écrit :
> There seems to be difference in syscall and libc definition of these
> methods and therefore musl does not implement them (1e21e78bf7). Call
> syscall directly to ensure the behavior of the libc of user application,
> not the libc that was used to build QEMU.
> 
> Signed-off-by: Tonis Tiigi <tonistiigi@gmail.com>
> ---
>   linux-user/syscall.c      | 40 ++++++++++++++++++++++++++-------------
>   linux-user/syscall_defs.h |  4 ++++
>   2 files changed, 31 insertions(+), 13 deletions(-)

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


