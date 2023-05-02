Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9696F4077
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 11:55:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptmjL-0004mq-Pg; Tue, 02 May 2023 05:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptmjH-0004mU-RB
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:55:27 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptmjG-0000wM-0C
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:55:27 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-50bc4ba28cbso3785148a12.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 02:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683021324; x=1685613324;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Tt4/gwWIWNEU5OhxPl9ay/wAaV+k05WcoQgOscbm9ZQ=;
 b=a9TQ+Ll4y6dyU5r9vECZQImdkfZu/Xau+wMsAD+muPzdL1DeId263J2916hml6zQxr
 uNIs4pYjFUaGzqw1UKv+H87/gHQaUCh5MtXgv9xQVO15j2GQdvxiX+lqgVh2MesC8TyH
 PFW7riHI8rxYXY7Zwuc9A4hml1LxYL1K/W0LYBHMO7bpgYSvQEchZyY+UPnb2O19/yhX
 ByUeUp00wTdsq5Hqs4F0luR6XJufth1mD77fuz6+VkhS9wwln3nFxrIeBbjYwWT56te+
 9eTSo/W1dlmOTlYweCB8Ky+MIuOsiYjCR6IC+r+Sn0VouGrdl7hSZLY+28XAA35Te8hg
 AJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683021324; x=1685613324;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tt4/gwWIWNEU5OhxPl9ay/wAaV+k05WcoQgOscbm9ZQ=;
 b=VCfKzac3Y0ZEEMfWIFgfBbeKsOmsjg9bg8JJ+FAAqS2zwZFrDymbMfkTuDtl4Lf9YD
 AUqfU0wBE2OSE7gGnF0TB49XVCKauCauI9z91Y8WXQgJdYZDsKGw+HAt2aIYPxHpGFS1
 wIywjOcqd0EkzLuzYGo0sNevBgu143ZYs3qFb9khbrLbeREF2qI02ccel3MsezeSrIgc
 3rb5hjFn3L722rLFLi1z6PTQUwE9tbp0SZkZLLdyyHRh6oiJwKNNbSCvHPBtR+NRmOnJ
 fw4CVN/vrlbHusf9VsepplWYH57aHgGeZ00sqby96yVauLH8RsuVhaRYAj9O2+WkxFO3
 1UlA==
X-Gm-Message-State: AC+VfDwoqmjPBWZvCvMCEzaoaDQPLtTo4EG7iAuirOo9rDzWdRvh8GaS
 0Fjp20q7IR9CQaY/Jfvt8ryais/SNazucXw3QACSVw==
X-Google-Smtp-Source: ACHHUZ4SY9dv217fSJgwVVosRceib3a8ROm/DSLsVo0E6PXHWZi6lWZ4lKrnHqU7XyWC2t6Ua+cqZVI4J/7EPrXKPt8=
X-Received: by 2002:aa7:d511:0:b0:506:a1c8:2bc5 with SMTP id
 y17-20020aa7d511000000b00506a1c82bc5mr7430948edq.15.1683021324064; Tue, 02
 May 2023 02:55:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230426180013.14814-1-farosas@suse.de>
In-Reply-To: <20230426180013.14814-1-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 10:55:13 +0100
Message-ID: <CAFEAcA_ZVpZzuvZ71NzgweRC5Uti0T_fqG00paqDDe18QP-veQ@mail.gmail.com>
Subject: Re: [PATCH v11 00/13] target/arm: Allow CONFIG_TCG=n builds
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 26 Apr 2023 at 19:00, Fabiano Rosas <farosas@suse.de> wrote:
>
> Hi,
>
> Some minor changes:
>
> - new patch to move a test under CONFIG_TCG (broken on master);
> - new patch to document the unsupported CPU test (Philippe);
> - changed the test skip message when no KVM or TCG are present (Igor).

Applied to target-arm.next; thanks for your persistence in
working through the many versions of this patchset.

-- PMM

