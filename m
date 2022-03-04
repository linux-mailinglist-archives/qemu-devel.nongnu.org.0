Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 278A74CD248
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 11:20:59 +0100 (CET)
Received: from localhost ([::1]:58484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ53R-0003bg-70
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 05:20:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nQ52B-0002uj-0W
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:19:39 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:48321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nQ529-0001fx-9z
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:19:38 -0500
Received: from [192.168.100.1] ([82.142.8.122]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MPXQi-1nmZjR2imI-00MfjQ; Fri, 04 Mar 2022 11:19:27 +0100
Message-ID: <cb6f0c8f-4c41-d847-f168-7afe3fccd0f9@vivier.eu>
Date: Fri, 4 Mar 2022 11:19:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 01/10] macfb: add VMStateDescription for
 MacfbNubusState and MacfbSysBusState
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, pbonzini@redhat.com,
 fam@euphon.net, qemu-devel@nongnu.org
References: <20220302212752.6922-1-mark.cave-ayland@ilande.co.uk>
 <20220302212752.6922-2-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220302212752.6922-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:7EjuG0TJEa0MvO4FQNhfvp/J9u2sWzGaP1f93gaRwF0ILnjG8cf
 LZWuEZ5PvPcAOqu6dOFtBv/AQSvcPUOiNbSKLAEoa+FDAU8E/ZzenZ/S7Dm9MNCaYWnWdGo
 +zgoTrg1t+Lrd0aS75xgyt4yUb0v4L+OWBxWZE2vM8TJzv6aW87n557C1yDzjXnSh1D64KL
 l300L4UxovVcalae4ling==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pQCv4SZqIs0=:/OSAoIz4mZs4DtH2EueKgD
 BTsCt9UELkk2vlDJTTWbAKNiEsTEzOMPXHYoFgtF48J4b87Zmp5iY1NEIHp/pl34Sxy+ivZaK
 zfR6XMWUbK1S76/QgOFvbRoPqSQMw05YVur/y6b59uyxr0EnRdS/BGxwaOd/ZwQf/EsZy8TVS
 ndH6v1iFhPlctWcivrzeHGe/FCF+VhiDXdjRWvFxggFShYPEQ1gidLTAOA+i1ay7ahdbE/NZw
 K23kvNye2WJPT3LraUzaiJK4VSRmwIKmktVYcB+SY7wdhbLZUFv0xYMpPDIVUiOBLth2hhzKt
 QTGKyYYUfieR91mGyV9TLSVNMkLl6hz3Uz0XleGRKUYZWBdXvIfFCr9R5vP9uFxNsBQxD6fDv
 lHsFdsxcuKwf1DLOTt3mNfBrNzadrjSJLele7D6qNEHZn+iFIJSioZfxSd7AZ/9R68O1sB26h
 ErsMHGOZA4DGhc3R/1a2NYqMWrEUemYKbKN0YMZIxI3CoASpHJgPooojZU/3R4jOAge5gPltY
 UiCi+f1zrFe2Lj6ZNhLHXJSC8VCC6rLfgf1x3nPF8QHxM7+fT7TrMJk1Bb8rrLWvbuagNUG6+
 xpR2v3a3kZHdjQCn/8gWLBloe+BJIvc/PTMkOwp2scqoruUFcrCt0GRyTxcY8TD3dRUkeUsvh
 p4DaD46/v0Cdz6zFSifm0I7eauUuH6vhxcuMgN3yGuKJXGIzgvYCJaPvqesTbPDAbu7M=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 02/03/2022 à 22:27, Mark Cave-Ayland a écrit :
> Currently when QEMU tries to migrate the macfb framebuffer it crashes randomly
> because the opaque provided by the DeviceClass vmsd property for both devices
> is set to MacfbState rather than MacfbNubusState or MacfbSysBusState as
> appropriate.
> 
> Resolve the issue by adding new VMStateDescriptions for MacfbNubusState and
> MacfbSysBusState which embed the existing vmstate_macfb VMStateDescription
> within them using VMSTATE_STRUCT.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/display/macfb.c | 24 ++++++++++++++++++++++--
>   1 file changed, 22 insertions(+), 2 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


