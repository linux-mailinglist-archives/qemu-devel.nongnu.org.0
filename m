Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2816C33309D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:07:33 +0100 (CET)
Received: from localhost ([::1]:34430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjZk-0007Fg-0x
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:07:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJjBL-0002Xv-LJ; Tue, 09 Mar 2021 15:42:20 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:54771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJjBI-0006jJ-44; Tue, 09 Mar 2021 15:42:19 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MX0TX-1lHBxT2qmP-00XNSY; Tue, 09 Mar 2021 21:42:10 +0100
Subject: Re: [PATCH 2/2] vhost_user_gpu: Drop dead check for g_malloc() failure
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210126124240.2081959-1-armbru@redhat.com>
 <20210126124240.2081959-3-armbru@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <aa5fd123-d1a2-3928-a62a-2ec26b5a49b7@vivier.eu>
Date: Tue, 9 Mar 2021 21:42:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210126124240.2081959-3-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ibsdu3YLGMoLhSNeXKAHiDQq10ER+xXy65u3veAhal7W88cUgsd
 7diT6tNaOro7yn1Fy36TdkMjejICGyOHD9SXn1vkhoLFFyOjb5RQe12/nKSwqM+aEood0/O
 P6YBcbexjiW25wJQ0nxrrFI9vAvh46HTdLZw5LvUBFPFdav1gc/QPCmwfTAZI6xq0CPFHPG
 wxtXtQrAzeEBx2fSiu65Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Yv48Udrekgs=:x0cnWZNKWC8Ca3tcRbYD/X
 yZOjuercW20gIn45JtXrYtTt3/DBY9wOKQocbrjmWsi0LqujGMSKcrykjBGs99qJU1dZe39Zb
 8gR6aBu6OBJIBptzyQdJT6ZnOel8QUZXaTanIJFGZp/FIfDsVmguZNj0XcceHa7TJyM0mIQX1
 BQlFowaWJccGTGss/u+3K9wX8u0NYSVgI48nc4XLVf80YtXNY7PGh3EjOK8TxC420+Muh0sgn
 PF3mnC7nEgymqkh8DdNfa53aNcEe5cI/NflLXOo9J+BEwJsFORLrp14UPtdNq4za09hNE7ygM
 o4n6VesFFZlFe8/TPrXlS781qjpa9m8tyYAazVNKeoJSgh3h46/DewdZS5S+TrhDdRzjppCxn
 9F0RU1j8NYGsk6QIHJSnzu6NLMaf2hvyidqXGMnoNp2GshuRMY7ZNHDih+knL
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 marcandre.lureau@redhat.com, kraxel@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 26/01/2021 à 13:42, Markus Armbruster a écrit :
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/display/vhost-user-gpu.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
> index 51f1747c4a..db042c7c5e 100644
> --- a/hw/display/vhost-user-gpu.c
> +++ b/hw/display/vhost-user-gpu.c
> @@ -332,7 +332,6 @@ vhost_user_gpu_chr_read(void *opaque)
>      }
>  
>      msg = g_malloc(VHOST_USER_GPU_HDR_SIZE + size);
> -    g_return_if_fail(msg != NULL);
>  
>      r = qemu_chr_fe_read_all(&g->vhost_chr,
>                               (uint8_t *)&msg->payload, size);
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

