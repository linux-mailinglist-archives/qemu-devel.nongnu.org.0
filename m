Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD4B391733
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 14:16:21 +0200 (CEST)
Received: from localhost ([::1]:48372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llsSR-0007WJ-UP
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 08:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llsPt-0006A4-3n
 for qemu-devel@nongnu.org; Wed, 26 May 2021 08:13:41 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llsPr-0000E8-09
 for qemu-devel@nongnu.org; Wed, 26 May 2021 08:13:40 -0400
Received: by mail-wr1-x42c.google.com with SMTP id n4so903995wrw.3
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 05:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ZgDBbgrvPPhwrfvdP8j85trEC+qISOa8BYWS1G1r8mo=;
 b=iv7/oh5ni+2Jq5fEzKxix0t8MuW4kRtoZdVXTuEtEhhhAWvV8c4iyONGprmnoZovU9
 /5pmANDNHEbaoGksL1gG9l9EGlG3WDY9rGDe4TVoseJbzIp3TX19//nsr2WRXjEwxxPe
 M4iMRtPxNQXldtMzQ/inIbErUtgej2FoJyGzLDQ1ZLm7vsoyuB7OUAUKWvMC/qAZhytg
 H6LmnNnhjdyISu+/rKuxe9fIMUAj9S74u++iELf/z2Bsd2h0e5OBd4dwjcThXQ7Ikjr1
 stEuWQt6MtgU9Ofdeqp+/1s+Jf0ejt19WlnKL2JuBFJXdvivJ2KP3uE6atUbpwvuAhmV
 7n1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ZgDBbgrvPPhwrfvdP8j85trEC+qISOa8BYWS1G1r8mo=;
 b=Cv8VJRgpfHnDwwYd3YE5/LhbtGhS1eidFZ535JLYTADzhLkVtQVp4rnf/bprr67lmb
 RGEvsYkG6BHsZ29y6swjohjJNni1rrrD9iKe+DzMJAt7LOu1WobxdHiWdCE5tPnCdhCh
 ByAovX9qzJbV3sBqfkCSxtN86TkiaBzubMtw/ViNlvTije1UqycMw9c/fq+kRdzxzY9a
 AMYLO7J66zUAxxofHFtc2GcedzCPNYqO9HBBeItV2HKGm0anyQK3I5Ab0WOcL62wJkzv
 LMzvRNY4zvHjXGRE7RtZTyjrjtIwR4U7A4nP1t7DGg3An7+fythJtLrZLsYHzvQIxq5Y
 WZ6g==
X-Gm-Message-State: AOAM533qtjpLErOIMgk9AiH82bBv/g6Zo0jslbCMVBfgBVXKEFz5GNRX
 FmhaT0TnRjm96BXQog0RTCAwMg==
X-Google-Smtp-Source: ABdhPJysJNG4IG1agHiXnTmGUDRoI4cZpWHjoGe5hu0zqaFeduDHzv9ea6qmVD+L1z6cbP+Wzq3/NQ==
X-Received: by 2002:a5d:668f:: with SMTP id l15mr1824102wru.349.1622031215747; 
 Wed, 26 May 2021 05:13:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w25sm14603869wmk.25.2021.05.26.05.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 05:13:32 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BFC201FF7E;
 Wed, 26 May 2021 13:13:31 +0100 (BST)
References: <79262dbe1f7888eb02e1911501eebafa6f2f6400.1616583806.git.viresh.kumar@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] gitignore: Update with some filetypes
Date: Wed, 26 May 2021 13:13:26 +0100
In-reply-to: <79262dbe1f7888eb02e1911501eebafa6f2f6400.1616583806.git.viresh.kumar@linaro.org>
Message-ID: <877djl3d78.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Viresh Kumar <viresh.kumar@linaro.org> writes:

> Update .gitignore to ignore .swp and .patch files.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

