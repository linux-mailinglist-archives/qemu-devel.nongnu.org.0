Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E74574B4D8E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 12:14:07 +0100 (CET)
Received: from localhost ([::1]:33478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJZJ0-0007Mc-Gc
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 06:14:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nJZGH-0006Ke-GC
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 06:11:17 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:41849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nJZGF-00064Y-6g
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 06:11:17 -0500
Received: from [192.168.100.1] ([82.142.13.146]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MqZE0-1o63Ar1cCu-00mc0X; Mon, 14 Feb 2022 12:11:09 +0100
Message-ID: <bd849d6c-9798-71b0-4ad4-abc84df74892@vivier.eu>
Date: Mon, 14 Feb 2022 12:11:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH v2 00/25] Virtio Sound card Implementation
Content-Language: fr
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
 <20220211221319.193404-1-chouhan.shreyansh2702@gmail.com>
 <a910913f-9621-1b75-d9a1-e5e7e0e5a135@vivier.eu>
 <20220214104403.xzzjy3iihnafe4vv@sirius.home.kraxel.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220214104403.xzzjy3iihnafe4vv@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:N8mOkdELf4FHyeRhtCJUWH0l1UEg+9mkjTnd4ovVpHW3c313Uqr
 fcAKh85Yd0qdF4oYWTIJOA+XnTnCGMu22cCfp1b5VjUb2fzomCtCUjJBFUve3zcfQcaTnMC
 F42vrbdokIAuQsQ1y1OzpYt+UUSMrV8S+emO53FkYCXQJmWtxPBlywVjHphw2DldBhQLh86
 A5E8G5/uVBCMFBZ1Y7QYw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rWQh2Bu5/E4=:jYGtp+7XN39+HWA3HSlt6C
 L3zgw05vHYclHiGJC4XnEwGubPCPOJuIKSmaR0R6JIQ2+Kvo4jeAOpKjhdkZbBCsaNGDaM8IO
 Yr9SOR8YvseA5hXh7mDPCQEp4a2IlxQb93tuCo++VJyea0fMsr5vx3MDM449lLsZQvtapcmDd
 0WhRnfkoEtZqjuq8/uMEBK1mCT0xWK8n1ab//CwMIotm39OzmlDQduM3WKGwg8IRdCZXQ8sYQ
 yIuEcFDqAz5SfoWBgp7sNq96CaTgOQzh2JbZ8wQFAsmd9F7YGd/R4un4PWXmr5L519oL8vKuD
 5MHauFXVOPVvgK83oT5fcSmdgLV9JIY0bRiAlZX1FWyq/C+NPvK8Wz/jeF+XyyE+DhmhOyHg8
 n7mk1Pa4F7GUbJVOJ5U4qmw/hPXepTtCDsgpA5BPMomBgtyBiqF4DgpOS80MOKdoGSzpuhm00
 G2r5pVyf9KBussn83ZfLV2qpND2vM3b39a/SMSKqKgFTjzjaNJZbDsk3aZAtf3Ld5rDBJT8UU
 W2+0rNf6XfJmPNQU23vUMDNc4gVODnHav2pehi6VYL0SnwYv7wzo45+2yRjlTUfOFKGDJxSgj
 o8a7GRZoUzdxEoWJc4cUxiLNEVz5gv8fXPSFRRvlLglEQmViHa/FMyluRoWpgoBD+bdoILYVV
 ntg1CAHbiVyxpzhTNN1cCVAwbWuOD/RIl3jurOglvimiPj5koq8PD5iEdnjIim69SZcI=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 14/02/2022 à 11:44, Gerd Hoffmann a écrit :
>    Hi,
> 
>> IMHO, all your patches can be merged in only one.
> 
> For the most part yes.  I'd keep the pci wrapper (aka -device
> virtio-snd-pci) separate though.  Possibly also patches adding
> significant functionality in the future (i.e. one patch with all
> basics and playback support, one patch adding recording
> functionality, ...).
> 

I agree.

Laurent

