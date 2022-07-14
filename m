Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8034574E92
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 15:04:31 +0200 (CEST)
Received: from localhost ([::1]:40256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oByW6-0003PS-Sb
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 09:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oBySi-0006Kx-P7; Thu, 14 Jul 2022 09:01:00 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:34491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oBySb-0003OQ-Pp; Thu, 14 Jul 2022 09:00:59 -0400
Received: by mail-oi1-x236.google.com with SMTP id x185so2273310oig.1;
 Thu, 14 Jul 2022 06:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1thW3Ww0AYTOYv1gFXBM0tviAlpRbTuaxCDksC2CtZU=;
 b=kiAWMlrxE3rmTVReq/5+gjlkVyOV+SdKMqntzCYokDs0aGXr6d20dnnIZ1tGIKkMqr
 RRCkaY9XC02WyrS9g6PWS/Do0a/Csbiyp1RiDakLn6hr+mLvW2KXaYHrLFggdGYL47bL
 O6EpfsNuW/bDlzs2q2ngranS+v1VCA8QIPHKz1VUiV0zYYbskVTydxykDYfzaSrMWD1G
 jLa+1bAc5T5070ZRtn2TnZ0hDwHfLBKEUI+14Q6y5+M+Zq0Z1ZKRin3I2T7+PWq0JqUA
 8zg6BXVQR9Z/kuR3rG1FK5+ummSoQuCQazWMUA9CJ3Oxm5YlnfU8DZ9ACgMdAvMx9htq
 0SOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1thW3Ww0AYTOYv1gFXBM0tviAlpRbTuaxCDksC2CtZU=;
 b=qTskBQoiDGEwE/AGpejQYRZ72bSEvKvFqNcdFRX8BxwYMNzmIa97ETq/Ubfy6kuFPz
 tN9EJa4AdAec5VHqk+B2wQFcwhTkR5AAiaysh35t4LRV5UKJfM/ebkQaRJ9pkbjSRSWj
 YMKoxbaBdmFJ4koc1k8KYNFL9V8tP0R00+GheXz/uBD4cOWupmFLA4RVtYzLbAO5Cf7T
 YjnpUVDL5lYLM+g/h6w+fhZ4ZRsx5DyvaQgs0RDTOpwPOxE+r/jrhH4ZBkPO+QqdFWMy
 puqfxM/XWqpKSztH4FuUNo7nN1v+J1Pqy6ZdOT+PLf79xBeyfQPh7vScWbtq5qPcUJLy
 E94A==
X-Gm-Message-State: AJIora/2oMql8ImA/jpkgML7mkI+GzeglKxHGUwICphKwV0upoCLcSh3
 t8+EpV3sE3ngLmUZBez7jpE=
X-Google-Smtp-Source: AGRyM1tAQofHMrC+wN/XwQ2GwgPV40cOuILyLwNwPngN/lwqioyeoG+JzVERGD8Xjve18ra+stP3cA==
X-Received: by 2002:a05:6808:14c3:b0:337:a1dc:89d5 with SMTP id
 f3-20020a05680814c300b00337a1dc89d5mr4232968oiw.201.1657803652182; 
 Thu, 14 Jul 2022 06:00:52 -0700 (PDT)
Received: from [192.168.10.102] (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 br10-20020a056830390a00b0061c71777dcfsm607702otb.75.2022.07.14.06.00.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 06:00:51 -0700 (PDT)
Message-ID: <725c07ef-a3db-baf8-c086-7a14d876f84f@gmail.com>
Date: Thu, 14 Jul 2022 10:00:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] target/ppc/kvm: Skip current and parent directories in
 kvmppc_find_cpu_dt
Content-Language: en-US
To: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, mopsfelder@gmail.com, Fabiano Rosas <farosas@linux.ibm.com>
References: <20220712210810.35514-1-muriloo@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220712210810.35514-1-muriloo@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 7/12/22 18:08, Murilo Opsfelder Araujo wrote:
> Some systems have /proc/device-tree/cpus/../clock-frequency. However,
> this is not the expected path for a CPU device tree directory.
> 
> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


and queued.


Daniel

> v2:
> - Skip current and parent directories.
> 
> v1: https://lore.kernel.org/qemu-devel/20220711193743.51456-1-muriloo@linux.ibm.com/
> 
>   target/ppc/kvm.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 6eed466f80..466d0d2f4c 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -1877,6 +1877,12 @@ static int kvmppc_find_cpu_dt(char *buf, int buf_len)
>       buf[0] = '\0';
>       while ((dirp = readdir(dp)) != NULL) {
>           FILE *f;
> +
> +        /* Don't accidentally read from the current and parent directories */
> +        if (strcmp(dirp->d_name, ".") == 0 || strcmp(dirp->d_name, "..") == 0) {
> +            continue;
> +        }
> +
>           snprintf(buf, buf_len, "%s%s/clock-frequency", PROC_DEVTREE_CPU,
>                    dirp->d_name);
>           f = fopen(buf, "r");

