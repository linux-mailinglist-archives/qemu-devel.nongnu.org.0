Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDF22F03E0
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 22:45:57 +0100 (CET)
Received: from localhost ([::1]:46068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyM3Y-0006uv-MH
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 16:45:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyM2P-0006U8-D6
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 16:44:45 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyM2N-0007Hg-Mv
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 16:44:45 -0500
Received: by mail-wm1-x32a.google.com with SMTP id q75so11444212wme.2
 for <qemu-devel@nongnu.org>; Sat, 09 Jan 2021 13:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=izxWwJ5+Q/ADU1LfIIPjUGe8MSQhm+kbkxSevdj3e5U=;
 b=VGCgsbf0NNLMiRF4uAimZCEQY4STRxLqEYdcRM072sB2ioRY1bC6FS1ZcF9ZV3BYUu
 lpgGRJ3k3pBjh2CgqTkYzqDlVI7B3YdArzDzKQhG3sLD2YppeOmly1Kbnf2UAa/8PbEB
 tvgnAsH3cyYvHY+XVauQiJHxaBK7fOOK0OJFSaUcdYxMNPuFxMGRiqpyaczfYAxnMLzO
 SYaA9Xe/RNM0ENJPpQ70LRUZueHv3pXRpns02clYop81IXU3ewu4WOewAurix0bCXtHR
 uOfv4xlQU8b6WO2GlAmjYS1taiq9BrK/y4ulnQrxBTeCFwUPFGHWQOcOyYapnY8M/1Z/
 VqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=izxWwJ5+Q/ADU1LfIIPjUGe8MSQhm+kbkxSevdj3e5U=;
 b=LezvKZRMYaeveV1tM34i1/CLYPAErDNNbZPBdc7LqGkLpwQOK96WsK570/cOQ7RyPt
 TqK6kLmSQDxE05oBDBiXZcQ1JqCMeDSWBnD0YMDpzggjmCW3IgtZ3dE8ggw5jF2BCK5a
 rPvLeliuO300msdDqZbSJFZSthZyMadk71DykLkzTIt/28z/QCFbQ2HmXQpDUorLJMlo
 zynFDQINeaQlNv0SlfpphROSlEhgPMDeje0xPQsf+DqKnVxtoPAHVMR7YItIj0q5XxL4
 b+E56aqCqhWNif3nX1HuRufzSl6ObmfP6UVsaloHOvuExyvxGCRB/PT0DpULRYNarehO
 yXOg==
X-Gm-Message-State: AOAM5326Nz2XnAn+9tGfjdau5uG3QAyq1LBP/QxwAIaD7QfuG1XNePyp
 m/JluioUGQPDHD8tyaX/UP0=
X-Google-Smtp-Source: ABdhPJzuJ6GR2vlr3fHugQ2EM+AzSLfsMwf2smHu9xrE45VSrvyxp5uZr1lEq7ptW6bKh/qgWRm+SQ==
X-Received: by 2002:a05:600c:20f:: with SMTP id
 15mr8555813wmi.36.1610228681812; 
 Sat, 09 Jan 2021 13:44:41 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id z13sm23992165wmz.3.2021.01.09.13.44.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Jan 2021 13:44:40 -0800 (PST)
Subject: Re: [PATCH v6 08/35] Hexagon (target/hexagon) GDB Stub
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1610080146-14968-1-git-send-email-tsimpson@quicinc.com>
 <1610080146-14968-9-git-send-email-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fbd9d005-a75a-e073-163f-f299e6563b4b@amsat.org>
Date: Sat, 9 Jan 2021 22:44:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1610080146-14968-9-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, richard.henderson@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/8/21 5:28 AM, Taylor Simpson wrote:
> GDB register read and write routines
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/hexagon/internal.h |  3 +++
>  target/hexagon/cpu.c      |  2 ++
>  target/hexagon/gdbstub.c  | 47 +++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 52 insertions(+)
>  create mode 100644 target/hexagon/gdbstub.c

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

