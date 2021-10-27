Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0715B43C20E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 07:12:19 +0200 (CEST)
Received: from localhost ([::1]:34776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfbEY-0003FL-2y
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 01:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfbDg-0002aD-Sn; Wed, 27 Oct 2021 01:11:24 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfbDf-0001k2-He; Wed, 27 Oct 2021 01:11:24 -0400
Received: by mail-wr1-x432.google.com with SMTP id v17so1916196wrv.9;
 Tue, 26 Oct 2021 22:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Wlqk/rgJ4av10dltdxEejokYCVR+Jp6LglG32f2Sw8U=;
 b=Lcl/Vd2M83cwEGq0mT0wTp+NJnLesLCppQaFJC69nUYvCium5BQVwVzzaQx7MSyerx
 6weir8aaAjXj2ANKweBS3hZYqzVrUi+XGhapMChLayxopDBu9YgRddBW9e/jxNegJl2d
 gLVPwkI0VArEls+dypo6FBUotwlXnO7gEjCChreo1egRgweIZ5piUC/Rmzgceb19KviW
 GWu4byzUH/V8HShUD+qSzUSdkO96lVBW6za/j7W/BeozjSnZwoftzixBkmYL15RjDSMa
 P1ZMvVnlgse+2EUcMbvGkIgJUgM1PnqlJplszRZZlzLFJ695QROsx6czZDXCMINev7Ve
 rsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Wlqk/rgJ4av10dltdxEejokYCVR+Jp6LglG32f2Sw8U=;
 b=udU2CK0SEGhnEbsjXT+BtXF4/x9aB1zIn8Y8OzRah2rr/napBb+dQjyTV16iXX36rS
 COTZqBvsX5dsZKjk70pGtyPIlElz5AmBUsBGhAVtAH46SYKXng15TtIsHlTVqDxK234p
 T5BYzLAYPqklCsFyxyA8AdrROmqnckn7WxvWYKxs7/kIG7EdiO8+j4Z1WOGbA9dM0EEq
 Qq+mm4FfZnXEQUHcFER1+9OXFV4hzSMVSAQFDkRf4IQ9lYZH9Fi3aLf/e1ulNFljVjhk
 0kJ5WiFmkjD5cedsjmgiKlxZXcBupQBpkUhsfI8K+0IMl+PRUlkdXUDnm7+mlI1/2v2v
 wX+w==
X-Gm-Message-State: AOAM531H+LYqMySf8K/YoqvE2DBBijf6FZo0Q9se/dJpfVy/tAqQOhFB
 X+1S7fLy+Fx9z00ECBtQoKJ/3td//1s=
X-Google-Smtp-Source: ABdhPJxOikzuhb/cxUMEfaXIDhDyhmNXi/7FwsTchaYyksAGuam3RqNcIwbtMIYJs5JAi3ZGi9gU/A==
X-Received: by 2002:adf:a48e:: with SMTP id g14mr37456648wrb.327.1635311481670; 
 Tue, 26 Oct 2021 22:11:21 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id k7sm8408wrn.16.2021.10.26.22.11.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 22:11:20 -0700 (PDT)
Message-ID: <e4da8e9f-7874-0852-792e-645eb7b0d078@amsat.org>
Date: Wed, 27 Oct 2021 07:11:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/3] hw/input/lasips2: QOM'ify the Lasi PS/2
Content-Language: en-US
To: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210920064048.2729397-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210920064048.2729397-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.215,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing qemu-trivial@ (fully reviewed).

On 9/20/21 08:40, Philippe Mathieu-Daudé wrote:
> Slowly nuking non-QOM devices: Lasi PS/2's turn.
> 
> Philippe Mathieu-Daudé (3):
>   hw/input/lasips2: Fix typos in function names
>   hw/input/lasips2: Move LASIPS2State declaration to
>     'hw/input/lasips2.h'
>   hw/input/lasips2: QOM'ify the Lasi PS/2
> 
>  include/hw/input/lasips2.h | 31 ++++++++++++++++--
>  hw/hppa/lasi.c             | 10 +++++-
>  hw/input/lasips2.c         | 64 +++++++++++++++++++-------------------
>  3 files changed, 70 insertions(+), 35 deletions(-)
> 

