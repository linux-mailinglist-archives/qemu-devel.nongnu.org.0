Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AE84A49E2
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 16:10:57 +0100 (CET)
Received: from localhost ([::1]:38060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEYKW-0003ff-NB
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 10:10:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEWvj-0004tZ-P0; Mon, 31 Jan 2022 08:41:15 -0500
Received: from [2a00:1450:4864:20::334] (port=44560
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEWvi-000412-5T; Mon, 31 Jan 2022 08:41:15 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so9396357wms.3; 
 Mon, 31 Jan 2022 05:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VWBfq2qoGD1ExXa5/bORefdQ0o5eOcds4wBiM1lqGVE=;
 b=ALqEUbEeK9gOFWcqKegKSXa1XktxowTHfe3fPJkuJAbeNCmyuavhn8cW4XWUVasxtO
 tgMIn2XmenXHmSamWKUl9RVxYB4SGtVbt6QhsT3ikALxcnTnQ7AW3YtYJYSwULyW4YFR
 UxjAb8xGfwNiBK6cJ7LJRdjzkcXx/I++f25dyt9l1NBUb0AzbvuGmW6EE1y3K6fOQyWM
 uQspqAlXCXrcRGpgaeLTqHaiRW+xpeI+sXjP7D+BDDE48I8D0l+aWlWOkRftoxpreGc2
 ibntP1dKt5a/c8RdBQMqfKViZJeopG3Q0SnPeS14bmJbdxyWGFIxzMYAFAdPvLJ1oQf6
 SiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VWBfq2qoGD1ExXa5/bORefdQ0o5eOcds4wBiM1lqGVE=;
 b=XRTkq3bm1tMb0EykwHg92664LHjOOZUPbuEQQlb+OFdA07h8VHy0/7kryFL02ebeIE
 lJNlRBXJlYSWRML7srg22//UpXZBFFrtTwTPYeAwyV9RNUHdaZClNxsv+U1jGGzw1P5+
 YaiivHKRXkNFFQ+7pQ7mLW27Yoaoub+0ZSi9+umsSqKQtVJZ+zPnsxBQJNNcuoLh0wls
 /HaHgBlX7ulZlW9oohiD8rqZmk6y2SltobfZkTcW3dynNXX2CoxFo1js0idfwsOdpXPs
 aTxp8+/JJtpqsgib3/6OnFZsXZ/bsONkH+AYIlmSSHLS1iEaddbSBcr1zhBmPuBYURYp
 phtg==
X-Gm-Message-State: AOAM5318ca62Dq+GuHeKVqcDNsdMz4+7JwoJRTlNzwGKjMJlyXy0k/uq
 xs1IZin0W4+a8lcyRnmRR3E=
X-Google-Smtp-Source: ABdhPJyvohexG8VTCaSJmsERwS56uLv8ruDuQuKqGNzfdIH2B0gTcL+FlXMyZVQ/l9xOouEFtzJpkw==
X-Received: by 2002:a05:600c:3494:: with SMTP id
 a20mr18948185wmq.129.1643636468885; 
 Mon, 31 Jan 2022 05:41:08 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id bg17sm7731137wmb.2.2022.01.31.05.41.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 05:41:08 -0800 (PST)
Message-ID: <9fe14564-e2ac-7623-f85f-de9bda131085@amsat.org>
Date: Mon, 31 Jan 2022 14:41:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH] hw/rx: rx-gdbsim: DTB load address fix.
Content-Language: en-US
To: Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20220131094203.772226-1-ysato@users.sourceforge.jp>
In-Reply-To: <20220131094203.772226-1-ysato@users.sourceforge.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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

Cc'ing qemu-trivial@

On 31/1/22 10:42, Yoshinori Sato wrote:
> Linux kernel required alined address of DTB.
> But missing align in dtb load function.
> Fixed to load to the correct address.
> 
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>   hw/rx/rx-gdbsim.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
> index 75d1fec6ca..f70472aeaf 100644
> --- a/hw/rx/rx-gdbsim.c
> +++ b/hw/rx/rx-gdbsim.c
> @@ -143,6 +143,7 @@ static void rx_gdbsim_init(MachineState *machine)
>               }
>               /* DTB is located at the end of SDRAM space. */
>               dtb_offset = machine->ram_size - dtb_size;
> +            dtb_offset &= ~0x0f;


Alternatively (more explicit):

           dtb_offset = ROUND_DOWN(machine->ram_size - dtb_size, 16);

For any option:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


