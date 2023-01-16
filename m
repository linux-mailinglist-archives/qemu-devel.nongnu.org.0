Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5477266C018
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 14:50:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHPs4-0007g0-F0; Mon, 16 Jan 2023 08:49:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHPrv-0007fC-LB
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 08:49:48 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHPrr-0005i3-L9
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 08:49:47 -0500
Received: by mail-pg1-x534.google.com with SMTP id q9so19699058pgq.5
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 05:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a3CnBVOLCP2dM6Ha1kb4WheMOMwZ6ZjS+Mi3lpu6eYI=;
 b=f7Y1sy3ZvKh1ah3gIMMcEMipeDAO++/fR90DEUfVzzFy65AqEGwRRljHP4d6pk3UVv
 Kg+hxlEJSxWJOTGQCpSmwTITnJHGAsq+wQlbnwsq7b7+2RpoFdV0MJDy1bUns9MduTQt
 Gcv2NccolyAq9t7BGbZsxdhNLuVm+dlc39evbMxyi85F0Dx1jc5x45xeO1E6Mm/BTG9R
 +Qd/bKSHgflWUJbVtnShq4GLOfsY9G/wmIZYQVHvCTpXLrQnltWbT2gJIRoM0ZcYRhil
 2Lpm/1WR3Tw9KRdCTriGEcgLUrP8kr3EsGbb0Z2WsMHljfDlLg2whgF+25CEsBrDR2SU
 hcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a3CnBVOLCP2dM6Ha1kb4WheMOMwZ6ZjS+Mi3lpu6eYI=;
 b=TuQmGqofkE2rCE+/vshkiELBNakQSs2ngoa2MemjVpzvMzLUsxCq1Yi26r1MytQA8+
 sVskx2dYeISDzBAGfT7bfhM8ZkV8Rp48ov5B0xlbeA5OvLN3BmyymDnFD4h+83L2xNwe
 ImybsI7z4ZQb6rz9sKLTju3ZurCSNLb022aNnkRSxD34Z3C8BK7eKytTh1w1AXv5RFGE
 xmnwBh9TbZb5hxkxR8ajlaVCQtLL4SX9gKi4XoX4i7CwScULoxSA6onKZggiZiXt4VCe
 5qhXT71ewplbtSdOv78c9bqhHtZJM7MP9cNtB473E09a5GarJmqNtJ1c8iyYt5jBOEuZ
 JEyA==
X-Gm-Message-State: AFqh2krJmM6Exadw575cAqCoT8rRctL+cOuzJIY+gxJBSS+zJbndCBOX
 Mh423qm6PRF2FMzjYc+iCTUg4pwzi1X7rzpQ0YZv1Q==
X-Google-Smtp-Source: AMrXdXtKNSYAsXvpCf1U94N5to2+0tLVgM5NYG1i7LNtkYG5aQRZyV2UhmoSToiTUVHT98A/jdoKQcVAuATR+Ac+XmE=
X-Received: by 2002:a63:9d47:0:b0:4af:9f91:54d1 with SMTP id
 i68-20020a639d47000000b004af9f9154d1mr1862211pgd.192.1673876982035; Mon, 16
 Jan 2023 05:49:42 -0800 (PST)
MIME-Version: 1.0
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-21-farosas@suse.de>
 <bb5f5cd7-6d53-eb69-3e79-db95c9734f07@linaro.org>
In-Reply-To: <bb5f5cd7-6d53-eb69-3e79-db95c9734f07@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Jan 2023 13:49:30 +0000
Message-ID: <CAFEAcA-XXWg+NXyFJVECfomGHAkytW9WZoVdE48Hrcmyhs4nHw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 20/28] target/arm: Set cortex-a57 as default cpu
 for KVM-only build
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x534.google.com
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

On Fri, 13 Jan 2023 at 22:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/13/23 06:04, Fabiano Rosas wrote:
> > The cortex-a15 is not present anymore when CONFIG_TCG=n, so use the
> > cortex-a57 as default cpu for KVM.
> >
> > Signed-off-by: Fabiano Rosas <farosas@suse.de>
>
> Ideally there would not be a default at all, requiring the command-line option to be used.

Effectively, you pretty much do always need to use the command line
option, because almost 0% of people wanted the cortex-a15 at this point,
even when using TCG...

-- PMM

