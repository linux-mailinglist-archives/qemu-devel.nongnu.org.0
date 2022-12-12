Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B0464A657
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 18:56:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4n1L-0001nk-Fu; Mon, 12 Dec 2022 12:55:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4n1F-0001mq-3y
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 12:55:13 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4n1D-0006E4-LN
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 12:55:12 -0500
Received: by mail-wr1-x436.google.com with SMTP id u12so12932669wrr.11
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 09:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=FfjtVk8xPMU5CAXqjSq1lJ0a4QMS0sKtPMAGPrj/R+g=;
 b=bQsk7fc7WXd34bHyYSE3Yz6dIfeTTPzk4lg4mX6EWOV4masL0NxLxUKboyh8w+8DzU
 EQN34xQH+LwFhMcXsm5snjtKPkqQDaPr2OQOU9b7kfmbX/F0aCxv9C9Fwsh3Il0Ry92T
 sLEUy0Kxn5TjXNO5La1AlfqgQgjkKMwFttn1O819N8r4gTh8RiT9ZPeqTDW7Kn/Psm6z
 l+gBzeCabwPd1dJsXpnVacHHHKiKDqEVtU46ARq4YbqXpu1iB5Nwq5mB/FNuF0wPmVr+
 eXHWCItFKPe8Fj2ZWSYZj5kxixAirYckJ+NZ76Hk21KBnSNN6B5ZEhj5mB/x4vQat5IS
 w9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FfjtVk8xPMU5CAXqjSq1lJ0a4QMS0sKtPMAGPrj/R+g=;
 b=k+3h+BiW7O2bZG14kteqeJEn2hIlDBq2B+SuwsVPIeqhsonRgfbnFJw9OB9ELpf2fj
 LxzRrZJoOwzTap4fZkOJ51hqacKtAJrcaeV+OUo8heqIocJjjMuLQY8kagWNH7QFjwhF
 O/6xK7w0z3SaoY25BrysGeHLfAwLDK6ZCtTTbCdTGJMkOmr9kt+YSoIjRw5MC8lNTTyJ
 3vzouuYt2+92GIvs3Zj5QYWrXsPnSEW2EjTq2LtP9qEvFfEhQTX70v+q5HcrfEM0O14k
 Mo07b5oqapflUZ8p+/MUbSU9AFIY/7BPgpXbhKO5ajVjhSfKJUsZOe/mWORdKFVvWjhy
 wCAQ==
X-Gm-Message-State: ANoB5pk88tbuVPhK/6nBapUs7L8MtQLkCV+S4Jq8M9t5O8/Oy6Qc4Ofx
 MXnOE1BtEQ8g+IVBGTi/V9o=
X-Google-Smtp-Source: AA0mqf5nhbqlADGtJD1ajeqIA2CSPbg1+cVn0smjrKGey09WYRxkZVi8c/02SxV5qQvv88k+BnoQMA==
X-Received: by 2002:a05:6000:1111:b0:242:1b08:25ba with SMTP id
 z17-20020a056000111100b002421b0825bamr10266357wrw.39.1670867710236; 
 Mon, 12 Dec 2022 09:55:10 -0800 (PST)
Received: from [192.168.4.46] (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id
 bt4-20020a056000080400b002365cd93d05sm9500299wrb.102.2022.12.12.09.55.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 09:55:09 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <b7b13808-c0b0-1ba2-74f8-380480a9aa0b@xen.org>
Date: Mon, 12 Dec 2022 17:55:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 03/22] i386/xen: Add xen-version machine property
 and init KVM Xen support
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse
 <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221209095612.689243-1-dwmw2@infradead.org>
 <20221209095612.689243-4-dwmw2@infradead.org>
 <8495140d-3301-7693-b804-0554166802da@redhat.com>
Organization: Xen Project
In-Reply-To: <8495140d-3301-7693-b804-0554166802da@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/12/2022 17:30, Paolo Bonzini wrote:
[snip]
> 
> The platform device can be created either in mc->kvm_type or manually 
> (not sure if it makes sense to have a "XenVMMXenVMM" CPUID + emulated 
> hypercalls but no platform device---would it still use pvclock for 
> example?).
> 

Not sure it's wise but the platform device is certainly optional in 
xl.cfg so you can easily bring up a VM without it.

   Paul




