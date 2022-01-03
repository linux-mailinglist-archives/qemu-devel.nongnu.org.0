Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B50F648374D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 19:59:33 +0100 (CET)
Received: from localhost ([::1]:54266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4SYO-00032D-Id
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 13:59:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4SXK-0001Ts-RI; Mon, 03 Jan 2022 13:58:26 -0500
Received: from [2607:f8b0:4864:20::736] (port=37822
 helo=mail-qk1-x736.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4SXI-000833-1B; Mon, 03 Jan 2022 13:58:26 -0500
Received: by mail-qk1-x736.google.com with SMTP id t66so20743053qkb.4;
 Mon, 03 Jan 2022 10:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ufTAd0zJcjPqs9eeB6QTMDCrqFU873XSvjw2FEIRhPs=;
 b=KoX47fV38yuYnXEYgxnrYaS7ttstzdi9o+eQIha20icdmIMGik2E7N6a1Vf4MnewrV
 3kT/Ju7s9Q04/aFd+2da/9dsomJQxOqCMRwkiQjMdBHHDEv/SSfbasuHWorx1fn1Qz6j
 F4pYAGjnpGo+hUbXfo4K3md9f8V85w5Cw5fb2dtg+D4iSzABTAM1pTPSnYGs9gDNeER6
 76h6/UH/lqciVY42pxnvzwI6meCP6xwWDSH5X/ehd3fPPDStjq2PWK4JneJZ9T5d5vfY
 MHliFE9jKqlej7QVTi/a2Lj1UzLMxHI9GNyj27QJT3nfu2Fo3/Uuvx8t7UnqggTqJiOz
 fyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ufTAd0zJcjPqs9eeB6QTMDCrqFU873XSvjw2FEIRhPs=;
 b=tdn5fbwbcuNcb7YgEgkQV/5Lga+Ciduvke3MB5u8g5jGgE5M/pgMFhTqt6OAC6Qtka
 GDNv0MynroNzJKDc9OENZYxNP3vcUDj7poFgqndnAjT/eyhNs/7RKaGCVdJ+MAsRqBRK
 rpu7sJaM7tC/8g0ncaGKryv+M6Zpm8W1T65dtTO01o2RQ/AxfFz2VEZe2djzdcgdWoWS
 FLz1hN1Eb3f7i9ML4yZg8LXVji1vPvWIbbRV/ccMik4EgAAOgzcVLavTlMATfZdoRqP5
 M368PTvHDx28bjN2P8/p/9o4k5AfzMOJOYR9bfFDA86FA5nW7Q0CTh1g8SxINd5O3RrY
 oKDw==
X-Gm-Message-State: AOAM53373r2ohJrcuGZWNApmf47guDLUry5suyglhvGtE79++SKffia5
 akWciZC6q58crCShpSB4S02U9BhM9q0=
X-Google-Smtp-Source: ABdhPJxW7CF0/S7SIlaxzJ4miLtbcCMKoBzfy2QP55MjizWlXWxmbm2scMNQjao8jbo9S042bcTvBw==
X-Received: by 2002:a37:9b0c:: with SMTP id d12mr32572949qke.389.1641236302784; 
 Mon, 03 Jan 2022 10:58:22 -0800 (PST)
Received: from ?IPV6:2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7?
 ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id bj30sm28446741qkb.58.2022.01.03.10.58.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 10:58:22 -0800 (PST)
Message-ID: <91929906-0ade-51ce-295f-38cd68c519b9@gmail.com>
Date: Mon, 3 Jan 2022 15:58:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 00/17] ppc/pnv: enable pnv-phb4 user devices
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20211228193806.1198496-1-danielhb413@gmail.com>
 <e62ca8df-25a2-222c-1ffe-12fc52a4a82f@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <e62ca8df-25a2-222c-1ffe-12fc52a4a82f@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::736
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x736.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.354, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/3/22 05:21, Cédric Le Goater wrote:
> Hello Daniel,
> 
> On 12/28/21 20:37, Daniel Henrique Barboza wrote:
>> Hi,
>>
>> This series implements pnv-phb4 user devices for the powernv9 machine.
>> It also includes a couple of pnv-phb3 and pnv-phb3-root-port fixes that
>> were also applied for the pnv4 equivalents.
>>
>> During the enablement I had to rollback from the previously added
>> support for user creatable pnv-phb4-pec devices. The most important
>> reason is user experience. PEC devices that doesn't spawn the PHB
>> devices will be just a placeholder to add PHBs, having no use of their
>> own as far as the user sees it. From this standpoint it makes more sense
>> to just create all PECs and attach the PHBs the user wants on them.
>> Patch 14 also describes technical reasons to rollback this support.
>>
>> The series is rebased using Cedric's 'powernv-6.2' branch [1]i, which
>> includes the '[PATCH 0/5] ppc/pnv: Preliminary cleanups before user
>> created PHBs' patches [2].
> 
> It would be easier if you based the patchset on mainline. It's not
> a problem to resend patches of another person or/and even rework
> them to fit your needs.


Sure, I'll send the v2 based on the mainline + the required patches.


Thanks,


Daniel

> 
> Thanks,
> 
> C.

