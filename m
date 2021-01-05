Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F102EA81C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 11:02:11 +0100 (CET)
Received: from localhost ([::1]:39620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwjAH-0000Vh-Fj
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 05:02:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kwj7X-0007vO-Ee
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 04:59:19 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:50317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kwj7R-0005Ue-DH
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 04:59:19 -0500
Received: from [192.168.100.1] ([82.252.137.42]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1McXs5-1kP2SP1Bgz-00d2ok; Tue, 05 Jan 2021 10:59:08 +0100
Subject: Re: [PATCH, BUILD-FIX] linux-user: Conditionalize TUNSETVNETLE
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210104234415.405521-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <db974bf1-0592-fb46-ef09-0de28a96c948@vivier.eu>
Date: Tue, 5 Jan 2021 10:59:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210104234415.405521-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6TNl8yXCEiLgBL2HehbQCDyDdUsdVd8PJ2fQPJei3s9CnEppFt0
 BJpdXM7LbzoRRzPIHex1f0y2rNWzU+xtsdBqF1IoRQXyviHMBSaWQh0483UnMXW33KKBCZh
 aRKZEk7o3zTJrc1Zks/pqFVVCgX+CljwOk1lhYF1MBNY/dMEn8sVSoddrFHEvf/d8/iRHV8
 9UGecjOIWj3iWjJm0F7vQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:m9S6HI6p0us=:DKQSv2ou4bfxFKKJuUn7gI
 mMSxZ5/ea7gfTlDzPztViekFSHhwPCd4yvajmNQhEyQSKCL8sOESWi9dglhaVMcsyHyckJlWt
 zcjsH1C36YQr0EHTuz3hIy6m5lml2zh17mKWwEq723n0gPA1C85AKwaafXwbYsFt6S4lY8zIl
 f11o+izJbaPFijP3FQnxbd0pUAPowTvmfFTVnKLajGYufHN5zwTnYNq7DwkYkbLV1l8T2EZ7Y
 AQzrH2jRfZwtGOXcVhmUMrqG/ln4cc0h2cZSPHlsnTztlU1JPnIBtlEzPckcKIMLPVlau23pB
 qCLjsNDHFO+tnhe/f72AdZ3z86OXfNiy/jVeyE+rZYdSRovBMvE3eUR6h27tVr/voBa3wrzBE
 g2awxG9Ic3ew1yvYmZh5IntWCgLP3puOutpOqEP+4sYmBRMSd7uGyirh8ONzu
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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
Cc: peter.maydell@linaro.org, Shu-Chun Weng <scw@google.com>,
 Josh Kunz <jkz@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 05/01/2021 à 00:44, Richard Henderson a écrit :
> This fixes the build for older ppc64 kernel headers.
> 
> Fixes: 6addf06a3c4
> Cc: Josh Kunz <jkz@google.com>
> Cc: Shu-Chun Weng <scw@google.com>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/ioctls.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
> index 661b5daa9f..7193c3b226 100644
> --- a/linux-user/ioctls.h
> +++ b/linux-user/ioctls.h
> @@ -748,8 +748,10 @@
>    IOCTL(TUNSETQUEUE,     IOC_W, MK_PTR(MK_STRUCT(STRUCT_short_ifreq)))
>    IOCTL(TUNSETIFINDEX ,  IOC_W, MK_PTR(TYPE_INT))
>    /* TUNGETFILTER is not supported: see TUNATTACHFILTER. */
> +#ifdef TUNSETVNETLE
>    IOCTL(TUNSETVNETLE,    IOC_W, MK_PTR(TYPE_INT))
>    IOCTL(TUNGETVNETLE,    IOC_R, MK_PTR(TYPE_INT))
> +#endif
>  #ifdef TUNSETVNETBE
>    IOCTL(TUNSETVNETBE,    IOC_W, MK_PTR(TYPE_INT))
>    IOCTL(TUNGETVNETBE,    IOC_R, MK_PTR(TYPE_INT))
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

