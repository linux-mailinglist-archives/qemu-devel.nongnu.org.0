Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 819314CD8AE
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 17:12:31 +0100 (CET)
Received: from localhost ([::1]:46330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQAXe-0002NR-8b
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 11:12:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nQAVG-0007c5-4T; Fri, 04 Mar 2022 11:10:02 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:54915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nQAVD-0002mS-P1; Fri, 04 Mar 2022 11:10:01 -0500
Received: from [192.168.100.1] ([82.142.8.122]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MPrXf-1nlwc92JP9-00MrtE; Fri, 04 Mar 2022 17:09:50 +0100
Message-ID: <a942e15b-9f18-a5b5-3a71-4fbefd16f07e@vivier.eu>
Date: Fri, 4 Mar 2022 17:09:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/4] oslib: drop qemu_gettimeofday()
Content-Language: fr
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220304152704.3466036-1-marcandre.lureau@redhat.com>
 <20220304152704.3466036-5-marcandre.lureau@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220304152704.3466036-5-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:z3NZTNTa6I15oZ1BOsCrdZmnJTjrvCkDNrAqeVid/SSBw6bkmnN
 hcOMPsF7h/9wLoPfB+bos5nmT26SxKtFO3h/ZtXYnSeeveR9/Dl+8cr0GNGVWXvWWuVbqpP
 sCUpfgB8j22qxADxKnUYXrkkucXorbw2/sn5GTb4VRz6XbiLC7F6RD3fdsZjyxd2NggT3x3
 1J2cmt3jqyhOTDuNkgssA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:k+HOPaNRqWs=:8nAW3+i2dh4gTEh+RQlJYL
 P8or2Hf2ywdpRGy4hhzWUk9rPjVvcktbMqwKmKmcII+StpRkVwMry+rgxmPi+rjfc5bNzepj0
 MMtCa7IL9sHZizj/eYiJ769y0nL7n/ce/gnAf/cEBamRQe7ix1Xe+1uh5HsdgdsUZsaAKxl5p
 3AGvzLBvpVs1kJipT9JZ/RkxQ89zVGNpKVcNHCQkZADmxmGuK4DsKnLDFZAsqvNFgY74jlxwB
 NM639MYtMUD+lEHJzPz4AS+plppHtJkymEKFI3m3JzNoHF5LpK+Ec0P7ICEhRrvvICNh+nT1C
 KacmRkfqM8JvMA8S/jZoYDe9HWLWENZQvanOq/jzovJC5wS2WeA1j4aFbBzNN81gytFAkkWTf
 0XzAl0DNNaUvPEu9Tf2i1diHk8tUB9PFX3zUlqP6v5tQpl/vCBya4zjrcRP2RbNRRMGOgv+DE
 9Jo53mCCydHk5e9yJAUVgwgPKOMWTHH+ZEqyvenH190tlmD4BMd6Yt21s79xk06x7lzZUPOcM
 tAEB2gIfgBl+eQI2kAgGjncCopDnKp4OlcjjJDtxK/sPPvBxwrV0jBptOOfK/Zilj1rgphBcK
 VM/WUuBHzDTr22BFdZHYkPa8SNuOpYBZ9L94uHttOgyAXRporCnTq+x2neSziay+iaaEu/hxb
 rktSNUcllx0Mf0lOMb1G0hlKEhTFVBevUdq0dmruacf0HYEghy1awUGJjSFUYjQmqjeQ=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marek Vasut <marex@denx.de>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Chris Wulff <crwulff@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 04/03/2022 à 16:27, marcandre.lureau@redhat.com a écrit :
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> No longer used after the previous patches.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   include/sysemu/os-posix.h |  3 ---
>   include/sysemu/os-win32.h |  6 ------
>   util/oslib-win32.c        | 20 --------------------
>   3 files changed, 29 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


