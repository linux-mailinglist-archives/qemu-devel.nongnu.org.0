Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF8E5ACF56
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 11:57:28 +0200 (CEST)
Received: from localhost ([::1]:39548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV8r9-0001iw-DO
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 05:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tugy@chinatelecom.cn>)
 id 1oV8nq-00072K-UT
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 05:54:04 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:56979
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tugy@chinatelecom.cn>) id 1oV8no-000173-2x
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 05:54:02 -0400
HMM_SOURCE_IP: 172.18.0.218:46676.1487504611
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.148.58.2 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id A0B2F2800A9;
 Mon,  5 Sep 2022 17:53:44 +0800 (CST)
X-189-SAVE-TO-SEND: +tugy@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 3a8d2299c5704fed9d97da580e4fc2c3 for
 peter.maydell@linaro.org; Mon, 05 Sep 2022 17:53:49 CST
X-Transaction-ID: 3a8d2299c5704fed9d97da580e4fc2c3
X-Real-From: tugy@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Message-ID: <d99f2dba-0b04-a8e9-4dea-407bfedbdb79@chinatelecom.cn>
Date: Mon, 5 Sep 2022 17:53:42 +0800
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.978,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

Ping...

Any advises are welcome

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

