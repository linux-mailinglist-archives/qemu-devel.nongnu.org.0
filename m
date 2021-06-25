Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 114373B3D4F
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 09:22:38 +0200 (CEST)
Received: from localhost ([::1]:53546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwgAe-0005yY-KT
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 03:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lwg9G-0004u4-Ci
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 03:21:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lwg9C-00053c-FT
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 03:21:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624605664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H7qLjYyy8ZtA81OMQ19XLrk8rJws49hEMWEOnXxpCq4=;
 b=TYmAxUwGpkmtLKJDqFW6Xg9KQ9nxDsDu1MGBdZpakocGXp9EOc5e/sowHPBgQIojBt8cII
 ETvjO8HmHiMdKaqvoXDxSFgB38VowYh15TJbjcXBa64mOpebvPj7Qda/pMstylZUAI7GM+
 kk4h7aGI4fWDLqh7j5aWmr7fpkhGzq4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-_rwqSFBOO0Oh0_l2X1iJKQ-1; Fri, 25 Jun 2021 03:21:01 -0400
X-MC-Unique: _rwqSFBOO0Oh0_l2X1iJKQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 s80-20020a1ca9530000b02901cff732fde5so2358849wme.6
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 00:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H7qLjYyy8ZtA81OMQ19XLrk8rJws49hEMWEOnXxpCq4=;
 b=fyBtaC0eQP/GBkcR3YJOf8/3fhKOn4BcihGCOwSE6hj786kqD4CWgYYA8TZjI3YClk
 9YYU2QnkjgOpQAII492ZDWtuVOA4lOyy+ahybtDFj60YoQTnXVqOqxCf/WXGxby9MBAF
 YJ0t82bT/RqVG4oJO0Ylvt1jxIrqKyU8FoR9ZWmk/sZKKV2+vT/rgZ9YD26ByH5ddhDl
 NZKmLtAB8IxtIFmSRxQuEGPcVNitoYUdQX5kRpeBcT7KOLUFiBPtgXT7rmLd6omLs3Gb
 H9guTgFpGqUehHzZtIS9vZjDr7PsPVPbjcRDtZE7XoRnE2KTP+Us0UURiduWRtQRwKFJ
 kvbQ==
X-Gm-Message-State: AOAM530hj/fjdOkoXTptoMl4O6RH+/jMxu4k7anOleTpPRQekFwvXfyC
 uZYYSoF9L+JnlNvyQSve139vMh0y6B06yTB/fNo8SrbWbxfUuqVpU+61HjgMPWb5rdygkRHSeZN
 w3yyi9wBcCoBW/ls=
X-Received: by 2002:a05:6000:2ce:: with SMTP id
 o14mr9392207wry.145.1624605660561; 
 Fri, 25 Jun 2021 00:21:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyszAzzn3g6qh39dVYxCmPaFyoESV4k7McsEKbrwjv47OmISUwqiiYSWxAiwMvxcfInZnv9jg==
X-Received: by 2002:a05:6000:2ce:: with SMTP id
 o14mr9392175wry.145.1624605660320; 
 Fri, 25 Jun 2021 00:21:00 -0700 (PDT)
Received: from thuth.remote.csb (pd9575d46.dip0.t-ipconnect.de. [217.87.93.70])
 by smtp.gmail.com with ESMTPSA id b71sm4973091wmb.2.2021.06.25.00.20.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 00:20:59 -0700 (PDT)
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <162459953801.387455.14911900669864582030.stgit@pasha-ThinkPad-X280>
 <162459954368.387455.15333719740993319179.stgit@pasha-ThinkPad-X280>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 1/6] tests/acceptance: add replay kernel test for s390
Message-ID: <5fff8b80-b761-b5c6-c79f-b606f2e1adac@redhat.com>
Date: Fri, 25 Jun 2021 09:20:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <162459954368.387455.15333719740993319179.stgit@pasha-ThinkPad-X280>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: philmd@redhat.com, qemu-s390x <qemu-s390x@nongnu.org>, wrampazz@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/06/2021 07.39, Pavel Dovgalyuk wrote:
> This patch adds record/replay test which boots Linux
> kernel on s390x platform. The test uses kernel binaries
> taken from boot_linux_console test.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> ---
>   tests/acceptance/replay_kernel.py |   16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
> index 71facdaa75..cdc22cb6d3 100644
> --- a/tests/acceptance/replay_kernel.py
> +++ b/tests/acceptance/replay_kernel.py
> @@ -208,6 +208,22 @@ def test_arm_cubieboard_initrd(self):
>                             '-initrd', initrd_path,
>                             '-no-reboot'))
>   
> +    def test_s390x_s390_ccw_virtio(self):
> +        """
> +        :avocado: tags=arch:s390x
> +        :avocado: tags=machine:s390-ccw-virtio
> +        """
> +        kernel_url = ('https://archives.fedoraproject.org/pub/archive'
> +                      '/fedora-secondary/releases/29/Everything/s390x/os/images'
> +                      '/kernel.img')
> +        kernel_hash = 'e8e8439103ef8053418ef062644ffd46a7919313'
> +        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
> +
> +        kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=sclp0'
> +        console_pattern = 'Kernel command line: %s' % kernel_command_line
> +        self.run_rr(kernel_path, kernel_command_line, console_pattern, shift=9,
> +            args=('-nodefaults', '-smp', '1'))

I guess you could drop the "-smp 1" since one CPU is the default anyway.

Anyway,
Acked-by: Thomas Huth <thuth@redhat.com>


