Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1128299484
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 18:56:21 +0100 (CET)
Received: from localhost ([::1]:49924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX6jE-00030m-Lc
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 13:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kX6Ah-0001HF-Nf
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 13:20:39 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:52033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kX6Ad-0000FR-Po
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 13:20:39 -0400
Received: by mail-wm1-x344.google.com with SMTP id v5so12468742wmh.1
 for <qemu-devel@nongnu.org>; Mon, 26 Oct 2020 10:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=t1AOSQTE36bHKr52gzFnFEt7JxcuPqZNh6I/4MIqcME=;
 b=JpasA9FPWkYYBM9YJBjrH3T7D+lR1LLw6PMenFugsmMFvgdb+Ny0JnnC2lOnAVcfXr
 5LEM0w/fjz194SGWsPbB8gNO2JB2N+tXuWWZ02zg8qq/BoI+ykx+zupMfrqUqqWx+xG7
 tQj3mPwyOflPrFq25WaZIDpy1FTYEl4ZMBWS2QBqHiiYr7GUCw4dgbQO6cTzSZL0E8vw
 hyUNOzfGBQCTKiDREAtvYlp+KgRAWtq7+x8ZlK5f+t8KhTap71ZDxDdhiOrrQuQVShu4
 Cpu9+aCqU+6SLDl3IWZ7COwr5F/G0q1GYzkQ8ht4c9dRUgreY/cIKFg7K50+1wZX1iAP
 lRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=t1AOSQTE36bHKr52gzFnFEt7JxcuPqZNh6I/4MIqcME=;
 b=pSz7SguPvmXDkAWilCVumC4XywVESJcshM0FauJLdaVQZsO/nvQ+4YW7tjdTERHpBi
 Siz5zhfhOiuhAaI24lf7OpiSZ2vqWMuDyQfAe0CHWt+oGV5a/DbVm5BHKesVD8tiTXc7
 L41bAgXWg6g5QPxDq16dtRwlNHMUmFblAj+VowCAkyHjNt/p3Qla0yR+uN/FI1qtiScL
 KqZKv2gYy1Em4Cfcrbh9HhtC7FGx9qGuze1+RDluTURQjyJj0QAFe2lHhrYVj+oIPYfP
 6i1sY6S3Sh0xJ3gMGISIcOBdDQTHRFeh16xBZPOyQ5c4BWOhwDgOvOPbVZ7rgZm8Li85
 Kqgw==
X-Gm-Message-State: AOAM530poH8RpLcGBvtnObvL/UQ/ielAVfceERtKbvnrIpd5mR/OCm5+
 Y78B/ZjanVyPm9amGKd27Hjsn2MvxbtT7A==
X-Google-Smtp-Source: ABdhPJw5C/lOB1J9g5mboCjFKFCqki4ZzNZwXOGeCRxH1FfAvlWlDt01N6EHyt1VHqY7kueHWVePog==
X-Received: by 2002:a1c:2b05:: with SMTP id r5mr17080712wmr.179.1603732830453; 
 Mon, 26 Oct 2020 10:20:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w6sm16303428wmb.28.2020.10.26.10.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 10:20:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 83E671FF7E;
 Mon, 26 Oct 2020 17:20:28 +0000 (GMT)
References: <20201026143028.3034018-1-pbonzini@redhat.com>
 <20201026143028.3034018-9-pbonzini@redhat.com>
User-agent: mu4e 1.5.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 08/15] mips: remove bios_name
In-reply-to: <20201026143028.3034018-9-pbonzini@redhat.com>
Date: Mon, 26 Oct 2020 17:20:28 +0000
Message-ID: <87tuuggazn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

