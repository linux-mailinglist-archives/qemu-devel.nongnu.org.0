Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A58265D72C
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 16:19:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD5Xm-0003Vi-FB; Wed, 04 Jan 2023 10:19:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD5Xl-0003VG-0n
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 10:19:05 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD5Xj-0007u9-Fh
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 10:19:04 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so26704580wms.4
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 07:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ppHjajXu00sfHG3gYewiMMYX9m68H41AIgp8I+UXRqY=;
 b=UC2d663kGMVSshGb3omgRSAw0Ledaea0D1mgz5XDzXkbSgMftbWdaODs4OZmZOZBoh
 FyMvchGQ+037Hv9r0gY2rD51/ne2FMsPDuiE3Zr9tDtd+GSwonagjkiT7goqZzl2Gh+U
 W4ctjpskbLJNK16iOyLNAxtSD8TykO7UWVx0+q05zFYM+chKLMn8WWzPXDTOREDFoFoX
 ai1PC9EBJ+Nyq85ZUfyieR+RVa63WqYZX6+4bmFIFPCpfBkXyscUWiRMXh36EpIKeSMd
 SKarwbnDmbMBH9wuFC0txM58BjgBz9sYihOWquggB5SiYOaAcSqkst3g2R31OfWxnwCT
 tISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ppHjajXu00sfHG3gYewiMMYX9m68H41AIgp8I+UXRqY=;
 b=LqClT5K3JxHMWdWDlf/yPp1YF567EdjPEUn23gdAPzHc95Gc1XSiDTq3zGlFs13Q6I
 41d2unbsQrWy5Pqbmn5l7UQhO3JCDpjdY74UwNwt15m8qBQuYdisrYyKqHEVXuL8PQ6+
 R7iProj6hrZwsCFhiorC89JZvmkDL/0hLV1j3Gg5cZJ5ZpEtx+XoSCrrbZ9ZHOMALziX
 GgNNvUYDyKkn8Bl8FWSuxKVZcZzcp+3zIkJLA4RFC9AgBsj4nTZOzt5h/R+ZxoOmcZob
 Jg5qwmedC+jsX0brNN6NOnuDhXrp1T6Q8J1z2egxfjKpTIvvn5rqcw0dxj9/kCpp5cNB
 JEwQ==
X-Gm-Message-State: AFqh2komfzNLM5pyvFDcHz9G5fcY4SydqPhiOi++lfS87zamTD/BzGGQ
 9QrZqMI+J2Jeuj9CGeFzuZI32Q==
X-Google-Smtp-Source: AMrXdXs4D+lia01lWxYpxoqiFcHhQKZtcCTZ221KZh9cuBly4YiKqjSpq4+CbaUrUFzi9gJI4l5cIg==
X-Received: by 2002:a05:600c:3844:b0:3d3:4406:8a3a with SMTP id
 s4-20020a05600c384400b003d344068a3amr41590590wmr.30.1672845541824; 
 Wed, 04 Jan 2023 07:19:01 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 6-20020a05600c024600b003cfd0bd8c0asm44453781wmj.30.2023.01.04.07.19.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 07:19:01 -0800 (PST)
Message-ID: <90e7dc87-e2a1-90ae-1002-6f98abe2224e@linaro.org>
Date: Wed, 4 Jan 2023 16:18:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 3/6] hw/isa/piix: Wire up Xen PCI IRQ handling outside
 of PIIX3
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Chuck Zmudzinski <brchuckz@aol.com>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230104144437.27479-4-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230104144437.27479-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 4/1/23 15:44, Bernhard Beschow wrote:
> xen_intx_set_irq() doesn't depend on PIIX state. In order to resolve
> TYPE_PIIX3_XEN_DEVICE and in order to make Xen agnostic about the
> precise south bridge being used, set up Xen's PCI IRQ handling of PIIX3
> in the board.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/pc_piix.c | 12 ++++++++++++
>   hw/isa/piix.c     | 24 +-----------------------
>   2 files changed, 13 insertions(+), 23 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


