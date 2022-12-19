Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A41D8650D16
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 15:14:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Gu5-0003tJ-1i; Mon, 19 Dec 2022 09:14:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7Gu2-0003s6-9O
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 09:14:02 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7Gtx-0005ny-UA
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 09:14:02 -0500
Received: by mail-wr1-x436.google.com with SMTP id y16so8782949wrm.2
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 06:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Nl4BGj1PyLBerZrWWS1NwXWllkrPCT7tq7b1VOTopDg=;
 b=Qoq1oc3WR/h+dr5nNxVF0P7U/ZkhFAEPkpf+fYnizATJ+5xL7j35kQRZlFPbDPYY6c
 xJ87qjQrF4tMPIewqjhAqQrO83nQpxuUaIk8jNhy/p3QqhwSRIlWhzki+GNhGPPoG5C0
 CNYt5ZkwEwcQIgYOHRqOtrZ+AXFqI9J/6J5r+RJ4DODPoxNNmlTVzRYWOtbR3RO7h6dH
 arAMC6XqWrhiNElK5I5Y8veR6sltuaZK3dnQXQHLIaG+vT7nPYnivs1S3YALat+eBHQf
 ZANg1H+/TYJ3rRMn24mhTyfWr76k9AvneEMnhGGVK7lIH9aqaGPda+t73IjSWL2d4qQa
 eNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nl4BGj1PyLBerZrWWS1NwXWllkrPCT7tq7b1VOTopDg=;
 b=SVAGnPhx5Vynpkclbyg+fX6n3me2fTCed/8AnvhPAQA4XBWPrYVhTu0mF8qHqJG3qp
 cIvPDBSnqyy7L9B/LOOr4Xf0XcY6M9gyLojHFdIuGApi360aqXCuhIr6qRCwIK8W/2qa
 csPxfl16SFu2rTCNulV6Z6nlInXr7hPgjoy37d7L8O7rJ3UjOpP+jFD6mk+6qNfmI7q/
 ET+dvJRe18hLBeJgi/HbkootyOgjFdlesXIwV1yRmaYWKsqFtlNmV04DGZrNHKXlrFYQ
 S6XjB0s/NQWV+LcFzVf0KmiwSGiW3akU5oXCJ3aiJyEqDQMZZootBJj5veaJ7L6YJlM3
 nm9w==
X-Gm-Message-State: ANoB5pnFb2u81DQMg2UKG/E0iCcJdQJvn+cUH8O1EHhV2IDhwqTShQO5
 IcBOqAvIDNH3sHGjJ1tJBgzTvg==
X-Google-Smtp-Source: AA0mqf5JZ3r27fj5zYU0NkvBmgVgehhQjiBRs8UlsMH+e7JchlrgCR43+KyfXv8Tqx1/1uR9NmQ+jw==
X-Received: by 2002:adf:e992:0:b0:242:4035:622 with SMTP id
 h18-20020adfe992000000b0024240350622mr28575482wrm.31.1671459234482; 
 Mon, 19 Dec 2022 06:13:54 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 u18-20020adfeb52000000b002423dc3b1a9sm10072017wrn.52.2022.12.19.06.13.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 06:13:54 -0800 (PST)
Message-ID: <542d86b6-3ca7-a1c4-51b1-af73d5434f57@linaro.org>
Date: Mon, 19 Dec 2022 15:13:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 4/6] util/error: add G_GNUC_PRINTF for various functions
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-ppc@nongnu.org,
 xen-devel@lists.xenproject.org, Laurent Vivier <lvivier@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, virtio-fs@redhat.com,
 Michael Roth <michael.roth@amd.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 David Gibson <david@gibson.dropbear.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>,
 Thomas Huth <thuth@redhat.com>
References: <20221219130205.687815-1-berrange@redhat.com>
 <20221219130205.687815-5-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221219130205.687815-5-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 19/12/22 14:02, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   util/error-report.c | 1 +
>   util/error.c        | 1 +
>   2 files changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



