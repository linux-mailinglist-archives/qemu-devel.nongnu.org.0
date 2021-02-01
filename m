Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B651D30A776
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 13:21:45 +0100 (CET)
Received: from localhost ([::1]:53450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6YDA-0008MA-QM
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 07:21:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6YBF-0006uL-76
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:19:45 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:53966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6YBD-0007K6-4Y
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:19:44 -0500
Received: by mail-wm1-x32a.google.com with SMTP id j18so12466869wmi.3
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 04:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=avgZriYDOqKoEcR/vPwtjNI1qkkfAZdmlsgr+6zNfUA=;
 b=W25YrZpRIPjkkwpjY+fokHbQ3AMhuFkLpPW9hC3hZgZMxfTKFcbbKbyyGtF2AMP0MH
 RjRtjzjl6W9rMaMhwVIe69LEXIEvNy9XtFk33x52/j84V3Dx1/EYikyNu8PdwaD28uT9
 ETqbeYBDOR1vrJsxeEWAmhtg0M6MgIXufJDLA0UvgxbNVFxsUkEpPEnE4i/SMZoTgqwy
 w+AX69Zc+7SBBwYrWqWdBK0f3SeVzC0vMzbOuIPGgiyOADZa2kOH0QkL3SDpFQd2OxUI
 K/oWbNtBTP691Mq2hEFi3XkEwob6MXAGL2tYajNye8S2HASEVN8WfavNVlnNTNPxBOol
 HlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=avgZriYDOqKoEcR/vPwtjNI1qkkfAZdmlsgr+6zNfUA=;
 b=M2wFyj0z/KJf3UYCvEuo+lXiQXDtu8kJ0yJDocfOThsg5d0TqYE3K7wpDB3HYSugTF
 Gh6XjfWqGm2BLntjkQ4Li+sSuqZ9rDWRNdEyiq0GCHVtb5MxDj3RAFf6/eV8BbNvOmE2
 7B9CXxqyBkBrHO2rn1CqefUWvLxN7/YbmGGbLTIw2TOMvzhSbGKKaw48WJI7jo045YLH
 jgJBfXZWJiP5a3Fz3hHUawHdDlTDMJ1DyGA/kG1qynKCaUJU0qZ7dfR4AFAqD84sD5jE
 omfL5D9mbUnqUbAj5X4eNsx/236FGUERmvkH+X/NmsutqugDZyfmKttW/XS+FdYMZ2XD
 kuag==
X-Gm-Message-State: AOAM530yhhAfNbbZDR0xa3PvdyF5ritA9mU2Bo9btjLfAA6+yHtRgriM
 noFeI39+dX/24nLU2iwltHx4YQ==
X-Google-Smtp-Source: ABdhPJxw1KUg774S0GvjZhynGs7AVYMFQh05vMS1Q/WT0qosW9/eDC/ZNt5ZZSlEIU5ejZfE8awX3w==
X-Received: by 2002:a1c:9d08:: with SMTP id g8mr14640405wme.112.1612181981321; 
 Mon, 01 Feb 2021 04:19:41 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r12sm26818287wrp.13.2021.02.01.04.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 04:19:40 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 806B41FF7E;
 Mon,  1 Feb 2021 12:19:39 +0000 (GMT)
References: <YBTRSK4/F5KLH+FZ@strawberry.localdomain>
 <YBWrpHUgLqY/h6Da@tahini.localdomain>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: Detecting Faulting Instructions From Plugins
Date: Mon, 01 Feb 2021 12:07:13 +0000
In-reply-to: <YBWrpHUgLqY/h6Da@tahini.localdomain>
Message-ID: <87zh0ougis.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: cota@braap.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> On Jan 29 22:23, Aaron Lindsay wrote:
>> 1. Is this considered a bug or a "feature"?
>> 2.a. If a bug, is there a good way to detect this from inside the
>> 	 tcg/plugin infrastructure and avoid calling the callback for the
>> 	 faulting execution of the instruction?
>> 2.b. If a "feature", is there a good way to detect this from my plugin?
>
> I think I've convinced myself the current behavior *is* a "feature", and
> working as intended since the instruction can be considered
> architecturally committed, even if it faults (ARM statement).

Yes I think that's correct. I assume in between the page-fault handler
has run and ensured the page is properly mapped and then returned to
*re*-execute the instruction.

> But I am
> still unsure of the best way to detect whether a load/store instruction
> has faulted from within the plugin interface, so I welcome thoughts
> there.

A hacky method would be to:

  a) track last executed PC on a per-vCPU basis in the callbacks for
  load/store
  b) have a specific callback handler for the head of the vector table
  for synchronous exceptions.

It wouldn't be ideal because you need some knowledge of where the table
is and depending on the architecture the entry may be shared between
synchronous (i.e. the last instruction that attempted to execute) and
asynchronous ones (e.g. a timer just happened to fire).

If we get to the point we can expose the register values to the plugin
then it becomes a much simpler operation because there will be state
information exposed somewhere in the register state.

>
> -Aaron


--=20
Alex Benn=C3=A9e

