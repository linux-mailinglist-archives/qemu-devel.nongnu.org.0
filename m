Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 099103B67EB
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 19:45:02 +0200 (CEST)
Received: from localhost ([::1]:33076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxvJd-0001Db-3w
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 13:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxvI4-0006st-CL
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 13:43:25 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:40599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxvI2-0004Hf-Kr
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 13:43:24 -0400
Received: by mail-ej1-x62a.google.com with SMTP id o5so6304565ejy.7
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 10:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MwJ5VRJ9jra+6XtLlNKuwutqHN8qedpT8dZoHpB7+Lo=;
 b=DCqhA8ii0CuHIbMw4qGAHXqq63/JRUhkmAYtYfh2eAkVaGbL6KO49F5q2JpINcpDMU
 RC1xdiMcKnT5tpFEMvO0M4wTBA6kfRKYOzsuvoNVJ2qpDGsAgzhXqtsU1SpxRmmaHVYo
 WMTWZbunxOvruRMqiA3h8uBqJXNhgGOIZcgpXcoIsNbjPgZpTshLI7278aqh+WqJUa4b
 iX8UuLrotvsPesGvzqOMWq829h805EiAFQokOScfBz0ie3m/ASiOyrMRACJUwUIfQ3cn
 /lm9N+dl7CKY3kboL8ki58QXMQXZXL5iYZ04uU6eqG834xCcqNiYoRL29WwXkNoKHvNS
 IlAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MwJ5VRJ9jra+6XtLlNKuwutqHN8qedpT8dZoHpB7+Lo=;
 b=Owyed/tLbWl9ZD1iX8jy+benPS/Wz5rNvG6OqZlLIPT8L4vR1Ld2YiSWa2d0ETbOFn
 xI2I5HMDIZlG1up2JLVKM0NdG7mjUKkC/JIAly0UKEX1D+eHarLZus6jjViOBYPR9RzA
 vG/vjrPbFsCJp4+/FdoPOsAuS+5M9Kz2vLFKBoKGLbzRp0CnRawxo+yEVn+7a6gS39eq
 BxyfwmPgpaI50Rrnmfu+jHBlQbj0if56brNHnEV7a5Uu0JOGhj4nSCx6pzQaRxzvTw3L
 vlnRb3U3edqonfBqkl71xwPvCSkduiM9Ey8MjbCoChpKD1bQh7E+/2tU3SWWkAjBBKvF
 gjZw==
X-Gm-Message-State: AOAM533jWxnYWB8DNNODn7YfsOgAVZUqI928PIF62rg92Q+07sxIF286
 Bf2O8ridj+VQ8pjJ8EGj0hZxcezFrtujn2RXlBztLw==
X-Google-Smtp-Source: ABdhPJw6lzYe99JDGPFzNbFYmqJx1F5Td4yI+AtS5UPn2Dv7V1a7zx/0DxmlEwPz7bHMQWoMcM7bG4epqGFY1OlKDjU=
X-Received: by 2002:a17:907:98eb:: with SMTP id
 ke11mr25718251ejc.85.1624902201120; 
 Mon, 28 Jun 2021 10:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210625091355.25673-1-alex.bennee@linaro.org>
In-Reply-To: <20210625091355.25673-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 18:42:44 +0100
Message-ID: <CAFEAcA8BSP0Zjqgpk5pe2i11=rsvDd_gDsR1SPtB+BqGgUcsHg@mail.gmail.com>
Subject: Re: [PULL 0/7] misc fixes (docs, plugins, tests)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Jun 2021 at 10:14, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>   - skip hppa/s390x signals test until fixes arrive

FWIW, an intermittent I just saw (x86 host):

timeout --foreground 60
/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/qemu-sh4
signals >  signals.out
qemu: uncaught target signal 11 (Segmentation fault) - core dumped
timeout: the monitored command dumped core
Segmentation fault
../Makefile.target:158: recipe for target 'run-signals' failed


thanks
-- PMM

