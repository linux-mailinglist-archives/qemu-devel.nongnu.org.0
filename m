Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0001337FAFD
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 17:47:48 +0200 (CEST)
Received: from localhost ([::1]:48966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhDYy-0003jA-40
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 11:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhDXu-0002kF-Ss; Thu, 13 May 2021 11:46:44 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:42433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhDXp-0003ZE-EZ; Thu, 13 May 2021 11:46:42 -0400
Received: from [192.168.100.1] ([82.142.31.78]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MhlCg-1l3m3L24y8-00djtq; Thu, 13 May 2021 17:46:31 +0200
Subject: Re: [PATCH 0/3] hw/virtio: Constify VirtIOFeature
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210511104157.2880306-1-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <789e6a38-73e1-e581-e26b-43dadb58fbff@vivier.eu>
Date: Thu, 13 May 2021 17:46:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511104157.2880306-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:aMJtWrSUT7mfG+O1NQ0XLPCoWFghh8FRgwISxruFWatLXJ6+qJq
 UzN8IMrU1XJIIcNFBp7x3QsShCqKKVxVGPqI/T+Ox6j1BZbJGTfR8MxOtozHv2GrQpKh6yD
 j4JLiOekQ4FQZGfeXPEDrvqkfTIG38IoORn2bM1UtRorBBk6hnUMVXFaO32Nk9wDyuVo/84
 7z9aTSuFKcr2XXbXem9jQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zEAbOMY2E+0=:psrrEe6N5F2m03ZW5Qgwb6
 2r9Fn6fqdiX1aB/6cdc6lg2LVe5370X0WnNARMU2iQeyNdIpxlX0Jr6TD3VpusjhI8rHeYUzy
 A+f/2WVzA1e/xxCRgNLet58NX2hfIgm0+Ss8MJeEAwAF4OfzsQmOH+fqT21y0vQosPpYRDw8m
 uaxkKkF66y15imsW6gTW90rPhCplurVBJYftwedsLAZQEC1DWtnu9D1L9FoxmPSm0MsAitRAH
 p2FDL1rCobFUAVeSGwLn9y2allEMF6UAtnGTUwZHGjQxfoBkyxAu07cReSMjcMpJpuP/nXXbK
 QCDvdV/MfcwM7WWbobCNwCZ4yo7kDx5AFKUsuXmY/Ll9Xr+L71aRn2Q76GS78cBUXkIvqUpBG
 8o5LDAEn0lm74VMarUWvMkahrJ83LWyVjjSoF3jOdvR7v93VhstrIqljwXJcplwA5yH21811c
 E6CkmSxjBRijWfVXd5y8Z2bAnY6qrErxtKV4RE98V2OXhjAzTE4bvt5AjL2PbZJyGrnzgbO3I
 0vD+gpcCR4d5XxGhE5WqDc=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 11/05/2021 à 12:41, Philippe Mathieu-Daudé a écrit :
> Trivial patches to keep VirtIOFeature arrays read-only
> (better safe than sorry).
> 
> Philippe Mathieu-Daudé (3):
>   hw/virtio: Pass virtio_feature_get_config_size() a const argument
>   virtio-blk: Constify VirtIOFeature feature_sizes[]
>   virtio-net: Constify VirtIOFeature feature_sizes[]
> 
>  include/hw/virtio/virtio.h | 2 +-
>  hw/block/virtio-blk.c      | 2 +-
>  hw/net/virtio-net.c        | 2 +-
>  hw/virtio/virtio.c         | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 

Series applied to my trivial-patches branch.

Thanks,
Laurent


