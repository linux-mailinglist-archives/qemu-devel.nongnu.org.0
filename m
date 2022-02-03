Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 500554A833A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 12:33:50 +0100 (CET)
Received: from localhost ([::1]:48212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFaN3-0007FT-2o
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 06:33:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1nFaLH-0005qa-Q1
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 06:31:59 -0500
Received: from [2a00:1450:4864:20::435] (port=42719
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1nFaLF-0007lq-6C
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 06:31:58 -0500
Received: by mail-wr1-x435.google.com with SMTP id a13so4397646wrh.9
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 03:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=tANGkzr4PwooRPxppQ9gCT4LumGon7ZLSxe0z1IwpgE=;
 b=eiE88RTQQBQOjFrPj91bktgBki972kbRKzLlARlGtFC0QAbWtpIUPhpGI9O1+ehvAK
 yXKuEZnU6O4nbB+yRhUllFCRX2TRYe77iLoZ6Cex9apO5pWhJdt0szpxOuiBZw+TiABy
 /kSKoZNyMKUxltJjLy5E27nPpBRRnBWDfNsXo37if5Z8tRd8j+PwopQbHMfBVfaK8BPa
 T7cpTlzv+pyY5TKI0jJD+mFbLDfw4CKo2VRPS68jZ5rA9igpzdu5RR2R4rs3r/9ex3Uw
 rMpaDbCnGPmzEwwBfj3hkWGTlBIGh4nfsbWha8Mj9KreFRt9RPwgsBJmo8eQ5fM2PLgO
 jhTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=tANGkzr4PwooRPxppQ9gCT4LumGon7ZLSxe0z1IwpgE=;
 b=bZwQy+ZVR4cnJdh9q83d9eH1pxazcTRdFu9H4CJNMrwmDBQZXVpAxGRGGjIUzYOXFC
 Li8RsOc8cCqSB9kxIUtKax+KapabEcpVuMmSMsiHz5vNarI4mycY95niW5BDANSmlOuq
 VFpTHedJ0JSOHRnaDFWrLK+kzGufOCLzkqbFkA+JXaF/WYhorj0gXeu444dOX/g0syGu
 Bw1z42XHcaua/iFHB9P/KjyhfWFL4RofE4wvu5d0Hz9S3yTMyKACK9y+v3MpOJYOUhZX
 on/iBytX2eI7r0HmhEg6VK4/q59eh2LnR7HZg5ZH638DFWCzuuvqzJQUXb8MbMIDpO2u
 kqNw==
X-Gm-Message-State: AOAM532BGmQ90S3nRpV+SaHlBdGE2UtFSjGhdDFpJlH1IxavLxGggTw2
 ww4SahzJhELTwIv0XP//ZXIBI//c4BWr+g==
X-Google-Smtp-Source: ABdhPJxNHPCJPcd32dd4pL2Mz8AzzXnkkyj9FyzOAIKZ+ZDYYA/B3Px8ifequ3M/G58p3Bwxh6AxzA==
X-Received: by 2002:a5d:550f:: with SMTP id b15mr18659988wrv.384.1643887905490; 
 Thu, 03 Feb 2022 03:31:45 -0800 (PST)
Received: from xps15-9570.lan ([85.210.223.90])
 by smtp.gmail.com with ESMTPSA id z6sm6848973wmf.37.2022.02.03.03.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 03:31:45 -0800 (PST)
Date: Thu, 3 Feb 2022 11:31:43 +0000
From: Peter Griffin <peter.griffin@linaro.org>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 4/8] vhost-user-video: add meson subdir build logic
Message-ID: <20220203113143.GC371411@xps15-9570.lan>
References: <20211209145601.331477-1-peter.griffin@linaro.org>
 <20211209145601.331477-5-peter.griffin@linaro.org>
 <87sftub6o7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87sftub6o7.fsf@linaro.org>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.griffin@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, stratos-dev@op-lists.linaro.org,
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

Thanks for reviewing.

On Tue, 11 Jan 2022, Alex Bennée wrote:

> 
> Peter Griffin <peter.griffin@linaro.org> writes:
> 
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  tools/meson.build | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/tools/meson.build b/tools/meson.build
> > index 3e5a0abfa2..3314b5efc5 100644
> > --- a/tools/meson.build
> > +++ b/tools/meson.build
> > @@ -24,3 +24,12 @@ endif
> >  if have_virtiofsd
> >    subdir('virtiofsd')
> >  endif
> > +
> > +have_virtiovideo = (have_system and
> > +    have_tools and
> > +    'CONFIG_LINUX' in config_host)
> 
> Following the convention of cece116c939d219070b250338439c2d16f94e3da
> 
>   have_virtiovideo = (targetos == 'linux' and
>       have_tools and
>       'CONFIG_VHOST_USER' in config_host)
>

Will fix in v2

regards,

Peter.

> > +
> > +if have_virtiovideo
> > +  subdir('vhost-user-video')
> > +endif
> > +
> 
> 
> -- 
> Alex Bennée

