Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC00607A5B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 17:19:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oltnw-0004dY-OB
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 11:19:25 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oltn8-00066E-VD
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 11:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oltmb-0002sj-7l
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 11:18:01 -0400
Received: from mout.kundenserver.de ([217.72.192.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oltmV-0001VH-7t
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 11:18:00 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MS3vJ-1of3NV1ja7-00TUrg; Fri, 21 Oct 2022 17:17:50 +0200
Message-ID: <f35c0e8d-4c98-7776-7df2-cb5b7ad61ab7@vivier.eu>
Date: Fri, 21 Oct 2022 17:17:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 2/4] linux-user: remove conditionals for many fs.h ioctls
Content-Language: fr
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221004093206.652431-1-berrange@redhat.com>
 <20221004093206.652431-3-berrange@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221004093206.652431-3-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BUcqe9N7qcamLwdK+7WsNLDlB8ouV3pddxJP7HPTSFhU20UT76d
 vHBelqSVhwC8dKU4AOfGS85rKLyj+OrsN4OrZXeGTDFlYYfILDt61Xf5xjj81OPvyiJ8nrK
 rIvhFvcB1fiRoWMqdnLtpmsjSj4M6uRbhcFRgjHf1aBJ+xl+Om7eGeGF8EWqr5lEHt/YUYR
 AwrEimgn0p5qJuKphGOaw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YREghppKyLI=:56SV7JCRFbtV4Nre0ja+/i
 P8DIh9x3mcVB/RWinvvGVxQPkecinKJXlbVj6xonvq6MlT2VYOkpi+Ql7MxprzNsoz1Il0Y2n
 cG62a3chWRh1vz7ZiG7/ReNm8Lyng87qeqQmPAbzkU+BQMJsuUrQNF9zVF5sffhH3BLgL/jxo
 8m1dkAiRsDMSVdcDMz+dVktzek1qaHcC69MUxfo9oQtPUAwHi+QpDJlj7tRTnjB8m3rJ5NY+f
 j1TUkf8wVcgc1VPpv0FXKBcHbN3CkY/E5816I1PJrBV0YgkvW2JTyolB5TER+SRo5BfB6P/B4
 +reMK3/tl+ahNrt2F2Ixp+Iq/5SlZMD5XyT+8VWhV8nXWPUcv4J4bSnpotOLEq6X5HldDRx2O
 8YKCQskFzqxutiSV6alTMtSrkOVMtGprKdbkAIELhZm87WjJTLrxir83N9Fh+BD/x5gA33fq2
 bYexx5esaRauxRg3f6exUTfZJdGXeegie9hPixAPz3hgR8ubGAceqvnCg7YZ0X1TeQNMTxKdp
 kQ07r8RLWbmVyOI8PUhyW02udWe19wibPirVnZAmqAI0QLjuH46fHQEbYMWKru2hX1plRtAKU
 i0+Z5x9GwgGyY+HpzgUXzGFUD71IXLwoIJWy1ROaqCQO7JYLA8VI7v6GqB17NWvXr4Gfm0FcS
 tbSivfl/92BB1NLQkPUHr6fXVDdY8gXuW8RwH6tCKy8eWZoHe3wUA1E0BEB1+tPPNJUmmykoj
 UfZV6uPb7b2ti2rUyN9tvu7OLEl5ldCg71va3mdNGvXSaR9m7ARx2wdTrlS53QCZnGGjWpym1
 sLa82/f
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 04/10/2022 à 11:32, Daniel P. Berrangé a écrit :
> These ioctls have been defined in linux/fs.h for a long time
> 
>    * BLKGETSIZE64 - <2.6.12 (linux.git epoch)
>    * BLKDISCARD - 2.6.28 (d30a2605be9d5132d95944916e8f578fcfe4f976)
>    * BLKIOMIN - 2.6.32 (ac481c20ef8f6c6f2be75d581863f40c43874ef7)
>    * BLKIOOPT - 2.6.32 (ac481c20ef8f6c6f2be75d581863f40c43874ef7)
>    * BLKALIGNOFF - 2.6.32 (ac481c20ef8f6c6f2be75d581863f40c43874ef7)
>    * BLKPBSZGET - 2.6.32 (ac481c20ef8f6c6f2be75d581863f40c43874ef7)
>    * BLKDISCARDZEROES - 2.6.32 (98262f2762f0067375f83824d81ea929e37e6bfe)
>    * BLKSECDISCARD - 2.6.36 (8d57a98ccd0b4489003473979da8f5a1363ba7a3)
>    * BLKROTATIONAL - 3.2 (ef00f59c95fe6e002e7c6e3663cdea65e253f4cc)
>    * BLKZEROOUT - 3.6 (66ba32dc167202c3cf8c86806581a9393ec7f488)
>    * FIBMAP - <2.6.12 (linux.git epoch)
>    * FIGETBSZ - <2.6.12 (linux.git epoch)
> 
> and when building with latest glibc, we'll see compat definitions
> in syscall.c anyway thanks to the previous patch. Thus we can
> assume they always exist and remove the conditional checks.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   linux-user/ioctls.h | 24 ------------------------
>   1 file changed, 24 deletions(-)
> 
> diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
> index f182d40190..071f7ca253 100644
> --- a/linux-user/ioctls.h
> +++ b/linux-user/ioctls.h
> @@ -96,9 +96,7 @@
>        IOCTL(BLKROGET, IOC_R, MK_PTR(TYPE_INT))
>        IOCTL(BLKRRPART, 0, TYPE_NULL)
>        IOCTL(BLKGETSIZE, IOC_R, MK_PTR(TYPE_ULONG))
> -#ifdef BLKGETSIZE64
>        IOCTL(BLKGETSIZE64, IOC_R, MK_PTR(TYPE_ULONGLONG))
> -#endif
>        IOCTL(BLKFLSBUF, 0, TYPE_NULL)
>        IOCTL(BLKRASET, 0, TYPE_INT)
>        IOCTL(BLKRAGET, IOC_R, MK_PTR(TYPE_LONG))
> @@ -107,33 +105,15 @@
>        IOCTL_SPECIAL(BLKPG, IOC_W, do_ioctl_blkpg,
>                      MK_PTR(MK_STRUCT(STRUCT_blkpg_ioctl_arg)))
>   
> -#ifdef BLKDISCARD
>        IOCTL(BLKDISCARD, IOC_W, MK_PTR(MK_ARRAY(TYPE_ULONGLONG, 2)))
> -#endif
> -#ifdef BLKIOMIN
>        IOCTL(BLKIOMIN, IOC_R, MK_PTR(TYPE_INT))
> -#endif
> -#ifdef BLKIOOPT
>        IOCTL(BLKIOOPT, IOC_R, MK_PTR(TYPE_INT))
> -#endif
> -#ifdef BLKALIGNOFF
>        IOCTL(BLKALIGNOFF, IOC_R, MK_PTR(TYPE_INT))
> -#endif
> -#ifdef BLKPBSZGET
>        IOCTL(BLKPBSZGET, IOC_R, MK_PTR(TYPE_INT))
> -#endif
> -#ifdef BLKDISCARDZEROES
>        IOCTL(BLKDISCARDZEROES, IOC_R, MK_PTR(TYPE_INT))
> -#endif
> -#ifdef BLKSECDISCARD
>        IOCTL(BLKSECDISCARD, IOC_W, MK_PTR(MK_ARRAY(TYPE_ULONGLONG, 2)))
> -#endif
> -#ifdef BLKROTATIONAL
>        IOCTL(BLKROTATIONAL, IOC_R, MK_PTR(TYPE_SHORT))
> -#endif
> -#ifdef BLKZEROOUT
>        IOCTL(BLKZEROOUT, IOC_W, MK_PTR(MK_ARRAY(TYPE_ULONGLONG, 2)))
> -#endif
>   
>        IOCTL(FDMSGON, 0, TYPE_NULL)
>        IOCTL(FDMSGOFF, 0, TYPE_NULL)
> @@ -149,17 +129,13 @@
>        IOCTL(FDTWADDLE, 0, TYPE_NULL)
>        IOCTL(FDEJECT, 0, TYPE_NULL)
>   
> -#ifdef FIBMAP
>        IOCTL(FIBMAP, IOC_W | IOC_R, MK_PTR(TYPE_LONG))
> -#endif
>   #ifdef FICLONE
>        IOCTL(FICLONE, IOC_W, TYPE_INT)
>        IOCTL(FICLONERANGE, IOC_W, MK_PTR(MK_STRUCT(STRUCT_file_clone_range)))
>   #endif
>   
> -#ifdef FIGETBSZ
>        IOCTL(FIGETBSZ, IOC_R, MK_PTR(TYPE_LONG))
> -#endif
>   #ifdef CONFIG_FIEMAP
>        IOCTL_SPECIAL(FS_IOC_FIEMAP, IOC_W | IOC_R, do_ioctl_fs_ioc_fiemap,
>                      MK_PTR(MK_STRUCT(STRUCT_fiemap)))

Applied to my linux-user-for-7.2 branch.

Thanks,
Laurent


