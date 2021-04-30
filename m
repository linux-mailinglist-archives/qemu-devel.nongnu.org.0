Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B92A36FFCC
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 19:42:38 +0200 (CEST)
Received: from localhost ([::1]:55010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcX9x-0003hT-3u
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 13:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcWkz-0005ak-Ow; Fri, 30 Apr 2021 13:16:49 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:34773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcWkx-0007Y7-9b; Fri, 30 Apr 2021 13:16:49 -0400
Received: from [192.168.100.1] ([82.142.15.170]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MCb2L-1lm7831vHf-009d9h; Fri, 30 Apr 2021 19:16:44 +0200
Subject: Re: [PATCH] docs/system: Document the removal of "compat" property
 for POWER CPUs
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <161399328834.51902.14269239378658110394.stgit@bahia.lan>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <43426d7d-9c97-4351-107e-a0db86760c45@vivier.eu>
Date: Fri, 30 Apr 2021 19:16:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <161399328834.51902.14269239378658110394.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:gEu43DWuUUyjLgYZ4kpqPOyKIgTmT3HatW1OjabE6BDzPrbHcyC
 WNHV7BUMm/zw7ipDQaStgMBUU/DiUyE2ZflBRMFe7ShWuq20oDpLFllab4LS3eOmQQqOXzW
 xdjF0YkHwsa03XV6o3nFcKf1kMK7Ev+5qaBSbfrBzUwmDvF8UKh97IiIgqOuLhP47yka9BG
 jyCwfPu8zsW41eLHhdyNQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:64MuyvCyG2M=:jBEnugHGcAQRJcoudlhOCY
 ot5B1mc42ERso7OqMhJsIh1Zmc6hxGsYHlim7799pZSXPCXa7aV4xnQa9cvAw1zZkfeQVPWnw
 JbdM9eM9NhaZaxBQei1yrbUjHo32k3eecUUUHoiZex4nzD5dIeRvqW9IWP0WOoWY3U6iyyI0H
 CyP8ml2ZF3BMbWIjzbfs+jdTCMBSj6IwIdRNviIrGvEAO6R0W+GmijeaaKZqOHV+2VyI9KBaH
 DuifeftFj5lC2J4DhnEChHolDarh9i8wYH+vnGfvIJnzET+Uv/bW8Dn2bxlTJhPqoXH7rAuol
 PZ8tLc0C76ticpNR+pTpy4pM1SW9/0Mzw3a/lv287xH6Q1k/8ipBP5u+4/T4DqbaAoXRO7TgZ
 4hu6CX1G+oZIdjmP5u5S8FU9gAr6aVK2Ckojso/3KVGFz9cxQeV/cRMoCQDbYwWHwvqeqzCRN
 61SQYdfRgq+IHJIYilbBB5nVl/VaD/Pdl4S1d8jNCo9hP7/O9dsS47+6mFcVTrTuBxXjHNTtR
 aTO48OF+Si5WxqirhGHNXs=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 22/02/2021 à 12:28, Greg Kurz a écrit :
> This is just an oversight.
> 
> Fixes: f518be3aa35b ("target/ppc: Remove "compat" property of server class POWER CPUs")
> Cc: groug@kaod.org
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  docs/system/removed-features.rst |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
> index c8481cafbd5c..04ffa90d48ca 100644
> --- a/docs/system/removed-features.rst
> +++ b/docs/system/removed-features.rst
> @@ -115,6 +115,12 @@ The RISC-V no MMU cpus have been removed. The two CPUs: ``rv32imacu-nommu`` and
>  ``rv64imacu-nommu`` can no longer be used. Instead the MMU status can be specified
>  via the CPU ``mmu`` option when using the ``rv32`` or ``rv64`` CPUs.
>  
> +``compat`` property of server class POWER CPUs (removed in 6.0)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +The ``max-cpu-compat`` property of the ``pseries`` machine type should be used
> +instead.
> +
>  System emulator machines
>  ------------------------
>  
> 
> 
> 

Better late than never:

Applied to my trivial-patches branch.

+cc stable

Thanks,
Laurent


