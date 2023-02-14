Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A8E6968D2
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:10:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRxss-0001sV-I3; Tue, 14 Feb 2023 11:10:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRxsn-0001s3-Uh
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:10:17 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRxsm-0005AE-9x
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:10:17 -0500
Received: by mail-wr1-x42f.google.com with SMTP id m10so7291528wrn.4
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 08:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r7i/Xj+u/7RysZRFirWOpp0SsCRXqUXK3nHoIYkbBeM=;
 b=kA9uHiFXfdOr5PIRVMlpWQfSiyUPbwqTWhjU9mjjEIVKHhUZgOWxwPicZXr/fDmbBr
 fFatUO2hyZevUnUw+aiHbofatXAY9NEi+sK9kyrQdTRjI8eoyO187OQTOBRBzR99CHiX
 Fl4RI8NZebBl5nQd7grTc0wQQYfTUZoU6ysKwvOAUD6eE4JgPfDirnDh1sfukr1MNytJ
 QlrfFs5XOA9L7vnlU0WbX2GCj7c54mATZfe++MiosUa9SGeltoDSBUg+FbM8kM3DWro8
 uXQbzFG48gYtomO4Xs8ozADTZp56w2pncW+IdzlCvYCnl/UcbSnxSRsX969f8gRQuVPh
 zjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r7i/Xj+u/7RysZRFirWOpp0SsCRXqUXK3nHoIYkbBeM=;
 b=m5YBbfIA1iooByrs4F1jDy8qIXMnaZTTOt3Zwk3+oZeaW8Aebr2TZLDGFfBBWg+xMl
 OEp9HsJ4pNAL5RJbAvlrGefaTylscJHyWY1CW7LaZly0g5f8xugUesPAf1GVX491f7VE
 wC+uRJAWmq/eiM+bnzWVH4e/0MKD3WBT4MbR8qqPcZqJYJV9MCTipeSVDKhtBdcsGTAe
 12WOiRviDlXbeyi+PHFogAnrBJOy82X0BQwYD/B+aJtDjgyU+tE7luZKHESD2cA79F7w
 k2yfmWS89v+hR7PzLeftpFavq1mMLJDVPF2hBPYPQuiGBb38UiwEjX4ynUyL14aGm2yi
 Mkyg==
X-Gm-Message-State: AO0yUKVUC5evu9Vsqmus1Ou9bhiwrku8fPIg6/lD//sSxEkv4CcXSinP
 DuSPBa6txUJC7w/DbsRFZcw=
X-Google-Smtp-Source: AK7set8E+wge3o2yWc3s6Rnm19l5W8yW8h9IhPnSOxA2pHRof0fVpQVpTqhoyv8CcU8UGfmUOaneXQ==
X-Received: by 2002:a05:6000:1c7:b0:2c5:6046:9244 with SMTP id
 t7-20020a05600001c700b002c560469244mr2856028wrx.53.1676391012937; 
 Tue, 14 Feb 2023 08:10:12 -0800 (PST)
Received: from [10.95.154.108] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a5d6102000000b002be5bdbe40csm13345517wrt.27.2023.02.14.08.10.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 08:10:12 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <9b1a0ff8-665d-bd75-2455-30f36e91af8e@xen.org>
Date: Tue, 14 Feb 2023 16:10:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 55/59] hw/xen: Implement emulated PIRQ hypercall
 support
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
References: <20230201143148.1744093-1-dwmw2@infradead.org>
 <20230201143148.1744093-56-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230201143148.1744093-56-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.35, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 01/02/2023 14:31, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> This wires up the basic infrastructure but the actual interrupts aren't
> there yet, so don't advertise it to the guest.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/trace-events  |   4 +
>   hw/i386/kvm/trace.h       |   1 +
>   hw/i386/kvm/xen_evtchn.c  | 300 +++++++++++++++++++++++++++++++++++++-
>   hw/i386/kvm/xen_evtchn.h  |   2 +
>   meson.build               |   1 +
>   target/i386/kvm/xen-emu.c |  15 ++
>   6 files changed, 318 insertions(+), 5 deletions(-)
>   create mode 100644 hw/i386/kvm/trace-events
>   create mode 100644 hw/i386/kvm/trace.h
> 

Reviewed-by: Paul Durrant <paul@xen.org>


