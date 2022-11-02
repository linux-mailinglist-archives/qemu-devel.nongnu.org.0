Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD61616BF7
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 19:21:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqILd-00012Q-Fb; Wed, 02 Nov 2022 14:20:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqILP-00010a-Vz; Wed, 02 Nov 2022 14:20:08 -0400
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqILN-0000XS-Fz; Wed, 02 Nov 2022 14:20:07 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MEmEf-1onmRx0gIt-00GK9O; Wed, 02 Nov 2022 19:19:50 +0100
Message-ID: <a86945a0-6c29-965f-fb0f-b21f82b2c816@vivier.eu>
Date: Wed, 2 Nov 2022 19:19:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 1/3] libvhost-user: Fix wrong type of argument to
 formatting function (reported by LGTM)
Content-Language: fr
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20220422070144.1043697-1-sw@weilnetz.de>
 <20220422070144.1043697-2-sw@weilnetz.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220422070144.1043697-2-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FKooJ/De53pIFKYHLoqJI1Vavw9bqaIGA9I0e/Q+KKQH+Oj4ov8
 uuToYynF3Dxz03y3d/WYqL5liiz+ILOacJZ41yPWtHfZeaWZNIxTXyt+8b0/2SbyBef1BUE
 6h3xcskaCvtk83C5wXkHzwdpJ/6NLcxWWs77n+j72nq/nx0IeRMGtdDt/jYXz/p3Qu3e7ST
 FuyEsyGZpvUQF2QrloFGQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:beCc7CPXf4I=:Km2ugtsaK722ZBdL+7xO2m
 FAnIRHFxar6JpcK01gU4jubvVw1qPQrqsxr83Z7teS7R6pgIN5iPnPareGlzADgwUQIMmWDyQ
 /PTOwj2QLieQDzRtg7lFPzJN01vc9q92HTeNxVihSMYANE3Q7qcSYqpPiaP49AVM0QtG64Rtm
 L+BNAvY/k6XcXL3lraD6tBSfOwF29bdGIhh9oh42RQnjBxOxlzr8SqCCtNpNGCZgpn9dO6Il4
 MFddlgAmrR9dKNXkgvAidWnM/dRlECugj7Mk15Y8dkJtaXoPceyYgbtN3rBwYMV5g9i+9Yh5a
 6Hx2nXKfAXDmsMX7ysc8bbEfgIn7+lCWmC+0YaUbx+3upHg/RddRnlO3NXYGBa4x4KWXg5FPE
 Uzvgmn3X7esb0Y2iWKkZ9t8I+56z/rgcLv605l+1xtgRG545MbOS0lxuAuAxx1xrIJ1t+GECI
 jSUPKdojzOzod3WBWkn193l18CMjfynoDJwAlRCtzYUPYGsSUGlMgojy1hiIlJGPWUX06cZdP
 Vj1Yy50xuCXFS6HraTsvaX9FLYWcKVcAeWQDq7AqyDnxWDCbtrQeI4c1Gt2VlFpt0sFgtH0lz
 AQThnZ4Qjso2Ghp8ptQFkZM/sbJPxqLWHAb1mQhXBGEkQFTJweCe7lDQX4QRkl8Up7f6FdgA1
 79kk58pGsoRRY5UetedNj6O/DWgSU3FKInv7XAn/9teIN2NCdSJi2iYcxjmuKNUoHLjQYLISI
 aY2JNEPfhWtC03R3hDJTy0tjqH3OP72h9ZrAmyntuHLjwT/cOIc5DDmCjwPNlxKZqLVX8jjFx
 2gcHm4M
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
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> This patch was already sent to the list and got reviewed, but missed
> release 7.0.0.
> 
>   subprojects/libvhost-user/libvhost-user.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
> index 47d2efc60f..2d29140a8f 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -651,7 +651,7 @@ generate_faults(VuDev *dev) {
>   
>           if (ioctl(dev->postcopy_ufd, UFFDIO_REGISTER, &reg_struct)) {
>               vu_panic(dev, "%s: Failed to userfault region %d "
> -                          "@%p + size:%zx offset: %zx: (ufd=%d)%s\n",
> +                          "@%" PRIx64 " + size:%zx offset: %zx: (ufd=%d)%s\n",
>                        __func__, i,
>                        dev_region->mmap_addr,
>                        dev_region->size, dev_region->mmap_offset,

Applied to my trivial-patches branch.

Thanks,
Laurent


