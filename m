Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E4B562D78
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 10:11:12 +0200 (CEST)
Received: from localhost ([::1]:54958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7Bk6-0000Da-M1
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 04:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o7Beq-0006Rl-R8
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 04:05:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o7Bek-0000ay-Bu
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 04:05:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656662737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=URpo55T5xjVZ6B4vc+kisCsL0gcOVnJ6x/Lmfoa10iE=;
 b=iBLV1ZLvv7pu0zcbPDerebu67ExQoP0y2XQxHyZenNzp7dOGOaBVFwmq3z18M3mkaFW+Pt
 +IEODzRT+LMClKBGLmVjQ0xbKdzcV8G0cauvY9aZqe2GnKRuAtLiZwrpi0Snslj9tAyeAk
 WIyeKnUbeLsxSbOr1yv1sNBgUd8su7s=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-EUR2vGZXOc2xr0Zo4hvh0w-1; Fri, 01 Jul 2022 04:05:36 -0400
X-MC-Unique: EUR2vGZXOc2xr0Zo4hvh0w-1
Received: by mail-ed1-f71.google.com with SMTP id
 x21-20020a05640226d500b00435bd7f9367so1260228edd.8
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 01:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=URpo55T5xjVZ6B4vc+kisCsL0gcOVnJ6x/Lmfoa10iE=;
 b=JwAjrC7PYL7+2y1e4xvKUfab3NAKhD2LNC6VvZk4Q138zTq3QYv0kOQjt73tLQHG4b
 f3fOsMLinomTT6nvovF8sFh8OwzQK8QTXp1UvFTCxADYznxRCMdE5S0xoAiCJH+rHIBt
 xCMrXHGUnrBlpMQE93St9jZZsZbmk0T1wKxJT1Rf/q+5xH6vZnF9uv9XApFk/aYbsrtQ
 mMYet9IpnkkensV4pYXJeL6Sw/mGh7p4QpC0RCeYyRdoqFuTPUOCOj4vUmrw4CSAQtCX
 hxviU6WNVsaYNSHdjM2CM5QVZuLWLCIqW5OOMTEQQ06T8bHs4eKwSF+XzYhfu8hhXVhZ
 KD6Q==
X-Gm-Message-State: AJIora/IPXf/0vOyp8q0qpfM+gH6YehE3dCVyHGAstDx4FwqBazZcoEH
 TgmWcAIJq+AKoDq0TkLD9pEgcoghejPbMhmrJbHELQKeE5l0jrorgab9U9Qao+CC6DQxkxqHoMx
 8Lh2ENdBE3kKL/wc=
X-Received: by 2002:a17:906:974c:b0:722:eaa7:5e5d with SMTP id
 o12-20020a170906974c00b00722eaa75e5dmr12763959ejy.541.1656662735429; 
 Fri, 01 Jul 2022 01:05:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u05MM7nUX3QCsuDms/6Hqw07KXSoHwB//tbLc2bbhhHMGGlhpk+nUw2iHyTz1nIn2aqvGWMg==
X-Received: by 2002:a17:906:974c:b0:722:eaa7:5e5d with SMTP id
 o12-20020a170906974c00b00722eaa75e5dmr12763942ejy.541.1656662735172; 
 Fri, 01 Jul 2022 01:05:35 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a056402055900b00435681476c7sm14707603edx.10.2022.07.01.01.05.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jul 2022 01:05:34 -0700 (PDT)
Message-ID: <b3e95451-77e3-7e4d-bb2c-664bdbaae9c9@redhat.com>
Date: Fri, 1 Jul 2022 10:05:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 02/10] tests/qemu-iotests: skip 108 when FUSE is not
 loaded
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220616142659.3184115-1-jsnow@redhat.com>
 <20220616142659.3184115-3-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220616142659.3184115-3-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.06.22 16:26, John Snow wrote:
> In certain container environments we may not have FUSE at all, so skip
> the test in this circumstance too.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/108 | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


