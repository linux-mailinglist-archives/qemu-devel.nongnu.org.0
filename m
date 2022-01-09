Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FEC488891
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 10:47:03 +0100 (CET)
Received: from localhost ([::1]:56556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6Un0-0002UP-K5
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 04:47:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTp-0005Pe-NL
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:27:13 -0500
Received: from mail.xen0n.name ([115.28.160.31]:55752
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTm-0006LM-LN
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:27:13 -0500
Received: from [192.168.9.172] (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 366EB62E7C;
 Sun,  9 Jan 2022 17:26:47 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1641720407; bh=RPdoOPoY6fasPhJsExnvmt5/W/QD7kythNlIKfkM/pI=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=POUHsfgC8KawxqyWhzu13gcxeLPKmlMWCMS4xW1gWZZWxdNTyjA222KWwY+XpcgHJ
 qzWyicY3bB6o99QZynW5ttZyUzuaUs2hXyOSgACCcYgF/kxMzGjEwZHtDYIaWFJY9S
 otIT81EBa7LZGUSTIoan/tz98FDQKvIilRtN6BTg=
Message-ID: <7d922249-5833-6a84-02ac-d830d4f0f31c@xen0n.name>
Date: Sun, 9 Jan 2022 17:25:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0a1
From: WANG Xuerui <i.qemu@xen0n.name>
Subject: Re: [RFC PATCH v4 04/30] target/loongarch: Implement
 qmp_query_cpu_definitions()
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220108091419.2027710-1-yangxiaojuan@loongson.cn>
 <20220108091419.2027710-5-yangxiaojuan@loongson.cn>
Content-Language: en-US
In-Reply-To: <20220108091419.2027710-5-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 philmd@redhat.com, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/8/22 17:13, Xiaojuan Yang wrote:
> This patch introduce qmp_query_cpu_definitions interface.

"implments"; however the whole sentence becomes nearly identical to the 
title, so it's better to remove this sentence after all.

> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Reviewed-by: Richard Henderson<richard.henderson@linaro.org>
> ---
>   qapi/machine-target.json |  6 ++++--
>   target/loongarch/cpu.c   | 26 ++++++++++++++++++++++++++
>   2 files changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
> index f5ec4bc172..682dc86b42 100644
> --- a/qapi/machine-target.json
> +++ b/qapi/machine-target.json
> @@ -324,7 +324,8 @@
>                      'TARGET_ARM',
>                      'TARGET_I386',
>                      'TARGET_S390X',
> -                   'TARGET_MIPS' ] } }
> +                   'TARGET_MIPS',
> +                   'TARGET_LOONGARCH64' ] } }
>   
>   ##
>   # @query-cpu-definitions:
> @@ -340,4 +341,5 @@
>                      'TARGET_ARM',
>                      'TARGET_I386',
>                      'TARGET_S390X',
> -                   'TARGET_MIPS' ] } }
> +                   'TARGET_MIPS',
> +                   'TARGET_LOONGARCH64' ] } }
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index 6e3dc5e6fa..690eeea2e6 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -351,3 +351,29 @@ static const TypeInfo loongarch_cpu_type_infos[] = {
>   };
>   
>   DEFINE_TYPES(loongarch_cpu_type_infos)
> +
> +static void loongarch_cpu_add_definition(gpointer data, gpointer user_data)
> +{
> +    ObjectClass *oc = data;
> +    CpuDefinitionInfoList **cpu_list = user_data;
> +    CpuDefinitionInfo *info = g_new0(CpuDefinitionInfo, 1);
> +    const char *typename = object_class_get_name(oc);
> +
> +    info->name = g_strndup(typename,
> +                           strlen(typename) - strlen("-" TYPE_LOONGARCH_CPU));
> +    info->q_typename = g_strdup(typename);
> +
> +    QAPI_LIST_PREPEND(*cpu_list, info);
> +}
> +
> +CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
> +{
> +    CpuDefinitionInfoList *cpu_list = NULL;
> +    GSList *list;
> +
> +    list = object_class_get_list(TYPE_LOONGARCH_CPU, false);
> +    g_slist_foreach(list, loongarch_cpu_add_definition, &cpu_list);
> +    g_slist_free(list);
> +
> +    return cpu_list;
> +}

After removing the commit message body:

Reviewed-by: WANG Xuerui <git@xen0n.name>


