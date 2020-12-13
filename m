Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB812D8EDF
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 17:49:27 +0100 (CET)
Received: from localhost ([::1]:41742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koUYo-0001jS-8y
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 11:49:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koUX6-00011w-7y; Sun, 13 Dec 2020 11:47:40 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:56181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koUX1-0000EK-2W; Sun, 13 Dec 2020 11:47:39 -0500
Received: from [192.168.100.1] ([82.252.135.218]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mzydy-1jrjEW38ic-00x6bW; Sun, 13 Dec 2020 17:47:18 +0100
Subject: Re: [PATCH] fsdev: open brace '{' following struct go on the same line
To: zhouyang <zhouyang789@huawei.com>, peter.maydell@linaro.org
References: <20201209060735.2760943-1-zhouyang789@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <aa827f2c-9dbd-fafb-e611-e3e111f8d244@vivier.eu>
Date: Sun, 13 Dec 2020 17:47:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201209060735.2760943-1-zhouyang789@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0CKDtIfMXeJu1pfuttzvVGobWXxiXhCpOlITRrgeJj3KVtoSSOc
 R1hLY1rZpABdq7Daw+CsFXZiXq+yfz6qqFH7KBgAuv/CtmcXlfx5mJ7AJacpCBywDo8zCug
 hG81/N1TR+VWPhWaSpJ0AZBNDB3vXE4wXmJ5353BfJHseor9Ya6jkSQ6usIxz3QFlCOxOXM
 BhG/YZpawuVpiSJbbPPBw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xNlfrWpJlwU=:7tVQvcgWKcEN4qgpG14PmL
 Aeez/wyq+VgYDBRFiarM9doxiWHcKYRv1osVthR5/P/d6M4MqC+TMo1EpznGwS2/fnis6olz5
 IK96CICeQ9Oaww351Jxd/NZdrtu5rca+AAMT0lfMdpd4apixqK9NG8hg1+xyGTPlgT5193dEE
 WegUIQ2MifVY9uYgbxPaw7cHpyCdZAY5JOT431rpVefdPxGi8xnTFY1OItux5PpVMY6KBPs70
 pTDIRo7+wlG4lY5Cz7uDs5UDD+QEeG0uMhxuebKrgNpDvp6rev/ifxWKWyGKpL56vKzKHydeS
 aA+G/i/psuT6Ttc/xVoHuwl390N/HnczJctYN2PhZ7+Uu1sMay2FzQLAAx9FdHaFPrYW5pq84
 ET63purK26NB5n90ywcLfxLEK+USpL6c4xSeOKZP0dn0YFGYCIMgYt2Ks9Qo42XBvWY86IpNY
 bnmR2+g+3g==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org, alex.chen@huawei.com, qemu-devel@nongnu.org,
 hunongda@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 09/12/2020 à 07:07, zhouyang a écrit :
> I found some style problems while check the code using checkpatch.pl.
> This commit fixs the issue below:
> ERROR: open brace '{' following struct go on the same line
> 
> Signed-off-by: zhouyang <zhouyang789@huawei.com>
> ---
>  fsdev/9p-marshal.h | 12 ++++--------
>  fsdev/file-op-9p.h |  3 +--
>  2 files changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/fsdev/9p-marshal.h b/fsdev/9p-marshal.h
> index 8f3babb60a..ceaf2f521e 100644
> --- a/fsdev/9p-marshal.h
> +++ b/fsdev/9p-marshal.h
> @@ -1,21 +1,18 @@
>  #ifndef QEMU_9P_MARSHAL_H
>  #define QEMU_9P_MARSHAL_H
>  
> -typedef struct V9fsString
> -{
> +typedef struct V9fsString {
>      uint16_t size;
>      char *data;
>  } V9fsString;
>  
> -typedef struct V9fsQID
> -{
> +typedef struct V9fsQID {
>      uint8_t type;
>      uint32_t version;
>      uint64_t path;
>  } V9fsQID;
>  
> -typedef struct V9fsStat
> -{
> +typedef struct V9fsStat {
>      int16_t size;
>      int16_t type;
>      int32_t dev;
> @@ -35,8 +32,7 @@ typedef struct V9fsStat
>      int32_t n_muid;
>  } V9fsStat;
>  
> -typedef struct V9fsIattr
> -{
> +typedef struct V9fsIattr {
>      int32_t valid;
>      int32_t mode;
>      int32_t uid;
> diff --git a/fsdev/file-op-9p.h b/fsdev/file-op-9p.h
> index d51cec2f3b..42f677cf38 100644
> --- a/fsdev/file-op-9p.h
> +++ b/fsdev/file-op-9p.h
> @@ -110,8 +110,7 @@ typedef union V9fsFidOpenState V9fsFidOpenState;
>  
>  void cred_init(FsCred *);
>  
> -struct FileOperations
> -{
> +struct FileOperations {
>      int (*parse_opts)(QemuOpts *, FsDriverEntry *, Error **errp);
>      int (*init)(FsContext *, Error **errp);
>      void (*cleanup)(FsContext *);
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


