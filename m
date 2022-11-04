Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F9D619CDF
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 17:18:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqzNQ-0001iU-Pw; Fri, 04 Nov 2022 12:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqzNF-0001QN-5v; Fri, 04 Nov 2022 12:16:56 -0400
Received: from mout.kundenserver.de ([217.72.192.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqzND-0000vB-I3; Fri, 04 Nov 2022 12:16:52 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MirfG-1pTbuj0Gge-00eshM; Fri, 04 Nov 2022 17:16:45 +0100
Message-ID: <ba853014-e45e-7fab-fc40-fc11487c51cd@vivier.eu>
Date: Fri, 4 Nov 2022 17:16:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PULL 04/10] libvhost-user: Fix wrong type of argument to
 formatting function (reported by LGTM)
Content-Language: fr
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20221103161727.4116147-1-laurent@vivier.eu>
 <20221103161727.4116147-5-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221103161727.4116147-5-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KuT1KaIO1ChXtoEym2/L3KO6XIhmNaaqpknWrxxY0nxTVElfmeV
 aB4749vTloDnN2dZ0mGy2e8tf4hChgesgmp13+U2bWR44SvS7KQUkvKK4NW3+sLZoZ6cv8u
 72KeAYCB5pHs69BFVg4jHP8Lt2i7GnJnpPB3KuFJ0409suuKD+vlsGVvqbyQOIHKIYsELVa
 t7OdcKe8bX0Gqb+uilbkg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jkE46CQltzQ=:xzY35CHNu2mUDB8lU8F24r
 aJ91UNT1ahkYV0t++Xmvec3d22eIDt0aHSNS5xYBEbE+8On7D7GSPVhIW1HMKMmPWP/WzIrx9
 xwwWtpg8W86fgrcBn7kviVr5GTlM36+z+z/TJC+HJrcjy3F1LMkdnCLV9xjvaD1AVOrdTu4dw
 fLiOKIzoh+nqMYWnSlclkJroYy8JWUyHBIUQrHVDHaUYfIGgVnkOfQQrZCefGU871jh48OwBo
 wY9fgruhvbZtMoWArT5Ug8uCv9sbKCpwho/G/yB6dTR/kH20YRjV6Kh6uce4Vgj1Njj+PVkee
 Kfmk5iFUdpNy4UR7TOYk1FC4ttwAENQIRGoz6yB0H2TzAaJaD/ktVLZ7FUzGueSDVThzCxW/4
 VSWqofEm2yBg9P5+1yNtpdGn9+/vBHke1qaQmK7jdp867ID0e+yDj+ymh0Pt0tGiBQ57dlVJZ
 cJ9ekf0hw/p8vOD05ctBVc5P8bkyAKlBgATJcgSQ6YuMouxHfjAazNBqYszqmYDkHX6+ZcN/O
 kchi5rqx98t4E6Mck4eIGuXu08ubBIP/nCR4FJUV+KXWI2sV6nOdiR6g0oL4qJULLwRnO3BfP
 wYUcWxU2R01sHlGPzMMniAcoJiH0/XD2VvepCK6t/h2W+A66ll/1n/YMN0API7JLZsuxXY2AU
 CkJy37dwY9/a729lQJVuPKiJ7j3Z67p3pweRTmHY+20tGn4B5mFwY6q4+Y/oeAXDOSvevBJYC
 5OrGDigDGd+6THtcknnR03M74nV4004VXPqjifxGuGptgwRxvk/jsWyErTgf7SdiLaqqUnflF
 joN1qE8
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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

Hi Stefan,

Le 03/11/2022 à 17:17, Laurent Vivier a écrit :
> From: Stefan Weil <sw@weilnetz.de>
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> Message-Id: <20220422070144.1043697-2-sw@weilnetz.de>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   subprojects/libvhost-user/libvhost-user.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
> index ffed4729a3dc..d9a6e3e5560f 100644
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

They all need PRIx64:

typedef struct VuDevRegion {
     /* Guest Physical address. */
     uint64_t gpa;
     /* Memory region size. */
     uint64_t size;
     /* QEMU virtual address (userspace). */
     uint64_t qva;
     /* Starting offset in our mmaped space. */
     uint64_t mmap_offset;
     /* Start address of mmaped space. */
     uint64_t mmap_addr;
} VuDevRegion;

Could you fix your patch?

Thanks,
Laurent

