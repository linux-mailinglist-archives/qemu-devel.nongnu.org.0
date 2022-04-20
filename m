Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB55509179
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 22:37:35 +0200 (CEST)
Received: from localhost ([::1]:35718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhH4w-0007Qx-P9
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 16:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhGpY-0001AG-4D
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 16:21:40 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:38215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhGpW-0005X3-DS
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 16:21:39 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-e5e433d66dso3208225fac.5
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 13:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=EMvO2IebofbBpkprHung1DIql5Coz6j/X0YCht4hUzM=;
 b=pvYkCIXsynIsVTegzxF/MBxaFT3ZHFz6cL68bXmFVPAGQqK8aewK3JDP1AvuldjwaO
 0c5IVsneKzj76eJ8FYtX1Vf9S6Fa5A4U37PXk/AS6sPLrgCvH6X0rpC/Ozv8VXOKiyqM
 gbA5albvD+Zj8ZM2acvUo875BECuttBjh1gbfmMK2ZgS/VUnYtFPSoNFoeKvGEXwx+Qp
 fH/AmqSC1FB9IfkCioFTMCRIkpH51zpzry5Xgld+mEdpOA6jAD1YLQSBG1g9gfeujKP7
 Ksa2eXKfA5VXcRv6faX5MAs54bHZNrJyZkQ6BLIhyaCHWke20fbX/fZWJ+gIT36PTE1e
 T3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EMvO2IebofbBpkprHung1DIql5Coz6j/X0YCht4hUzM=;
 b=ujDjEKEw/XPlaN8Ikc8MwLmEWZLTaKhBy7G+bV8Hr1hgf8iQpY3gJ2dj4kqbCbm9PS
 70KtbwhaF6LjS8cRrq072/QiITWNDveV3K8Il67Y5s6If93kYr8Ttw1Zfn+x6LYrj/kA
 9c9YMoWmNrVSFz82YxMjW6rXF9i8at51W2jpDoY6t/HELjNYnsSU1EI5MIJdx9YjBWum
 Bgsg+EbddN6MHppM8rMika9MSLSATsSfUuWcbvYR1YYGvniiIfvDGqYS2pkLpkzZPpaX
 w6xDSXcPmRzCsj1bTwRggun8vCeZ8uFA6RZKhQ0A140YV+G3uxuyR1ywNEwTZ0l/vcel
 8IBA==
X-Gm-Message-State: AOAM530SmrMDTQ5Tpu7DJgErENhapH7Adks8q+ODeusrlIU22RWzorTC
 SLIvNSZ4a1uTO84E18a+pqY=
X-Google-Smtp-Source: ABdhPJxGBjK44qK6HOyZYZMUhHk+QNcQjDFHyGrsPmMWs1JgsDDPV6C9cFkQREA052gZ4tKOOGSblg==
X-Received: by 2002:a05:6871:1ca:b0:e5:a8db:a93f with SMTP id
 q10-20020a05687101ca00b000e5a8dba93fmr2392260oad.232.1650486096819; 
 Wed, 20 Apr 2022 13:21:36 -0700 (PDT)
Received: from [192.168.10.222] ([179.225.252.195])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a4a9593000000b0032176119e65sm7055959ooi.34.2022.04.20.13.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 13:21:36 -0700 (PDT)
Message-ID: <a78fd584-2d40-cbd4-95db-8a6729087a93@gmail.com>
Date: Wed, 20 Apr 2022 17:21:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Future of libslirp in QEMU
Content-Language: en-US
To: Anders Pitman <anders@apitman.com>, qemu-devel@nongnu.org
References: <8f5cc095-e5e9-486d-8e52-d22cac6d2379@www.fastmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <8f5cc095-e5e9-486d-8e52-d22cac6d2379@www.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x33.google.com
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



On 4/20/22 16:08, Anders Pitman wrote:
> I noticed in the 7.0 changelog that libslirp might be removed as a submodule in the future. Since user networking is very important for my project, I'm wondering if this is simply an implementation detail, or if there are plans to eventually remove slirp support entirely from QEMU (which would be bad for me)?
> 
> Is there somewhere I can read the discussion about this? I searched the mailing list archives but didn't see anything obvious.

QEMU will still be supporting libslirp. The difference is that now QEMU will be
using libslirp from the distro instead of packaging it itself.

The relevant thread is here:

https://lists.gnu.org/archive/html/qemu-devel/2022-04/msg00974.html


Thanks,


Daniel

