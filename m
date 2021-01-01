Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F672E8434
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 17:54:34 +0100 (CET)
Received: from localhost ([::1]:33220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvNhA-0000kb-JN
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 11:54:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvNg3-0000Hz-7p
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 11:53:23 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:54771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvNg1-0001qz-Pu
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 11:53:23 -0500
Received: by mail-wm1-x332.google.com with SMTP id c133so9279542wme.4
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 08:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lkUTTAZe3iaxk027WYV8hkooS3UygipwPJ5Q9h8P6Wo=;
 b=rjYQ4lkOIDHzpFxZY/08KXfN+bPDoUCP8ux688MuyHt9pRznqVIzx5n04FJpUXBiLc
 +cTUL9XIvoUnyasiyX6MH2MQBB++B162Qyi9Kk2KtqoxWUXMu70jtKwdcUw9lPBPzfnn
 fr2ossuQJpiz8jWRVtktgtS2zCEUfAWs+gSnSFcovIUr6XIlfCu2ATPf6Ccych8RJA8i
 jcPzAgvBQmekfAL8+vGta5LXPNK0fnKZEJtFiFRUvsBJb7tKU7NVJfYTHTLQnmHj8C6Z
 2mde14HKPbDKSe0dhhPuN/I2EQCQQWqSueHObM1O1Vwj22jbdLhyqLJdA3hGme5tMPHM
 bglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lkUTTAZe3iaxk027WYV8hkooS3UygipwPJ5Q9h8P6Wo=;
 b=CL6yLT4hPk2Lzppqsne1in3fDo7ueoBEnqajEl6V/2DmDj3oabK/5yv7GUhzkFrZBk
 sDgcdTTOEauTsy+D+COIDA59F2G8qne/IBuajvfdzlAwqgRrV0MgP/7qy7qvIO0Rx0u3
 XYTjq+Nd0lQDlf1t/SVu+iiH1EHmhsVIuoyjrvJZJs544UxmD2BrqYNt8374FtWdtt37
 0IGa4bx3sBHr0tD9mIGDwYa65P6XB2f/zIg2wvM5QorLi/DK0TMXvL5hWqsEii5dlzUf
 tPNBBkqdwMt+En6P0trIi78dC/qOXdsvkPnIzj4SW2KDAyVR7o4hoNBXIzt/Q6I314eK
 dAIQ==
X-Gm-Message-State: AOAM532KU7wMOJUxsmFeug7669LhyVwQgnq3oon4YlJUPT9YZ4gjzMwS
 TOgZY57Qwg2mZkdOApeRX6k=
X-Google-Smtp-Source: ABdhPJwF7bhEVeoik1W/OPATZF1/zJaoa2ahokRRr3uwdIeIDki+FlCZFnVOmMwPYYfSFSByBFMiUg==
X-Received: by 2002:a1c:6856:: with SMTP id d83mr17057988wmc.119.1609520000366; 
 Fri, 01 Jan 2021 08:53:20 -0800 (PST)
Received: from [192.168.1.34] (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id l8sm17485608wmf.35.2021.01.01.08.53.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jan 2021 08:53:19 -0800 (PST)
Subject: Re: [PATCH 01/25] esp: checkpatch fixes
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
 <20201230153745.30241-2-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e68aeed3-897f-3415-337a-7638dcba57d2@amsat.org>
Date: Fri, 1 Jan 2021 17:53:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201230153745.30241-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.749,
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

On 12/30/20 4:37 PM, Mark Cave-Ayland wrote:
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 52 ++++++++++++++++++++++++++++++---------------------
>  1 file changed, 31 insertions(+), 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

