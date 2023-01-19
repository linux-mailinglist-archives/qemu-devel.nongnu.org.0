Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8C9673AEF
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 14:59:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIVRV-00072O-UG; Thu, 19 Jan 2023 08:59:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIVR8-0006p1-CS
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:58:40 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIVR6-0006SX-Ek
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:58:37 -0500
Received: by mail-pg1-x532.google.com with SMTP id e10so1556585pgc.9
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 05:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jVZ0E82j5PQjtmnIEv8oH4BUxm898ML+K/0A1gHCZKA=;
 b=Kxwx3YVz6wtwigLrCY4A1aRHBNjXKW7hztIktv8zIW58bRKCFP/MycXGl6SolYl50i
 fP6NsIctYpaGvdAi+UNHudaTcPnuDwc2pNbfrkcmal2IUCJf97BNbrh2AsCutQDqkjeA
 V2zdhO8B+Us0hztsf3TqLyTG5XEiiTcEJXqKCf4mAd9FxI1A29dQazbP/0MZvzFT/nFb
 RILqGI6NyHpDj2LGbBXl9/Muv+nrYAEjXyDGhaCW74pqcjIpgNETeZpNjCZQTqchc8qG
 WsxgAxfH0/yb1H53A/XD6dsq2GUQ580+76m1rolLG9P4vCWq8HBp+dA5cGMhcN4w+XSO
 Rmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jVZ0E82j5PQjtmnIEv8oH4BUxm898ML+K/0A1gHCZKA=;
 b=AdN07/sHdg1jJmf0LQjvIziPN0PKrPCR4gYD9qE36Ni6LGdT3jZ7cG3nt4EZqi/sv1
 is8xvTWaI4V66H5j9LkDsbrv8I/c4ZuEzce6KkbQ6noPy4/85SFFNVX0WZk4/qkk40Ip
 4EqkelOlI1KuIUJY1f0R59055bFEBG7yAN+h5GoNlGjYQ7cDwAxv/HFPziLDRV6A7LX+
 nydujZm2g2VauYk1pHu78Am3fA+hEerw03rZnN71YkuhbHtvRICm68xqw6KdLTQgfN5e
 KsYe6b/+UsylTkC2KCAAlFEP2qzznVfJjn0eNAgeZeHZvsbLbLqgeJSrOkY9CPbiblDp
 H0TQ==
X-Gm-Message-State: AFqh2krWSKQXgxeo2kemClX0dgT3rZV4gPLM4KIJQqOISHlSgv9chUZ8
 KiMPxDH3lD1+fQa0FCv5Xk7HFZxZClYThB1NYb4Tsw==
X-Google-Smtp-Source: AMrXdXvGasAGQKHyIypjlSEj1p6FxR3QZA7CzH9VjTtwLjucU3jXe3pPg+Ibcz+UqQCsLn9rtS7dIlC2i9KOQK2HrAQ=
X-Received: by 2002:a05:6a00:2b1:b0:582:a212:d922 with SMTP id
 q17-20020a056a0002b100b00582a212d922mr962045pfs.3.1674136714509; Thu, 19 Jan
 2023 05:58:34 -0800 (PST)
MIME-Version: 1.0
References: <167398464577.10345.18365355650640365165-3@git.sr.ht>
 <be662a38-c0fd-daf4-88e6-4adcde57fd57@linaro.org>
 <1a029d9c-92a8-2866-d1ec-7fdab4356fb6@meta.com>
In-Reply-To: <1a029d9c-92a8-2866-d1ec-7fdab4356fb6@meta.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Jan 2023 13:58:23 +0000
Message-ID: <CAFEAcA_G8a82YZyEvmQJcEr1odkQLu_D2bNkaX+1m2EV8TYEkw@mail.gmail.com>
Subject: Re: [PATCH qemu v2 3/3] target/arm/gdbstub: Support reading M
 security extension registers from GDB
To: David Reiss <dreiss@meta.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 17 Jan 2023 at 22:48, David Reiss <dreiss@meta.com> wrote:
>
> On 1/17/23 1:42 PM, Richard Henderson wrote:
> > Is there a reason why these are separate from m_systemreg?
>
> GDB puts these in a separate file, and J-Link puts them in a separate feature block.
> In general, I think it's nice to separate stuff related to the secure extension
> so folks not working with it can ignore it more easily.

The reason is "there is an unwritten standard for where the
registers are supposed to go" -- if we don't follow it then
although gdb will display the registers to the user fine it
won't recognize them for purposes of doing operations like
bactracing across secure-calls. I have nudged a local gdb dev
to suggest that the gdb remote docs be improved to write down
what gdb requires in the way of XML feature and register names.

thanks
-- PMM

