Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6A63F4D65
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 17:22:47 +0200 (CEST)
Received: from localhost ([::1]:52916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIBmf-00066n-SL
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 11:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIBlG-0004Wj-6L
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 11:21:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIBlC-0002ch-Jm
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 11:21:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629732073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cpJihCXUzgpi+3OL+/LebXO+XMRlBWHGbhTpOkTFKxg=;
 b=BNcBmOSjL4Ens10IpI74nMoEwpkKKZ1XALnC9QeDHwV7Phu0oly5jswCVUXVE/1DV0pHIA
 VDIWRDdsziWqDR/Kb/J3DPqoW4uwsK7Pt5RPESdyOWwTMB8TYuuY63XFSTJ8ZnHt+iUlt0
 agPWKkcIqaC+L5GRTaGUEzF9PqkAvpc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-qBJBP-mjP7yf8vMbJ9TbeQ-1; Mon, 23 Aug 2021 11:21:09 -0400
X-MC-Unique: qBJBP-mjP7yf8vMbJ9TbeQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 z186-20020a1c7ec30000b02902e6a27a9962so8616458wmc.3
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 08:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cpJihCXUzgpi+3OL+/LebXO+XMRlBWHGbhTpOkTFKxg=;
 b=s+5Q5nU7pNvo4TWYph20fZZF8OWBMF9oJdF3zXAvWyU74Yl8hUvD1xi6xRyV8i9DwV
 jTH6HFROtwmdxQ/Eo+c0C2YLyMyH86SA9TRREeXirTC+CX1ba2d7KAtkeEUDFA12AGX5
 gcId1m1hTB/XQEMr7lV2/1FzfHV8JVFEO7oqshFfh/nuHhN+UtnFAFp/mnOmVms72GPS
 zDns8tFBZHg85yh/XzubKdKXuriQ6vWif3kIzZKTuUGstJSLcgAz84OlntRrppUThq0A
 G/dtgnYZedr5wCR4bOHD4ME+w7f2VAvCCrHTt8OGusl7/b247HUHazeDP2xzvZWHuou+
 ccxQ==
X-Gm-Message-State: AOAM531yYfghLrH00zEycsinypsugtXHv9vZxcpho05S4CoZ+slv+cJD
 N7bqtUzpSFAyCxsU6OSzf1RnWjHmkP6K3Cckq/betBaFDorBxR6lqlQtSwZQahRkYzAZ3nyLZU0
 4tn3p7Rfhze3+gtI=
X-Received: by 2002:a7b:c04b:: with SMTP id u11mr16828910wmc.41.1629732068754; 
 Mon, 23 Aug 2021 08:21:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBwDeP4M+7EFA4baaz9ImETe8Ln71jNQE/wsj9Q80a1drPkKy5pEICXfi8ZQ2OnjEt2LoJaA==
X-Received: by 2002:a7b:c04b:: with SMTP id u11mr16828884wmc.41.1629732068569; 
 Mon, 23 Aug 2021 08:21:08 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id n15sm7575253wmq.7.2021.08.23.08.21.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 08:21:08 -0700 (PDT)
Subject: Re: [PATCH 0/3] gdbstub: add support for switchable endianness
To: Changbin Du <changbin.du@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210823142004.17935-1-changbin.du@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7523c6ad-52cd-0b20-b09d-01bd537edbb3@redhat.com>
Date: Mon, 23 Aug 2021 17:21:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823142004.17935-1-changbin.du@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.023, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 4:20 PM, Changbin Du wrote:
> To resolve the issue to debug switchable targets, this serias introduces
> basic infrastructure for gdbstub and enable support for ARM and RISC-V
> targets.
> 
> For example, now there is no problem to debug an big-enadian aarch64 target
> on x86 host.
> 
>   $ qemu-system-aarch64 -gdb tcp::1234,endianness=big ...

I don't understand why you need all that.
Maybe you aren't using gdb-multiarch?

You can install it or start it via QEMU Debian Docker image:

$ docker run -it --rm -v /tmp:/tmp -u $UID --network=host \
  registry.gitlab.com/qemu-project/qemu/qemu/debian10 \
  gdb-multiarch -q \
    --ex 'set architecture aarch64' \
    --ex 'set endian big'
The target architecture is assumed to be aarch64
The target is assumed to be big endian
(gdb) target remote 172.17.0.1:1234
(gdb)


