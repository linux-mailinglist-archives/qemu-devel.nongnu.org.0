Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD85666FF1
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 11:43:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFuwj-0000rP-9s; Thu, 12 Jan 2023 05:36:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFuwX-0000mx-TT
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:36:22 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFuwV-0002o0-Us
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:36:21 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 g19-20020a05600c4ed300b003d9eb1dbc0aso11679832wmq.3
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 02:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AwqfNoqa7cHGwIgRP5uEMR2GvceME5K5Y6aZiLAo1as=;
 b=q+W3j9cSkHv+P/gJCVl8N3Fc08Wg90WYGwDkrpdw6eqQLFDPG6s1gdk/vmSa7PmJte
 M0BAgMDzNbf1dC7B74IKm0aBjedNt6V6bKEH3XOaUPsXyS/mQxgCyIq2Jr12MNW6vw1E
 zmbe6zpguxMUJNvMalegVAPbBKsnKss54lyI5t5zc+WIEImZQ0FbYmrFME+/imln18MP
 645Q9X6uoQ5DxYlEKoSpKaUKUNluG6XuAgPlAYe1Uv70gDRJqBUok0xAKaQbu01CE4vf
 /uNwTKT0WXNRYs39cYbRhTOpJr/gtL/Sas7Ft6W++eatzIeMKIAvHq4RSayw1fyqGJQ9
 zc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AwqfNoqa7cHGwIgRP5uEMR2GvceME5K5Y6aZiLAo1as=;
 b=ApMlvLPcBv+ddikXsMRjEG69boyddIkzAp/PKFNe3vqF8wvSggLJacEQBJ+N6HSKPv
 A6tNXPFXa4Rjgw2Fe9Vac/qCnnGAZFnQS/+ma8fRZNFt9TF/LpbBbTho7wXHE5JGAnc+
 jtl/S5p8RUASxnywyMIfx8QD/jUADOsz4doVypXsehhXNusPe5MsBFese6NDAw5ffCbB
 w9QsjuGuxT4gmt7ZRS6+ysfwE4yR81Hx2NJgncfv+azhbPYF4h/3zCsiYXCrWNCUPCv4
 Ga3abNuTNjBl6Xs3+0wracvfESvcF6rS83GHO7CqsWTdI5GvppHT+FBAH4+iAm+QU9xl
 FL+g==
X-Gm-Message-State: AFqh2kqHAUkV28i680NuJeicWXr049jzZDc5XucrPQWJ+y6KoUN9cKhp
 ReKdKES1G3qFs3TMkGn64DjF2A==
X-Google-Smtp-Source: AMrXdXvA/nCAPpn0KOcjwVUhVUJ5l8Sdur4HyKngLENqMv7Q1BCj3mbc+eTNa6scEwuZ5EBOVr6Klg==
X-Received: by 2002:a05:600c:3b29:b0:3cf:d18e:528b with SMTP id
 m41-20020a05600c3b2900b003cfd18e528bmr55907456wms.39.1673519778143; 
 Thu, 12 Jan 2023 02:36:18 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g14-20020a05600c4ece00b003d9ea176d54sm22053554wmq.27.2023.01.12.02.36.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 02:36:17 -0800 (PST)
Message-ID: <0610e1a2-50e7-ea30-8ce3-92f8c83d3043@linaro.org>
Date: Thu, 12 Jan 2023 11:36:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 00/31] Introduce igb
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
References: <20230112095743.20123-1-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230112095743.20123-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 12/1/23 10:57, Akihiko Odaki wrote:
> igb is a family of Intel's gigabit ethernet controllers. This series implements
> 82576 emulation in particular. You can see the last patch for the documentation.
> 
> Note that there is another effort to bring 82576 emulation. This series was
> developed independently by Sriram Yagnaraman.
> https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg04670.html
> 
> Patch 1 - 16 are general improvements for e1000 and e1000e.
> Patch 17 - 18 are general improvements for e1000e test code.
> Patch 19 - 21 makes necessary modifications to existing files.
> Patch 22 starts off implementing igb emulation by copying e1000e code.
> Patch 23 renames things so that it won't collide with e1000e.

> Patch 24 makes building igb possible.
> Patch 25 actually transforms e1000e emulation code into igb emulation.
> Patch 26 - 27 makes modifications necessary for tests to existing files.
> Patch 28 copies e1000e test code.
> Patch 29 transforms e1000e test code into igb test code.
> Patch 30 adds ethtool test automation.
> Patch 31 adds the documentation.
> 
> The main reason why this series is so huge is that the early part of this series
> includes general improvements for e1000e. They are placed before copying e1000e
> code so we won't need to duplicate those changes for both of e1000e and igb code
> later. As their utility do not depend on the igb implementation, they can be
> merged earlier if necessary.

You could post patches 1-23 as "e1000x cleanups (preliminary for IGB)"
then post the rest, using the 'Based-on:' tag referring to the first
series cover letter.

I remember looking at the various e1000x cleanups independently, all
packed in the same series makes review context-switching cheaper for
me, so thanks.


Not really related to IGB but since you touched MDIO/MII/PHY files,
it would be great if we unify the MDIO as a qbus and the various PHYs
as qdevs, so boards could use any/multiple PHYs. We had 2 or 3 attempts
to do that in the past but none got merged.

