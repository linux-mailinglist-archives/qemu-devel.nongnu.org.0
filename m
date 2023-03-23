Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F616C7196
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 21:16:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfRLP-0006H9-0A; Thu, 23 Mar 2023 16:15:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pfRLM-0006FI-KM; Thu, 23 Mar 2023 16:15:28 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pfRLI-0005y3-Ua; Thu, 23 Mar 2023 16:15:28 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-17aaa51a911so23850860fac.5; 
 Thu, 23 Mar 2023 13:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679602515;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7WIPfErpMkM99kkXFcvAr7eJXNQ8VK97y/ablDHSY/I=;
 b=ZVLNoJ2zoC1RnD/Iy4Z+o9uMoCprsO0MWDhBz4vnMGHbrUc8dKjz4eypOvwWz1SODv
 Z2fqYJ6ga3QAesAb5mQRZN9d+leVOiwVdRKXYjD1IIHWHEb5lvJ7tnOstbyITyeKoxiC
 mOSN+OK7+isIjXeFnDLU7qFcGL7NPXy9z08bF88k4F6hM8q/e50KhluVVvXT93Ud5vSJ
 EObO31SENUmFjD3wRtr5YGLSsOG7pfFwgHhJ1QiQioV9LNUQXxt7g5larq66TWAYIARG
 KbfQzbKmeFPPQd286tN/0ewjzUDtoh9N7dR8xxRxFYla3+kXbVIZx8Y+UR4PYLgQlI6f
 Yy/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679602515;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7WIPfErpMkM99kkXFcvAr7eJXNQ8VK97y/ablDHSY/I=;
 b=osilPBD+KTBTCGWeNlMdFVPDm6BvyVpfLfV0/il4UqDkeX3xVRfJG+XmD1knPRPM/K
 tudZtvIISzFQGV69ZlgEI9USYYuSfW4NlH1Fw/ITWgfyUafemsH8XXKHzZxPTP/pJ0az
 /OJNEwdcSyhDa6FJS5FNtr9oPCmh4KSd32mO/DgMRxZPeaJ4lXlcdF14rZFlx10pR/NW
 VDtUkmtdl7JNxDHXrn8elYnanaCNvwyPOOewE3jNO2ye4dG6x1oD2IRhf/4muEuzSSDb
 scjctwHcLjYXqwahxGDAIObvJj5W/F04qVYsAt8AH6m1utSHw2GX42y0gWg1fMlwFC/K
 cvrA==
X-Gm-Message-State: AAQBX9fWgLj5WOIJSnbUSIG8wI18Ick/zvRxQBCzYc04mwbxl0pMvP0a
 DY7lXhJGrcvIQYNIvR70GBE=
X-Google-Smtp-Source: AKy350bAgd+1fCqmKqIHUg/un2N2esRR062ODWAa/utx1bCTly2MiLWo9wVEP/X/v5AmNkj0cvnqHg==
X-Received: by 2002:a05:6871:5cc:b0:17a:a825:6be9 with SMTP id
 v12-20020a05687105cc00b0017aa8256be9mr305271oan.43.1679602515499; 
 Thu, 23 Mar 2023 13:15:15 -0700 (PDT)
Received: from [192.168.68.107] ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 vk10-20020a0568710e4a00b00172426ebe58sm6511835oab.27.2023.03.23.13.15.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 13:15:15 -0700 (PDT)
Message-ID: <2b7edf21-9825-ca5e-0329-1ef3e411439d@gmail.com>
Date: Thu, 23 Mar 2023 17:15:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/1] hw/arm: do not free machine->fdt in arm_load_dtb()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org
References: <20230323161053.412356-1-danielhb413@gmail.com>
 <20230323161053.412356-2-danielhb413@gmail.com>
 <CAFEAcA89KN5SEi5hFoKKpzVSo=xV3gCn7b2bMBhb5qoQ=U9_mg@mail.gmail.com>
 <fda401e9-608d-a74b-9ff5-aa977d900cd5@gmail.com>
 <CAFEAcA_MXhG7-J9qAv-9cmHKC-qx5nKfZPHi7jXyqdoYumH5-A@mail.gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <CAFEAcA_MXhG7-J9qAv-9cmHKC-qx5nKfZPHi7jXyqdoYumH5-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 3/23/23 14:59, Peter Maydell wrote:
> On Thu, 23 Mar 2023 at 17:54, Daniel Henrique Barboza
> <danielhb413@gmail.com> wrote:
>>
>>
>>
>> On 3/23/23 14:38, Peter Maydell wrote:
>>> On Thu, 23 Mar 2023 at 16:11, Daniel Henrique Barboza
>>> <danielhb413@gmail.com> wrote:
>>>> -    g_free(fdt);
>>>> +    /* Set ms->fdt for 'dumpdtb' QMP/HMP command */
>>>> +    ms->fdt = fdt;
>>>
>>> With this we're now setting ms->fdt twice for the virt board: we set
>>> it in create_fdt() in hw/arm/virt.c, and then we set it again here.
>>> Which is the right place to set it?
>>>
>>> Is the QMP 'dumpdtb' command intended to dump the DTB only for
>>> board types where the DTB is created at runtime by QEMU? Or
>>> is it supposed to also work for DTBs that were originally
>>> provided by the user using the '-dtb' command line? The docs
>>> don't say. If we want the former, then we should be setting
>>> ms->fdt in the board code; if the latter, then here is right.
>>
>> My original intent with this command was to dump the current state of the FDT,
>> regardless of whether the FDT was loaded via -dtb or at runtime.
> 
> Mmm. I think that makes sense; we do make a few tweaks to the DTB
> even if it was user-provided and you might want to check those
> for debug purposes. So we should keep this assignment, and remove
> the now-unneeded setting of ms->fdt in create_fdt().


I don't think we can remove it. arm_load_dtb() does the following:

     if (binfo->dtb_filename) {
        (...)
     } else {
         fdt = binfo->get_dtb(binfo, &size);
         if (!fdt) {
             fprintf(stderr, "Board was unable to create a dtb blob\n");
             goto fail;
         }
     }

So if we don't have a '-dtb' option, fdt = binfo->get_dtb(). For the 'virt' machine,
machvirt_dtb(), will return ms->fdt. So we would SIGSEG right at the start.

And now that I think more about it, this patch is leaking the board FDT if we're
using the FDT from dtb_filename, isn't it? We're assigning a new ms->fdt on top
of the existing ms->fdt from the board. I'll send a new version.

Also, given that we're not using the board FDT at all if '-dtb' is present, I
think it would be good to move create_fdt() from machvirt_init() to machvirt_dtb().
Some code juggling would be required (some functions from init() are using ms->fdt)
but it think it would make the code clearer - create the fdt board only if we're
really going to use it. I'll see if I can pull this off and send a 8.1 patch
with it.


Thanks,


Daniel




> 
> thanks
> -- PMM

