Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCFF616C05
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 19:24:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqIOO-0003bO-Rq; Wed, 02 Nov 2022 14:23:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqIOH-0003TV-2t; Wed, 02 Nov 2022 14:23:09 -0400
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqIOC-00012d-KG; Wed, 02 Nov 2022 14:23:02 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MnpwC-1pMZ7m0b4k-00pNy5; Wed, 02 Nov 2022 19:22:44 +0100
Message-ID: <c2fc4156-1806-a252-56ac-e21267f525f5@vivier.eu>
Date: Wed, 2 Nov 2022 19:22:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 2/3] libvhost-user: Fix format strings
Content-Language: fr
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20220422070144.1043697-1-sw@weilnetz.de>
 <20220422070144.1043697-3-sw@weilnetz.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220422070144.1043697-3-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FIMmzHBT+anSYt/ziwIW7cCwh9hYquiiLuK3FoUgwqWAF01tfHZ
 /Li+wDaeYJaZiimT49JD/kSLm7Cj0EijR7mRnfWcL6L/yOn01DnNGKwJcsWpFf/iDh1Hi98
 aL6n1WhjFzx0sgJfbuyqXG2vlACmkLboRm6IwB3yXn8czZq5sKK0oADFkUNvEAE9xv9rKwL
 TJrI3DW1ytdtRaxiJMKiQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wLpyzC56O2g=:C8KbDaC6oydcvfRM58PNjC
 K+SJU8mHO1LsM/pcRYR7IWVjZnTnM4zDbJo9JgzVKd1M4stLKjT3IR/WncA7oxVboHg4lBz25
 TAe1axAM4clCBVgl8er8a3xU6ApXCIrez1QVVxepFaElbJzHhYgRYUnsm6KVZENw7S95UrwSf
 4WtOxkCr4F2ewBAQMPaHXSlYqMEqHTbKEcd5pUyLHiKRGn4AzH7dv7cyGdjGm/UH+lprEe5Yo
 mYUDXC4K2xYzZ6/Cm+uU9fvyKNOIcsVucEqQuTg5LC2S7+bxykf3H5s6Mi0I7/jClDr/m9o1r
 I3CDp6K0uCLxl6lziwfZDsCIQM88oe/xThRDQTXHx3Eh9h83/wHwI6TdfphZPntmzLJ0Md30/
 5FDqrKEf3ez9axjMMCtC6yFOyS5jenhg2CRj1b1ATahGDZiDoTq40KpanlSEdIaWCdhcSOA7w
 V8612BB6uAybCPGOHua3hoDC8YM5P74/TXs5y5UnqiDqhb0eRufJGUvyiRtB6D1qUJX29vOws
 XSr5dtAV975pNZvXTcxfd0NjBKgpFaXqwYYPXL4OejRzJUBtTMlFdppVvIJlzSRsBhlHiEguy
 TcVGBAQv2eIB9wUIQqgEV1qGc0GScZBukL0MxSGPONgD/96EUlnYKInja4EkLH1++WLtKOFBe
 StMeFASp3UKaMJmOG9xLvFKWg3w9uHYlPB5omcaJsW9jaSO6yJzarGV80Sgsqcu6f883k3yJs
 c3vJg1gMW9/m5uQdSwmUuTcNYJr89dTTOoxdnhWFbhEJfw87NAWHk6aYM9WPPELar6CKAgt+Q
 BmSdix+
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 22/04/2022 à 09:01, Stefan Weil a écrit :
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>   subprojects/libvhost-user/libvhost-user.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
> index 2d29140a8f..94645f9154 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -700,7 +700,7 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
>       if (vmsg->size < VHOST_USER_MEM_REG_SIZE) {
>           close(vmsg->fds[0]);
>           vu_panic(dev, "VHOST_USER_ADD_MEM_REG requires a message size of at "
> -                      "least %d bytes and only %d bytes were received",
> +                      "least %zu bytes and only %d bytes were received",
>                         VHOST_USER_MEM_REG_SIZE, vmsg->size);
>           return false;
>       }
> @@ -833,7 +833,7 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
>       if (vmsg->size < VHOST_USER_MEM_REG_SIZE) {
>           close(vmsg->fds[0]);
>           vu_panic(dev, "VHOST_USER_REM_MEM_REG requires a message size of at "
> -                      "least %d bytes and only %d bytes were received",
> +                      "least %zu bytes and only %d bytes were received",
>                         VHOST_USER_MEM_REG_SIZE, vmsg->size);
>           return false;
>       }

Applied to my trivial-patches branch.

Thanks,
Laurent


