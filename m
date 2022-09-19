Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C02625BC37D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 09:29:35 +0200 (CEST)
Received: from localhost ([::1]:40042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaBDi-00015C-BR
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 03:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tugy@chinatelecom.cn>)
 id 1oaB57-0004Oj-Gk
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 03:20:42 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:34442
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tugy@chinatelecom.cn>) id 1oaB53-00087h-T2
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 03:20:40 -0400
HMM_SOURCE_IP: 172.18.0.218:59486.217613756
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.85 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id E51CC2800C4;
 Mon, 19 Sep 2022 15:20:13 +0800 (CST)
X-189-SAVE-TO-SEND: +tugy@chinatelecom.cn
Received: from  ([36.111.64.85])
 by app0025 with ESMTP id 756ac17e52c445a98eddf449ec3018e7 for
 peter.maydell@linaro.org; Mon, 19 Sep 2022 15:20:26 CST
X-Transaction-ID: 756ac17e52c445a98eddf449ec3018e7
X-Real-From: tugy@chinatelecom.cn
X-Receive-IP: 36.111.64.85
X-MEDUSA-Status: 0
Message-ID: <78346219-548c-e2e0-6d01-745cbfe2b21e@chinatelecom.cn>
Date: Mon, 19 Sep 2022 15:20:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: tugy@chinatelecom.cn
Subject: Re: [PATCH v1 0/2] introduce qemu_socketpiar()
Content-Language: en-US
To: peter.maydell@linaro.org, f4bug@amsat.org, marcandre.lureau@redhat.com,
 qemu_oss@crudebyte.com, richard.henderson@linaro.org, berrange@redhat.com,
 mst@redhat.com, kraxel@redhat.com, qemu-devel@nongnu.org
References: <cover.1661240709.git.tugy@chinatelecom.cn>
From: Guoyi Tu <tugy@chinatelecom.cn>
In-Reply-To: <cover.1661240709.git.tugy@chinatelecom.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=42.123.76.219; envelope-from=tugy@chinatelecom.cn;
 helo=chinatelecom.cn
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.657,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Peter,

what do you think about this patches? If this could be merged in 
upstream, i will start to update the test codes

On 8/23/22 15:50, tugy@chinatelecom.cn wrote:
> From: Guoyi Tu <tugy@chinatelecom.cn>
> 
> Introduce qemu_socketpair() to create socket pair fd, and
> set the close-on-exec flag at default as with the other type
> of socket does.
> 
> besides, the live update feature is developing, so it's necessary
> to do that.
> 
> Guoyi Tu (2):
>    oslib-posix: Introduce qemu_socketpair()
>    vhost-user: Call qemu_socketpair() instead of socketpair()
> 
>   hw/display/vhost-user-gpu.c |  3 ++-
>   hw/virtio/vhost-user.c      |  2 +-
>   include/qemu/sockets.h      | 18 ++++++++++++++++++
>   util/oslib-posix.c          | 19 +++++++++++++++++++
>   4 files changed, 40 insertions(+), 2 deletions(-)
> 

