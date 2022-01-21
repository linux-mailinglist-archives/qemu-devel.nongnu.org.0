Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8003495E85
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 12:44:12 +0100 (CET)
Received: from localhost ([::1]:53198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAsKx-0004a4-8O
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 06:44:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAsB4-0006S2-BU
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 06:34:02 -0500
Received: from [2a00:1450:4864:20::332] (port=44907
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAsB2-0001wG-Sb
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 06:33:58 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so21680181wms.3
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 03:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UGtfCmAjicnZHFy/HhV0pGRFuAQTKVaSyqTB9BJTOgg=;
 b=Isy/EBELORMb3tUFFtbrPBBOMVdy0LcRFrk0AHHz+0ts3ohsl66X4z0A3M/IsXUprK
 k1JWexdudx9tra1WsER1DyrHSLAAcBnse6JaoqEsy7I8XlIrickDIZNECYj1x1XTZMVh
 wQG40avebV4bpAwr5jTSxoD3J2aiIoyOMd1E22ZH/b0YLCBogGdaD2Kvnjdp2Pyw6Osu
 tuzIc0miDM5pGKAV6Hr2gnT/jKeXA2aZZmBf4uyP5AvW9tmWZkdFa0iHXM9HTgZop1r+
 nBoBpjlixWfTI+QrQi5/1KEO3G71bySIjRqHdkjRn9526XvrlSPKgp4qbK6OoP7VDtvX
 uhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UGtfCmAjicnZHFy/HhV0pGRFuAQTKVaSyqTB9BJTOgg=;
 b=KaPoN4IQCU6klVVFuG1wYZVBosjNXbFm7bpDLV1+ro+lqOTbzm5lrnOWVQcP8u7RvZ
 EnhZJ6V/gVo7E5D06Dkn2LpxVFeYlBVnCgor0UAa/e2eTVbADvcJ7UVBjZKpcI53cAic
 0nLPYUaxBHC7oi2Oi8FwjY7vcpQe4SO7iTUJg424v4MYcDShnm55DayHyyVMkOJB/OYU
 N9nTdEviJYoi3Htq5aN49FdKP3BnfsFE8RR6fkRM98bcKgu/1F2T30VnHUHY3AV4uh1m
 AqvyBdIu0+CufGkB18dhuTB+qFKBCYnyJqniYurWuIVaXSwkPsJGvJI85eWftn10ktBM
 bEyg==
X-Gm-Message-State: AOAM530nzZ0JVUpSbZMcNZi+R2ePqWLrgs/QEO7/xgi0YwSamzGQg4hL
 j/raUhSKcCZGic03BmSkPSZsCttimei0+gmQIgar9Q==
X-Google-Smtp-Source: ABdhPJz86BKdXDngD5IssHKybXvrEAseBCCsxLmaaKL3vFPGrth2s60zmM1Bih4XMEws5zpxNNW5tn1xLJ1FyzHxP3o=
X-Received: by 2002:a5d:644a:: with SMTP id d10mr3414291wrw.295.1642764825031; 
 Fri, 21 Jan 2022 03:33:45 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <CAFEAcA9_d5jw5-HOrZA6dsG1vMqxzqmrfHA7Jo0KsDcaEXmB_Q@mail.gmail.com>
 <6c90ca3d-eaec-d7e8-5941-4deb83b58fd0@redhat.com>
 <87zgnp4b32.fsf@dusky.pond.sub.org>
In-Reply-To: <87zgnp4b32.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Jan 2022 11:33:33 +0000
Message-ID: <CAFEAcA_kxrCgyxWPFLw6VZ-rKx-res0C8L2BWRvfB81cR+keLg@mail.gmail.com>
Subject: Re: "make check-acceptance" takes way too long
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 21 Jan 2022 at 10:50, Markus Armbruster <armbru@redhat.com> wrote:
> No objection, but it's no replacement for looking into why these tests
> are so slow.
>
> The #1 reason for things being slow is not giving a damn :)

See previous messages in the thread -- the test starts a
full-fat guest OS including UEFI boot, and it takes forever to
get to the login prompt because systemd is starting everything
including the kitchen sink.

-- PMM

