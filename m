Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CE64C284C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 10:39:41 +0100 (CET)
Received: from localhost ([::1]:59736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNAb5-0000Mr-RM
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 04:39:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNAXh-0006mV-Qo
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 04:36:11 -0500
Received: from [2607:f8b0:4864:20::b2d] (port=34369
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNAXc-0007uM-NB
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 04:36:09 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id v186so2660669ybg.1
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 01:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HaYBHkaaTO/+raPpHUlGFrCYmLk8LxhPCnDAbtRZqEM=;
 b=AZvZMLXPN+FRVhZjVNytCGJzlR0UJNO1qkfiQrfcu3bznkbrEpRDxfekWrfXGkcUGD
 6vfNsSBb0kGPzOlm6LrGOok1V9auhHLA52F7Dz+zAWJY9kd79mj8ap7jn2RgXZTF8hrz
 mgP5fjnTMaP9wggolXEG7pYawV+GaSmst9qLLegKSD6E8fRxnsfFsZXKc8zR081dGN05
 SZA2nNv8vGg2DfONyIPNVkew/eKaAMYzAcMq/0bWWLTFg8cwXjEJg9wzWuQ5bEIkUKzD
 NQD2nCW3jFAIiPAwQc7InJAIHaJ9aMumDxJ+LA1D1AgHGyLJSLeE3Q8ZT3lw/8qwNMDe
 YnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HaYBHkaaTO/+raPpHUlGFrCYmLk8LxhPCnDAbtRZqEM=;
 b=wdGycRHaAsBm4AWlxdJv6PsNcgvBG3yTN3uwa5cOzTpUtmWbKppkS1nMJSf9JoEzII
 ylujr1gr98hEhtH7SA/LwMtXoLBWduMQaSZA0kUQKc7Np4rODfP35KEd22k8YR1uM08S
 tIBnKYuF3FxqMmZ95OmlP0uScZ8hR1lN8cB0vyY8YkDPsZTNqej/gAfnafiySbRI92gn
 4g03f5QUUWgvxiphT6amniK2D0fqYxiigUCSb4PI5zjB259+tc4luVwTmVnzcY2WSxpa
 Dysq6sRFxwgjq3ODV3GhgLtBsGdj/ekcNMZEYKnHTySnrQmqjXPr/TIv77p9dGgAnDVE
 NPTQ==
X-Gm-Message-State: AOAM533obL/esbtC+kWM5l8nWEqwpfDVyrMvWcpfkk9zzZ2Y10WK7dnM
 2DpJMsRG/LLQGqcOL2hIy+0xOAoulxGyQhshdUf4Mw==
X-Google-Smtp-Source: ABdhPJwlMDEImcqhq5Kw8KxAiaqPT+sk5R58P39A7NvlYg/T1QsAOTd3j0vtybB4WNYQZ0jvf7EBGv5rP44/a5TXK04=
X-Received: by 2002:a05:6902:83:b0:61a:709b:d841 with SMTP id
 h3-20020a056902008300b0061a709bd841mr1582898ybs.140.1645695362089; Thu, 24
 Feb 2022 01:36:02 -0800 (PST)
MIME-Version: 1.0
References: <010e01d82875$d3cc0ec0$7b642c40$@sysprogs.com>
 <93318cc1-bf62-34dd-190c-1961a4716f75@redhat.com>
 <01e801d828f0$b58a6e40$209f4ac0$@sysprogs.com>
In-Reply-To: <01e801d828f0$b58a6e40$209f4ac0$@sysprogs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Feb 2022 09:35:50 +0000
Message-ID: <CAFEAcA_y=xRhBoStyxa+UZcyibAzgcJSf+kQO4e0BMrdq4j6Jg@mail.gmail.com>
Subject: Re: [PATCH 3/3] whpx: Added support for breakpoints and stepping
To: Ivan Shcherbakov <ivan@sysprogs.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Feb 2022 at 20:08, Ivan Shcherbakov <ivan@sysprogs.com> wrote:
>

>  static GDBState gdbserver_state;
> +static bool gdbserver_is_connected;
> +
> +bool gdb_is_connected(void)
> +{
> +    return gdbserver_is_connected;
> +}

I haven't looked at the rest of the patch -- but can you explain where
whpx is different from how other accelerators handle debug such that
it needs to know whether gdb is connected or not ?

thanks
-- PMM

