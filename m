Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F72696885
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 16:55:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRxd1-0000G5-Fi; Tue, 14 Feb 2023 10:53:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRxcy-0000Fg-0e
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 10:53:56 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRxcv-0004MF-EE
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 10:53:55 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 f47-20020a05600c492f00b003dc584a7b7eso13989114wmp.3
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 07:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/zYXMOqxFYi6LScaOomSTVJlzSrLk+YNL0ZBBaa+cC8=;
 b=CJIacpgdsnljARRZxdNh/EWi19yfVfQVrOcF1DwzxGg74EUWVDz1rr1Srlvyhc2hFe
 d16yOpdrbOaP2IgG5XPTVVldk/8kKo8qEVZGEWm8ZBDiuG5Lzq00RVKX7TdR8ipxV0RZ
 4M+1G+uNDdc/ai9Iu1FqUqF/6veOGndzeiizNlCu/QeQYbaVrm6jpdQv7+CHGrbDtKq0
 nf+MFq9seMkzCyJew1Xoe4uhwjT7wqJvKg3pXyO7Dt63D6oX7o9Kd60uC1U3Q+FHD6BM
 RZPXlJDBbL36ue0MPwUThsR6tzAj1TZ/lxdmcQ43EkLiB21WczOuyy6gq4B68ucBtAUo
 RUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/zYXMOqxFYi6LScaOomSTVJlzSrLk+YNL0ZBBaa+cC8=;
 b=S8RAYSmED4d3v0Zu57pNkvtxi4eF3Up9Ysj5wHGJrErmWWSpLRfO30LVkEF7/Ls/Ri
 EIZwtUQMEsY1TLuUQXY2t/M+X2Ch8WeGI0OnvYk6Zp3oRJUeqU/R1pGURAsm7a+MLOf4
 h+nEYnlUYqSfNdtBYaBk52xS7dLuBU7+KfgYEGJiACFNhBoqWck0if7K3nKo/08s3dZI
 +wMgfwAJo2pVBG2kqAXFU35n9ilx17AEIQglSP9r7sqq5tSsV4X7+hTotn/GQZaEpX7V
 KUwufPfVWWBgrdQrl/Mb7P6/wzr/SnI4j3zv3Z9jKR/7fMItaHEAEPl6gBhk8+ImKh8m
 4rlg==
X-Gm-Message-State: AO0yUKWHQt7F4vLD2Vye0jQQui6TO0qs9OFwzMHyd5kWiaCU15pd1v6U
 GHH3ImhDNfO6wsIXboUoooo=
X-Google-Smtp-Source: AK7set+jNFS19YRVCGAJwEmYo94GfRwtZIkUk7gNDSv50gw2UAvmLUlkwF1zIOqwlrEqiUqflW8bMQ==
X-Received: by 2002:a05:600c:354b:b0:3dc:c5c:b94f with SMTP id
 i11-20020a05600c354b00b003dc0c5cb94fmr2352946wmq.39.1676390010582; 
 Tue, 14 Feb 2023 07:53:30 -0800 (PST)
Received: from [10.95.154.108] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a7bc444000000b003d9fba3c7a4sm19530419wmi.16.2023.02.14.07.53.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 07:53:30 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <91f95b09-cd01-6490-f247-b8250c2c956a@xen.org>
Date: Tue, 14 Feb 2023 15:53:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 50/59] hw/xen: Add backend implementation of
 interdomain event channel support
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
 <20230201143148.1744093-51-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230201143148.1744093-51-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32c.google.com
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
> The provides the QEMU side of interdomain event channels, allowing events
> to be sent to/from the guest.
> 
> The API mirrors libxenevtchn, and in time both this and the real Xen one
> will be available through ops structures so that the PV backend drivers
> can use the correct one as appropriate.
> 
> For now, this implementation can be used directly by our XenStore which
> will be for emulated mode only.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_evtchn.c | 340 ++++++++++++++++++++++++++++++++++++++-
>   hw/i386/kvm/xen_evtchn.h |  19 +++
>   2 files changed, 352 insertions(+), 7 deletions(-)

Reviewed-by: Paul Durrant <paul@xen.org>


