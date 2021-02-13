Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A2031AE79
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 00:12:39 +0100 (CET)
Received: from localhost ([::1]:44296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lB45e-0000Y5-Lw
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 18:12:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB44f-0008SK-Fs; Sat, 13 Feb 2021 18:11:38 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:54381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB44b-0001Li-UT; Sat, 13 Feb 2021 18:11:36 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MS3r9-1lIRwv3GHb-00TTe7; Sun, 14 Feb 2021 00:11:22 +0100
Subject: Re: [PATCH v2 07/12] tpm: put some tpm devices into the correct
 category
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201130083630.2520597-1-ganqixin@huawei.com>
 <20201130083630.2520597-8-ganqixin@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <d9e8d3df-cbd7-9555-c0d2-43b2446bfef0@vivier.eu>
Date: Sun, 14 Feb 2021 00:11:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20201130083630.2520597-8-ganqixin@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9ccmmX0F1/j8ePL8SQ1k7WlTF00w3UF8/rBR7hrpx04yaANzGW6
 5OMOqYVivqE3DhSZJvrse7QWEcMd7uaflVjsjm9ChRL/YrmOJRbhjVsslVE3L2/MQeEwe9g
 iH67iLdLuTPlS+a6B9Y9TXap9Kud6UDQ2tW7rHRtHs1g750pYpm7MS0a7C+lYnq6teU2yjg
 rKE8CN8RojYhFfsU6z7Dw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:L5EVsvg8ivE=:CR8G/k+HH1KEzK3b8+dmLj
 kvv1MP7ee0cfUPLPfCQ3/7gF0sl9NGcNhkE0raHIhYLIvBIq+4JNskgAT/ZLugYdnhsDPBgz0
 LuCAWvIHKnw3qGbWxIXsJ6bB+nc/hsBkkdoVwoKaGYziBfN1Ishw0XuRD3xjPSZvZEEmpDfGA
 WyoWDvX7Xh/QHxgAN7y3bOaz2GQ8SF2GhaH2IoQgBBnkv1lMjxomztpp4xN1qAW56r6qCIK9Q
 UO3ZKhxQvWSn+WIaxT670pkFsshhvcfHNSM2s7FCz8mnJhiqyK2VnFdaQfxzw7m6w1Bb7eFfY
 jlxbrJALG5teaMsOw1gcxNRP6RAfolZDUnijDhZ1gLPOff1pChMAYLfk1VhoDauzyE8suRJEY
 lO42yst6oGLSdsDYwT/mO7Gzc0X1lepxNuQ+aZoUgVPGd6Iie5wsm2rj7vSqV4l7Cdb7RSJxr
 vPrG7CvaPA==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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
Cc: kuhn.chenqun@huawei.com, thuth@redhat.com, zhang.zhanghailiang@huawei.com,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 30/11/2020 à 09:36, Gan Qixin a écrit :
> Some tpm devices have no category, put them into the correct category.
> 
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
> Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
> ---
>  hw/tpm/tpm_tis_isa.c    | 1 +
>  hw/tpm/tpm_tis_sysbus.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/hw/tpm/tpm_tis_isa.c b/hw/tpm/tpm_tis_isa.c
> index 6fd876eebf..10d8a14f19 100644
> --- a/hw/tpm/tpm_tis_isa.c
> +++ b/hw/tpm/tpm_tis_isa.c
> @@ -150,6 +150,7 @@ static void tpm_tis_isa_class_init(ObjectClass *klass, void *data)
>      dc->reset = tpm_tis_isa_reset;
>      tc->request_completed = tpm_tis_isa_request_completed;
>      tc->get_version = tpm_tis_isa_get_tpm_version;
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>  }
>  
>  static const TypeInfo tpm_tis_isa_info = {
> diff --git a/hw/tpm/tpm_tis_sysbus.c b/hw/tpm/tpm_tis_sysbus.c
> index 2c32aa7099..45e63efd63 100644
> --- a/hw/tpm/tpm_tis_sysbus.c
> +++ b/hw/tpm/tpm_tis_sysbus.c
> @@ -139,6 +139,7 @@ static void tpm_tis_sysbus_class_init(ObjectClass *klass, void *data)
>      dc->reset = tpm_tis_sysbus_reset;
>      tc->request_completed = tpm_tis_sysbus_request_completed;
>      tc->get_version = tpm_tis_sysbus_get_tpm_version;
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>  }
>  
>  static const TypeInfo tpm_tis_sysbus_info = {
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


