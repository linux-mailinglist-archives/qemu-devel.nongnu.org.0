Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 227563E5B8E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 15:27:31 +0200 (CEST)
Received: from localhost ([::1]:48618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDRn0-0003sd-7P
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 09:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mDRlV-0002yG-4o
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 09:25:57 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:33949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mDRlT-0003P8-LC
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 09:25:56 -0400
Received: from [192.168.100.1] ([82.142.5.86]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MP2zs-1mTqXz3qdo-00PMHZ; Tue, 10 Aug 2021 15:25:52 +0200
Subject: Re: [PATCH] linux-user: Check lock_user result for ip_mreq_source
 sockopts
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210809155424.30968-1-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <93eefdc3-9624-2b5a-8401-62af5f09c82d@vivier.eu>
Date: Tue, 10 Aug 2021 15:25:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210809155424.30968-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dZO/h5PSI2xeII8Q8cFIZtcMgDEGHwr/aSKNPu7jAdoWI8wX57J
 sPBRqxagdLbjF6lyp3q0UQnMIsCFDL5RbKuVgjEaULhJZ8yOdkts6n1gPOw4hRQyF8qGdTF
 yhUbsWZ5UrJDjLrHEeQp3J9Mk4xb966IRyrer8EMD2ua1+8SKShZli4KgRS2MN0F7L3iiQZ
 k/ZYCAh4lgbOLAzKYuKyg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nxixUdb+L8E=:Tvvq3PmW1MoS2q0A+vJHz5
 wb3SS+nxtPJzhL31Fu+J1/zaVfC0HtptEv8Mgk7g4llNGMuLLH/b8x2G69oH8IlnpjProi6b6
 U3YS3p+pZLZ+0F7DvWkzzZtorkdkeCeVZoj0AwjLz3IEVNLDyG0/rzePNlwTh3uUVrCb10ztj
 JAxQaCl1lBGplww0x/QRZPp+Swiacu7w+F0YSDGpY/Vp6hJa0CjHvPWhiJFBKFT4cwkMAsCsG
 vhPAmS46neiUZUL9CR4erZhkNjtCGhryyFWAMiF7vtSDqHg4UUV2rmDQjgwgEx1lIJmt8jOua
 S/wi5a/tkA744RdWxENQjCoyV8QHivG5Jm+hq1Dnw84T0JZROChsG16wuRGKSijztSB/fY6Xu
 jz9C/oGHsR4Mxuf0I726N8w+3Qe/0zyVLLv3NTumY+FBa68Pv+ZA8AvJ5F9euWweVc/utd9X3
 lZL73nUkDnm5Tlmzld1RgEPsCQiDD3guoFMytsJDSBeJT09+FFxXPk21UFibLsxdyViDFzfEs
 CmvqdvIMvifB+8AOeIfpeAszz+Y/Ur4HUgQzHgspf+VqYZruZDvRrplsLO0jHiFej1vUb8v6J
 1G2sgRALttD9R+6aXxNuEtp9MkqPneObVGDbQaIcWGu0+zBCOH/c127NuPf8LTp5TVcAtNHdZ
 fSIlriegLE9V9eJdFfhLY3lh+5kz4V+6Y7iWoG4M9wEaTcChLomhQiq9mS71fec2f7W+kB/+S
 wL/LfkbxEMCbIbW7utjxxMDE9CEsBeAqyqKY8V2oWYSRAsGAp87eabasVYHIRcDKNPREuf7xH
 NXxX9ojiA2c9eRNw64HU7CKRDYgwYK0we6Z2iaY1bxHL6htjtWab+8ir3ay3T3R3fcijQGc
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 09/08/2021 à 17:54, Peter Maydell a écrit :
> In do_setsockopt(), the code path for the options which take a struct
> ip_mreq_source (IP_BLOCK_SOURCE, IP_UNBLOCK_SOURCE,
> IP_ADD_SOURCE_MEMBERSHIP and IP_DROP_SOURCE_MEMBERSHIP) fails to
> check the return value from lock_user().  Handle this in the usual
> way by returning -TARGET_EFAULT.
> 
> (In practice this was probably harmless because we'd pass a NULL
> pointer to setsockopt() and the kernel would then return EFAULT.)
> 
> Fixes: Coverity CID 1459987
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Compile-tested only; I don't have a test case to hand that
> uses these socket options.
> 
>  linux-user/syscall.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index ccd3892b2df..d2b062ea5a9 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -2121,6 +2121,9 @@ static abi_long do_setsockopt(int sockfd, int level, int optname,
>                  return -TARGET_EINVAL;
>  
>              ip_mreq_source = lock_user(VERIFY_READ, optval_addr, optlen, 1);
> +            if (!ip_mreq_source) {
> +                return -TARGET_EFAULT;
> +            }
>              ret = get_errno(setsockopt(sockfd, level, optname, ip_mreq_source, optlen));
>              unlock_user (ip_mreq_source, optval_addr, 0);
>              break;
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

