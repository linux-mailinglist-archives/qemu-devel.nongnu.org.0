Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A62F49CC3B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 15:23:39 +0100 (CET)
Received: from localhost ([::1]:48820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCjD0-0006gR-Gd
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 09:23:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1nCidy-0002kX-Iz
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 08:47:26 -0500
Received: from [2a00:1450:4864:20::329] (port=40826
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1nCidw-0000Yo-8L
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 08:47:25 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 d138-20020a1c1d90000000b0034e043aaac7so1186463wmd.5
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 05:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:reply-to:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4VWrmponanBoZjuBiqM+aKR3MrRMA0UiGhMwRZriHI0=;
 b=JCXrVw5w8jmMfAHuQXyfZWeBFVP+FfRIIwA/nHcX4GH6GeLxKlZR6B4Oq/4IU8fhhB
 w5U/MwDVapNuCxttoSQIiVeqbQbPAGyt0jKJLjGDHNeKX8Qswfkt6l6iMsnuMqb4vot8
 HDpO1CwmmYiBaNA3/bBtfV3N+ixi5q+SiqaZHImKVcNKQWXKFeoA1H7H0RH1hRE7d/n2
 ZKGcrCZ2h6bm8s9kWePYdkrj3lUiaBkfhSXP5xyS8pQP9rqft1od306SPGNciA7MRSu4
 gpo554ksHPUu0fpj4LSkzTjQYKRaSzuPCTx9cCF4cF9UjuD0VlXSL9fPjoF9cm6ZnIDM
 HX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4VWrmponanBoZjuBiqM+aKR3MrRMA0UiGhMwRZriHI0=;
 b=TFK8D2Iya5aZbwMSQyQZ6tC2ZXwzBJ2SZ8LXobkAhJIX40aG4IkQw1jqN9Pc537Daq
 HAuNO5opPLdpIqRPS4m7E4zgV1xz1OPv3G2KO6bBRQfe3jjQjMB1B0a1MuyFQcf64A6S
 BkBXEnyAXkmQi86ZDHSncBXLl0p2wupXZHCvykPBJeb1OVpjsmtbkh/LyktHN9NWRGH+
 LLmWiVCBqfo9T6ejhLG2H4PRBy6gh94hWYJcr4ieE/6kMwTpd9jf0VOeloYkWeHI7wEj
 e5Rme2t4Ey470zvciYHM4hfVMoW1uc8OYfbObLCr5RQiGKUGTnvU0PDtIX2Udl8H4luh
 35Jw==
X-Gm-Message-State: AOAM531V4W6tQeiIHeQ5D9jYQoImKig1CY32yU04ahe9KkrXbJuXpDMU
 H5+sXPtRKvLEwV5vIO6vdiQ=
X-Google-Smtp-Source: ABdhPJz6bCth0FuLHkr3FlcNdgVZJzrqlzHciCO36Yn2SuiNT64swHO+PdQ5i81QyfsYsH4Q5yvUlw==
X-Received: by 2002:a05:600c:4ec7:: with SMTP id
 g7mr7480705wmq.171.1643204842294; 
 Wed, 26 Jan 2022 05:47:22 -0800 (PST)
Received: from [10.7.237.6] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id p8sm3873089wrr.16.2022.01.26.05.47.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 05:47:21 -0800 (PST)
Message-ID: <2ebaf0d6-a84a-e929-5ac2-597c81d40230@gmail.com>
Date: Wed, 26 Jan 2022 13:47:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] xen-hvm: Allow disabling buffer_io_timer
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>, Paul Durrant <paul@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <20211210193434.75566-1-jandryuk@gmail.com>
 <adfe1c14-f773-0592-e304-d80da8380cc0@gmail.com>
 <CAKf6xpv0=ex+OrFb1z4TpaULsmMaPQqmmsxoY_d4yJRt6Zx3sw@mail.gmail.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <CAKf6xpv0=ex+OrFb1z4TpaULsmMaPQqmmsxoY_d4yJRt6Zx3sw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: paul@xen.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, QEMU <qemu-devel@nongnu.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/01/2022 13:43, Jason Andryuk wrote:
> On Tue, Dec 14, 2021 at 8:40 AM Durrant, Paul <xadimgnik@gmail.com> wrote:
>>
>> On 10/12/2021 11:34, Jason Andryuk wrote:
>>> commit f37f29d31488 "xen: slightly simplify bufioreq handling" hard
>>> coded setting req.count = 1 during initial field setup before the main
>>> loop.  This missed a subtlety that an early exit from the loop when
>>> there are no ioreqs to process, would have req.count == 0 for the return
>>> value.  handle_buffered_io() would then remove state->buffered_io_timer.
>>> Instead handle_buffered_iopage() is basically always returning true and
>>> handle_buffered_io() always re-setting the timer.
>>>
>>> Restore the disabling of the timer by introducing a new handled_ioreq
>>> boolean and use as the return value.  The named variable will more
>>> clearly show the intent of the code.
>>>
>>> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
>>
>> Reviewed-by: Paul Durrant <paul@xen.org>
> 
> Thanks, Paul.
> 
> What is the next step for getting this into QEMU?
> 

Anthony, can you queue this?

   Paul

> To re-state more plainly, this patch fixes a bug to let QEMU go idle
> for longer stretches of time.  Without it, buffer_io_timer continues
> to re-arm and fire every 100ms even if there is nothing to do.
> 
> Regards,
> Jason


