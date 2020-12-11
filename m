Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 747B52D7A97
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 17:13:10 +0100 (CET)
Received: from localhost ([::1]:42986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knl2b-0003zD-Ex
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 11:13:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knkza-000287-Kz
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:10:02 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:34616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knkzZ-0005lq-1v
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:10:02 -0500
Received: by mail-ej1-x632.google.com with SMTP id g20so13095538ejb.1
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 08:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kAhbbqTOiHk578QnuvXmuM0iunsvSiGf+znXVKxv1a8=;
 b=dUBooUB4E0GR1FXiIF3JUUQ+798OHQ5Fn6CONLUQ4iAx/+WgOfjWPjFPy+VVLIxGAQ
 z2U/yoN85Eq+R+F6bgXCQn4vbn0AEMKEwwObGFUlF3iNybDqo5Y+hcxZ86X8gXlb0zZZ
 ZtFjIeB5diItnw0wnK2BUN31iwRGDd3hFtzalmsNtr78yUjdotrkcb9YsRuGWzha/Xln
 +AZPtDN8pSpzzOGp+GIy2l7ZojwKEq8oqTIi1IcNqUtjlO0yp0iXvS0tAvztyyNrEdgH
 qZU9Tnsdz5N6fPOo0Jz5CwBcrqlggVJ1HPWUGhYVRk0C23y+xe5VhebdtQyfZkei4+qi
 eFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kAhbbqTOiHk578QnuvXmuM0iunsvSiGf+znXVKxv1a8=;
 b=hLMJQpnElU5KHDeYVp1niIYmABXAtM48Z7fXIczy5Nr++q8DgtCq78+Y6gt7ys43zr
 YfpQU8UYep1ce4AlCs55paoLOWnI7Yv2h/z/EWrtJQlomWT2Fz/QZXqaMDpnNPKnOrdb
 duHOp1k8L+hF4cYid/BWN6m8l28jBsKYFXNVdMNjlwSe066QQeueqqIx8YevqsgY+uYY
 Gpf14VTa8imFGSHEFOB9uDn76SFdqxvlV8BnDXb0tsEJsJ0Fu6Ztl1opxBTaJxE+e1Lm
 on/o1vuk3V6ZHM3mU+wDKH4xiT0mIygwNCSJ8KTxquP3YKY2JQSM4RVHrhemqmMGtHQp
 d2ow==
X-Gm-Message-State: AOAM530PiAUUp0NxmOwe55HeTePW1iw6OvUjxai/b15CHALb67zezvL3
 Oo4YLUDPdZqGwN3jc9/CgN5snNOEITgpRk7XQihaHQ==
X-Google-Smtp-Source: ABdhPJwfQ9ZBWn6BAlavhKkBnouxSlBSVMDhl0N4OT2ZxfEc3aI0yZlhN5fKH012KzItiRhsChBE9f1LpM0MPwSqDVI=
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr11678204ejr.482.1607702999228; 
 Fri, 11 Dec 2020 08:09:59 -0800 (PST)
MIME-Version: 1.0
References: <1607023357-5096-1-git-send-email-sai.pavan.boddu@xilinx.com>
In-Reply-To: <1607023357-5096-1-git-send-email-sai.pavan.boddu@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 16:09:48 +0000
Message-ID: <CAFEAcA8-KcdSrFKFGcuPcTQPBvgDapR3epNScaQSbW8s9E9zwg@mail.gmail.com>
Subject: Re: [PATCH v15 0/4] Add Versal usb model
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: Francisco Eduardo Iglesias <figlesia@xilinx.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Vikram Garhwal <fnuv@xilinx.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Paul Zimmerman <pauldzim@gmail.com>, Sai Pavan Boddu <saipava@xilinx.com>,
 Edgar Iglesias <edgari@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ying Fang <fangying1@huawei.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Dec 2020 at 19:18, Sai Pavan Boddu <sai.pavan.boddu@xilinx.com> wrote:
>
> This patch series adds dwc3 usb controller to versal SOC.
>



Applied to target-arm.next, thanks.

-- PMM

