Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7850449E41E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 15:04:05 +0100 (CET)
Received: from localhost ([::1]:50064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD5Nc-000550-Bn
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 09:04:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nD5Ju-0002qk-0c
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:00:14 -0500
Received: from [2a00:1450:4864:20::536] (port=41878
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nD5Jn-0008PW-Hc
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:00:10 -0500
Received: by mail-ed1-x536.google.com with SMTP id j2so3761648edj.8
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 05:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=user-agent:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f+RQgh6yWhXqXuRDVbnkmEW/88v6eMr1cNb0lxpXrU4=;
 b=qPUXIBxLHzCjbMQLjtQ55/n805AN//1hySZhnUtAtofkcQTVD2NbJ3ju8nDHJSrPF3
 1PWx/Ei4fX5n2HXhodt46pSxEAxS96ViQ+sP7ieXCkpFvHjoJHkjNHmNLYw81mRIRJyi
 YHdqa88HKW2snibmnnETPBMZHsz9YWSOwcKh4axYN3+2WreBy7S32KzigiSIamWhSGyG
 Qhxt+XUk352J8KO25NYTYndrls7XnEVzirrnKPslxfqk4j/GhTboixV1ts5zM6k7cZZL
 kJBe+e21Dsbm81NylDgZokp3puxaAz3xlQ1fT+nSo5JZGlmgzxLJV0xx23cQA+DsHf8t
 05nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=f+RQgh6yWhXqXuRDVbnkmEW/88v6eMr1cNb0lxpXrU4=;
 b=D+hNacro8hHWiLg6t8unziri7dYqXWNuKT+HmEkCjC28o44fEmaDoOoFVwkRctOtIg
 I0/wmVCbboojLCVTlR+4r8NiXyhoA0dV+SJkDbpOKyubfzxBReggRAxhUPAc8MYTxxzN
 Nr4QboLqKwzWcjzHv3XPQ1sM7UmbEUiV7yn0U7FyV+BJdDfNTauuO/bamb61BThCiQcc
 /eevoet6pJhPGM84kH3NcwoLB2dqbJ7MPNWovKGGiDVjVOVwB4gmEC4N392tr9v4a6em
 KE2ieDk9kWW/weSiZFT1DOP/uALWnLTgdMm/+WPty7mJ0vb2d/9EQDQleVuNvi3wAJTs
 Vq6w==
X-Gm-Message-State: AOAM53183JMbvC5J0lWgvMlvVJerfpMEeIpwkqbdJa7CyLdHBrMgByIc
 YxhGmYvTgU0f6HzSqr/3JuTPEw==
X-Google-Smtp-Source: ABdhPJxRZRciMIQYLEPecLMfwLaWMWtr0Aib70k4+dcBaDbxnmfZgzQn25gRfesdttx/yxLkl7+oPQ==
X-Received: by 2002:a05:6402:424e:: with SMTP id
 g14mr3760428edb.281.1643291993425; 
 Thu, 27 Jan 2022 05:59:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w18sm8697761edr.59.2022.01.27.05.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 05:59:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D34B61FFB7;
 Thu, 27 Jan 2022 13:59:51 +0000 (GMT)
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Baumann
 <Andrew.Baumann@microsoft.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>
Subject: Any example command lines for the RaspberryPi Models
Date: Thu, 27 Jan 2022 13:55:34 +0000
Message-ID: <87ilu59t48.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Someone was asking on IRC earlier and I realised we don't give any
examples in the documentation of how to attach block devices. I found a
reference in an out-of-tree repo that mentioned -sd which seems right
but I assume you must be able to use -device sd-card as well?

Could we document some of the common boot examples in
docs/system/arm/raspi.rst please?

--=20
Alex Benn=C3=A9e

