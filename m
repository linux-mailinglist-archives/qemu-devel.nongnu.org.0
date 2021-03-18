Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 445DD3404D8
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 12:42:08 +0100 (CET)
Received: from localhost ([::1]:60666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMr2V-00004q-C8
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 07:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMqzm-0007Ly-QB
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 07:39:18 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:41921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMqzl-0007Fs-6S
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 07:39:18 -0400
Received: by mail-ej1-x62a.google.com with SMTP id u5so3400843ejn.8
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 04:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5fc0rYREPoyM171mPCFs3fflTQuz/Pg0IrClqL2rKzQ=;
 b=lpSZRjWgrhsxARoLyqYSaM5PBEwGX6bBhw0TDQ/ziRbjK4y0tfKWd3JnvoXWI4LDAl
 v/fS5ylZRP2SwGY36PjzNCIZyXho8n1+lRhouOVp0GMs+NT6dXQ4D9bUoW/IE4zCZ1Tr
 uKNzcFqdhNLrQ0PaPZaWHtp97qicFay7wfzlZk5vKD8a2g2gaCMtwHMY/i2uV+qa+qfR
 u9Fh7CpL6dn+z3za0gd1mkN292Y+zmxNBOyT6wBooX/xSBE6fwrNwYijgYgJzYQB+djL
 HBWxBM0ye+F8OEC5nqtcoEvv+0IohTHvT6CYIP5xwydJzjAf8EhNmlJGNB9kklz6OH1h
 /inA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5fc0rYREPoyM171mPCFs3fflTQuz/Pg0IrClqL2rKzQ=;
 b=tx76Ia2P70TdoO7QXI3ENUhNHjqwP3MIY9XSorpB+2wQ+5GwHigy8NKz0+H2rZrl5r
 1UhJTDxD7hXjyhMBzAPzHWpCPZsQ46PFWAJ0myqH71wvmJzkfPwwBMrzH8CPl9WBGuyy
 4se94+6E8y5PE2jYOrUSbXAsandgYGNjEUu/XKDAIBKYS1Hm+dk6CBs9hnwNWJk7EzYT
 Oq9zRNU5Sjtc4jzFU0/kJxIwbqCPsbgyOkSZFkfToQvipXqBvpngo+P64nHTJ4UZEFes
 7sJaShMW4Pvy4JrjGRpclF1KK79hAX3y2FJ7zpvLG1jI7eBXXVIqbRLrMYPWWoj4P+I5
 X68w==
X-Gm-Message-State: AOAM5319s7yH5W42J+s12ovQuAZ+WOTcN+zL1NIv3V3GwI1Dhegf2avq
 ZRoOKIB7hE+Ds70I2n+fq/QdjsbRNFKqU7DEH2BshQ==
X-Google-Smtp-Source: ABdhPJyKQ2vR8zvfqEzAHSIGRAI+XFsLHnMewnTHmf0c5x6/lMIrKvS6QLizXAtfRE1fmKfp7LJRW9gjZ+2McWip4I0=
X-Received: by 2002:a17:906:1ecc:: with SMTP id
 m12mr40142996ejj.4.1616067555645; 
 Thu, 18 Mar 2021 04:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210221222617.2579610-1-f4bug@amsat.org>
 <20210221222617.2579610-4-f4bug@amsat.org>
 <c395479b-d2e0-a862-3446-4afef601ca1f@suse.de>
 <8a302c84-b69c-b0c2-de45-607dd1f686a6@redhat.com>
 <e0d11b2c-7b1c-c968-feb2-675a8c98c7a4@suse.de>
 <ec296129-2c4d-fd74-d044-50c470e29609@redhat.com>
 <cd4caf9d-c32c-25fd-a27f-d352ece74ed3@redhat.com>
 <CAFEAcA8YybFf1=wQ7-scC2JnQEHr9nx0LBvt16dTBOXV0KuMAg@mail.gmail.com>
 <28540fd5-3bd3-30d7-624d-da21d0f39806@redhat.com>
In-Reply-To: <28540fd5-3bd3-30d7-624d-da21d0f39806@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Mar 2021 11:38:51 +0000
Message-ID: <CAFEAcA8t3Roq2qL1RTru1H+WZAQMVmWcN=VjCtJkvAzmyws_YQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] target/arm: Restrict v7A TCG cpus to TCG accel
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
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
Cc: Andrew Jones <drjones@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Mar 2021 at 11:31, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
> I tend to agree. The problem is for the running VMs started before
> 82bf7ae84ce (so up to any fork based on v5.2). I don't know what
> the forks are supposed to do with the running VMs if they want to
> migrate them to newer QEMU (or upgrade the host QEMU).

Anybody with a Cortex-A15 KVM VM is just going to have to stay
with their pre-existing ancient hardware, their pre-existing
host kernel and their pre-existing QEMU binary. That's what
"we deprecated and then dropped support for this" means:
we no longer support running that kind of VM, so users who
were doing it need to either do something else instead, or
else just keep on going with the old versions they have.

thanks
-- PMM

