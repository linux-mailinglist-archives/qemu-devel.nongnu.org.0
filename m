Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1C13A27A8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 11:03:35 +0200 (CEST)
Received: from localhost ([::1]:57254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrGb8-0002w7-O9
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 05:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrGZW-0001WR-2h
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:01:55 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:40944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrGZO-0002hv-Un
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:01:53 -0400
Received: by mail-ej1-x62c.google.com with SMTP id my49so26251847ejc.7
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 02:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ONbdJzvvZTBySQzNOZWRio+1fvyMZzE0WrW3laRqjgA=;
 b=M9M+V8d37z1vKiB+2zTuqQaNcLWhnQgPNmLFljTD/U4IOl1RiTBnEOzIlhbre438ka
 /dokP3HtuYEVNkdmv/B30EM7Z/NBwfpA0jRrrLJj1Z3WZ0JKTNSscWTdI3oWwkQNWMxd
 NPiQHhpyJCpeGxtucySWsEF2AhOCZh2YzUKeJ4STXVdkW3ZeWVtpqOeLdTxFSaJwtFkB
 M/RwEFYkhCW8ortecbHiv2HPO05H2pROTARRjftg022DFFNuSBhTlSH6LcPkNhlLqHko
 VSdrVfB/m+UCG/dBY2GIufL9KB+SHq5Z6zlRqNlDqDauM9cYBY67rVZXdFtGPjCZMvxG
 wrfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ONbdJzvvZTBySQzNOZWRio+1fvyMZzE0WrW3laRqjgA=;
 b=DUDQSs3IalXh/hgonRN7qrwbUBJ3XPpbN9f3U48o+f13YR9zlKeo+fV9DOBe8JBPkw
 nBCfUoKXNmLluhAU2Hi0mPCGnqisWZ+wPw9tGrKzt3H0bMUstev+uyM8ZD4aqW3m4Ql/
 NOcrtoaQF3DJH1BzKqsDVwVx9AW0nJplI5sm87quDLxweVp3JM9Usy4n7YM0KlMBfDey
 vBvAYejUOw9InwzcGDXL2BnbNB3rAwjA5fVy0YIWWOQ60xKXlZ6zCZijOUtmagjfWQfm
 FxorzZSOsqnigG0vALLVqt90qhdA8OJGrrwvvGLoljP9TQ992ZlueNWUG+6/FjL3hnAz
 1IvQ==
X-Gm-Message-State: AOAM530/Vvauw5LxBzpukXL5siB2n2YTfoqmJa3xZEMeRbvSgQKaRss+
 36cHGe+YJJq3c7qfimw4zwZDmyQwJVdWbTKglKu/VA==
X-Google-Smtp-Source: ABdhPJw9ZgCAffV5u46HuLtPIy0WDEZWuxAYgqJkG/AgrZV0jfuu2wSSw4RLl1EoTP55sQ3pQU2TACk0stjK2QVeZIY=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr3487731ejy.407.1623315704932; 
 Thu, 10 Jun 2021 02:01:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-79-alex.bennee@linaro.org>
 <d0865350-88f9-0f91-f984-25832c0f289b@linaro.org>
 <d62d06c3-5b14-56bc-c5a5-d5e960a9d7d7@suse.de>
In-Reply-To: <d62d06c3-5b14-56bc-c5a5-d5e960a9d7d7@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Jun 2021 10:01:10 +0100
Message-ID: <CAFEAcA-GGr50x8XQOssOEVqPvE7Wq+=tpypirxT+rso+diCWsw@mail.gmail.com>
Subject: Re: [PATCH v16 78/99] target/arm: cpu-exceptions, cpu-exceptions-aa64:
 new modules
To: Claudio Fontana <cfontana@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Jun 2021 at 09:45, Claudio Fontana <cfontana@suse.de> wrote:
>
> On 6/5/21 10:50 PM, Richard Henderson wrote:
> > I don't see the point in the excessive replication of header files, for exactly
> > one declaration.  This is not the first example.
> >
> > What's wrong with internal.h?
>
> Doesn't mean anything and leads to a mess of unrelated code.

It is all related: it is "things that the target/arm code needs,
which are not needed by anything outside target/arm".

> I think we should be better at creating meaningful modules

target/arm is a meaningful grouping of code :-)

thanks
-- PMM

