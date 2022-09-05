Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0405AD3B3
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 15:21:19 +0200 (CEST)
Received: from localhost ([::1]:59408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVC2Q-0002gp-Ie
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 09:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tugy@chinatelecom.cn>)
 id 1oVBii-0006FW-EC
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 09:00:56 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:35953
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tugy@chinatelecom.cn>) id 1oVBic-0002Nt-6k
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 09:00:56 -0400
HMM_SOURCE_IP: 172.18.0.218:42128.1046698057
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.148.58.2 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 678082800A7;
 Mon,  5 Sep 2022 21:00:33 +0800 (CST)
X-189-SAVE-TO-SEND: +tugy@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id c6a53a3202ff407b893bb0a1155b4914 for
 marcandre.lureau@gmail.com; Mon, 05 Sep 2022 21:00:40 CST
X-Transaction-ID: c6a53a3202ff407b893bb0a1155b4914
X-Real-From: tugy@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Message-ID: <98e1bb3c-0dfc-6416-86b5-c97ede9a9c7c@chinatelecom.cn>
Date: Mon, 5 Sep 2022 21:00:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: tugy@chinatelecom.cn, peter.maydell@linaro.org, f4bug@amsat.org,
 qemu_oss@crudebyte.com, richard.henderson@linaro.org, berrange@redhat.com,
 mst@redhat.com, kraxel@redhat.com, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v1 0/2] introduce qemu_socketpiar()
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <cover.1661240709.git.tugy@chinatelecom.cn>
 <CAJ+F1CL7G+RGGH1Qt6TwX0fHRjNxtyfg27HyuZJnGh49KdXaGg@mail.gmail.com>
 <02813d8a-6fce-8623-a188-ead54682b55e@chinatelecom.cn>
 <CAJ+F1CJi4mkAHEGBm2WYK+mw37byzof0p+omCcuZy9sdh4N4xQ@mail.gmail.com>
From: Guoyi Tu <tugy@chinatelecom.cn>
In-Reply-To: <CAJ+F1CJi4mkAHEGBm2WYK+mw37byzof0p+omCcuZy9sdh4N4xQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219; envelope-from=tugy@chinatelecom.cn;
 helo=chinatelecom.cn
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.716,
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



On 9/5/22 20:33, Marc-André Lureau wrote:
> Hi
> 
> On Mon, Sep 5, 2022 at 4:28 PM Guoyi Tu <tugy@chinatelecom.cn 
> <mailto:tugy@chinatelecom.cn>> wrote:
> 
> 
> 
>     On 9/5/22 19:19, Marc-André Lureau wrote:
>      > Hi
>      >
>      > On Tue, Aug 23, 2022 at 12:00 PM <tugy@chinatelecom.cn
>     <mailto:tugy@chinatelecom.cn>
>      > <mailto:tugy@chinatelecom.cn <mailto:tugy@chinatelecom.cn>>> wrote:
>      >
>      >     From: Guoyi Tu <tugy@chinatelecom.cn
>     <mailto:tugy@chinatelecom.cn> <mailto:tugy@chinatelecom.cn
>     <mailto:tugy@chinatelecom.cn>>>
>      >
>      >     Introduce qemu_socketpair() to create socket pair fd, and
>      >     set the close-on-exec flag at default as with the other type
>      >     of socket does.
>      >
>      >     besides, the live update feature is developing, so it's necessary
>      >     to do that.
>      >
>      >     Guoyi Tu (2):
>      >        oslib-posix: Introduce qemu_socketpair()
>      >        vhost-user: Call qemu_socketpair() instead of socketpair()
>      >
>      >
>      > Looks like a good idea to me. We will eventually extend the
>     support for
>      > win32 (as discussed in "[PATCH 19/51] tests/qtest: Build
>      > test-filter-{mirror, redirector} cases for posix only").
>      >
>      > There are other places where you can replace existing
>     socketpair() calls
>      > in the code base. Why not do it?
>      >
>     yeah, Thanks for reminding me, Maybe i can replace all the existing
>     socketpair() calls in a separate patch if this patch can be merged to
>     upstream.
> 
> 
> It needs to be reviewed though, all may not want to set CLOEXEC, but 
> most should. Else, we should probably consider switching to GSpawn which 
> does dup or unset CLOEXEC for explicitely passed fds.

Got it. Special care will be taken when replace those functions.

Thanks again.

--
Guoyi
>     --
>     Guoyi
> 
>      > Current patches lgtm
>      > Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com
>     <mailto:marcandre.lureau@redhat.com>
>      > <mailto:marcandre.lureau@redhat.com
>     <mailto:marcandre.lureau@redhat.com>>>
>      >
>      > --
>      > Marc-André Lureau
> 
> 
> 
> -- 
> Marc-André Lureau

