Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37879202421
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Jun 2020 16:26:30 +0200 (CEST)
Received: from localhost ([::1]:38804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmeRw-0006Bm-QN
	for lists+qemu-devel@lfdr.de; Sat, 20 Jun 2020 10:26:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmeR4-0004XI-Im
 for qemu-devel@nongnu.org; Sat, 20 Jun 2020 10:25:34 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:37057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmeR2-0002r5-Ox
 for qemu-devel@nongnu.org; Sat, 20 Jun 2020 10:25:34 -0400
Received: by mail-oi1-x241.google.com with SMTP id a3so11272540oid.4
 for <qemu-devel@nongnu.org>; Sat, 20 Jun 2020 07:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K95ALXJatKk0UpQroQzNclk5eENV7hoQVlZpuGr7UW4=;
 b=mlllid3r9aWeDqeubyimRsJJAWSRLpb71zDahcIh8pgKNus3Py6vAuchpPh7moDqxb
 8PGGQRqJzR+h6D0YILTpRNALUsXrkxuq2HpHGsxtC4N0tqHCiWt80YTmNnNqFclmZ+xm
 IDbzBR7QA4sQI1qzSU+nhJIICTvg8nS1lm0/ltynCEGZX0K7I8RO938O5pugY4EOkpye
 bGFe0UtQV6rN783pkjqruEAgRadE/OV104os47FLBmEtywN97RJxgMRKvxR2n/njyQ/7
 lg6ck6Kd7Gs8EqPoFd+9Rl5NwYQTyMvedNZlRWvs0wPO9mlnEn8u6kSiDVjd6f8go8O8
 XGAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K95ALXJatKk0UpQroQzNclk5eENV7hoQVlZpuGr7UW4=;
 b=TODiKAJRewhRyj9yNwnUqY5aA/tb/8LtNjXNSQ51Mc1qtoCBY0Lq37HGClUveShsMr
 m+fra/vFnS/2zm4dO2ymQzDR0up5CAsbBMdXnB60obkMfkhnzYOMNZktHRW54/E+8h+B
 LlaQDnO+qTYMQzUv9r+cd1eel4eSFEnTrYlUNzSXxiczYbN5qR9ADdUWKcm+Eq9555C2
 /tbkyiQbW/VYTtA4RsiepTlAwvjlWCWKr0TEFuZdOspUym0OWB/VwYTA2ThWw2ONad7E
 Fyi4AqNc/XltkcIp9vsNzQxwc2E+Q9mU/SOfmboD6Pd/L0GtDWomiHvT/vs8CvUmDqQ+
 8+NQ==
X-Gm-Message-State: AOAM530RMJWKL6COSyR5HcStiPTmzMzaFYee1GNXfMaOXnuorWN/BhXr
 UeK+tHuR7UY+GgFVDHUlhKvGzCOLSXGLpbSLMP7DwA==
X-Google-Smtp-Source: ABdhPJxpf8TS4C8L5mnUg0LfY1eo4NTTu++y0vXT4rnH/NlyYa+9BPnckZP7m0ETEiyl+wn3CSyrvtfI5AXZjcTI7zc=
X-Received: by 2002:aca:568c:: with SMTP id k134mr6300998oib.48.1592663130742; 
 Sat, 20 Jun 2020 07:25:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200620133207.26849-1-aleksandar.qemu.devel@gmail.com>
In-Reply-To: <20200620133207.26849-1-aleksandar.qemu.devel@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 20 Jun 2020 15:25:19 +0100
Message-ID: <CAFEAcA9C+cJ_2DdNQBckNZJEZXiG4jNPsE1HSh9bU5AOrOGMCQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] checkpatch: Do appropriate kernel->qemu renaming
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 20 Jun 2020 at 14:33, Aleksandar Markovic
<aleksandar.qemu.devel@gmail.com> wrote:
> There are several places where 'kernel' is mentioned instead of
> 'qemu' in checkpatch.pl.
>
> This small series corrects this.

So, the thing about this kind of change is that it's implicitly saying "we have
forked checkpatch and will not try to update to newer versions of it from
the kernel tree", because this sort of no-behavioural-change tends to
get in the way of that kind of update by obscuring the delta between
the kernel version and ours. Effectively I think we *have* ended up
with our own fork,
simply because we haven't cared to do that kind of update from the kernel's
version and we've gradually added our own changes to our copy. But it seems
like it's worth discussing the general principle.

thanks
-- PMM

