Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 656036076F9
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 14:37:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olrGk-0002av-OC
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 08:36:58 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olr97-00062J-GY
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 08:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1olr8y-0005nD-RI
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 08:28:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1olr8w-00065p-VX
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 08:28:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666355333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3NmFBoeaO6iethftxFea9nVkPgFggATnZk4i51iS5cc=;
 b=NcgtP/FBN7USz8DiXaewjqW3cGF/t6dYdJS4ptvrWC2XfEhkD4EhYqPoKy2O188ZiEl7uS
 OHZ6eUhmPa59qjG54nrRck3EaNC0qfbivqpdKvGxoifPfVBEHrV0XyOCXt09ceY18+x7/5
 f3G2Zib1KMMMXEsLGifUzmjiahvAbNI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-neb4rITUPSmTx6JEFJrYEw-1; Fri, 21 Oct 2022 08:28:52 -0400
X-MC-Unique: neb4rITUPSmTx6JEFJrYEw-1
Received: by mail-qt1-f198.google.com with SMTP id
 a19-20020a05622a02d300b0039a3711179dso2415908qtx.12
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 05:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3NmFBoeaO6iethftxFea9nVkPgFggATnZk4i51iS5cc=;
 b=xkKxv+1wjFeWBmRlsa91FD0nL8Jy1kVHNDvUECeJ0sLa1pVbrrw3rpm1PjrO4Q7WCG
 R291A8snZY5K1WMDdX8r50OtihQ5OeaPLmyNA3vsLHi5JuZV1UUoQgK6Y0u2AQbZNdYc
 vaZlJ+kez3aPask33WUtXZZsHqLbB/N2tYUrvicDW/sw6USEmYWFyzOnKixl0Q/qZcJy
 YCQcJ8YgB+DFgcTTDqS2BCukShFu+QNmBLIHDrJxMpu/Q5PtPf4Gurxrd3iz5CBqDEiS
 hW3C0t0D17eRFFKOfKxFR7qqa59MGegeL1OnN1TpJEEPizGnBosSBL0MQmvhNGb88sWv
 dNjg==
X-Gm-Message-State: ACrzQf1eCcWpWNWfC2j5Vv7PRc2jB0ljdpk5gTYkZjQciKrjVV2dQmFE
 pKlJfsK3sMD0PKVkX4v/PdCaOI//OxTU0Uv5UzA472pxGnWOo/UBS7kCFjRbq9yRaRoHLv3uzpR
 F3+01LpAnjYW8A6o=
X-Received: by 2002:a05:6214:19e7:b0:4b9:ca97:c249 with SMTP id
 q7-20020a05621419e700b004b9ca97c249mr5662155qvc.113.1666355332118; 
 Fri, 21 Oct 2022 05:28:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5nqAvSC5j6tz+bFqIJRDGabvCTRfVf05YHxeSWH5euwYrWhM40f0b9HLKpUrAJ06SD8QpXuw==
X-Received: by 2002:a05:6214:19e7:b0:4b9:ca97:c249 with SMTP id
 q7-20020a05621419e700b004b9ca97c249mr5662132qvc.113.1666355331850; 
 Fri, 21 Oct 2022 05:28:51 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-178-110.web.vodafone.de.
 [109.43.178.110]) by smtp.gmail.com with ESMTPSA id
 x30-20020a05620a0b5e00b006cfc9846594sm9355006qkg.93.2022.10.21.05.28.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 05:28:51 -0700 (PDT)
Message-ID: <143b10d1-c6a3-723a-7064-b2028f8f63dc@redhat.com>
Date: Fri, 21 Oct 2022 14:28:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v6 08/10] RFC: elf.h changes
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, qemu-s390x@nongnu.org, seiden@linux.ibm.com,
 scgl@linux.ibm.com
References: <20221017083822.43118-1-frankja@linux.ibm.com>
 <20221017083822.43118-9-frankja@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221017083822.43118-9-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/10/2022 10.38, Janosch Frank wrote:
> Adding two s390x note types
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>   include/elf.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/elf.h b/include/elf.h
> index 3d6b9062c0..8bf1e72720 100644
> --- a/include/elf.h
> +++ b/include/elf.h
> @@ -1650,6 +1650,8 @@ typedef struct elf64_shdr {
>   #define NT_TASKSTRUCT	4
>   #define NT_AUXV		6
>   #define NT_PRXFPREG     0x46e62b7f      /* copied from gdb5.1/include/elf/common.h */
> +#define NT_S390_PV_CPU_DATA	0x30e	/* s390 protvirt cpu dump data */
> +#define NT_S390_RI_CB	0x30d		/* s390 runtime instrumentation */
>   #define NT_S390_GS_CB   0x30b           /* s390 guarded storage registers */
>   #define NT_S390_VXRS_HIGH 0x30a         /* s390 vector registers 16-31 */
>   #define NT_S390_VXRS_LOW  0x309         /* s390 vector registers 0-15 (lower half) */

Matches include/uapi/linux/elf.h in the Linux kernel sources:

Reviewed-by: Thomas Huth <thuth@redhat.com>


