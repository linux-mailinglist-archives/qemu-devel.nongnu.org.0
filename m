Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C292631B814
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 12:36:23 +0100 (CET)
Received: from localhost ([::1]:58768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcAw-0002ar-QT
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 06:36:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBc9I-0001Sx-KO
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:34:41 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:52572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBc9D-00044q-7j
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:34:40 -0500
Received: by mail-wm1-x331.google.com with SMTP id l17so5927976wmq.2
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 03:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ISWETQSfyfDAvmMObQIqVCjD/ngAjYAorC4sfNJ1cfs=;
 b=rWk8/t1FmzLa0gMOBPtpM98O7Xrz8ji0ZFxdpL8gOPwpu/ENmPanrMIRsKThLhwXN0
 EliCdQ4Vzv33/kzHTRkCloZq19ihDpssjcEj/NyPDqzoeWebCnLKviOI1F2K3oR4hoZL
 SOmRDtzAG3wBlhebPJzQmGDLJbsioXAfyLcE7E8slHrnOlKJ6r0+NKq0jpwggXbNqG6v
 jcK06LyquWU7XMuHf1gYiQhk2Ow/UX/0QpxUCzbvxcpzR+3ifBD25bLBDadU8S1481if
 6tzWvO+cAsOLS6r58VBPkJ74HBgKYc/uactb6nb3ABJbzi/3s5ukXDboooN1ntEbK8c3
 GwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ISWETQSfyfDAvmMObQIqVCjD/ngAjYAorC4sfNJ1cfs=;
 b=C3sTEqinZzXKgjcdjAgpWiO2frc8PxTGg44DR5xgJOACtxobvqqZE/lH29GFkiAxi/
 12+bwQ8dagKITZm9tbRwjC638kWADdj3OCQLo6eCx2rKyJM/GPQn59K3SfeB5c284PVZ
 qGCrDQ/NAe+3G9wti9hemyVFIPA5VkHxs1WqLkHU0nmBihCh06YMH50AE7FcPKgJ88yW
 HDv+vCAJBhQxaoFOBnd7NjNjwfczBXo7lrjabnOmQjV++sriCfZTwmISf7GcrQSgqY3k
 BknfHR+TIhaWZl5dbVhjcHI2Ffd0dKOt7JPlMm8yc1TpX5hMbgTjcGeDfR2IYyuidL6Q
 YejQ==
X-Gm-Message-State: AOAM530jCn3Vbe8gS4weETkYSJz22Hvxw5fPeyEVcrnKE+ko3WfOqtxo
 MqTNxR89e7bdE+XrmF8rlslwEg==
X-Google-Smtp-Source: ABdhPJx4ruVX3y34X6WP83F6m3a+hihmPokiNZxeBRR5qmVHpp645+mYFNTDLfGlVtoP1FeC/H2SqQ==
X-Received: by 2002:a1c:2e83:: with SMTP id u125mr13581422wmu.13.1613388873853; 
 Mon, 15 Feb 2021 03:34:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p12sm22527278wmq.1.2021.02.15.03.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:34:32 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3388E1FF7E;
 Mon, 15 Feb 2021 11:34:32 +0000 (GMT)
References: <20210212123622.15834-1-cfontana@suse.de>
 <20210212123622.15834-4-cfontana@suse.de>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v18 03/15] accel: introduce new accessor functions
Date: Mon, 15 Feb 2021 11:34:27 +0000
In-reply-to: <20210212123622.15834-4-cfontana@suse.de>
Message-ID: <87czx1va2f.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> avoid open coding the accesses to cpu->accel_cpu interfaces,
> and instead introduce:
>
> accel_cpu_instance_init,
> accel_cpu_realizefn
>
> to be used by the targets/ initfn code,
> and by cpu_exec_realizefn respectively.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

