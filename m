Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 353D14AB20E
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 21:27:35 +0100 (CET)
Received: from localhost ([::1]:57508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGo8E-0005cm-B2
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 15:27:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGo0J-0000bj-7F
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 15:19:23 -0500
Received: from [2a00:1450:4864:20::42e] (port=38754
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGo0H-0002qs-66
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 15:19:22 -0500
Received: by mail-wr1-x42e.google.com with SMTP id s10so18804803wra.5
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 12:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9LUjAIKjzb2MgRQ07C67MjnVTd4Gf+9PH267i9QV2Dg=;
 b=AJvnYiJG4F0sXx2lWjwlHdzf+R09nryMktsBspf4ZwKWELm1qOZfbE3b2WbI/QrmLB
 OEYmsnGAdsdL+ZuH3LI3VmwJ4pY6Qr7RKzFAZP+YqsGhVmqYSnTIs7eTZriIMW0yv0CH
 aLu6qEt4J60TugSQDRExcYvMZE/6fGyr9LtQTVtQFTUI6wx1n2bSgM24ANyjiLnzd17B
 Tlt5HzYWw8fxls56LNdqoiyAXEFChFRiHrKQ1JWOdvWI39EUrJiqZEyWJ1LdQV+djPoQ
 Pj/mInyAcewWr+8jASWunT8rc71Z8QPs8WlvX2guPag1TfmITEkfC28Pvy0oKa2YKlgX
 Tepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9LUjAIKjzb2MgRQ07C67MjnVTd4Gf+9PH267i9QV2Dg=;
 b=f/vVsVIMK7nD1eagv0GhKm+5mhIzM+cJ7dvIVDjAJPAwdIosdzktdYO5V+ff7q4GXT
 3bq26dVTLHlVAxuW9yZrZUUXu140c3rcdQOxZHae8Vac1jMP1Xvbbz00j2QaRvhZbOiL
 14HRXsx5e/YFgWL/vhlOL8V5fA23TaNn7J92n+G6b4aRdGgpfEwCBX/fvFjeal0AVI2K
 UpOPS0TSqYO7khE0gCmRmH6QGnb0ZiguKxBVW/v2DJC/DzokeIpNhda7x0rNb89PHr7T
 odvKZlKY4uTtfsFdB5Mrs34WHHwlundzMG5nUZ6z8goyYK4o+dvTf3kcbdc6yDHp8WH0
 x/9w==
X-Gm-Message-State: AOAM530unr7XzOe5ZIW7bbfbv1bgWVnJW/ijSRaQDzdN3YXMu2l2/XCf
 raZ+BFKmLQpp+rej7s4wYCQ=
X-Google-Smtp-Source: ABdhPJzWHHFvKEdwUyH1rPlRD8S4947NgUySuLK//+unLuV/KdNwrs1Jx6A/pcQ9YZK1QPklcR2abg==
X-Received: by 2002:a5d:64a3:: with SMTP id m3mr7421009wrp.412.1644178759238; 
 Sun, 06 Feb 2022 12:19:19 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id t3sm5869109wrv.103.2022.02.06.12.19.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Feb 2022 12:19:18 -0800 (PST)
Message-ID: <704d269e-ed92-6918-677f-0a931f9ed9ad@amsat.org>
Date: Sun, 6 Feb 2022 21:19:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v3 16/26] tests/tcg/sh4: disable another unreliable test
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com, minyihh@uci.edu,
 ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu, cota@braap.org,
 aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Laurent Vivier <laurent@vivier.eu>
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
 <20220204204335.1689602-17-alex.bennee@linaro.org>
In-Reply-To: <20220204204335.1689602-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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

On 4/2/22 21:43, Alex Bennée wrote:
> Given the other failures it looks like general thread handling on sh4
> is sketchy. It fails more often on CI than on my developer machine
> though. See https://gitlab.com/qemu-project/qemu/-/issues/856 for more
> details.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Laurent Vivier <laurent@vivier.eu>
> ---
>   tests/tcg/sh4/Makefile.target | 4 ++++
>   1 file changed, 4 insertions(+)

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

