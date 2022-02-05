Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC654AA84D
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 12:17:30 +0100 (CET)
Received: from localhost ([::1]:55514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGJ4L-0006bd-CJ
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 06:17:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGJ3D-0005vM-GH
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 06:16:19 -0500
Received: from [2607:f8b0:4864:20::434] (port=41895
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGJ3B-0001Es-8s
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 06:16:19 -0500
Received: by mail-pf1-x434.google.com with SMTP id i30so7347833pfk.8
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 03:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Qwg5DSdttx2wPECrRmdydUWft1STu3XJ7d/KtS1taJ0=;
 b=SFTg9tQyLd84npjULEiHPs3g21/tTECpsVOnN0Mfs248wmYlUxVPAn+tRVLzkMCD2W
 G0E8jl8Oe/L71lkJaoCjktVfCETedIzNT/SMG4NoyDlMGcM89376uOG9novoujZw7nkQ
 JFph1lfhhcKJkfGnRZyi9IBqUW9XcRZJwAzQYAwysoDPFlxGvdVIhJLb4fwe4gsjje+t
 j1tttD4qauApWYviVD8a6p5UUW5lHR++FZJ3XIXR83b0kl1Z2m/v7KcFh61PxKxZY2a5
 h6q406zkFcvnS5vpv85g0/Dvh+SenNLfn4jf4F5MLE/7zIdpW1rC+eUs3bHvHO/zoEmj
 uixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Qwg5DSdttx2wPECrRmdydUWft1STu3XJ7d/KtS1taJ0=;
 b=VQjkibrHs0G58n0sbqCfK9cDbeQufo2qoMwnVCsf/HrohqAUvuN3a6TZb0irEMIn+s
 0HUwQQ9RwPJoVqKTVeQlMeqpBCIirH2E8Vk6ZvbtrBFXjJpd7ES9ILC9WU/gUrv/KxYm
 zEgSp9npUmY+PIqX6wtoB/En8MlYj6CA2oH307feSLfNHSEPMh+WFU1ApZ1ZpiN+0l2X
 cAIdolbLbrrjPuHBWYGsBj8B2WFPQsG98NpHua+8KBb3VDyhJcCvEXwe6PEgqjT7SutJ
 /hdtUNzK5R4OBdWvjEod9iZdVx/C38vGL3Dj4nhFDnKNnTzDP2tY39NW5Kf+aYrx0mn4
 fh6Q==
X-Gm-Message-State: AOAM532I0yKnBzba9GOPVOq4T4kY3Ulo8J+M/UWWbFSmMr1mr9g6nT4B
 APTsBWbAPutKakXwAMwgUFw=
X-Google-Smtp-Source: ABdhPJySNwZ4g1CROjWWRWCjt5UtHesdYGqUhOz8hmuInEl2jpNzLp2VYJvqNnwZzlPOXc4l0ckUNw==
X-Received: by 2002:a63:91c2:: with SMTP id l185mr2608672pge.570.1644059775992; 
 Sat, 05 Feb 2022 03:16:15 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id g5sm5603945pfv.22.2022.02.05.03.16.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 03:16:15 -0800 (PST)
Message-ID: <84db72ea-9aca-43f9-2876-28a5d6d840f4@amsat.org>
Date: Sat, 5 Feb 2022 12:16:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 01/11] mos6522: add defines for IFR bit flags
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>
Cc: laurent@vivier.eu, qemu-devel@nongnu.org
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
 <20220127205405.23499-2-mark.cave-ayland@ilande.co.uk>
 <9e5c4e86-8555-1a42-783f-dae53f114cd2@eik.bme.hu>
 <79a162bf-86f5-0ca4-5f14-822469606812@ilande.co.uk>
In-Reply-To: <79a162bf-86f5-0ca4-5f14-822469606812@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 5/2/22 11:51, Mark Cave-Ayland wrote:
> On 27/01/2022 23:16, BALATON Zoltan wrote:
> 
>> On Thu, 27 Jan 2022, Mark Cave-Ayland wrote:
>>> These are intended to make it easier to see how the physical control 
>>> lines
>>> are wired for each instance.
>>>
>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> ---
>>> include/hw/misc/mos6522.h | 22 +++++++++++++++-------
>>> 1 file changed, 15 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/include/hw/misc/mos6522.h b/include/hw/misc/mos6522.h
>>> index fc95d22b0f..12abd8b8d2 100644
>>> --- a/include/hw/misc/mos6522.h
>>> +++ b/include/hw/misc/mos6522.h
>>> @@ -41,13 +41,21 @@
>>> #define IER_SET            0x80    /* set bits in IER */
>>> #define IER_CLR            0       /* clear bits in IER */
>>>
>>> -#define CA2_INT            0x01
>>> -#define CA1_INT            0x02
>>> -#define SR_INT             0x04    /* Shift register full/empty */
>>> -#define CB2_INT            0x08
>>> -#define CB1_INT            0x10
>>> -#define T2_INT             0x20    /* Timer 2 interrupt */
>>> -#define T1_INT             0x40    /* Timer 1 interrupt */
>>> +#define CA2_INT_BIT        0
>>> +#define CA1_INT_BIT        1
>>> +#define SR_INT_BIT         2       /* Shift register full/empty */
>>> +#define CB2_INT_BIT        3
>>> +#define CB1_INT_BIT        4
>>> +#define T2_INT_BIT         5       /* Timer 2 interrupt */
>>> +#define T1_INT_BIT         6       /* Timer 1 interrupt */
>>> +
>>> +#define CA2_INT            (1 << CA2_INT_BIT)
>>> +#define CA1_INT            (1 << CA1_INT_BIT)
>>> +#define SR_INT             (1 << SR_INT_BIT)
>>> +#define CB2_INT            (1 << CB2_INT_BIT)
>>> +#define CB1_INT            (1 << CB1_INT_BIT)
>>> +#define T2_INT             (1 << T2_INT_BIT)
>>> +#define T1_INT             (1 << T1_INT_BIT)
>>
>> Maybe you could leave the #defines called XX_INT and then use 
>> BIT(XX_INT) instead of the second set of #defines which would provide 
>> same readability but with less #defines needed.
> 
> I'm not so keen on removing the _INT defines since that would require 
> updating all users to use BIT() everywhere which I don't think gains us 
> much. I could certainly replace these definitions with BIT(FOO) instead 
> of (1 << FOO) if that helps readability though.

Do you mean simply doing this?

-#define T1_INT             0x40    /* Timer 1 interrupt */
+#define T1_INT             BIT(6)  /* Timer 1 interrupt */

