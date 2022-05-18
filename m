Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B48F052C3E8
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 22:04:47 +0200 (CEST)
Received: from localhost ([::1]:49684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrPuY-0002k1-S1
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 16:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nrPt8-0001oa-2O
 for qemu-devel@nongnu.org; Wed, 18 May 2022 16:03:21 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:52845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nrPt6-0004Rs-Br
 for qemu-devel@nongnu.org; Wed, 18 May 2022 16:03:17 -0400
Received: by mail-pj1-x1031.google.com with SMTP id l14so3096908pjk.2
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 13:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=lz+nfgfss2PcFs+FEv/9w7J4NisMN3BjpXcB/+mx3VM=;
 b=OwB1KsRfkCANx+PoghbYAFQ7vcobPviZhwLCyX1U6X21OA0SvGAnVXgQCEMDxsktjh
 EECNKO3+nUERhb8VM3unPlsM/TANa0nNvVGG4sDEvIh9E6ma+hlB4rJUPYqlh71XJm6v
 TdkM6mSalgwjVvTAQpwML6QpcReZ0HUSh+oj9FmF8chUYNiz2wR0sgO/nte3anNFrdxE
 ZDLXEObvShGtTw5Z6hBnQQ/bjAr4DJ+8dF+eA/rp9vH0DPEMHHL0OX4gByWJGd4WpvAJ
 van8mr/TT6CnczMYSLgAPw8/IGxCJBXWzeIo9czYsKG9kW+JUeJDwphX/wsWj1BSXLh+
 V+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lz+nfgfss2PcFs+FEv/9w7J4NisMN3BjpXcB/+mx3VM=;
 b=3Y/CYztlV962y0ozSn4JldRtaog6GlZby2Jgma+CPzWU94Je/Am8gW63GvziKmMCAO
 H6DwSETIiKAYPCVQwneX8a9tlGcxQkWvIEsMRz9IeSj1OyUS0n7/LwGGZPSMULnUJo5d
 c3oxerwMvTyD2nqsU0e2ypd6s5l3qpe5mDEKJu1iMm2qqcpnBU+F54R2PZHrreQECqfj
 ezug41lbW3X8psABi4TIfIbgS0Sg9cFFrBZbCVXBafh+EwdDHScP/xVgonnWyUW2Gp4m
 baZbzuJoUpjEr3MXuMx96ahuyOHqI75ck31gC44zsYWa+FqdVMMqXMC5i81j1MT3cH8+
 Fkzg==
X-Gm-Message-State: AOAM532nEZ55s5Nvt93Z6WBoYHonMFGNCqG4C+aXS7fO5lmaXA93txjo
 CXjX/QQZzfdPgWKyOXw4Em+/iQ==
X-Google-Smtp-Source: ABdhPJz8nGGPOwugcAp7mqo3CljiP2zNN80a8JGdEtJ/iGea70SS3JspwcvXDoNWgy5MJRG2qyqZHw==
X-Received: by 2002:a17:902:e54b:b0:15e:9c09:7142 with SMTP id
 n11-20020a170902e54b00b0015e9c097142mr1236401plf.159.1652904194958; 
 Wed, 18 May 2022 13:03:14 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a17090341ca00b001617aef3e08sm2079188ple.51.2022.05.18.13.03.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 13:03:14 -0700 (PDT)
Message-ID: <d1f9cdf0-fb8c-9533-04b9-51a19267a6e4@linaro.org>
Date: Wed, 18 May 2022 13:03:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 0/7] Artist cursor fix final patches
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20220518161758.49036-1-deller@gmx.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220518161758.49036-1-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/18/22 09:17, Helge Deller wrote:
> The following changes since commit 178bacb66d98d9ee7a702b9f2a4dfcd88b72a9ab:
> 
>    Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2022-05-09 11:07:04 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/hdeller/qemu-hppa.git tags/artist-cursor-fix-final-pull-request
> 
> for you to fetch changes up to 9ef2c6b4ab9a430ee230ee305b6994d7eae86fe7:
> 
>    artist: Fix X cursor position calculation in X11 (2022-05-16 16:46:25 +0200)
> 
> ----------------------------------------------------------------
> hppa: Artist graphics driver fixes for HP-UX and keyboard fix in firmware boot console
> 
> This series updates the SeaBIOS-hppa firmware to version 5, in which additional
> HP fonts were added to the firmware and the firmware boot console was fixed to
> accept input from the emulated PS/2 keyboard when running in graphical mode
> (serial console was working before already). To test use the "-boot menu=on"
> qemu option.
> 
> The artist graphics card driver got various fixes when running the X11-Windows
> on HP-UX:
> - fixes the horizontal and vertical postioning of the X11 cursor with HP-UX
> - allows X11 to blank the screen (e.g. screensaver)
> - allows the X11 driver to turn the X11 cursor on/off

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


