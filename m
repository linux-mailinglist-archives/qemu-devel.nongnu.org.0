Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC45231B734
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 11:35:02 +0100 (CET)
Received: from localhost ([::1]:60762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBbDZ-00062x-Bd
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 05:35:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBbAt-0004HP-84
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:32:15 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBbAq-0001dv-De
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:32:14 -0500
Received: by mail-wr1-x430.google.com with SMTP id v1so8242912wrd.6
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 02:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=SOD3NreGo1V885+N/yx+58IbyIp4/uSuO02wnwe4frc=;
 b=rIMiN84tefJhmsH6gZzbQyMYsAOJ7CcxZwmP+u6YBIr3CtHLWhA1X764Bb4uvpX3Vi
 syo6jcG5J0c2mjAoJh4WQeZDRMz9WOSMDwy6PK7nUgVpfD5pA04mk042eerJngJyo4YY
 KpriCDhHMfTLMjRJ3+zGO8Ha2npf44rYzQI+4sOVuRWKWr42+hL+Lxpovkl3hzyV0XnB
 JBDPI3jl1++8sc2/zQ+qn32Uok54Bq7y0x0JOqzLxduxm5S/m+mFIxE0YLwDJzFt2DzT
 gxoDSFW8bo4vgfp+34gl2ypSGPX6jBT+gLlXA2ca+lmyMPIbgWvS7aetWLFE+Bs80ytD
 CSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=SOD3NreGo1V885+N/yx+58IbyIp4/uSuO02wnwe4frc=;
 b=J1gT+mxIJie1inTHWAasSmbR0r1MC7mLr9WroC9A5SNqZNXEa+LMCCW8j462BIF8bA
 syM3tgRufHfCd4O/4O/NTf3LbH6drb5Fa5zURPcvIg4pFOonmI+2HJf/LtDFiZlIclfd
 p/yfGj4kgqrW2HZM4C5nSwdeLeJGXeXLfYKLEsNEkP8PGT16FVJt+4qAiNIX7m2PffzB
 aKC06vZhWvgTSLljONsvAKJiOy1B0RQYvoWNDALNZuQL1Jko4Rmw2GBM4FKaEIDjGEO3
 cR9hBTNni91/MOeccg1b2h7T5uwOQGdfq65FgUs+vmRYDVZKdXboqH2+0xlpq9Csfs77
 Ds6Q==
X-Gm-Message-State: AOAM533jMvGE6Dqe2QlGyaNCDQgrvVXVGXvHjjhWxNcm/kCp7ut2POM+
 iDIrLv3AvZmI6Fyn1DkPXEmcjg==
X-Google-Smtp-Source: ABdhPJzggCBDemU8V1Zvk94f6Y1S+F95hJRKupSrh+YnsEpWTj5U+BAQVZSQ4RimGiLB9viVl2xElg==
X-Received: by 2002:a5d:4a0b:: with SMTP id m11mr18525007wrq.51.1613385130865; 
 Mon, 15 Feb 2021 02:32:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w8sm23060966wrm.21.2021.02.15.02.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 02:32:09 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 26E8B1FF7E;
 Mon, 15 Feb 2021 10:32:09 +0000 (GMT)
References: <20210212123622.15834-1-cfontana@suse.de>
 <20210212123622.15834-13-cfontana@suse.de>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v18 12/15] i386: separate fpu_helper into user and softmmu
 parts
Date: Mon, 15 Feb 2021 10:32:04 +0000
In-reply-to: <20210212123622.15834-13-cfontana@suse.de>
Message-ID: <87lfbpvcye.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> Signed-off-by: Claudio Fontana <cfontana@suse.de>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

