Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5927647B234
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 18:33:13 +0100 (CET)
Received: from localhost ([::1]:45908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzMXA-0000LQ-EA
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 12:33:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mzKxD-0002MB-Nj
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:52:01 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:60247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mzKx6-0004ji-Td
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:51:56 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MEmMt-1nFTBP3yDz-00GLj4; Mon, 20 Dec 2021 12:35:49 +0100
Message-ID: <e1480965-6a34-211d-45ec-d4c8632ddcb9@vivier.eu>
Date: Mon, 20 Dec 2021 12:35:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 2/2] linux-user: call set/getscheduler set/getparam
 directly
Content-Language: fr
To: Tonis Tiigi <tonistiigi@gmail.com>, qemu-devel@nongnu.org
References: <20211220072105.48860-1-tonistiigi@gmail.com>
 <20211220072105.48860-3-tonistiigi@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211220072105.48860-3-tonistiigi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2b8Aq59Pn413sBoDve4Zg15DWgP/mVF3xKPOWHRYBO2aYBR3J0/
 scU31LQM8SMh4YzwM0wY71vkqH/W3Kg/gUQ9lt20PPJftwi1xg3U+23NzxmS41tv0lorlmy
 vNp2fk5SeBAiwzMhiKHX7cK9V5HBU3NG9agKTMv53cy9K4JvpQWJAXaQZ06HfD1DtemhPvA
 Ly/IsFUdU2feSnfrhx79w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LUZ0WKe99j8=:4+1tkuyWkNv6Zl17cWnTlE
 5ghsp511RVP16KlWNc5Roim8RBujuukHWIsg7IJP3Jo5Q45kCKLRwi8bs63unBVZfeoT2g1/R
 Uzx+MY0CBgUKhCAgJhow5s+Yzib9L60F9J8nbMq9eHNW19/xaguDzcT6V4Y0UhSRo0xxb/u0I
 Xh3E82wXQJneS5czc3hwJj7EoLi2WVhETGe/y22xzfF+DmT9v7A8z8fSXfkYQMgQCFbtu0TfA
 /TTSO0IGOJ+6JIStMod1ZlnVDRggbIaN+u2Be/0qqGIWZv1m0+dsmkPKQRO80wnBxitQiifBt
 NvtckLSe/iCtNqZv01GIr87I1nd3nCY2knmFY4bH8h127rQoXNQoRj/Fnz2RGTCEr3KLgZtxX
 /UfWBiG3jO3KbOlYkxh5HCW3YPRav8uHRySCcGWqof9ZBJ6zdA8LtD5FNhbsUw417YWGJV5vH
 qO7pBLvTG6Woh+22yNKXK+sGAuQdQDzs72QvA7oMZL48EvnzXrbuPyODYGhQnQbEBO8UoU2uS
 NkYsYdSi0/8ODEBQEehdjxllVeHQ40BuAoEvk3DBCnAGazdC+WgQ8Nzuv2EqLD9TnsGjoHs4V
 E6DNCxXhwNEu7RSPnRGdhPa9nBo96tVl1A47ZzOzslQ4mXVD5RRVoyZTDi/KrOkJZR5XUwX4g
 p5p2vCjUOiGogHE0lAYasiexxwzLBIlWZ4wzx+Ucwoqi9lQm4hPKLViVU6sil/nbT5eo=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.608,
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

Le 20/12/2021 à 08:21, Tonis Tiigi a écrit :
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
> 


Reviewed-by: Laurent Vivier <laurent@vivier.eu>

