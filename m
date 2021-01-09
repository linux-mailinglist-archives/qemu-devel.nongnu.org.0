Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5086C2F046D
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 00:44:04 +0100 (CET)
Received: from localhost ([::1]:46218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyNtr-0007IP-4A
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 18:44:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyNsj-0006d0-F1
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 18:42:53 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyNsi-0006jb-5r
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 18:42:53 -0500
Received: by mail-wr1-x42c.google.com with SMTP id a12so12490285wrv.8
 for <qemu-devel@nongnu.org>; Sat, 09 Jan 2021 15:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jbDwyvvR5thLzYR7Xrm04p5NfaXN/IRuwxT/6QmhNa4=;
 b=exLbaLfCV4aZxoZjAZdAOCYUtxBrmwF8f+pB8eKOxkHplp66A38naUt6povCXwUiws
 2J4Rte7zhXzbFOKZaFls6ub5ATjIvhJlN3nywJsZ/51eBVyXJRX97ZW0PDofOIk9pj3x
 hbpGMcWFiI4RCGMpZAel1eqV73pVjERA3TgXs1pWf/p0lmP7iBdDqL6o1jPD7c9VDzm7
 FZnK6FyHQX8h8MCPBQUzI9Dz1+X1sk8bbwlN2W9xc2BFiIAAhjTafs8sZ8LqOOwUSs5f
 5UlwLfDm+lxXZpQl8lVPg9A2jSTkVWFGZBcrQv1MY1ww5yPWhckwEPCHkUipIvc7TOQ1
 br4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jbDwyvvR5thLzYR7Xrm04p5NfaXN/IRuwxT/6QmhNa4=;
 b=Gz1nbMQMlbj7zMhMTCJ725JS0ACwvqayJwIJDCm/CHropZVq9/sb/yHR3oorM447nH
 h7+g5kgZXaDZtvb1qUw/16ypLfIZgBugei1TpOqPh06OdBRdh8wi8CJXJnPY4cJrwMo4
 aUK5h+qiW70XVxzS4dnPVJ4SvwyN3TKUvMLBXTDHU+JApvHHRkaHpRlAwHDfnhuzEoHH
 nyl+e6whhRD0kwFrxrqfALPAw+FZJ/TaTdNcQ9iKepq7Y14tr8h1l4DfNvbkTiIGBhyY
 5QRc9Vv4oVpoxEWoIApVWq1qYst0DUWnon1qwCcxBnG/JYO5+L0RIxY4ExtMK1QxytLb
 J12g==
X-Gm-Message-State: AOAM531fZUEiIMFvaN56OFWbgGGxqXAHd+iKNx5Ol93fWLvlsrkTjDAO
 WoTGkdDpV+y6bnxiIaBz1Xk=
X-Google-Smtp-Source: ABdhPJy0RuNrl2GwbXJG0XDESjWmUHZq+ywcu9vz6q1oBYXlGkYN9dOmsl7xPJC6qWUsGbHa/AD0Lg==
X-Received: by 2002:adf:a3c3:: with SMTP id m3mr10062581wrb.105.1610235770725; 
 Sat, 09 Jan 2021 15:42:50 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id r82sm17564481wma.18.2021.01.09.15.42.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Jan 2021 15:42:50 -0800 (PST)
Subject: Re: [PATCH v2 06/13] vt82c686: Make vt82c686b-pm an abstract base
 class and add vt8231-pm based on it
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1610223396.git.balaton@eik.bme.hu>
 <34969fc7be984fa070479bfb9f748993a0aef31b.1610223397.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0421b1be-60bb-b75d-1372-be96595be070@amsat.org>
Date: Sun, 10 Jan 2021 00:42:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <34969fc7be984fa070479bfb9f748993a0aef31b.1610223397.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.255,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/9/21 9:16 PM, BALATON Zoltan wrote:
> The vt82c686b-pm model can be shared between VT82C686B and VT8231. The
> only difference between the two is the device id in what we emulate so
> make an abstract via-pm model by renaming appropriately and add types
> for vt82c686b-pm and vt8231-pm based on it.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/vt82c686.c         | 84 ++++++++++++++++++++++++++-------------
>  include/hw/isa/vt82c686.h |  1 +
>  include/hw/pci/pci_ids.h  |  3 +-
>  3 files changed, 59 insertions(+), 29 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

