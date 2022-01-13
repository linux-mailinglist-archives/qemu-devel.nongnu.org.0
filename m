Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C14E48D6A9
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 12:29:11 +0100 (CET)
Received: from localhost ([::1]:57002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7yI1-0007jE-V9
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 06:29:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7yAn-0003Zt-7r
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 06:21:42 -0500
Received: from [2a00:1450:4864:20::529] (port=40604
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7yAl-0008HT-ML
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 06:21:40 -0500
Received: by mail-ed1-x529.google.com with SMTP id a18so21787351edj.7
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 03:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=K9RI/jh4dbfrNN11s27/xMMsL6TVjjeYnup9FesENQs=;
 b=gUBOvm97zIW+aTccf+l+yLODwjW+l3aMQMe7vepWn7HKJlQjSrVp2eIRkYhJ/SP6pW
 qhAEaxAQgAJW0yWAh2XNZF7MX7/EyU6wYC7w8nOlLHKhJCaAfIPENt/X8Op6htF2b7PP
 GshXTVa1qd6AzUbz6EVlrI6yRk8W1KXWaZtFkjfL5++xBog6+TuOg3iNlsBX/hiv2luv
 yFl4vFtseibsJ+QdFEk2MMn5KtoZun+QvPeKsboxMKszoUp/zz11R6+QvXYmFSk78Iy5
 7Ave4X5YGL9635ng/BBQt22k700HPWtCNb/rizJ508VhhrLkhwDDHJVpkL6W6gtm27vm
 vkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=K9RI/jh4dbfrNN11s27/xMMsL6TVjjeYnup9FesENQs=;
 b=XyaaLc8ZguuAsWh0asnSmk2Kb33de5kLCo2zCQmdpDfANo7myxrZyUAQqTIJxVfTuW
 lcMhx8chMDd9ICMGircIUd+0hbvD9bTpNZXJAah3cjPz0t8EPIoEz4uXkRrZodDEODJ3
 MWYLGWuQCI9qPNCvKSKtr8HzA/9zOckERkmsPhQyDOkWyppJybWHUxPZrjN7ZTugfymD
 lEJJycMYG9zqzVQbD9Sq0dDTxAigwswPScx3eHslSUqzZRttIfQITYVx4KhrhJx9bI8V
 zdPDeu3fm66/cqp57LWgNrFVjibzSIX44+f/FtSwu4nlbkYfeMlflrjKLD9VFlKpvtYR
 84jQ==
X-Gm-Message-State: AOAM5333tImpSRdipVTWXvLBBAcHkaOdJjA1hnefhD2I5jTv01oOCjcN
 JjVdNxuAUyD4GttjHyJ55Wc=
X-Google-Smtp-Source: ABdhPJylgdLIM67TSCpjontMRwdCV+IxZd13qoS1jfsCbiaQEFWGLcenmb1vHbm3KbHV0lR8ncoMAg==
X-Received: by 2002:a50:d74e:: with SMTP id i14mr3608675edj.243.1642072897829; 
 Thu, 13 Jan 2022 03:21:37 -0800 (PST)
Received: from [10.101.1.234] ([185.224.57.167])
 by smtp.gmail.com with ESMTPSA id f6sm781390ejf.69.2022.01.13.03.21.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 03:21:37 -0800 (PST)
Message-ID: <45ee27fc-05d7-4c24-7ca2-d12027a4e420@amsat.org>
Date: Thu, 13 Jan 2022 12:21:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/4] include/qemu: rename Windows context definitions
 to expose bitness
Content-Language: en-US
To: Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 marcandre.lureau@redhat.com, dgilbert@redhat.com,
 yuri.benditovich@daynix.com, yan@daynix.com, philmd@redhat.com,
 qemu-devel@nongnu.org
References: <20220113005248.172522-1-viktor.prutyanov@phystech.edu>
 <20220113005248.172522-2-viktor.prutyanov@phystech.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220113005248.172522-2-viktor.prutyanov@phystech.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/1/22 01:52, Viktor Prutyanov wrote:
> Context structure in 64-bit Windows differs from 32-bit one and it
> should be reflected in its name.
> 
> Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
> ---
>   contrib/elf2dmp/main.c       |  6 +++---
>   dump/win_dump.c              | 14 +++++++-------
>   include/qemu/win_dump_defs.h |  8 ++++----
>   3 files changed, 14 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

