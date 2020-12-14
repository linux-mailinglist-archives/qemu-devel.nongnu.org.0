Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEA82D9904
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 14:38:55 +0100 (CET)
Received: from localhost ([::1]:46418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koo3y-0007DL-50
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 08:38:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koo2H-0006Fl-CQ
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 08:37:09 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:38179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koo2D-0000XV-T5
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 08:37:08 -0500
Received: by mail-ej1-x644.google.com with SMTP id 6so7882938ejz.5
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 05:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dBf1ZDRhXZJ54k3ajCkvQSEqznc4nCmDAJyCxLgwLsI=;
 b=MYS+AH9zU6xxDaZrIR3KHepI6x10VxdO7bzR7wwAzh+XLNxGBRjW5yJePuiGkHdqek
 JVUyp43gKoNJn8pQX8pWtJFYTj7N8X/sbxrP+bRIMgc/QLlJ1NOjz5CznZf8WxDRQvr8
 2x0WTIHwF/ojngymrfl41mZj4jqeA2gWvA8HR3piikTTs6sln22fb9qcpI/tA5WJNk08
 VyspyM9tDV9LGqSzQVgid5fFlvVpttL0P+y5sI5qky9NtrotXqieSHapiS78bQXlkmid
 C8v2/L5ACdyk8nvohMHPC4BaINvGUll96n5AkAnBVREVA03FaVnJ0kYjdg7k5DXeAM8F
 /2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dBf1ZDRhXZJ54k3ajCkvQSEqznc4nCmDAJyCxLgwLsI=;
 b=YympE9Mbm5zTH8tEw2ufcBAkVQiiknbFAFclMbr9gZTtT2Fu9yctlSB51cZc+MNr1t
 mRHY8MfdArj7jq9yYY+RHX3BeQMF4VPr2W/zbipCiPXjze7sHUE4O83p7pjQU7TCkcai
 U1stPHwUEllWdpqiGm3bSk53/Vsgk2DjciLJhLdYsKPz14z3pke+OrLmFG90RXbWns9w
 kJlLZ53FvXMe+WN627tnmV4v4bmuzc0ARqtgUl9Inb4JolbV/w0qjWa+zE5saOSShqbA
 /KrlNe0V8StS+pGk8BGO9nsOhT2kjUnCQHIQaDluFaJJfBzekWz6gvKn9ANG5YsW9i3b
 1lrA==
X-Gm-Message-State: AOAM531MSJ6LUMyky2M8wGqTsZ7iWQzMndMD0b/A6RqpAbAyweGOjCkD
 mOmnUGwDAy0NhyFwIBhcKPP+tZqE3jqHKxTEsJiDew==
X-Google-Smtp-Source: ABdhPJx9/X4MzHdtO9pVj1t+66h9z2wkaOwq07TYdpSqvp/ypioJMTpC7tnh9Qa4WYZHmYztO0Io805HU99aZkeEAJM=
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr22644909ejr.482.1607953022744; 
 Mon, 14 Dec 2020 05:37:02 -0800 (PST)
MIME-Version: 1.0
References: <20201214123553.2515-1-leif@nuviainc.com>
In-Reply-To: <20201214123553.2515-1-leif@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Dec 2020 13:36:51 +0000
Message-ID: <CAFEAcA-X-JV9TXgnuoqw0ZDH8W9ZyiHAEiBW=epsYyb3fJ7FkA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] target/arm: add descriptions of CLIDR_EL1,
 CCSIDR_EL1, CTR_EL0 to cpu.h
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Dec 2020 at 12:36, Leif Lindholm <leif@nuviainc.com> wrote:
>
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> ---
> v1->v2:
> - Correct CCSIDR_EL1 field sizes.

Hi -- could you resend the whole series for a v2, please?
The tools (and people) that handle patches get a bit confused
by partial series.

thanks
-- PMM

