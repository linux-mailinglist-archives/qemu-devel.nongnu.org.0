Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 105C74131E8
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 12:45:55 +0200 (CEST)
Received: from localhost ([::1]:54114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSdHe-0007Rp-4r
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 06:45:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mSdBM-000147-QL
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 06:39:24 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mSdBL-000179-34
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 06:39:24 -0400
Received: by mail-wr1-x430.google.com with SMTP id i23so37732240wrb.2
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 03:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=HLd+19dFYZQmgK05MnIAuJQ9ppcbATuqEBHwGjRR7RM=;
 b=FxN1Iie5yMJzK9Xrtr3Ws3P4Mz1YUJkZxbG+mzMJTAeI0MjEL24L+btmwvCrgmQpdk
 PsPmaH9Xacc6HzYqeEvccBoosN/FCVlgYieD1DeYSUrfsya2ZwAVNt5hwGML7aQ5cMIT
 rdoc8nGxj5TlVIu+2rAYpu6bpVpalPY27xwUPVttk/tppRbE6uhvZOmb7cD7LaOjh+ev
 +ZeHFa02bXqP07LZsxCvwPB3DQNn15s0s/B8gZH5SH0dBu+sWvYogKH6LgJ0Q/eaZfTk
 6e0KwGgWT63Txcmv5HSll1QtcQD2gi5lFacEte1Stcdm/nmIOTx8sAiw1Y8N6xiJZOyj
 Jw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=HLd+19dFYZQmgK05MnIAuJQ9ppcbATuqEBHwGjRR7RM=;
 b=IgLgy40MBi4IdpglMHhPEGcr8Si3D0x81qn8DIc9JRojsaR/yRq2grQV7+OLLBYnyS
 p5wThsU37X1/CFbv9t+EU5r8qjbIyN2bAa+UoOvLuvIpcekWNwG4LIVOL9xGJ7lSzpSm
 oPRaeGxnG9mgDxr0iypZkQMiikqv5dvKslrERStEST56gugcJyA91Op/M1JP5RCLFfGl
 RMXeBDCm4payGq0MIMd+drqJouqZKXyOmKCV+b882AyOsB1nghbtypPqueGudtWkpinn
 MXYqtbHcVLqMK75rW8J/vDav1ktJlb/oVd5FSZfpbPB4PK1aum1Z6Zs9bMeUpjuWHMjZ
 XqRg==
X-Gm-Message-State: AOAM531Ny4Ve5tfRkjD0k5Mgu1vYtVHxIynl9iWCOEKNzrMGreOnwWz+
 XVrQqW2d4KYen3OEjHWFzZSN+A==
X-Google-Smtp-Source: ABdhPJyPsFKQeEminXQee+Zqz5Px6vBaK7R5mittT9vz816UfOldfLRPNHPnxBQkbRt7RWaNgERpCA==
X-Received: by 2002:adf:f48b:: with SMTP id l11mr33902845wro.254.1632220761024; 
 Tue, 21 Sep 2021 03:39:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k4sm18507041wrv.24.2021.09.21.03.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 03:39:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A37111FF96;
 Tue, 21 Sep 2021 11:39:19 +0100 (BST)
References: <CAEYr_8=uH3=BGbVQrbjijoE5xB7jRch=35hjD0g0v91u_cXUog@mail.gmail.com>
 <6ab9eb4d-5835-df61-b27f-932af7e64889@amsat.org>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: Range of vcpu_index to plugin callbacks
Date: Tue, 21 Sep 2021 11:31:18 +0100
In-reply-to: <6ab9eb4d-5835-df61-b27f-932af7e64889@amsat.org>
Message-ID: <87y27qnrfs.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Robert Henry <rrh.henry@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-discuss@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> (Cc'ing qemu-devel@ mailing list since this is a development question).
>
> On 9/19/21 19:44, Robert Henry wrote:
>> What is the range of the values for vcpu_index given to callbacks, such =
as:
>>=20
>> typedef void (*qemu_plugin_vcpu_udata_cb_t)(unsigned int vcpu_index,
>> void *userdata);
>>=20
>> Empirically, when QEMU is in system mode, the maximum vcpu_index is 1
>> less than the=C2=A0-smp cpus=3D$(NCPUS) value.
>>=20
>> Empirically, when QEMU is in user mode, the values for vcpu_index slowly
>> increase without an apparent upper bound known statically (or when the
>> plugin is loaded?).
>
> Isn't it related to clone() calls? I'd expect new threads use
> a new vCPU, incrementing vcpu_index. But that is just a guess
> without having looked at the code to corroborate...

It's exactly that - in user-mode each thread is modelled using a new
virtual CPU so a heavily threaded application will slowly grow the
maximum index. If you want to track the creation of these threads you
can use qemu_plugin_register_vcpu_init_cb to track the creation of the
new vCPUs.

It's more this reason the recently added cache modelling plugin does
vcpu_index % cores to bound the simulated cache the thread affects.

>
> Regards,
>
> Phil.


--=20
Alex Benn=C3=A9e

