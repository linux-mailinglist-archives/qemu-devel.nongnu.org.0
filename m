Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3F46920D8
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 15:31:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQUPt-000261-Df; Fri, 10 Feb 2023 09:30:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pQUPq-00025l-SN
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:30:19 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pQUPp-0000i4-2b
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:30:18 -0500
Received: by mail-wm1-x335.google.com with SMTP id r18so3942622wmq.5
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 06:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VbMVBuepZNykkyz8uQyjySSGuBwCVMpMjP1YIGyVCno=;
 b=M1o2wdR/tUbYlRMungCYSO4dAD5nQaaKmTAWpev6VtTOKLAz/GJJ1kPM9Ta4F8PGjc
 DF5ddFh0mc/1z8+X0yRJZA5pY4ngfOaFpxyx48+FuCB/pB4skjvdjctEh7QILQpWwR/X
 U9kc1sOrICkuKFPHl7vBC5GVibSMH2y6d6Q7xZ0t/GT1UILPFqjX2qeg7+nRJZ3hWt3w
 nx39BbL4vW6zw2KYKAUsXruhirBEG8u7R+iPc3x4vFEv1MrrgG+PYJmba1g4sMRNJy7P
 wO511biaHLHopyE4muYM2PVvGXJD6vwcdSJ/cskbkSuLqqqQW16jgvjzel+8bRw9mfFy
 Xz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VbMVBuepZNykkyz8uQyjySSGuBwCVMpMjP1YIGyVCno=;
 b=OjSmHf2VshWC0DN8wKbzmcR10P/KvgrhCaEKwbWKtu/vmx07OFBrkG0moqRk7aX28R
 HOmmxpvEK/g1HDlY8TAHVimawZ2VEwt1cqFVtniy/VD0VVin0KGh8xEjrbZG9S5y/71K
 YeGfLPhIv0Kz9CVKVXjPDGn/uj9Q5QLUxyw55Y+QD470lXvoRgc7prhCAtuQ872s7kRB
 M0dXdcIgpDG+jclsLKCBdOWVc55j0cXfocCJF1h3h7ouBkbkuZb7yhO7yeUO4n+nYWBi
 G1HgK0Pf9k58YoU6flQqmK25hr4NPnz4mK+9v3tPQOLKbznOr0/HfgLk0xC7FbYS5AM3
 9fOw==
X-Gm-Message-State: AO0yUKVsf3STq1guri5S84TfzyqY3rH8a5ZqJIStbetkZiOYbhDW3YI8
 cugdrONUNIItA2tlvNbuxO0=
X-Google-Smtp-Source: AK7set9zTqbQngDhOv35Fdv38A3q2pYvEqleoMYWj3f46pjY6ahfZmaz2CqWT78sKhk8ucAChG6Slg==
X-Received: by 2002:a05:600c:130f:b0:3e0:c5e:ad52 with SMTP id
 j15-20020a05600c130f00b003e00c5ead52mr13282479wmf.6.1676039415043; 
 Fri, 10 Feb 2023 06:30:15 -0800 (PST)
Received: from [192.168.15.58] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a05600c2ca400b003dc51c48f0bsm8679391wmc.19.2023.02.10.06.30.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 06:30:14 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <a2acab27-e6e1-a8d7-4b16-ff1b1f30ae97@xen.org>
Date: Fri, 10 Feb 2023 14:30:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 36/59] hw/xen: Implement EVTCHNOP_bind_interdomain
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
 <20230201143148.1744093-37-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230201143148.1744093-37-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_evtchn.c  | 78 +++++++++++++++++++++++++++++++++++++++
>   hw/i386/kvm/xen_evtchn.h  |  2 +
>   target/i386/kvm/xen-emu.c | 16 ++++++++
>   3 files changed, 96 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


