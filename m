Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28462609A1F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 07:56:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omje8-0005qe-QK
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 18:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1omLiD-0007Ev-R0; Sat, 22 Oct 2022 17:07:21 -0400
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1omLiB-0002H9-WC; Sat, 22 Oct 2022 17:07:21 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mnq0K-1pSq9A2EZO-00pN4p; Sat, 22 Oct 2022 23:07:14 +0200
Message-ID: <6a978ba7-45cb-323d-0c1c-ed40dd68972f@vivier.eu>
Date: Sat, 22 Oct 2022 23:07:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 3/3] Drop more useless casts from void * to pointer
Content-Language: fr
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20220923120025.448759-1-armbru@redhat.com>
 <20220923120025.448759-4-armbru@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220923120025.448759-4-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yfP9r8Jdaorb6aN6wRucBPoLiBto1GMtflYkOOFobLd5PE2ocbY
 OnQC9KFTQDJblAGRutGYK9SSM2pj2yqBPrXKHXr7OMSFeSB5z7ZJdruTxadFsh/unFVf3dx
 XRZt6Y7QyOFPUXWd91dAjsUfSNuWmZKYqdYjZI1fvKjLK65z2mvNScVKClxUkSOvzZIK95S
 6r2g8oZ7ao1ArgRglDkvA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nhjUG/N8dl4=:/7QGBCQCf+MXO9GUdzQaJD
 MXNxAO2jrfELSmR/QX5G6xRoYwVtcJAPoJt7P+DwT60wBpnAhhHDfDLNGk4GDFVvY6VzQAVtY
 3OQSpN5zvgq25iuVjovwTWF7MNrztYOc3boTFRCFlhHroXUgJCeh+v/RvbHsespe1GgJnEnFd
 kHfy/XdEmrwe86PYAH0uCciMEf4zxlTWE0qruoYsgis9yT7arrohxNnGR4UCW0F34351FkBp1
 G5rEuA7fEAV/AAmF7QEOEEzWpK926ZTilkgSfJgJJP0Fi8Ys1gimMX+032DU1SOEZXOy74mR0
 LZ7+S6qG5ylZTvk/5mAw+Cm8j/o0XlEuroDaAgQoZCimavI10OvEr+wkCxT+K29aA3BfBf6tm
 eyfQG7zPJSPgcoUJBN/Eq1c0tSYlt/bzKmtk6clV8lrGkvTWQL9J93Ko1STNuDoHJCt0qkaDz
 tvJTHnTC7/wJ1eGHYgcrAKOc9A/Y/b37ZJn+VTWMAKFvJOu1npzRiEVQmaC3QVjSTzkbdMw9W
 14p9qlE8Y1xzliFFeLNYF8GSQBd6P687lSdiXpIe5quJNUXicIeQ0knSPdA9fgDg/zwEyPOtC
 jg0ZYVccUeGqLNGaTI7ZhedKaprJJFW3RJme4LuTgJws0/Wwo/0rJ51WoI2nacST17OBxBt8C
 U2MgJcD670z9ZFEmxh0StgSbvm2LTcIQ6cXxX7WfO9EY67rm7W971B9GEYZhEQ/+tY3/9EC5H
 gYhXmsHPQfgXIp98QAZhI955AaLz3x9gYc0tVwN8loxnEx6ZJPdYPDm3uRWV/YCjryoo/Io6T
 5cpkSEq
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 23/09/2022 à 14:00, Markus Armbruster a écrit :
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   bsd-user/elfload.c                      | 2 +-
>   contrib/plugins/cache.c                 | 8 ++++----
>   contrib/vhost-user-blk/vhost-user-blk.c | 2 +-
>   hw/core/qdev-clock.c                    | 2 +-
>   hw/hyperv/vmbus.c                       | 2 +-
>   hw/net/cadence_gem.c                    | 2 +-
>   hw/net/virtio-net.c                     | 2 +-
>   hw/nvme/ctrl.c                          | 4 ++--
>   hw/rdma/vmw/pvrdma_cmd.c                | 9 +++------
>   hw/rdma/vmw/pvrdma_qp_ops.c             | 6 +++---
>   hw/virtio/virtio-iommu.c                | 3 +--
>   linux-user/syscall.c                    | 2 +-
>   target/i386/hax/hax-all.c               | 2 +-
>   tests/tcg/aarch64/system/semiheap.c     | 4 ++--
>   util/coroutine-ucontext.c               | 2 +-
>   util/vfio-helpers.c                     | 2 +-
>   16 files changed, 25 insertions(+), 29 deletions(-)
> 
...
> diff --git a/util/coroutine-ucontext.c b/util/coroutine-ucontext.c
> index ddc98fb4f8..31f586d366 100644
> --- a/util/coroutine-ucontext.c
> +++ b/util/coroutine-ucontext.c
> @@ -105,7 +105,7 @@ void finish_switch_fiber(void *fake_stack_save)
>       __sanitizer_finish_switch_fiber(fake_stack_save, &bottom_old, &size_old);
>   
>       if (!leaderp->stack) {
> -        leaderp->stack = (void *)bottom_old;
> +        leaderp->stack = bottom_old;

bottom_old is "const void *" and stack is "void *", I think compiler will complain we discard the 
"const" qualifier.

Otherwise:

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


