Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE273FBEB8
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 00:07:53 +0200 (CEST)
Received: from localhost ([::1]:36664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKpRY-0002i5-55
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 18:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKpNO-0008JY-TH
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 18:03:34 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKpNN-0000zM-D0
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 18:03:34 -0400
Received: by mail-wr1-x435.google.com with SMTP id u9so24435939wrg.8
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 15:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sZP8rUMKITnVgXOoLh8qrUi22yBW/tbmNGGHIVhrts0=;
 b=YLcbJUV3HXNq7m7UO5rQISwPYdUuiEvffjuU7NKIUyD9BW1q2tVopU1BZWmYwGBeUC
 Ki50/Tzrw2FczNMIOfKUWAr/2epK/bmjSXi8Cije+qzkZ1Vt3XS2u4ZaV3dnGQFUXv78
 OUZTDGHrdMGOlyRW//xrsOD6Qd2WHstg6kXc5Sv7U7XDx39wqWtT8lil8jo9tqcTK0Ic
 ltbZNo/QBcBpWXgm+Q9p6gkHgE2Frz0MqE/Fu5U192UG0hUBUCvvvUBakWLxea2jGgKI
 vtowqEhQzm6vYh7jWE4TADUxqxdI+NwHDuCW9oZCP+Gv+3gEQZfwZ7KpyBUFnZ43WAMY
 j8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sZP8rUMKITnVgXOoLh8qrUi22yBW/tbmNGGHIVhrts0=;
 b=gQB56PKFkb/ewuzXPhPyER24HSdRCGw1I3++4VQE69tl/OXWqErGiwNtQ1+ppL13wC
 dmRKshQG2K/KUjLlBjIeU/x2wAx1/MRih4juMRPUJWWV6ihEE5qCV17HalaCUT/Qi8iX
 Gv966esM1oDGUSGdBvED5FtekjhS0lg89O8M0mL+OUfJkQq3aUSAyRg9NY8PXA6+jq0n
 w3E5KA81M9uHJBpCD+8wUePYALAnbqJiykkO+4GhIXQoubvzz/DJbfDMgFKtMvEDeQOg
 1Qws3BjORo4d38qi62bRJ+vo4/+hBM0Ics5do1Nugq1DA0r8F5f9DNvKsHxmLyCyY28k
 8Gjw==
X-Gm-Message-State: AOAM531bdzMcsBAJCVMcr9QncfRIjOnSTBjrRnymczx8jWkNwAEtbUSY
 DkRPUDHSYl/WzXug/A/yaF0=
X-Google-Smtp-Source: ABdhPJzCOMUpIUTe3Faiv7T7Pm4E38HHc3ITQq8K0HStufT+n2abXNL9RFLPg6/XNXIXQCwZ8w+jhQ==
X-Received: by 2002:a5d:6cae:: with SMTP id a14mr26952278wra.275.1630361011896; 
 Mon, 30 Aug 2021 15:03:31 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id 138sm735971wmb.7.2021.08.30.15.03.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 15:03:31 -0700 (PDT)
Subject: Re: [PATCH 10/12] mac_via: remove explicit viaN prefix from VIA IRQ
 gpios
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
 <20210830102447.10806-11-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bb6483db-4c23-941c-5c0d-489f53f10fed@amsat.org>
Date: Tue, 31 Aug 2021 00:03:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830102447.10806-11-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.932,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/30/21 12:24 PM, Mark Cave-Ayland wrote:
> Now that q800 VIA1 and VIA2 are completely separate devices there is no need to
> add a specific device prefix to ensure that the IRQ lines remain separate.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/m68k/q800.c    | 10 ++++------
>  hw/misc/mac_via.c |  9 +++------
>  2 files changed, 7 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

