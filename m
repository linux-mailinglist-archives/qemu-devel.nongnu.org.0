Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA2533309E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:07:49 +0100 (CET)
Received: from localhost ([::1]:35626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJja0-0007pR-Av
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:07:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJjLc-0007Ry-If; Tue, 09 Mar 2021 15:52:57 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:52989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJjLS-0002nE-17; Tue, 09 Mar 2021 15:52:52 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MSLhm-1lD2Kh04UK-00SjAy; Tue, 09 Mar 2021 21:52:43 +0100
Subject: Re: [PATCH] docs/system: Document the removal of "compat" property
 for POWER CPUs
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <161399328834.51902.14269239378658110394.stgit@bahia.lan>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <e7281f1f-27b2-a464-d7bf-bbd2fb116168@vivier.eu>
Date: Tue, 9 Mar 2021 21:52:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <161399328834.51902.14269239378658110394.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RW+fTeY5NEE0QuxIfqSMgVsW8Wm4nXO+gkJ7PhOqcVMz+Pt4N11
 lHP7aL7drgmB+JCy2o0mGyP/CBuUko7vavdrsIiGWg0ApGjLtW/x6PwaLTJBhPYmqFDsSzI
 Lc5EJefyON5SEAuLoIabzp37Q2j1v1NeyIs+c0OXo5cWldtnZ2B30VKs+0fGvFVBaeTUXDx
 BKFoJI4YHvK9+SEZEzGDw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FfEK6C83CrE=:epUt1na3NfzmDRfOYR/Sm4
 e4U5SmrGnuTC8rblMYjrg3qu0ddvsWJMXw7YJIybjNcwz/yUk5C7H4WWhxYYXRdmq6vcUmbtB
 Jhrkcz36fSaptW6Yhrrxw9oySdKqJ5OqD5lMU/2t0TnyY7liSlAd7ILzbhawvhnmDSRjvE5yM
 N9o0/ryJL/O5gbTZTKpCO2a1rbaeaOhbR7WJvlmMJSRM2IdeD0yTg3PvcAahLvHKwq878Xd0c
 ura7fUEV2/QGp095VtR+X4547WwjoMZvswB5j7AADU6WUpS3oUQDh8GPGVdBTb/dN3Jl94d9O
 ifI9/MeVM2SiKf+y9muQKBRo/HXnvA4VOcdnsCInFmz2HWwMmLzCBsGAGk7YEw7z+zejbzV0b
 berDp4BdS3i7ZUDuJ6OfAOzuZ3GOWLAJ4B12qtIBYzdhRaZutIY51m/KQPsnZ
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


