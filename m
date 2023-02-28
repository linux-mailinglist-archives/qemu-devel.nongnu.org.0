Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 273B56A5871
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 12:39:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWyK5-0007A6-84; Tue, 28 Feb 2023 06:39:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWyK3-00079R-Dg
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:39:07 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWyK1-0005hY-0t
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:39:07 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso4637518wmq.1
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 03:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g38SaBYL8DRx2FSkktTdAE/jD1zykcejSRVyVTpAMQo=;
 b=H/c5yKnTAe3WrJAZGeBk8gKBIxgmMUfxF2fJBcM2v5ZoUyMr4nuK662KETjG5zNdYY
 WrB8invLlKyC9lazmdkQscICdBgjJaaziCFqcXsGog8ARTkmnt4UGZLI7LwAYn1qUd2J
 Sh4ZPMhHM3yOFlVVEtAlYHukECzwy1++5/kK9UzONCHWWuyQyv1jyFmHGBUVOd1xW6/1
 qtXNIADax2UKQdvdbzmcra01WWmATB0vcH+yyFno3gS7jjyq80iA4n/HEZfar+ijvVyd
 ngNgYe5+wxajqkYtITYTG4Wm1eBSCPCTNdPLJPPTTJ9aRN++9O3bwrP6P8QGnbeHu17M
 RqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g38SaBYL8DRx2FSkktTdAE/jD1zykcejSRVyVTpAMQo=;
 b=HJqMvpmR20GRtWiZbYEzdSvXkA48rhyOWxsoq0vWm0HVQiZvjrDiC5PWB7UtxAzx5s
 gGlA1hTSTRYuKYOjhaeRWxFfhazeHaDSQ32YFYMkVhsJgC37qJgm8rmBp0StDaohMHkz
 TTrNG9y5sQj324TkISLjSG5o40hxV97o1EPAUqrhIYM1AoRanPswCypUk7sOmlOkfNMa
 xTc5bj/5zMiVi1PPzbmh5Ic/JKVo7RMQGpDvkqUStSCbTyN0Pk2YQBQu0s/j5B3zUTFH
 1C4wdtF7TMA9F2lp42IPHMQ95MZXDUH8CAGGOJwCOaPpls5BHN+Cr0V6kwXz3bLaW/VK
 oiRw==
X-Gm-Message-State: AO0yUKXU3fLiwQRv+NqUqXCYj95/gbV5ZkSpba65rvpbc+HdSAf34Jbo
 wdYfLTXgDOhgosF7bLqMe+MLOA==
X-Google-Smtp-Source: AK7set+Xo1TX3HB9ryPac3cQFOKMEB2p59juW/GbkFfR2j1qUzkV6JmktjAsL8EP8qQGmf76hvsU1A==
X-Received: by 2002:a05:600c:2ed3:b0:3eb:2de9:d01 with SMTP id
 q19-20020a05600c2ed300b003eb2de90d01mr1888791wmn.18.1677584343342; 
 Tue, 28 Feb 2023 03:39:03 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 a2-20020a05600c348200b003e8f0334db8sm16070937wmq.5.2023.02.28.03.39.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 03:39:02 -0800 (PST)
Message-ID: <ef18fb1c-cb49-d367-d9b2-f729667faacb@linaro.org>
Date: Tue, 28 Feb 2023 12:38:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 2/7] tests/dockerfiles: unify debian-toolchain references
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Li-Wen Hsu <lwhsu@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Ed Maste <emaste@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Hanna Reitz <hreitz@redhat.com>, Bandan Das <bsd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
 <20230224180857.1050220-3-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230224180857.1050220-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 24/2/23 19:08, Alex Bennée wrote:
> We use the debian release number elsewhere so fix it for consistency
> along with the broken comment.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/docker/dockerfiles/debian-toolchain.docker | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


