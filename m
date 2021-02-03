Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0786B30DCCC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:32:48 +0100 (CET)
Received: from localhost ([::1]:38788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7JD5-0005Mr-3L
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:32:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7J5q-0005eg-49
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:25:21 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:36127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7J5l-0000IN-Pf
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:25:17 -0500
Received: by mail-wm1-x32b.google.com with SMTP id i9so5428850wmq.1
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 06:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=5kjtRP2lTK8V5zutu1VrXQE3NHMKUI6+9a/M/d3x9pU=;
 b=IAjq8iFDSS5eINLcx2HpPt2JXwy3hq5TNaQTey5UUy371yjETJp4gY6S7gnUYj01E1
 uKjymqM9HgsvDHvLvllfMhvWiMWIpDdWlOC9QR/7WgObZkguQZTCBGURKcKTueFUyhvD
 tWgTDMHE6pMvO8icVhUtZC4cUMJfQwA0qpOg5OibC4Bg0Jci5VXSDgku8K0kVCsRw3G3
 qKyDZT0gdGBMOhsbWg/QjEhGv7YqlDIH6Whr6OrgF6exrl/GL9t/hQhaHB16HxRQCvmo
 h9TFDqJpHjhMwcmx+WbIg6ljx1oF/sA7xx6jd5bh1lNh97dcQEuIROgymEyj1qLaiIKk
 QJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=5kjtRP2lTK8V5zutu1VrXQE3NHMKUI6+9a/M/d3x9pU=;
 b=QvhjRxkIAcZrOxLxpCxn289qdCsmKcVQ9GjqoR4fsASLQGmPN2c9RjilfRjyfFn1Fm
 24Q/nNRNplGWbGLJoxMdMreML9OoLUtPYK24joHq7RIh7UBSCW0k86iqyCgyxn7KKoxa
 l50vIN+DfICk/lad/RWwxCidns2AgQrm5MssTIGC6Q0OYERxSpBo5yubcI8q/gpQ/hxI
 dzMQWOwZcxUnxznEv9PA6lAkfIozz3Xnz44DKI/JnA3ojJvPJAGQVCCMA1/l1khBYnBr
 unMrzm5RNj/pnYaK+Nos+9/64YCfGWgrQjKQ9wCHc4P4EDf8Cv4I9fN1J3CQkjmkzs7n
 FAEw==
X-Gm-Message-State: AOAM532QRBB7/4OfZSfw9RggOCYlVUG63YO7w3SR8daLS/CoFF1YT/59
 8cTEtJ+GCR3/PrFwPZ4d9D4fbsvbnM4HeYBS
X-Google-Smtp-Source: ABdhPJwqHav8+r0LFO8CND1FaWT7N/D5jDUw0VvBVYrOyMvVv0NZ5UplidlXBZSutwdJ7LbQKFyxwg==
X-Received: by 2002:a1c:2b05:: with SMTP id r5mr3039750wmr.179.1612362312331; 
 Wed, 03 Feb 2021 06:25:12 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s23sm2983793wmc.29.2021.02.03.06.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 06:25:11 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8EF641FF7E;
 Wed,  3 Feb 2021 14:25:10 +0000 (GMT)
References: <20210201100903.17309-1-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v15 00/23] i386 cleanup PART 2
Date: Wed, 03 Feb 2021 14:22:38 +0000
In-reply-to: <20210201100903.17309-1-cfontana@suse.de>
Message-ID: <87ft2drzy1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> v14 -> v15:
>
> * change the TcgCpuOperations so that all fields of the struct are
>   defined unconditionally, as per original patch by Eduardo,
>   before moving them to a separate struct referenced by a pointer
>   (Richard, Eduardo).
>
<snip>

I'm not sure if their is some instability because I keep seeing failures
in the review trees, e.g:

  https://gitlab.com/stsquad/qemu/-/pipelines/250749404

If you look at my pipeline history you'll see it is *mostly* green:

  https://gitlab.com/stsquad/qemu/-/pipelines

especially for the testing/next branches that I apply the reviews to. So
I worry there might be something lurking in there. How have your CI runs
looked?

--=20
Alex Benn=C3=A9e

