Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2310453880E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 22:10:47 +0200 (CEST)
Received: from localhost ([::1]:36308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvlit-000561-9D
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 16:10:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlKZ-0000Of-7b; Mon, 30 May 2022 15:45:35 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:42688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlKW-00019C-HX; Mon, 30 May 2022 15:45:34 -0400
Received: by mail-pf1-x431.google.com with SMTP id y199so11290257pfb.9;
 Mon, 30 May 2022 12:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pmEKjF0FDQWu8TTBw2Kikm43RbrRCZ9ffxzbcJUfkFI=;
 b=ktGa5yTG9DSGdcgmCKhH6yVZZ2qbxGM4w8WS1DmxE/meo813iKnPphIFTNdGqyrPEY
 eRhRDUBKjbDpjvRqE995FCJ3jk6CGVun/OEcylnNjQYMR/ObnId65+37nz0KOIYJsg03
 yQGru0nrK3ym2TaBJAM3sXdXMk1hIstzuC2iOUagHob8xDMfqNpkpkcJkVHfYOhq+YFu
 h9jqxVeQBIlDRXkrtc9XfsAxdj1ab7whCBLrDoz0emhFXKyodO5bBTSGObV+UuE0Cp6a
 g0X8joz3Iu2H9WdfDxZRp0K5aA0hiduwafOkyMDwT93z8p4jlhSYyoh+o5uIvIL8Irzq
 +KBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pmEKjF0FDQWu8TTBw2Kikm43RbrRCZ9ffxzbcJUfkFI=;
 b=Tk/W7C08dCRlLkaojag+3v3toHeB8+AMWCxtETWeDLA/13UhZcKBhq1c3d1aLVvu5e
 DrdDW8+6T5yIwMAoHEk59NBEYkxMIl648Ttpi79PB6MpQilnq/4inQuM49KRXr7Z1S+I
 WXIAzebZW/bQQ3cONIAN3ta98pZLp2HIiT5M0v8FKlOJNnTHcgmk070JHAFiKV+5VOyR
 Xl7/bL3J/WBGaxEf128bfqKSyxphBdU+wtBpxugV0u7fElsPrs4ve5jrbMTF1EfhYvGk
 Q7dnx/2Je/nHu9N1+sWwYq52+Pkl4Nde1EVcT7rFcDpUNkHe3+pPBOVEhtvEzeaJvFQ0
 BxdA==
X-Gm-Message-State: AOAM5313VRCx4+U/8Gb5aMHYewZbDeXQQrGN+erSG0qde7T5Xkx8te1I
 PGoC5ngs86vxFSFcF3/R0SE=
X-Google-Smtp-Source: ABdhPJyp+27XYd4IBow4oMCcjuFGkTkOZI+aaytoY2ECvLZwidnXBlqdd+heZ1KoabiQBHbOtLnU7w==
X-Received: by 2002:a05:6a00:1253:b0:518:7c1f:2a17 with SMTP id
 u19-20020a056a00125300b005187c1f2a17mr47870688pfi.72.1653939930804; 
 Mon, 30 May 2022 12:45:30 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a170902a9c300b0015f2b3bc97asm6393266plr.13.2022.05.30.12.45.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 12:45:30 -0700 (PDT)
Message-ID: <c5fd32b5-fe22-a55b-de06-a6eac908bca2@amsat.org>
Date: Mon, 30 May 2022 21:45:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v3 0/7] QOM'ify PIIX southbridge creation
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bernhard Beschow <shentey@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20220528192057.30910-1-shentey@gmail.com>
 <110e160e-19bd-dd7a-1b4e-1a0e7437b782@ilande.co.uk>
 <ac5d95b2-8be5-1585-3076-deabe749e926@ilande.co.uk>
 <CAG4p6K7DzHVsp8425-O4uvb46XT9nzw-A2CK_jK8Nm+Xt8wsbw@mail.gmail.com>
 <5ef86c6c-719b-f197-3ccb-462e453dffa5@ilande.co.uk>
In-Reply-To: <5ef86c6c-719b-f197-3ccb-462e453dffa5@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 30/5/22 21:11, Mark Cave-Ayland wrote:
> On 29/05/2022 14:02, Bernhard Beschow wrote:

>>     Oh wait - I see now it's just the cover letter which is missing 
>> the additional
>>     maintainer addresses :)  If you could add them into the cover 
>> letter for your next
>>     revision that would be great, since it gives context for 
>> maintainers to help with
>>     the
>>     review process.
>>
>>
>> Hi Mark,
>>
>> Thanks for your great work you put into reviews and the useful 
>> insights! It seems to me that the time it takes for patches to be 
>> queued depends on the subsystem - some are faster, some are slower...
>>
>> I've automated my setup as described in [1]. However, it doesn't seem 
>> to work for the cover letter which I'd expect to be sent to the union 
>> of all reviewers of all patches. Any idea how to fix this?
>>
>> Best regards,
>> Bernhard
>>
>> [1] 
>> https://www.qemu.org/docs/master/devel/submitting-a-patch.html#cc-the-relevant-maintainer 
>> <https://www.qemu.org/docs/master/devel/submitting-a-patch.html#cc-the-relevant-maintainer> 
> 
> 
> Good question. I tend to do "git format-patch -o /tmp/foo 
> --cover-letter" to generate the series, fill in the cover letter, and 
> then use "git send-email /tmp/foo" to send out the emails (entering in 
> the results of get_maintainer.pl by hand). I'm not sure why the cover 
> letter isn't being generated correctly in your case I'm afraid.

Or try git-publish :) It does a first pass collecting Cc for each patch
(calling get_maintainer.pl) then use that set on the cover.

https://github.com/stefanha/git-publish

