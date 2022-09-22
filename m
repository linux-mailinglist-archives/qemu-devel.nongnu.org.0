Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 577B45E616B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 13:42:23 +0200 (CEST)
Received: from localhost ([::1]:34176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obKb0-00044y-5g
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 07:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obJt9-00077Z-FG; Thu, 22 Sep 2022 06:57:04 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:38541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obJt2-0005dt-W7; Thu, 22 Sep 2022 06:57:02 -0400
Received: by mail-pg1-x535.google.com with SMTP id t70so8771178pgc.5;
 Thu, 22 Sep 2022 03:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=jltK3TdF6y5ormymMe0PVWfi2SUZEinNcO4BxKII6Lc=;
 b=NcsOhBa0Jn8eI9iOLt6o8LKe79dIOuuqvZpyj2BRSd93l30ypGsk6r9RW0A3VfEjwH
 o3OrFr1iI48FhJ963yHZFHWGsXB8mFFITTc7D1B73/y0Eluj/5EnEsvVj3a5N/mWy05Z
 QQKbWBVngxTfWPM8geu8JoprDAmEiLc4BNKzyHc2VnLYHBvwgQYNyhyketoNEiZQCsJv
 B03HWVYBw04olSrwgdPu7A5bzkEXP5DeMFwdZU1xKmXydD6wab8RYqR5F5tnxnHuTKmc
 tXgQQDJWpCbYvxy8Kmmfw8Hlg3BcYt5o+pdnPiny2YBB6x+V1P8Fju8YuWWwm6kRnXer
 JZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=jltK3TdF6y5ormymMe0PVWfi2SUZEinNcO4BxKII6Lc=;
 b=3qk17AuthmLrrzE+PhwLCYr1laFJHr1th/1tMLElvViPKCeQEdH8DA7vbsVyJPRA94
 Q/J9dJL64IylMB96jgVtAU3YAJvR94hDfQfFH3Kug5H8bthKB0ap+6ChCkrUfsRTkAPO
 eAIdeOi4cHBAPbMv86jCWS2b2wWdpx0M+6ACqfKMKnseWwTfcVJ/0qVUtfHFzuXpsMgT
 9LR3+wZicmpaJY1Mz0uWpEb57gjQl3q9Ybki22q80ypohoC6iC1Yu+VmK85htBHNQbfp
 ZFzpS9g4hr/N3TnSCeY1SNc9Tor/sJFnyU2YscMW0LnnBXf3W72Wd4DiMmVxQ/MIhaAq
 /NWg==
X-Gm-Message-State: ACrzQf2TF6sn1DKFYg+esxS8RFu+VMGSYbzGHXJrJ49ALzWKK5we5psm
 jXwoUiwD8GdH279Z3Kixw5k=
X-Google-Smtp-Source: AMsMyM6S8WmvnvqaBaddBzG3up8V9MMp4ZG5fcPV7o88BmZ1jyiKLaFNK0c+MjWjYp69wqJ9azYuCQ==
X-Received: by 2002:a05:6a00:4106:b0:548:9e0e:f13b with SMTP id
 bu6-20020a056a00410600b005489e0ef13bmr2994194pfb.0.1663844215251; 
 Thu, 22 Sep 2022 03:56:55 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a170902bd0100b001769e6d4fafsm3769566pls.57.2022.09.22.03.56.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 03:56:54 -0700 (PDT)
Message-ID: <7b3130ac-34db-0af3-ebfd-31e91c3ab4e7@amsat.org>
Date: Thu, 22 Sep 2022 12:56:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v7 10/14] hw/ppc: set machine->fdt in spapr machine
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>
References: <20220908194040.518400-1-danielhb413@gmail.com>
 <20220908194040.518400-11-danielhb413@gmail.com>
In-Reply-To: <20220908194040.518400-11-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.702,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 8/9/22 21:40, Daniel Henrique Barboza wrote:
> The pSeries machine never bothered with the common machine->fdt
> attribute. We do all the FDT related work using spapr->fdt_blob.
> 
> We're going to introduce a QMP/HMP command to dump the FDT, which will
> rely on setting machine->fdt properly to work across all machine
> archs/types.
> 
> Let's set machine->fdt in two places where we manipulate the FDT:
> spapr_machine_reset() and CAS. There are other places where the FDT is
> manipulated in the pSeries machines, most notably the hotplug/unplug
> path. For now we'll acknowledge that we won't have the most accurate
> representation of the FDT, depending on the current machine state, when
> using this QMP/HMP fdt command. Making the internal FDT representation
> always match the actual FDT representation that the guest is using is a
> problem for another day.
> 
> spapr->fdt_blob is left untouched for now. To replace it with
> machine->fdt, since we're migrating spapr->fdt_blob, we would need to
> migrate machine->fdt as well. This is something that we would like to to
> do keep our code simpler but it's also a work we'll leave for later.
> 
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/ppc/spapr.c       | 3 +++
>   hw/ppc/spapr_hcall.c | 8 ++++++++
>   2 files changed, 11 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


