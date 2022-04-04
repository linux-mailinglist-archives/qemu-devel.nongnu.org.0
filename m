Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BD44F13AB
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 13:18:11 +0200 (CEST)
Received: from localhost ([::1]:33410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbKio-0000C3-Ki
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 07:18:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1nbKhS-0007VU-E0; Mon, 04 Apr 2022 07:16:47 -0400
Received: from [2a00:1450:4864:20::230] (port=45662
 helo=mail-lj1-x230.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1nbKhQ-0002Oh-Ky; Mon, 04 Apr 2022 07:16:46 -0400
Received: by mail-lj1-x230.google.com with SMTP id q14so12345683ljc.12;
 Mon, 04 Apr 2022 04:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RK3ABgNE5HdMg3koC1WYwvf7uDxWoLwz5783qYWhce0=;
 b=MLv1QFEbtjFefbmBkG30vHItVOfdN+BU21oNVGu8ClleyZnVqUe/bIB/YJYtHdJnmL
 ol53dotRLIDg0ulJ88Jpq3WAMhWxuewQkWVuz2hZ/hO6cr+yHcLFqP0Bmy6vSv/S9Oya
 /U9+PN4bn3bk78Hf9kBeO6ai9SWGDvXNZS6tgJLmNwqcK7pKRQ54wmZAT2H0cmawSCQL
 ZuJu7Kk9c34j3U+/fcwOT5cu8r9/EJpne8wrIO55h68KTXx96ozTLElsDxLL8qj9hJuA
 XuQgYV1kINBksBH/xYxi8NJEYNL8MXIO4EPEEQZ/6kpSJVmVpi18Q5gkd78jP/aCqjDR
 GYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RK3ABgNE5HdMg3koC1WYwvf7uDxWoLwz5783qYWhce0=;
 b=i7FeS3VdB2DnuSNWw81JgNCTR0Li7uv4x7W/DryuK3TdzxtNKXXtKJ5Kz8MaSppXOb
 7iKPZ3jsrepPcdDvtpeQaxxJsNnULQ7DuP7lp1xlQZpkivhZVhHs9vbqeGUkal4HQ2+X
 bV8ZLhoIzuHC8O9fALKKqIn2KZtDmltN8QBZFVtfjEeuVpK5hM3d0kUp7tQs/yDLVbjq
 ORezj51/i5YxbzRTH8lAu6aazoEYGZuwzesu74hV5iE7tpld8dxLFNCd1IA2ntr9kzbF
 Av1hFZF/2iuBNJFgsnWnOzWX1xlJ7yarfHBLDGzFR576NsVlafPJcmGqFSdujZAHEjft
 meKg==
X-Gm-Message-State: AOAM530rrVWBFhB6GRbMfNE/GZYmA8MkvhvU1opjhi5j3vvYUq/G6zfk
 PQUclPTfC2VLeTkzewXWj2w=
X-Google-Smtp-Source: ABdhPJwMiI7592RgPOm9/zPfivfdG9QmoP04qa/UMCOfD+fPDsGWQ0ZrRlCVf+21bc+6FQ9UkHhiRg==
X-Received: by 2002:a2e:875a:0:b0:249:829a:d5f7 with SMTP id
 q26-20020a2e875a000000b00249829ad5f7mr20824249ljj.173.1649071001955; 
 Mon, 04 Apr 2022 04:16:41 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 x16-20020a19e010000000b0044ac4a38ef1sm1103935lfg.4.2022.04.04.04.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 04:16:41 -0700 (PDT)
Date: Mon, 4 Apr 2022 13:16:39 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Pavel Pisa <pisa@cmp.felk.cvut.cz>
Subject: Re: [PATCH] docs/system/devices/can.rst: correct links to CTU CAN FD
 IP core documentation.
Message-ID: <20220404111637.GB2422@fralle-msi>
References: <20220402204523.32643-1-pisa@cmp.felk.cvut.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220402204523.32643-1-pisa@cmp.felk.cvut.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::230
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x230.google.com
X-Spam_score_int: -1006
X-Spam_score: -100.7
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-100.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On [2022 Apr 02] Sat 22:45:23, Pavel Pisa wrote:
> Signed-off-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  docs/system/devices/can.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/system/devices/can.rst b/docs/system/devices/can.rst
> index 16d72c3ac3..fe37af8223 100644
> --- a/docs/system/devices/can.rst
> +++ b/docs/system/devices/can.rst
> @@ -182,7 +182,7 @@ Links to other resources
>   (5) `GNU/Linux, CAN and CANopen in Real-time Control Applications Slides from LinuxDays 2017 (include updated RTLWS 2015 content) <https://www.linuxdays.cz/2017/video/Pavel_Pisa-CAN_canopen.pdf>`_
>   (6) `Linux SocketCAN utilities <https://github.com/linux-can/can-utils>`_
>   (7) `CTU CAN FD project including core VHDL design, Linux driver, test utilities etc. <https://gitlab.fel.cvut.cz/canbus/ctucanfd_ip_core>`_
> - (8) `CTU CAN FD Core Datasheet Documentation <http://canbus.pages.fel.cvut.cz/ctucanfd_ip_core/Progdokum.pdf>`_
> - (9) `CTU CAN FD Core System Architecture Documentation <http://canbus.pages.fel.cvut.cz/ctucanfd_ip_core/ctu_can_fd_architecture.pdf>`_
> - (10) `CTU CAN FD Driver Documentation <http://canbus.pages.fel.cvut.cz/ctucanfd_ip_core/driver_doc/ctucanfd-driver.html>`_
> + (8) `CTU CAN FD Core Datasheet Documentation <http://canbus.pages.fel.cvut.cz/ctucanfd_ip_core/doc/Datasheet.pdf>`_
> + (9) `CTU CAN FD Core System Architecture Documentation <http://canbus.pages.fel.cvut.cz/ctucanfd_ip_core/doc/System_Architecture.pdf>`_
> + (10) `CTU CAN FD Driver Documentation <https://canbus.pages.fel.cvut.cz/ctucanfd_ip_core/doc/linux_driver/build/ctucanfd-driver.html>`_
>   (11) `Integration with PCIe interfacing for Intel/Altera Cyclone IV based board <https://gitlab.fel.cvut.cz/canbus/pcie-ctu_can_fd>`_
> -- 
> 2.20.1
> 
> 
> 

