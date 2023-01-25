Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D72967B31A
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 14:17:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKeau-0000wu-K9; Wed, 25 Jan 2023 07:09:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKeaj-0000ua-L2
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 07:09:25 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKeag-0006na-Jy
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 07:09:25 -0500
Received: by mail-wr1-x432.google.com with SMTP id h12so12834837wrv.10
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 04:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hk/B+EvgrF9XYUeiBLDR/SZx9E1u1rxi6H6kSXhhV/4=;
 b=vfKoJXnejLxR89wQ7h7eqpVlTOZD679NNruYKy6kf5OueGHkfHdBPK8qj+YZwlRaHc
 YTucBvL1vfW78ADH0muCHsO2cFuHHiyVYlMg8vaclD88tnYFHu0k6K7P2ZwZGeKtuCOH
 P6EPKsF2k9cFp1zAV3GlnkK86IZU9r4cn81HWsu9br9rVW2KbIZkkVIv342CeYM8KFXe
 o8WlmaRg8ULmBjQPfsDJ1NgZREcc3eXF7gMnhsQHTkAQDn6Jq++jqPch2/Kk+nqIs8lX
 TP8lk8SPk2Jw7R4ZSsoDXoiioSdHwkzERueS6jVvbgISWXWscO0FBUnxDPOF1gSlauzW
 K/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hk/B+EvgrF9XYUeiBLDR/SZx9E1u1rxi6H6kSXhhV/4=;
 b=XQMqpBDgUUBIKdhLpL5O4SK+e95vFK/NJwKBodQNsjm9VF2sWrPX2PxU9RUVlSf0vR
 8GeUC0BLaZ/oAlBkeR6w19wCzi5mDfhGJw+W0a2IhhR3r0F6QzWlWmMih/akoG23yEeX
 yLDuIqc+epKdc5mpVH9i9oCvvq8FobCIL9lGymePooqGunwkWQgXQMdvjj9kDJCdSYZr
 jQYNhGkKXbmP4Zc3eAbZxCTz7eX6zV3n+7Lv3LtpbIS98T3sUb6hVG051nH/EjSkXE9o
 TAGLa6UCr98MWL079oUYGbbpiCwlljWomqstJm7PcXtky3lCKt3XeI2eX3ksjGfMmIVS
 H1ig==
X-Gm-Message-State: AFqh2kpcJF3IL5Mbm/VRGxUvahEThbw8TQj6R7gG/S/4KfNwcEjuKI/A
 U8EOYTMrB+PKkvZH2tJcT0zYHw==
X-Google-Smtp-Source: AMrXdXvGYRUdt8zmlHxhiDPdxv8Tk/P8ipr7pfVrtzVeAcXmQiduxGBm2JL7fzKnFpfBcuJVlrrPzA==
X-Received: by 2002:a5d:6e08:0:b0:2be:493d:1384 with SMTP id
 h8-20020a5d6e08000000b002be493d1384mr17804676wrz.22.1674648560082; 
 Wed, 25 Jan 2023 04:09:20 -0800 (PST)
Received: from [192.168.0.114] ([196.77.22.181])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a5d4b01000000b002be53aa2260sm4764188wrq.117.2023.01.25.04.09.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 04:09:19 -0800 (PST)
Message-ID: <247ce351-61d9-31b3-2ef6-81b72008d73f@linaro.org>
Date: Wed, 25 Jan 2023 13:09:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 02/35] gitlab: add FF_SCRIPT_SECTIONS for timings
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 qemu-arm@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Li-Wen Hsu
 <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
 <20230124180127.1881110-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230124180127.1881110-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 24/1/23 19:00, Alex Bennée wrote:
> From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>   .gitlab-ci.d/base.yml | 5 +++++
>   1 file changed, 5 insertions(+)

Nice!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


