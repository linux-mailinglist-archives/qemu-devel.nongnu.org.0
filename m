Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EFB47B24D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 18:43:51 +0100 (CET)
Received: from localhost ([::1]:44952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzMhS-0002HF-9H
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 12:43:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mzL6J-0005vu-SD; Mon, 20 Dec 2021 11:01:25 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:60285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mzL6I-0008Uy-6K; Mon, 20 Dec 2021 11:01:23 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MlwBh-1mZb4N3Jh5-00iyWc; Mon, 20 Dec 2021 17:01:12 +0100
Message-ID: <88fff234-b5c1-16e5-58ab-c3b9bc19e3b9@vivier.eu>
Date: Mon, 20 Dec 2021 17:01:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] linux-user: Remove the deprecated ppc64abi32 target
Content-Language: fr
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211215084958.185214-1-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211215084958.185214-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PDB8UfQwYaYxU5SGX4Hes0eLj0zdpSAq+OBqhSvZOb9dFhpyYJm
 Lt0EjO4a72oDLJqP0ZLIMJT8J8WfGBAbzw8Mtgo02Pwum8mjGuCU+NuhFFfuBV6de9n7OQP
 C0OUVD9pdLBY/Lqvoo226pU/OP4L9/wE6wmXhpcnMeCNdPt5pikrbYI3LRymw8QjxauwWSH
 6mvqvWbinYRe4NRjvWCgQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7n007gJBtxk=:uBl4KWHUrCc1x9HGrQW2ra
 v74DCw+LSlr5BAgAy15Z/8DozvdMKBPCNIeZ/ykgwK5drfC5EctSmDjTYwFOwOnQ01EvCwn8D
 IIveylaTUPSuwf3BLSiqph5+DJW31r3yb32BEPAlLjKD+7MQoPE7W2tReWSaO77XHCEAsP0Bq
 TH1yti68uD7JZTQzL756V89dsP+hqluaBHTBAb/Exh/uA1DewiAIASPqJVGhNyFfA3QO9xQej
 qu84T0Da0HoLuMKFdlNsu/IBY8K84DLZgu9pXsGbMSEApT+71LaMJxvWk91ZCdWsUu4k1ubxE
 k+cgW4gtBYGOvreriIn7PJNkR47MdxahUl7aDtEIJfa2ygz38lKV4Sh1GS88cwcxVHRceAOZ0
 oHdhN1lHq5X4EO7QOW7phNIxVg3hCZ4DWsurgWEjz6znQNVdyEKCJqcJyPaiV1a7g3psPRlDF
 oTLYMU+tfzvLlISqVOXdPHEpRUJrpkm2vC9ric7XLYwiIdHYdygcSQaVN4HxGCpYTD4AAvViv
 jVeBpSgXddnbvS8kH73xUkqQnRv2QmtImSu39udmEG+Sb82YB/tmCCYc8mcLay9zIER+06HPL
 nPTvhFiykHkQ1gamShXlWQcMjKAw722Fwxb6nQ3YcNX3UkYqHxH/6mPHq+RnzOD841rmaek2v
 d0mhqXYPB8O0sdavKkM/Ng7BnL3c6ldAosnRLRcKd09exieBI464pGcNiTHOXcxTaGpI=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.608,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 15/12/2021 à 09:49, Thomas Huth a écrit :
> It's likely broken, and nobody cared for picking it up again
> during the deprecation phase, so let's remove this now.
> 
> Since this is the last entry in deprecated_targets_list, remove
> the related code in the configure script, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   .gitlab-ci.d/buildtest.yml                    | 27 -----------------
>   configs/targets/ppc64abi32-linux-user.mak     |  8 -----
>   configure                                     | 29 +------------------
>   docs/about/deprecated.rst                     |  7 -----
>   docs/about/removed-features.rst               |  8 +++++
>   docs/user/main.rst                            |  1 -
>   linux-user/elfload.c                          |  4 +--
>   linux-user/ppc/signal.c                       | 11 ++-----
>   linux-user/ppc/target_syscall.h               |  4 +--
>   linux-user/syscall_defs.h                     |  6 ++--
>   .../dockerfiles/debian-ppc64el-cross.docker   |  2 +-
>   tests/tcg/configure.sh                        |  2 +-
>   12 files changed, 21 insertions(+), 88 deletions(-)
>   delete mode 100644 configs/targets/ppc64abi32-linux-user.mak
> 

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent



