Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4AF37FB23
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 17:59:48 +0200 (CEST)
Received: from localhost ([::1]:55902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhDkZ-0000cp-1i
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 11:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhDik-0008C2-JE; Thu, 13 May 2021 11:57:54 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:57233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhDii-0001s1-Tc; Thu, 13 May 2021 11:57:54 -0400
Received: from [192.168.100.1] ([82.142.31.78]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M6EOc-1lad4U3woi-006bFd; Thu, 13 May 2021 17:57:47 +0200
Subject: Re: [PATCH trivial] qapi: spelling fix (addtional)
To: Kevin Wolf <kwolf@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
References: <20210508093315.393274-1-mjt@msgid.tls.msk.ru>
 <YJkExu14294jutI/@merkur.fritz.box>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <49aaabc9-463f-8bc6-53bc-b6fefb9a6d02@vivier.eu>
Date: Thu, 13 May 2021 17:57:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJkExu14294jutI/@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Nbl3ek/eb9k79joY8vm139AphSfbBYb7ogKSvCABMuFmg4P1yI4
 /6szKA13slJOfEngASIQ7ThVtF4c6Lc1UrRaNtk1/Qk5++sxr8Gg0PzD/t5S4fPH9Mh+ZNm
 BqMowznEeTeKYiWC17dA464PFD6J7MHv9g9C08g5eCm5ZEAm1qvtUemX3l6Vugk9nVsSpSm
 XEUNaIu4UoN3JQAzF+LXw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:J6ue0yUmio0=:Fmky8Rih6WL51pTW1YcNiA
 Sj59xi8JKvOpXQXFy3yf2/laXFv5fMRc2gKyDZNzKAucHGQmDH/iqTK9KpWsazlGP7WsPpCzQ
 ukSbGNwo/vyLx7X76Br7gxDK9N/ZmKge/UdS4aGPZrKPp/85jJSqRS0+XAnZka1br2eGPENvR
 NNOdv4uUAhL3qWkmohqRpauz3dqgUXrwkiJld4geMhXXsbcdxp/CnhhJppT7kp3Vmhtoe5655
 TBnylZbZvEV5SSIII1d7TPfucFb9r0oHX/oiO7V31lB1o0BU0BZGZM3cbSWm4vMId6YQf4e7+
 xK0ry4ouKfB/tQzS2NkN3QP5xg3NDWLXvm6NER+IUiu9hpSBTuvTTFZrDEY9uXzKbSLTeZdR3
 +jWHJ1nOsJZ2X7GKdYOHwja5slEQ5QCuQGIZJzKgDdMxWyFni7M0OyukG/kBDP+0iM6qPEgNA
 qaIIxjggQlXO91RP/+3XmiWjUU6ho1RZ/xbPnaLuPeqqMtJLg3AE8JOEDtMLVECt48MQ16hQt
 hIJk7N2cNZPk6/U82/PAWI=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 10/05/2021 à 12:02, Kevin Wolf a écrit :
> Am 08.05.2021 um 11:33 hat Michael Tokarev geschrieben:
>> Fixes: 3d0d3c30ae3a259bff176f85a3efa2d0816695af
>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> 
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>
> 
> I'm also applying this to my block branch because this is how the patch
> that introduced it was merged, but if qemu-trivial merges first, this is
> fine.
> 
> Kevin
> 
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

