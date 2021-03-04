Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D728332D80F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 17:50:55 +0100 (CET)
Received: from localhost ([::1]:50594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHrBd-0003nQ-RQ
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 11:50:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHr8k-0001w6-6U
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 11:47:54 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHr8i-0004PG-5b
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 11:47:53 -0500
Received: by mail-wr1-x435.google.com with SMTP id v15so28407474wrx.4
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 08:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2hmJLH9476fsJj4HWvavBehhbaKnPuslem2SZDpWm7w=;
 b=Gplzq6GX8OzL4HQzIJ9fceRXO3RI+we7psAGp/a3NP/UxisaFrI6fBIsggZ26BVlh5
 UoZSI+ULJXaWvj5lrbzzrBc29F2EKb0rvS6yVoJ+J6vy2zdr7gumYcGAW6ElPi774Dmr
 LNfKko3PMTfJQmRMzL1Fe2eCEunR9u5WvjbFtghrram8K+0PSDN9HjtQrhXrEDo2PTVt
 HEHx0bW76b7UsUnLMCZlwG7P3gcnsYs+g9Ihfk3mL+luVXda+u6usNk35lWA1K9st9ke
 /nxtAdGM822JdxM1jRAN9BoslBsis20vPfgTTpH7f+pCMX49LJjIgPe4L0YLos6442a9
 gEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2hmJLH9476fsJj4HWvavBehhbaKnPuslem2SZDpWm7w=;
 b=kablRL468qRwrW3cIt4Bhy7Q8dUMgY7tI+ts6uwK6gYl/6w30twgvwiFcavTElFkll
 FSrKo2PyJX/uHRdOMms1EnyGiG39lJz4AuXBCzE1g22doXvErviept3Pl64ZLtTWH6Rf
 4dydoK8YOetOqzDGrEwniMrDU1E92W2DxWT5q1E+WByIB/o2HkPDzZvbF1rtvW5dHoKL
 tF6SsUTF5PXObfrag9lA4KbJ4Y6WFWZkrFxgkQZKgVTBugnCeKs5GQeAKJDFVV4bIyKK
 2CYU5S/fyGPgpKc1PVo43/w8XNIK8L2/4AH1Ia8Mmk9QitULaTqnktV+ok6LLlzGNYU9
 Higw==
X-Gm-Message-State: AOAM530UCGG+GqI0UfAaiFefGvCIX7yvhqj6bHHT+/bT9eJXHT0NhK+C
 x4u7kzVRXmBruhzBibcBN24=
X-Google-Smtp-Source: ABdhPJyORsESRwbGV5O1SmN4Xwsju6ogn2K5fmyDWlZ1ZiJJjHC7DA5n7DE4D9RvrAfl8QX4+hAsDA==
X-Received: by 2002:adf:f4ce:: with SMTP id h14mr4877137wrp.257.1614876470381; 
 Thu, 04 Mar 2021 08:47:50 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d7sm8280234wrs.42.2021.03.04.08.47.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 08:47:49 -0800 (PST)
Subject: Re: [PATCH 2/3] cpu: Forward-declare user-mode TaskState structure
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
References: <20210304152607.1817648-1-f4bug@amsat.org>
 <20210304152607.1817648-3-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0f314729-3c4d-d179-5ceb-594b7fa25dc8@amsat.org>
Date: Thu, 4 Mar 2021 17:47:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210304152607.1817648-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/21 4:26 PM, Philippe Mathieu-Daudé wrote:
> The TaskState structure is only used by user emulation.
> Currently it is hold in CPUState as a void pointer and
> casted in user-specific code. In order to simplify by
> - renaming this generic field
> - remove the casts
> in the next commit, forward-declare the type in "cpu.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  bsd-user/qemu.h       | 4 ++--
>  include/hw/core/cpu.h | 7 +++++--
>  linux-user/qemu.h     | 4 ++--
>  3 files changed, 9 insertions(+), 6 deletions(-)

> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index c005d3dc2d8..f4d2169cc8e 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -274,6 +274,9 @@ struct qemu_work_item;
>  #define CPU_UNSET_NUMA_NODE_ID -1
>  #define CPU_TRACE_DSTATE_MAX_EVENTS 32
>  
> +/* See bsd-user/qemu.h and linux-user/qemu.h */
> +typedef struct TaskState TaskState;
> +
>  /**
>   * CPUState:
>   * @cpu_index: CPU index (informative).
> @@ -310,7 +313,7 @@ struct qemu_work_item;
>   * @gdb_num_regs: Number of total registers accessible to GDB.
>   * @gdb_num_g_regs: Number of registers in GDB 'g' packets.
>   * @next_cpu: Next CPU sharing TB cache.
> - * @opaque: User data.
> + * @opaque: User task data.
>   * @mem_io_pc: Host Program Counter at which the memory was accessed.
>   * @kvm_fd: vCPU file descriptor for KVM.
>   * @work_mutex: Lock to prevent multiple access to @work_list.
> @@ -386,7 +389,7 @@ struct CPUState {
>      QTAILQ_HEAD(, CPUWatchpoint) watchpoints;
>      CPUWatchpoint *watchpoint_hit;
>  
> -    void *opaque;
> +    TaskState *opaque;

FYI Paolo said on IRC:

"having multiple definition of the same type is not very good taste,
void* or union are both better".

