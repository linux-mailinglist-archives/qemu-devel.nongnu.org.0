Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A18466CDC9
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 18:40:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHTSF-0005IK-2z; Mon, 16 Jan 2023 12:39:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHTSD-0005Hx-Al
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 12:39:29 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHTSA-0005cK-Ob
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 12:39:28 -0500
Received: by mail-wr1-x435.google.com with SMTP id n7so2133898wrx.5
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 09:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QoF0rORcJXnB2b9L1PSgAQWKNXSzhUXhK2rE7wubdgI=;
 b=jEvZV06XKWqwLIcsimtsaZGE1eM57WCpI9Ub9Xeq5AzyGIoi1vUolMmhv1FX+1F3ow
 2g28+iZuWEoanD4f+DpZ43V/7eT6VLFclqbACDi9UT3ueNCh6RlMLvirHA3VjL3U1ZFc
 +uznaLFT0VPbmHgQmg7HmRAE1RPbKEpsQlfUrjK7Lw6JI/jxKuQRDmINdvxVllaijGEY
 G4K1eQ4hIITJCL5oLXKO/e+QwCKmsyDYmOgGVx+Cgr4/7MA4+0QqQzCS4YQjy8oymLCl
 Pu9WiPr9Zt0sLTqAWXRogrwC0mSMCIRFcSLCp0Yt2CVdKH7ECX8V/QPl1lmZWix2ekiz
 VK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QoF0rORcJXnB2b9L1PSgAQWKNXSzhUXhK2rE7wubdgI=;
 b=7fATSVkyC0BXMpxKPx70Vyoc0WmMsu6UPZioUq3aQPVD1Xz67BwLvOdsNLmTLYBY55
 gYzpohjr9Wy6mqCjwMsztc3/WnCwNhOJRtycD02sGTHq48d6sgSRxicX27SBiKb/hFxS
 1WZQFJlZ2XqkQfg9vg+z183viRklxriRNpXT4PeMgfiMcwbFu0R9P27DDxHWUD5Gl0wd
 TcRx1+NHq0rNtr5fLbULlXIM0DAKlkST6gf3tltJq6uNPGd8dJuX/G+icRyfcu4MeKpe
 BR0PVhPJIc0YsntmIb3yvAGjR19kO2hNQSBy126+gTMFKhR5/b/WDOakm8DqPTqAMz33
 hdNA==
X-Gm-Message-State: AFqh2kr1E7XkZCGr8+AeO4uSKC/a6KxKrXzRtOKy442O6RercsPfCzkT
 lLwXPYsxMvWq/Fs+IZZRNWw=
X-Google-Smtp-Source: AMrXdXsDyDqbVOD8DWL8StF79cgIb8SAQJAlQwlpce/cqSBHF8t7+EiE00OqkIBfH3t0sSkaouBp2Q==
X-Received: by 2002:adf:cf03:0:b0:2bb:62bf:f5ce with SMTP id
 o3-20020adfcf03000000b002bb62bff5cemr261501wrj.35.1673890765291; 
 Mon, 16 Jan 2023 09:39:25 -0800 (PST)
Received: from [192.168.6.176] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a5d67cd000000b002bdcce37d31sm15092365wrw.99.2023.01.16.09.39.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 09:39:24 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <095a681e-a7ac-b186-d951-21328f613bcb@xen.org>
Date: Mon, 16 Jan 2023 17:39:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 18/51] i386/xen: implement HYPERVISOR_hvm_op
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
References: <20230110122042.1562155-1-dwmw2@infradead.org>
 <20230110122042.1562155-19-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230110122042.1562155-19-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/01/2023 12:20, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> This is when guest queries for support for HVMOP_pagetable_dying.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/kvm/xen-emu.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


