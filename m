Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 697D34DDEB9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 17:22:36 +0100 (CET)
Received: from localhost ([::1]:57620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVFN5-0006gy-FA
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 12:22:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nVFLO-0005Rw-F5
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 12:20:50 -0400
Received: from [2607:f8b0:4864:20::62f] (port=41710
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nVFLM-0007Ef-6G
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 12:20:49 -0400
Received: by mail-pl1-x62f.google.com with SMTP id z3so7325515plg.8
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 09:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=CdV3kp73DSUULBnDFr7Lgib9wnwez5Og5ClJVYlgEBs=;
 b=JV7l30Nscr8twODgPfAu+dgN6MMFf3RHNjBXkqOWuI+eD+Xz+B62ZijiFPOYrFycqf
 qp1myJtjJi+xGCbCLIK8a2+7Q5NpRgwUGud7em2ylNVmgFfOqicKBlx1tPfXm5e333Jk
 loZUk0UpCFZ+hZLpvx970/b6XSH+9es3k1WthzwGVvQyRKCZjKxNr0+/sWRTUtFfeai+
 96I/rA/ETAtoK5Mi6N0B0MALZzkhYoe9gQoxUn7UukqVVVNm92FIwYVW+4Oxorbd/i9M
 KGXLUc3Jx90nU8fX01qZbJp2f80bONKWWS5K3VNDy0g+mVDkjDDz5ShNgPxnA++6CbZQ
 wARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CdV3kp73DSUULBnDFr7Lgib9wnwez5Og5ClJVYlgEBs=;
 b=w84/ZobVCArNPNzT5AIko9oiVa59XxW0ck2z2vRCcypwUfwKKPEuMTV5g6ZkZasYhE
 p1XFyRDJQvlPYjHltJxrX34d+EmZUToeAZ9Qoz4GW7jlm85tL0GFjUSabtl6K+8i5jYi
 S20NiqjXyPbDUuqOzsw8swyBEmILeyjDvcwuiRXHarZdDpbCo56F+bpw5RWyXehYhxyx
 ii2tSHcmYbdJbgwt4z6YFlQqjxkfnbmpTgzhzLARr1G/2pWsenzhHkkw3RDyZ0Go2pE6
 L8sEbTxPmdPEvbnX+dSqWUeP7ueGs52kEfPmANBjsZIRaL02nB+JfIpmUog0GPwM6H/i
 ZdYg==
X-Gm-Message-State: AOAM5330EqC3gZNem/yMhSULI7/FSG7yOJwEqRK+VDDxZeuD5hUkWR40
 arPCg70OYaQ9nbb2qOBC1qU=
X-Google-Smtp-Source: ABdhPJzWdG5D+vjvB5Z/ZoajZmu6nY2FgzD3/Xhs4es4DH5yaxyWSC55m68MeFLiVAAJkU1J77SWqg==
X-Received: by 2002:a17:902:ea0e:b0:154:152a:7fac with SMTP id
 s14-20020a170902ea0e00b00154152a7facmr245413plg.24.1647620446355; 
 Fri, 18 Mar 2022 09:20:46 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a63384e000000b00366ba5335e7sm7936998pgn.72.2022.03.18.09.20.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 09:20:46 -0700 (PDT)
Message-ID: <43aacf84-f775-a2d5-8414-3de9d85be0c1@gmail.com>
Date: Fri, 18 Mar 2022 17:20:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/5] accel: Introduce
 AccelOpsClass::destroy_vcpu_thread()
Content-Language: en-US
To: Mark Kanda <mark.kanda@oracle.com>, qemu-devel@nongnu.org
References: <20220318151555.381737-1-mark.kanda@oracle.com>
 <20220318151555.381737-2-mark.kanda@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220318151555.381737-2-mark.kanda@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/3/22 16:15, Mark Kanda wrote:
> Add destroy_vcpu_thread() to AccelOps as a method for vcpu thread cleanup.
> This will be used in subsequent patches.
> 
> Suggested-by: Philippe Mathieu-Daude <philippe.mathieu.daude@gmail.com>

Thanks, but preferably:
Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
> ---
>   include/sysemu/accel-ops.h | 1 +
>   softmmu/cpus.c             | 3 +++
>   2 files changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

