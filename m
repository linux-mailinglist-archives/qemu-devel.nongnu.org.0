Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF33B2D8944
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 19:30:04 +0100 (CET)
Received: from localhost ([::1]:40102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ko9ed-0005uu-VT
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 13:30:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ko9R2-0006Gh-Rq
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:16:00 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:33917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ko9R1-00015X-5c
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:16:00 -0500
Received: from [192.168.100.1] ([82.252.152.214]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MofPt-1kLc4y2LQf-00p2ND for <qemu-devel@nongnu.org>; Sat, 12 Dec 2020
 18:09:49 +0100
Subject: Re: [PATCH 0/2] target/m68k: add vmstate structure to migrate M68kCPU
To: qemu-devel@nongnu.org
References: <20201022203000.1922749-1-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <57d1af33-f437-81a9-5c69-6938260aa274@vivier.eu>
Date: Sat, 12 Dec 2020 18:09:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201022203000.1922749-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:A6tk3zsHiBt+zLolTKL7SnabH3/2pEc6sum3jWkAecZDoDJjvm+
 yXmZ+mVu3ynrdfsL7blyfUk6IaAD/UrR04ybS0K4yaC04U1YHjgtCFSyFCtr/s/vhm+4KRn
 7+a2x47ciJw87FwVF8guHccXntuw3POKpM6f80nt5Uqvqe3R2cOMEzXmF1tixMPsuC9Pr5K
 Et7vICAS/fOJ+Q3kqp2/A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1T96MxG5Vgc=:cVC+99H0S/kkkr8fC8tZW+
 uo+YCEjoMxv6Pff67lnBiU/YaFz9Mxmwrz5nJyFWWGmWmhmmeEIe4Q126XIuasOVhc4uD67yr
 U20/4vUKSXFWYXN/BpkIUPWTpq2g1zA9JlmkQKlumtwESMlhq/G5C+cg6FMmtNfX0QngAdaWr
 3yREmoGyi5AtCmnC8bRY9V+4xaCpdxmZSwta6f2fxBU0gyBWvQ6OELNYFk8N8rzae0n70dplY
 DFr/LS9BBZl+aW5wWIQ0aK1NkYt3enU1oPSN1edId+M2zCxV4NqmeB7IcnLe1K7qCOz8z2vYH
 XV9CBisyfyRv/waiGZTjo1sgRM/PHMZ8XpFWxQ/6HGzMCRUvOUtaO/8R19CZXsFoXmi3V7LoS
 CQtXpVHCves+kz8wrbhLOeaDOVmpiRUUXCyH8PqYc+pe75al4KDRqJCr6FFYApeXdPwYDwP1N
 JhafUdKhEw==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 22/10/2020 à 22:29, Laurent Vivier a écrit :
> First patch is a cleanup patch.
> 
> The second patch defines the vmstate structure for M68kCPU.
> 
> I have tested the migration with my experimental machine virt-m68k.
> 
> I didn't check if q800 machine type has all the needed vmstates
> for all the hardware devices it uses.
> 
> Thanks,
> Laurent
> 
> Laurent Vivier (2):
>   target/m68k: remove useless qregs array
>   target/m68k: Add vmstate definition for M68kCPU
> 
>  target/m68k/cpu.h        |   5 +-
>  target/m68k/cpu.c        | 193 ++++++++++++++++++++++++++++++++++++++-
>  target/m68k/fpu_helper.c |  10 +-
>  3 files changed, 198 insertions(+), 10 deletions(-)
> 

Applied to my m68k-for-6.0 branch

Thanks,
Laurent

