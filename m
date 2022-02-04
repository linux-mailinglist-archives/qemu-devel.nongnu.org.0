Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFB04AA319
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 23:23:10 +0100 (CET)
Received: from localhost ([::1]:56762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG6yy-0004Wb-J8
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 17:23:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nG6vV-0000cg-Qs
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 17:19:33 -0500
Received: from [2607:f8b0:4864:20::1031] (port=34593
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nG6vS-0005t0-8U
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 17:19:31 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 l24-20020a17090aec1800b001b55738f633so8527790pjy.1
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 14:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aFi3NNgH7Eklau7zEOToprREQMijvGzImFgt9pIkeIU=;
 b=olE7cmzlhdaOxU6q82yfmMmd2BbOpZSTw4nekZ0vExbKiAMGzYXUJbcmNOB0+Z0DPK
 mpha6blB9GqYi+8CJCvUa5/TgwNRhGeVEIAaaqwIF3CVFgwO5AG3zb4U+/jbJZmC64Iw
 B6url3I5HfLiDDz44bhmYbFnexg138UO1yCZMkmlzzYN+K3xRYkZLHWDpS6c/zNRwL8V
 iIefQHCjd+hTKIzHiCxiznKrJvDfjsrJIeKaNXnP3DLLsg/4nnNXYU/upzcEyTg0kzMm
 j8bC1K6T3lyW/77VQtrjAPHbRIZBu6qE1f9l1g8zHFj33SeM6BuNHHw8nC73FGyR38r2
 6ecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aFi3NNgH7Eklau7zEOToprREQMijvGzImFgt9pIkeIU=;
 b=Jj+hkWUQiQb6IqjuRGMKRSRNajUtJ5Yvwx5F2zOq/Lynmyh4lvgp97kQ6E7syQ/wwf
 dj/xRPinKMDgJ2NXIa6E1kjFGvcii2QC8BTqWsem5WsjIY52pNlxSV7p06i5a1tmy4FQ
 EkhX9MHkuI5jS1CBDbFXICNVfcpq0niucx23Z8tOWQom9wz6OAqg/oF6ILAcIsH0B7Kf
 F3j1yiLnKa0nafMmpeviHHC2+Fz1jdk7ukWLVELJ/0nUdxRCpOSThc1dRDtMJj/S8yjt
 XVpqoZ+slDakP8MTLqpCP8+jp059e+iKEx9M5eY9Cwip3m2lhwY47vHxF21yLfQn731V
 Ap0Q==
X-Gm-Message-State: AOAM532EtBCc0X0/dytZAyMH2JTM8JBsjh4/0P3yMi4hoyyOu4cxwmO7
 hmhTzM6sYf+IHJebu+qz/To=
X-Google-Smtp-Source: ABdhPJy3OzlDGPunj9ipZuJ+6ETISvOrEnSvHiT48CAsOe14N+hgIdb6UvgNmrhxA0Pw5eZKSwi/1w==
X-Received: by 2002:a17:902:7c88:: with SMTP id y8mr5322883pll.9.1644013160225; 
 Fri, 04 Feb 2022 14:19:20 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id g2sm3653079pfj.83.2022.02.04.14.19.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 14:19:19 -0800 (PST)
Message-ID: <9a6776a0-75af-aa48-b3fc-605f2781453c@amsat.org>
Date: Fri, 4 Feb 2022 23:19:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v3 26/26] plugins: move reset of plugin data to tb_start
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com, minyihh@uci.edu,
 ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu, cota@braap.org,
 aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
 <20220204204335.1689602-27-alex.bennee@linaro.org>
In-Reply-To: <20220204204335.1689602-27-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
> We can't always guarantee we get to the end of a translator loop.
> Although this can happen for a variety of reasons it does happen more
> often on x86 system emulation when an instruction spans across to an
> un-faulted page. This caused confusion of the instruction tracking
> data resulting in apparent reverse execution (at least from the
> plugins point of view).
> 
> Fix this by moving the reset code to plugin_gen_tb_start so we always
> start with a clean slate.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/824
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20220124201608.604599-23-alex.bennee@linaro.org>
> ---
>   accel/tcg/plugin-gen.c | 29 ++++++++++++++++++-----------
>   1 file changed, 18 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

